From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 29 Jun 2016 19:22:55 +0300
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to arc-2016.09-eng005
Message-ID: <1467217375-20555-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With this commit we're starting a series of updates of ARC tools.
Significantly rewritten arc-2016.03 tools introduced way too many
problems highlighted by Buildroot autobuilder. Now in attempt to
resolve as many issues as possible by the time final release of
arc-2016.09 tools is cut we'll be executing arc-2016.09 series
with engineering snapshots like this one.

We decided to go this way instead of applying separate patches here
and there because ongoing development introduces quite a lot of
changes and separate patches are not practical in Buildroot.

Moreover this will give us very clean visibility of number of
issues we see (hopefully it will decrease over time).

One of the important changes introduced in this engineering build
is initial set of changes for proper support of PIE on ARC in terms
of both building on host and running on ARC target. I expect some
PIE-related build breakages to go away and new ones will be treated
as the high-priority issues to be fixed ASAP.

For now we only update Binutils and GCC while keeping GDB
as it is of arc-2016.03 release because there're some issues
we'd like to resolve before releasing it to wider audience.

So again note this is one of the first engineering builds of
arc-2016.09 series and it might have all kinds of breakages,
please don't use it for production builds.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: arc-buildroot at synopsys.com
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>

---

Thomas, could you please rebuilt your prebuilt tools for ARC
to include this arc-2016.09-eng005 drop?

 package/binutils/Config.in.host                    |  2 +-
 ...ith-dynamic-relocs-not-being-generated-wi.patch | 34 ----------------------
 .../0300-ld-makefile.patch                         |  0
 .../0301-check-ldrunpath-length.patch              |  0
 .../0500-add-sysroot-fix-from-bug-3049.patch       |  0
 .../0600-poison-system-directories.patch           |  0
 ...t-build-failures-when-makeinfo-is-missing.patch |  0
 package/binutils/binutils.hash                     |  2 +-
 package/binutils/binutils.mk                       |  2 +-
 package/gcc/Config.in.host                         |  2 +-
 .../130-fix_build_with_gcc-6.patch                 |  0
 .../130-pr43538.patch                              |  0
 .../301-missing-execinfo_h.patch                   |  0
 .../305-libmudflap-susv3-legacy.patch              |  0
 .../842-PR60155.patch                              |  0
 .../850-libstdcxx-uclibc-c99.patch                 |  0
 .../851-PR-other-56780.patch                       |  0
 .../930-libgcc-disable-split-stack-nothreads.patch |  0
 package/gcc/gcc.hash                               |  2 +-
 19 files changed, 5 insertions(+), 39 deletions(-)
 delete mode 100644 package/binutils/arc-2016.03/0700-Fix-issue-with-dynamic-relocs-not-being-generated-wi.patch
 rename package/binutils/{arc-2016.03 => arc-2016.09-eng005}/0300-ld-makefile.patch (100%)
 rename package/binutils/{arc-2016.03 => arc-2016.09-eng005}/0301-check-ldrunpath-length.patch (100%)
 rename package/binutils/{arc-2016.03 => arc-2016.09-eng005}/0500-add-sysroot-fix-from-bug-3049.patch (100%)
 rename package/binutils/{arc-2016.03 => arc-2016.09-eng005}/0600-poison-system-directories.patch (100%)
 rename package/binutils/{arc-2016.03 => arc-2016.09-eng005}/0800-Docs-Prevent-build-failures-when-makeinfo-is-missing.patch (100%)
 rename package/gcc/{arc-2015.12 => arc-2016.09-eng005}/130-fix_build_with_gcc-6.patch (100%)
 rename package/gcc/{arc-2016.03 => arc-2016.09-eng005}/130-pr43538.patch (100%)
 rename package/gcc/{arc-2016.03 => arc-2016.09-eng005}/301-missing-execinfo_h.patch (100%)
 rename package/gcc/{arc-2016.03 => arc-2016.09-eng005}/305-libmudflap-susv3-legacy.patch (100%)
 rename package/gcc/{arc-2016.03 => arc-2016.09-eng005}/842-PR60155.patch (100%)
 rename package/gcc/{arc-2016.03 => arc-2016.09-eng005}/850-libstdcxx-uclibc-c99.patch (100%)
 rename package/gcc/{arc-2016.03 => arc-2016.09-eng005}/851-PR-other-56780.patch (100%)
 rename package/gcc/{arc-2016.03 => arc-2016.09-eng005}/930-libgcc-disable-split-stack-nothreads.patch (100%)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index efdc840..0d90e3e 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -26,7 +26,7 @@ endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "arc-2016.03"	if BR2_arc
+	default "arc-2016.09-eng005"	if BR2_arc
 	default "2.24"		if BR2_BINUTILS_VERSION_2_24_X
 	default "2.25.1"	if BR2_BINUTILS_VERSION_2_25_X
 	default "2.26"		if BR2_BINUTILS_VERSION_2_26_X
