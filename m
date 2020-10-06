From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 6 Oct 2020 08:43:19 -0500
Subject: [Buildroot] [PATCH 1/1] package/patchelf: Pull in upstream
 bugfixes
In-Reply-To: <20201005185034.37131-1-conrad.ratschan@rockwellcollins.com>
References: <20201005185034.37131-1-conrad.ratschan@rockwellcollins.com>
Message-ID: <CANQCQpYMWY4FK38O1bSTrW5AOvQ78z2f_3VLtKK5uUCPygoKkA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Conrad,

On Mon, Oct 5, 2020 at 1:53 PM Conrad Ratschan
<conrad.ratschan@rockwellcollins.com> wrote:
>
> On Buildroot 2020.02.6 when building iputils for powerpc with
> BR2_PIC_PIE enabled, the arping/rdisc/tftpd binaries will segfault at
> runtime. This can be traced back to a few bugs in patchelf corrupting
> the ELFs when resizing the RPATH to replace "$ORIGIN/" with "/usr/sbin".
>

Is this patch a bug against master and 2020.02.x?

> This patch pulls in upstream fixes to prevent the binaries from being
> needlessly inflated, prevent the startPage from always being adjusted,
> fix a few minor bugs, and fix incorrect endianness handling.
>
> Signed-off-by: Conrad Ratschan <conrad.ratschan@rockwellcollins.com>
> ---
>  ...file-sizes-needlessly-and-allow-bina.patch | 176 ++++++++++++++++++
>  ...ry-corruption-when-rerunning-patchel.patch |  55 ++++++
>  .../0007-fix-adjusting-startPage.patch        |  45 +++++
>  ...stead-of-sh_addr-when-checking-alrea.patch |  38 ++++
>  ...ignoring-the-first-section-header-wh.patch |  41 ++++
>  ...ix-endianness-issues-for-powerpc-PIE.patch |  80 ++++++++
>  6 files changed, 435 insertions(+)
>  create mode 100644 package/patchelf/0005-Avoid-inflating-file-sizes-needlessly-and-allow-bina.patch
>  create mode 100644 package/patchelf/0006-Fix-shared-library-corruption-when-rerunning-patchel.patch
>  create mode 100644 package/patchelf/0007-fix-adjusting-startPage.patch
>  create mode 100644 package/patchelf/0008-Use-sh_offset-instead-of-sh_addr-when-checking-alrea.patch
>  create mode 100644 package/patchelf/0009-Fix-issue-66-by-ignoring-the-first-section-header-wh.patch
>  create mode 100644 package/patchelf/0010-Fix-endianness-issues-for-powerpc-PIE.patch
>
> diff --git a/package/patchelf/0005-Avoid-inflating-file-sizes-needlessly-and-allow-bina.patch b/package/patchelf/0005-Avoid-inflating-file-sizes-needlessly-and-allow-bina.patch
> new file mode 100644
> index 0000000000..0d7931cd52
> --- /dev/null
> +++ b/package/patchelf/0005-Avoid-inflating-file-sizes-needlessly-and-allow-bina.patch
> @@ -0,0 +1,176 @@
> +From 79c093226e609b99fa889f6e37480b92b399610d Mon Sep 17 00:00:00 2001
> +From: Richard Purdie <richard.purdie@linuxfoundation.org>
> +Date: Tue, 7 Mar 2017 21:08:34 +0000
> +Subject: [PATCH] Avoid inflating file sizes needlessly and allow binaries to
> + be stripped
> +
> +The current approach to changing sections in ET_DYN executables is to move
> +the INTERP section to the end of the file. +This means changing PT_PHDR to
> +add an extra PT_LOAD section so that the new section is mmaped into memory
> +by the elf loader in the kernel. In order to extend PHDR, this means moving
> +it to the end of the file.
> +
> +Its documented in BUGS there is a kernel 'bug' which means that if you have holes
> +in memory between the base load address and the PT_LOAD segment that contains PHDR,
> +it will pass an incorrect PHDR address to ld.so and fail to load the binary, segfaulting.
> +
> +To avoid this, the code currently inserts space into the binary to ensure that when
> +loaded into memory there are no holes between the PT_LOAD sections. This inflates the
> +binaries by many MBs in some cases. Whilst we could make them sparse, there is a second
> +issue which is that strip can fail to process these binaries:
> +
> +$ strip fixincl
> +Not enough room for program headers, try linking with -N
> +[.note.ABI-tag]: Bad value
> +
> +This turns out to be due to libbfd not liking the relocated PHDR section either
> +(https://github.com/NixOS/patchelf/issues/10).
> +
> +Instead this patch implements a different approach, leaving PHDR where it is but extending
> +it in place to allow addition of a new PT_LOAD section. This overwrites sections in the
> +binary but those get moved to the end of the file in the new PT_LOAD section.
> +
> +This is based on patches linked from the above github issue, however whilst the idea
> +was good, the implementation wasn't correct and they've been rewritten here.
> +
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +
> +Fetch from: https://github.com/NixOS/patchelf/commit/c4deb5e9e1ce9c98a48e0d5bb37d87739b8cfee4
> +
> +Backported to v0.9
> +
> +Signed-off-by: Conrad Ratschan <conrad.ratschan@rockwellcollins.com>
> +---
> + src/patchelf.cc | 71 ++++++++++++++++++++++++++++---------------------
> + 1 file changed, 40 insertions(+), 31 deletions(-)
> +
> +diff --git a/src/patchelf.cc b/src/patchelf.cc
> +index 1d58061..c2147af 100644
> +--- a/src/patchelf.cc
> ++++ b/src/patchelf.cc
> +@@ -209,6 +209,8 @@ private:
> +     string & replaceSection(const SectionName & sectionName,
> +         unsigned int size);
> +
> ++    bool haveReplacedSection(const SectionName & sectionName);
> ++
> +     void writeReplacedSections(Elf_Off & curOff,
> +         Elf_Addr startAddr, Elf_Off startOffset);
> +
> +@@ -632,6 +634,15 @@ void ElfFile<ElfFileParamNames>::writeReplacedSections(Elf_Off & curOff,
> +     replacedSections.clear();
> + }
> +
> ++template<ElfFileParams>
> ++bool ElfFile<ElfFileParamNames>::haveReplacedSection(const SectionName & sectionName)
> ++{
> ++    ReplacedSections::iterator i = replacedSections.find(sectionName);
> ++
> ++    if (i != replacedSections.end())
> ++        return true;
> ++    return false;
> ++}
> +
> + template<ElfFileParams>
> + void ElfFile<ElfFileParamNames>::rewriteSectionsLibrary()
> +@@ -648,52 +659,53 @@ void ElfFile<ElfFileParamNames>::rewriteSectionsLibrary()
> +
> +     debug("last page is 0x%llx\n", (unsigned long long) startPage);
> +
> ++    /* Because we're adding a new section header, we're necessarily increasing
> ++       the size of the program header table.  This can cause the first section
> ++       to overlap the program header table in memory; we need to shift the first
> ++       few segments to someplace else. */
> ++    /* Some sections may already be replaced so account for that */
> ++    unsigned int i = 1;
> ++    Elf_Addr pht_size = sizeof(Elf_Ehdr) + (phdrs.size() + 1)*sizeof(Elf_Phdr);
> ++    while( shdrs[i].sh_addr <= pht_size && i < rdi(hdr->e_shnum) ) {
> ++        if (not haveReplacedSection(getSectionName(shdrs[i])))
> ++            replaceSection(getSectionName(shdrs[i]), shdrs[i].sh_size);
> ++        i++;
> ++    }
> +
> +-    /* Compute the total space needed for the replaced sections and
> +-       the program headers. */
> +-    off_t neededSpace = (phdrs.size() + 1) * sizeof(Elf_Phdr);
> ++    /* Compute the total space needed for the replaced sections */
> ++    off_t neededSpace = 0;
> +     for (ReplacedSections::iterator i = replacedSections.begin();
> +          i != replacedSections.end(); ++i)
> +         neededSpace += roundUp(i->second.size(), sectionAlignment);
> +     debug("needed space is %d\n", neededSpace);
> +
> +-
> +     size_t startOffset = roundUp(fileSize, getPageSize());
> +
> +     growFile(startOffset + neededSpace);
> +
> +-
> +     /* Even though this file is of type ET_DYN, it could actually be
> +        an executable.  For instance, Gold produces executables marked
> +-       ET_DYN.  In that case we can still hit the kernel bug that
> +-       necessitated rewriteSectionsExecutable().  However, such
> +-       executables also tend to start at virtual address 0, so
> ++       ET_DYN as does LD when linking with pie. If we move PT_PHDR, it
> ++       has to stay in the first PT_LOAD segment or any subsequent ones
> ++       if they're continuous in memory due to linux kernel constraints
> ++       (see BUGS). Since the end of the file would be after bss, we can't
> ++       move PHDR there, we therefore choose to leave PT_PHDR where it is but
> ++       move enough following sections such that we can add the extra PT_LOAD
> ++       section to it. This PT_LOAD segment ensures the sections at the end of
> ++       the file are mapped into memory for ld.so to process.
> ++       We can't use the approach in rewriteSectionsExecutable()
> ++       since DYN executables tend to start at virtual address 0, so
> +        rewriteSectionsExecutable() won't work because it doesn't have
> +-       any virtual address space to grow downwards into.  As a
> +-       workaround, make sure that the virtual address of our new
> +-       PT_LOAD segment relative to the first PT_LOAD segment is equal
> +-       to its offset; otherwise we hit the kernel bug.  This may
> +-       require creating a hole in the executable.  The bigger the size
> +-       of the uninitialised data segment, the bigger the hole. */
> ++       any virtual address space to grow downwards into. */
> +     if (isExecutable) {
> +         if (startOffset >= startPage) {
> +             debug("shifting new PT_LOAD segment by %d bytes to work around a Linux kernel bug\n", startOffset - startPage);
> +-        } else {
> +-            size_t hole = startPage - startOffset;
> +-            /* Print a warning, because the hole could be very big. */
> +-            fprintf(stderr, "warning: working around a Linux kernel bug by creating a hole of %zu bytes in ?%s?\n", hole, fileName.c_str());
> +-            assert(hole % getPageSize() == 0);
> +-            /* !!! We could create an actual hole in the file here,
> +-               but it's probably not worth the effort. */
> +-            growFile(fileSize + hole);
> +-            startOffset += hole;
> +         }
> +         startPage = startOffset;
> +     }
> +
> +
> +-    /* Add a segment that maps the replaced sections and program
> +-       headers into memory. */
> ++    /* Add a segment that maps the replaced sections into memory. */
> +     phdrs.resize(rdi(hdr->e_phnum) + 1);
> +     wri(hdr->e_phnum, rdi(hdr->e_phnum) + 1);
> +     Elf_Phdr & phdr = phdrs[rdi(hdr->e_phnum) - 1];
> +@@ -706,15 +718,12 @@ void ElfFile<ElfFileParamNames>::rewriteSectionsLibrary()
> +
> +
> +     /* Write out the replaced sections. */
> +-    Elf_Off curOff = startOffset + phdrs.size() * sizeof(Elf_Phdr);
> ++    Elf_Off curOff = startOffset;
> +     writeReplacedSections(curOff, startPage, startOffset);
> +     assert(curOff == startOffset + neededSpace);
> +
> +-
> +-    /* Move the program header to the start of the new area. */
> +-    wri(hdr->e_phoff, startOffset);
> +-
> +-    rewriteHeaders(startPage);
> ++    /* Write out the updated program and section headers */
> ++    rewriteHeaders(hdr->e_phoff);
> + }
> +
> +
> +--
> +2.17.1
> +
> diff --git a/package/patchelf/0006-Fix-shared-library-corruption-when-rerunning-patchel.patch b/package/patchelf/0006-Fix-shared-library-corruption-when-rerunning-patchel.patch
> new file mode 100644
> index 0000000000..9fb3e260c1
> --- /dev/null
> +++ b/package/patchelf/0006-Fix-shared-library-corruption-when-rerunning-patchel.patch
> @@ -0,0 +1,55 @@
> +From 5df4791bf077127684faceeeea8bfab063e43774 Mon Sep 17 00:00:00 2001
> +From: Richard Purdie <richard.purdie@linuxfoundation.org>
> +Date: Wed, 3 Jun 2020 12:14:58 +0100
> +Subject: [PATCH] Fix shared library corruption when rerunning patchelf
> +
> +When running patchelf on some existing patchelf'd binaries to change to longer
> +RPATHS, ldd would report the binaries as invalid. The output of objdump -x on
> +those libraryies should show the top of the .dynamic section is getting trashed,
> +something like:
> +
> +0x600000001 0x0000000000429000
> +0x335000 0x0000000000335000
> +0xc740 0x000000000000c740
> +0x1000 0x0000000000009098
> +SONAME libglib-2.0.so.0
> +
> +(which should be RPATH and DT_NEEDED entries)
> +
> +This was tracked down to the code which injects the PT_LOAD section.
> +
> +The issue is that if the program headers were previously relocated to the end
> +of the file which was how patchelf operated previously, the relocation code
> +wouldn't work properly on a second run as it now assumes they're located after
> +the elf header. This change forces them back to immediately follow the elf
> +header which is where the code has made space for them.
> +
> +Should fix https://github.com/NixOS/patchelf/issues/170
> +and https://github.com/NixOS/patchelf/issues/192
> +
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +
> +Fetch from: https://github.com/NixOS/patchelf/commit/ad5f1f078b716802dfb8f7226cb1d5c720348a78
> +
> +Backported to v0.9
> +
> +Signed-off-by: Conrad Ratschan <conrad.ratschan@rockwellcollins.com>
> +---
> + src/patchelf.cc | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/patchelf.cc b/src/patchelf.cc
> +index c2147af..1224a89 100644
> +--- a/src/patchelf.cc
> ++++ b/src/patchelf.cc
> +@@ -706,6 +706,7 @@ void ElfFile<ElfFileParamNames>::rewriteSectionsLibrary()
> +
> +
> +     /* Add a segment that maps the replaced sections into memory. */
> ++    wri(hdr->e_phoff, sizeof(Elf_Ehdr));
> +     phdrs.resize(rdi(hdr->e_phnum) + 1);
> +     wri(hdr->e_phnum, rdi(hdr->e_phnum) + 1);
> +     Elf_Phdr & phdr = phdrs[rdi(hdr->e_phnum) - 1];
> +--
> +2.17.1
> +
> diff --git a/package/patchelf/0007-fix-adjusting-startPage.patch b/package/patchelf/0007-fix-adjusting-startPage.patch
> new file mode 100644
> index 0000000000..fd044964e0
> --- /dev/null
> +++ b/package/patchelf/0007-fix-adjusting-startPage.patch
> @@ -0,0 +1,45 @@
> +From 4a82c97e8a0677706d1d532812daaa73249768a8 Mon Sep 17 00:00:00 2001
> +From: Ed Bartosh <ed.bartosh@linux.intel.com>
> +Date: Fri, 21 Jul 2017 12:33:53 +0300
> +Subject: [PATCH] fix adjusting startPage
> +
> +startPage is adjusted unconditionally for all executables.
> +This results in incorrect addresses assigned to INTERP and LOAD
> +program headers, which breaks patched executable.
> +
> +Adjusting startPage variable only when startOffset > startPage
> +should fix this.
> +
> +This change is related to the issue NixOS#10
> +
> +Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> +
> +Fetch from: https://github.com/NixOS/patchelf/commit/1cc234fea5600190d872329aca60e2365cefc39e
> +
> +Backported to v0.9
> +
> +Signed-off-by: Conrad Ratschan <conrad.ratschan@rockwellcollins.com>
> +---
> + src/patchelf.cc | 6 ++----
> + 1 file changed, 2 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/patchelf.cc b/src/patchelf.cc
> +index 1224a89..4676157 100644
> +--- a/src/patchelf.cc
> ++++ b/src/patchelf.cc
> +@@ -697,10 +697,8 @@ void ElfFile<ElfFileParamNames>::rewriteSectionsLibrary()
> +        since DYN executables tend to start at virtual address 0, so
> +        rewriteSectionsExecutable() won't work because it doesn't have
> +        any virtual address space to grow downwards into. */
> +-    if (isExecutable) {
> +-        if (startOffset >= startPage) {
> +-            debug("shifting new PT_LOAD segment by %d bytes to work around a Linux kernel bug\n", startOffset - startPage);
> +-        }
> ++    if (isExecutable && startOffset > startPage) {
> ++        debug("shifting new PT_LOAD segment by %d bytes to work around a Linux kernel bug\n", startOffset - startPage);
> +         startPage = startOffset;
> +     }
> +
> +--
> +2.17.1
> +
> diff --git a/package/patchelf/0008-Use-sh_offset-instead-of-sh_addr-when-checking-alrea.patch b/package/patchelf/0008-Use-sh_offset-instead-of-sh_addr-when-checking-alrea.patch
> new file mode 100644
> index 0000000000..d423cad23a
> --- /dev/null
> +++ b/package/patchelf/0008-Use-sh_offset-instead-of-sh_addr-when-checking-alrea.patch
> @@ -0,0 +1,38 @@
> +From cb8326de54ad7a56658b0dc8efb7da5e71684a7c Mon Sep 17 00:00:00 2001
> +From: Pablo Galindo <pablogsal@gmail.com>
> +Date: Tue, 22 Sep 2020 01:33:47 +0100
> +Subject: [PATCH] Use sh_offset instead of sh_addr when checking already
> + replaced libs
> +
> +When checking for already replaced libs, the check against the size must
> +be done using the section header offset, not the section file address.
> +This was not crashing in many situations because normally sh_address and
> +sh_offset have the same value but these two may differ and using the
> +sh_address value instead can cause library corruption in these
> +situations.
> +
> +Fetch from: https://github.com/NixOS/patchelf/commit/83aa89addf8757e2d63aa73222f2fa9bc6d7321a
> +
> +Backported to v0.9
> +
> +Signed-off-by: Conrad Ratschan <conrad.ratschan@rockwellcollins.com>
> +---
> + src/patchelf.cc | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/patchelf.cc b/src/patchelf.cc
> +index 4676157..c025ae2 100644
> +--- a/src/patchelf.cc
> ++++ b/src/patchelf.cc
> +@@ -666,7 +666,7 @@ void ElfFile<ElfFileParamNames>::rewriteSectionsLibrary()
> +     /* Some sections may already be replaced so account for that */
> +     unsigned int i = 1;
> +     Elf_Addr pht_size = sizeof(Elf_Ehdr) + (phdrs.size() + 1)*sizeof(Elf_Phdr);
> +-    while( shdrs[i].sh_addr <= pht_size && i < rdi(hdr->e_shnum) ) {
> ++    while( shdrs[i].sh_offset <= pht_size && i < rdi(hdr->e_shnum) ) {
> +         if (not haveReplacedSection(getSectionName(shdrs[i])))
> +             replaceSection(getSectionName(shdrs[i]), shdrs[i].sh_size);
> +         i++;
> +--
> +2.17.1
> +
> diff --git a/package/patchelf/0009-Fix-issue-66-by-ignoring-the-first-section-header-wh.patch b/package/patchelf/0009-Fix-issue-66-by-ignoring-the-first-section-header-wh.patch
> new file mode 100644
> index 0000000000..a820f2d1d2
> --- /dev/null
> +++ b/package/patchelf/0009-Fix-issue-66-by-ignoring-the-first-section-header-wh.patch
> @@ -0,0 +1,41 @@
> +From e22ca2f593aa8fd392f1ac4f8dd104bc56d0d100 Mon Sep 17 00:00:00 2001
> +From: Ezra Cooper <ezra@qumulo.com>
> +Date: Thu, 21 Jun 2018 11:07:35 -0700
> +Subject: [PATCH] Fix issue #66 by ignoring the first section header when
> + sorting, and not overwriting NOBITS entries.
> +
> +Fetch from: https://github.com/NixOS/patchelf/commit/52ab908394958a2a5d0476e306e2cad4da4fdeae
> +
> +Backported to v0.9
> +
> +Signed-off-by: Conrad Ratschan <conrad.ratschan@rockwellcollins.com>
> +---
> + src/patchelf.cc | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/patchelf.cc b/src/patchelf.cc
> +index c025ae2..fa2945e 100644
> +--- a/src/patchelf.cc
> ++++ b/src/patchelf.cc
> +@@ -435,7 +435,7 @@ void ElfFile<ElfFileParamNames>::sortShdrs()
> +     /* Sort the sections by offset. */
> +     CompShdr comp;
> +     comp.elfFile = this;
> +-    sort(shdrs.begin(), shdrs.end(), comp);
> ++    sort(shdrs.begin() + 1, shdrs.end(), comp);
> +
> +     /* Restore the sh_link mappings. */
> +     for (unsigned int i = 1; i < rdi(hdr->e_shnum); ++i)
> +@@ -586,7 +586,8 @@ void ElfFile<ElfFileParamNames>::writeReplacedSections(Elf_Off & curOff,
> +     {
> +         string sectionName = i->first;
> +         Elf_Shdr & shdr = findSection(sectionName);
> +-        memset(contents + rdi(shdr.sh_offset), 'X', rdi(shdr.sh_size));
> ++        if (shdr.sh_type != SHT_NOBITS)
> ++            memset(contents + rdi(shdr.sh_offset), 'X', rdi(shdr.sh_size));
> +     }
> +
> +     for (ReplacedSections::iterator i = replacedSections.begin();
> +--
> +2.17.1
> +
> diff --git a/package/patchelf/0010-Fix-endianness-issues-for-powerpc-PIE.patch b/package/patchelf/0010-Fix-endianness-issues-for-powerpc-PIE.patch
> new file mode 100644
> index 0000000000..6a3500b91e
> --- /dev/null
> +++ b/package/patchelf/0010-Fix-endianness-issues-for-powerpc-PIE.patch
> @@ -0,0 +1,80 @@
> +From c61c2960d782c67566790b210163ff9c799f018a Mon Sep 17 00:00:00 2001
> +From: Conrad Ratschan <ratschance@gmail.com>
> +Date: Sat, 3 Oct 2020 20:17:24 -0500
> +Subject: [PATCH] Fix endianness issues for powerpc PIE
> +
> +Previously when running `patchelf --set-rpath "/usr/sbin" my_bin` on a
> +PIE ppc32 binary that had no RPATH a few issues were encountered.
> +
> +This commit fixes:
> +
> +1. The PT_PHDR being sorted improperly due to the type being read in
> +   incorrect endianness
> +
> +3. The interpreter being clobbered due to the replace sections routine
> +   reading sh_offset and sh_size in incorrect endianness
> +
> +4. The PHDR segment having an incorrect virt and phys address due to
> +   reading the e_phoff in the incorrect endianness
> +
> +This also fixes a read of the shdr.sh_type in writeReplacedSections but
> +this was not encountered during testing.
> +
> +Fetch from: https://github.com/NixOS/patchelf/commit/884eccc4f061a3dbdbe63a4c73f1cc9bbf77fa7d
> +
> +Backported to v0.9. Removed item 2 from the fix list as it is not
> +applicable to v0.9.
> +
> +Signed-off-by: Conrad Ratschan <conrad.ratschan@rockwellcollins.com>
> +---
> + src/patchelf.cc | 12 ++++++------
> + 1 file changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/src/patchelf.cc b/src/patchelf.cc
> +index fa2945e..e60b17c 100644
> +--- a/src/patchelf.cc
> ++++ b/src/patchelf.cc
> +@@ -173,8 +173,8 @@ private:
> +         ElfFile * elfFile;
> +         bool operator ()(const Elf_Phdr & x, const Elf_Phdr & y)
> +         {
> +-            if (x.p_type == PT_PHDR) return true;
> +-            if (y.p_type == PT_PHDR) return false;
> ++            if (elfFile->rdi(x.p_type) == PT_PHDR) return true;
> ++            if (elfFile->rdi(y.p_type) == PT_PHDR) return false;
> +             return elfFile->rdi(x.p_paddr) < elfFile->rdi(y.p_paddr);
> +         }
> +     };
> +@@ -586,7 +586,7 @@ void ElfFile<ElfFileParamNames>::writeReplacedSections(Elf_Off & curOff,
> +     {
> +         string sectionName = i->first;
> +         Elf_Shdr & shdr = findSection(sectionName);
> +-        if (shdr.sh_type != SHT_NOBITS)
> ++        if (rdi(shdr.sh_type) != SHT_NOBITS)
> +             memset(contents + rdi(shdr.sh_offset), 'X', rdi(shdr.sh_size));
> +     }
> +
> +@@ -667,9 +667,9 @@ void ElfFile<ElfFileParamNames>::rewriteSectionsLibrary()
> +     /* Some sections may already be replaced so account for that */
> +     unsigned int i = 1;
> +     Elf_Addr pht_size = sizeof(Elf_Ehdr) + (phdrs.size() + 1)*sizeof(Elf_Phdr);
> +-    while( shdrs[i].sh_offset <= pht_size && i < rdi(hdr->e_shnum) ) {
> ++    while( rdi(shdrs[i].sh_offset) <= pht_size && i < rdi(hdr->e_shnum) ) {
> +         if (not haveReplacedSection(getSectionName(shdrs[i])))
> +-            replaceSection(getSectionName(shdrs[i]), shdrs[i].sh_size);
> ++            replaceSection(getSectionName(shdrs[i]), rdi(shdrs[i].sh_size));
> +         i++;
> +     }
> +
> +@@ -723,7 +723,7 @@ void ElfFile<ElfFileParamNames>::rewriteSectionsLibrary()
> +     assert(curOff == startOffset + neededSpace);
> +
> +     /* Write out the updated program and section headers */
> +-    rewriteHeaders(hdr->e_phoff);
> ++    rewriteHeaders(rdi(hdr->e_phoff));
> + }
> +
> +
> +--
> +2.17.1
> +
> --
> 2.17.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