diff --git a/package/binutils/arc-2016.03/0700-Fix-issue-with-dynamic-relocs-not-being-generated-wi.patch b/package/binutils/arc-2016.03/0700-Fix-issue-with-dynamic-relocs-not-being-generated-wi.patch
deleted file mode 100644
index c2967a3..0000000
--- a/package/binutils/arc-2016.03/0700-Fix-issue-with-dynamic-relocs-not-being-generated-wi.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From e59d8728f2fd57938ff28bb48cb47ddc7dbf8271 Mon Sep 17 00:00:00 2001
-From: Cupertino Miranda <cmiranda@synopsys.com>
-Date: Tue, 24 May 2016 18:00:28 +0200
-Subject: [PATCH] Fix issue with dynamic relocs not being generated with -pie.
-
----
- bfd/elf32-arc.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
-index c2d05e4..00af1a5 100644
---- a/bfd/elf32-arc.c
-+++ b/bfd/elf32-arc.c
-@@ -1492,7 +1492,7 @@ elf_arc_relocate_section (bfd *		   output_bfd,
- 	  case R_ARC_32_ME:
- 	  case R_ARC_PC32:
- 	  case R_ARC_32_PCREL:
--	    if (bfd_link_pic (info) && !bfd_link_pie (info)
-+	    if ((bfd_link_pic (info) || bfd_link_pie (info))
- 		&& ((r_type != R_ARC_PC32 && r_type != R_ARC_32_PCREL)
- 		    || (h != NULL
- 			&& h->dynindx != -1
-@@ -1774,7 +1774,7 @@ elf_arc_check_relocs (bfd *		         abfd,
- 	    /* FALLTHROUGH */
- 	  case R_ARC_PC32:
- 	  case R_ARC_32_PCREL:
--	    if (bfd_link_pic (info) && !bfd_link_pie (info)
-+	    if ((bfd_link_pic (info) || bfd_link_pie (info))
- 		&& ((r_type != R_ARC_PC32 && r_type != R_ARC_32_PCREL)
- 		    || (h != NULL
- 			&& h->dynindx != -1
--- 
-2.5.5
-
diff --git a/package/binutils/arc-2016.03/0300-ld-makefile.patch b/package/binutils/arc-2016.09-eng005/0300-ld-makefile.patch
similarity index 100%
rename from package/binutils/arc-2016.03/0300-ld-makefile.patch
rename to package/binutils/arc-2016.09-eng005/0300-ld-makefile.patch
diff --git a/package/binutils/arc-2016.03/0301-check-ldrunpath-length.patch b/package/binutils/arc-2016.09-eng005/0301-check-ldrunpath-length.patch
similarity index 100%
rename from package/binutils/arc-2016.03/0301-check-ldrunpath-length.patch
rename to package/binutils/arc-2016.09-eng005/0301-check-ldrunpath-length.patch
diff --git a/package/binutils/arc-2016.03/0500-add-sysroot-fix-from-bug-3049.patch b/package/binutils/arc-2016.09-eng005/0500-add-sysroot-fix-from-bug-3049.patch
similarity index 100%
rename from package/binutils/arc-2016.03/0500-add-sysroot-fix-from-bug-3049.patch
rename to package/binutils/arc-2016.09-eng005/0500-add-sysroot-fix-from-bug-3049.patch
diff --git a/package/binutils/arc-2016.03/0600-poison-system-directories.patch b/package/binutils/arc-2016.09-eng005/0600-poison-system-directories.patch
similarity index 100%
rename from package/binutils/arc-2016.03/0600-poison-system-directories.patch
rename to package/binutils/arc-2016.09-eng005/0600-poison-system-directories.patch
diff --git a/package/binutils/arc-2016.03/0800-Docs-Prevent-build-failures-when-makeinfo-is-missing.patch b/package/binutils/arc-2016.09-eng005/0800-Docs-Prevent-build-failures-when-makeinfo-is-missing.patch
similarity index 100%
rename from package/binutils/arc-2016.03/0800-Docs-Prevent-build-failures-when-makeinfo-is-missing.patch
rename to package/binutils/arc-2016.09-eng005/0800-Docs-Prevent-build-failures-when-makeinfo-is-missing.patch
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 338bb8d..b313702 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -4,4 +4,4 @@ sha512  0b36dda0e6d32cd25613c0e64b56b28312515c54d6a159efd3db9a86717f114ab0a0a1f6
 sha512  e77e1b8dbbcbaf9ac2fae95c4403615808af3be03b2e1d32448cd3a7d32c43273f8bcace3f2de84ec120a982879295673029da306e2885dbf5f990584932cfc7  binutils-2.26.tar.bz2
 
 # Locally calculated (fetched from Github)
-sha512  566312760ef564902fd85e281ef1370426c1451a16eb1d3e2faea7ec62100ae70ac9a5f33a7a5f87cdc744e82dd03203378fa4db1652c6b7856d865404dd19f8  binutils-arc-2016.03.tar.gz
+sha512  a0e2974990d6087aef94fec958b9f14458e847308d59dfb6f5dd8e9d1a246c4c4885a240ba43f15a7a20aff43bccba5a664daadf7fae54415bb8298620b46c23  binutils-arc-2016.09-eng005.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 9ed7262..2fd91ba 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -9,7 +9,7 @@
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
-BINUTILS_VERSION = arc-2016.03
+BINUTILS_VERSION = arc-2016.09-eng005
 else
 BINUTILS_VERSION = 2.25.1
 endif
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 3180071..44a72f1 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -100,7 +100,7 @@ config BR2_GCC_VERSION
 	default "4.9.3"     if BR2_GCC_VERSION_4_9_X
 	default "5.4.0"     if BR2_GCC_VERSION_5_X
 	default "6.1.0" if BR2_GCC_VERSION_6_X
-	default "arc-2016.03" if BR2_GCC_VERSION_4_8_ARC
+	default "arc-2016.09-eng005" if BR2_GCC_VERSION_4_8_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	string "Additional gcc options"
diff --git a/package/gcc/arc-2015.12/130-fix_build_with_gcc-6.patch b/package/gcc/arc-2016.09-eng005/130-fix_build_with_gcc-6.patch
similarity index 100%
rename from package/gcc/arc-2015.12/130-fix_build_with_gcc-6.patch
rename to package/gcc/arc-2016.09-eng005/130-fix_build_with_gcc-6.patch
diff --git a/package/gcc/arc-2016.03/130-pr43538.patch b/package/gcc/arc-2016.09-eng005/130-pr43538.patch
similarity index 100%
rename from package/gcc/arc-2016.03/130-pr43538.patch
rename to package/gcc/arc-2016.09-eng005/130-pr43538.patch
diff --git a/package/gcc/arc-2016.03/301-missing-execinfo_h.patch b/package/gcc/arc-2016.09-eng005/301-missing-execinfo_h.patch
similarity index 100%
rename from package/gcc/arc-2016.03/301-missing-execinfo_h.patch
rename to package/gcc/arc-2016.09-eng005/301-missing-execinfo_h.patch
diff --git a/package/gcc/arc-2016.03/305-libmudflap-susv3-legacy.patch b/package/gcc/arc-2016.09-eng005/305-libmudflap-susv3-legacy.patch
similarity index 100%
rename from package/gcc/arc-2016.03/305-libmudflap-susv3-legacy.patch
rename to package/gcc/arc-2016.09-eng005/305-libmudflap-susv3-legacy.patch
diff --git a/package/gcc/arc-2016.03/842-PR60155.patch b/package/gcc/arc-2016.09-eng005/842-PR60155.patch
similarity index 100%
rename from package/gcc/arc-2016.03/842-PR60155.patch
rename to package/gcc/arc-2016.09-eng005/842-PR60155.patch
diff --git a/package/gcc/arc-2016.03/850-libstdcxx-uclibc-c99.patch b/package/gcc/arc-2016.09-eng005/850-libstdcxx-uclibc-c99.patch
similarity index 100%
rename from package/gcc/arc-2016.03/850-libstdcxx-uclibc-c99.patch
rename to package/gcc/arc-2016.09-eng005/850-libstdcxx-uclibc-c99.patch
diff --git a/package/gcc/arc-2016.03/851-PR-other-56780.patch b/package/gcc/arc-2016.09-eng005/851-PR-other-56780.patch
similarity index 100%
rename from package/gcc/arc-2016.03/851-PR-other-56780.patch
rename to package/gcc/arc-2016.09-eng005/851-PR-other-56780.patch
diff --git a/package/gcc/arc-2016.03/930-libgcc-disable-split-stack-nothreads.patch b/package/gcc/arc-2016.09-eng005/930-libgcc-disable-split-stack-nothreads.patch
similarity index 100%
rename from package/gcc/arc-2016.03/930-libgcc-disable-split-stack-nothreads.patch
rename to package/gcc/arc-2016.09-eng005/930-libgcc-disable-split-stack-nothreads.patch
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 82160bf..1b41d0a 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -12,4 +12,4 @@ sha512  2941cc950c8f2409a314df497631f9b0266211aa74746c1839c46e04f1c7c299afe2528d
 sha512  eeed3e2018b8c012aabce419e8d718fde701e5c3c179b4486c61ba46e5736eecc8fccdd18b01fcd973a42c6ad3116dbbe2ee247fe3757d622d373f93ebaf8d2e  gcc-6.1.0.tar.bz2
 
 # Locally calculated (fetched from Github)
-sha512  65b1eef5f8ca26941dd9b5e1bcaf4ce285cc95429eeb92b4088663577bcdb2392f9712925f38666d94207fecd244579336f753a13de1f90e5169b21d8a73bef3  gcc-arc-2016.03.tar.gz
+sha512  6234ad8d6e613bc490f8b8d92be8b348ce6cf5e803afab009936323ef5bca36ad56614f57f9ba8a3cb1b03d9f4e45a3e4529b7356a764ad2176e3ff3d0e593db  gcc-arc-2016.09-eng005.tar.gz
-- 
2.5.5
