From: Wolfgang Grandegger <wg@grandegger.com>
Date: Sat, 4 Mar 2017 16:16:57 +0100
Subject: [Buildroot] [RFC PATCH 1/9] package/patchelf: use a recent
 version and add "--make-rpath-relative" patch
In-Reply-To: <6f9b5eb0-34dc-498c-b23e-cb6449071210@mind.be>
References: <1488550733-3956-1-git-send-email-wg@grandegger.com>
 <1488550733-3956-2-git-send-email-wg@grandegger.com>
 <6f9b5eb0-34dc-498c-b23e-cb6449071210@mind.be>
Message-ID: <edacb9c4-60c3-5dad-c4a3-863af839f66b@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

Am 04.03.2017 um 12:26 schrieb Arnout Vandecappelle:
>  Hi Wolfgang,
> 
>  The "and" in your subject indicates that this should be two patches: one to
> bump the version, a second one to add the feature.
> 
>  For the version bump, it would be useful to explain why it is needed, because
> we bump from a released version to a development commit.

OK. The idea was to get the patch mainlined first. That's the reason
why I implemented it with the most recent version. If we think the
patch does what we want, I would start the mainlining process. I will split
and update the description.

> On 03-03-17 15:18, Wolfgang Grandegger wrote:
>> The patch allows to use patchelf to sanitize the rpath of the buildroot
>> libraries and binaries.
>>
>> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
>> ---
>>  ...to-make-the-rpath-relative-within-a-speci.patch | 313 +++++++++++++++++++++
>>  package/patchelf/patchelf.hash                     |   2 +-
>>  package/patchelf/patchelf.mk                       |   6 +-
>>  3 files changed, 317 insertions(+), 4 deletions(-)
>>  create mode 100644 package/patchelf/0001-Add-option-to-make-the-rpath-relative-within-a-speci.patch
>>
>> diff --git a/package/patchelf/0001-Add-option-to-make-the-rpath-relative-within-a-speci.patch b/package/patchelf/0001-Add-option-to-make-the-rpath-relative-within-a-speci.patch
>> new file mode 100644
>> index 0000000..44b1742
>> --- /dev/null
>> +++ b/package/patchelf/0001-Add-option-to-make-the-rpath-relative-within-a-speci.patch
>> @@ -0,0 +1,313 @@
>> +From cc9f15bb80cf36b4a88e10000c3b1c1989b51197 Mon Sep 17 00:00:00 2001
>> +From: Wolfgang Grandegger <wg@grandegger.com>
>> +Date: Mon, 20 Feb 2017 16:29:24 +0100
>> +Subject: [PATCH] Add option to make the rpath relative within a specified root
>> + directory
>> +
>> +Running "patchelf" with the option "--make-rpath-relative ROOTDIR" will
>> +modify or delete the RPATHDIRs according the following rules, similar
>> +to Martin's patches [1] making the build/SDK relocatable.
> 
>  For upstream, you probably should start the commit message with an explanation
> why we want this, i.e. to be able to move binaries to a different runtime
> location then where they were built.

OK.

>> +
>> +RPATHDIR starts with "$ORIGIN":
>> +    The original build-system already took care of setting a relative
>> +    RPATH, resolve it and test if it is worthwhile to keep it.
> 
>  IIUC, the --make-rpath-relative by itself doesn't evaluate the "worthwhile to
> keep it", so I'd just say "leave unchanged". Same for the others below.

It does check if the path exists and if it's within the root tree. If
not; it get's dropped. I will update the description.

>> +
>> +RPATHDIR starts with ROOTDIR:
>> +    The original build-system added some absolute RPATH (absolute on
>> +    the build machine). While this is wrong, it can still be fixed; so
>> +    test if it is worthwhile to keep it.
> 
>  It is not wrong per se, it's only wrong if you move the binary (i.e. it is
> wrong for cross-compilation).

Yep.

>> +ROOTDIR/RPATHDIR exists:
>> +    The original build-system already took care of setting an absolute
>> +    RPATH (absolute in the final rootfs), resolve it and test if it's
>> +    worthwhile to keep it.
> 
>  *This* bit is in fact only relevant if --no-standard-libs is specified (i.e.
> not for host binaries, only for target binaries).

No, for example pulseaudio uses the following target RPATH dirs:

ROOTDIR/usr/lib/pulseaudio
ROOTDIR/usr/lib/pulse-9.0/modules

>> +
>> +RPATHDIR points somewhere else:
>> +    (can be anywhere: build trees, staging tree, host location,
>> +    non-existing location, etc.). Just discard such a path.
> 
>  I think a warning should be printed in this case, certainly if
> --no-standard-libs is specified.

This is very often the case. Here is the host rpath from pulseaudio:

/opt/bdo/alqt5/build/pulseaudio-9.0/src/.libs:/opt/bdo/alqt5/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib:/usr/lib/pulseaudio

Especially references to .libs and sysroot do show up often.

>> +In addition, the option "--no-standard-libs" will discard RPATHDIRs
>> +ROOTDIR/lib and ROOTDIR/usr/lib. Like "--shrink-rpath", RPATHDIRs
>> +are discarded if the directories do not contain a library
>> +referenced by DT_NEEDED fields.
> 
>  Again, since you're doing two separate things here, I would think that it makes
> sense to split this patch in two for upstream. You can still include both
> upstream patches in a single Buildroot commit, but I think for upstream it is
> easier to accept the changes if they're separated.

If you look to the patch, it uses a separate "if" block to implement
"--make-rpath-relative". It does not interfere with the
"--shrink-rpath" block. Actually, I didn't find an elegant way to
extend the "--shrink-rpath" logic. It's to much different.

>> +
>> +[1] http://lists.busybox.net/pipermail/buildroot/2016-April/159422.html
>> +---
>> + src/patchelf.cc | 179 ++++++++++++++++++++++++++++++++++++++++++++++++--------
>> + 1 file changed, 153 insertions(+), 26 deletions(-)
>> +
>> +diff --git a/src/patchelf.cc b/src/patchelf.cc
>> +index 5077cd5..24ebe89 100644
>> +--- a/src/patchelf.cc
>> ++++ b/src/patchelf.cc
>> +@@ -49,6 +49,8 @@ static int pageSize = PAGESIZE;
>> + 
>> + typedef std::shared_ptr<std::vector<unsigned char>> FileContents;
>> + 
>> ++#define MODIFY_FLAG_NO_STD_LIB_DIRS 0x1
>> ++static int modifyFlags;
> 
>  Since this flag can have just one value, it makes more sense to make it a
> boolean, no? Also it should be together with the other command line options like
> shrinkRPath.

For the moment yes, but I thought it may hold other flags, e.g. to
suppress checking the rpath dir against the needed libraries.

>> + 
>> + #define ElfFileParams class Elf_Ehdr, class Elf_Phdr, class Elf_Shdr, class Elf_Addr, class Elf_Off, class Elf_Dyn, class Elf_Sym, class Elf_Verneed
>> + #define ElfFileParamNames Elf_Ehdr, Elf_Phdr, Elf_Shdr, Elf_Addr, Elf_Off, Elf_Dyn, Elf_Sym, Elf_Verneed
>> +@@ -83,6 +85,36 @@ static unsigned int getPageSize()
>> +     return pageSize;
>> + }
>> + 
>> ++static bool absolutePathExists(const std::string & path, std::string & canonicalPath)
>> ++{
>> ++    char *cpath = realpath(path.c_str(), NULL);
>> ++    if (cpath) {
>> ++        canonicalPath = cpath;
>> ++        free(cpath);
>> ++        return true;
>> ++    } else {
>> ++        return false;
>> ++    }
>> ++}
>> ++
>> ++static std::string makePathRelative(const std::string & path,
>> ++    const std::string & refPath, const std::string & rootDir)
>> ++{
>> ++    std::string relPath = "$ORIGIN";
>> ++
>> ++    /* Strip root path first */
>> ++    std::string p = path.substr(rootDir.length());
>> ++    std::string refP = refPath.substr(rootDir.length());
>> ++
>> ++    std::size_t pos = refP.find_first_of('/');
>> ++    while (pos != std::string::npos) {
>> ++        pos =refP.find_first_of('/', pos + 1);
>> ++        relPath.append("/..");
>> ++    }
>> ++    relPath.append(p);
>> ++
>> ++    return relPath;
>> ++}
>> + 
>> + template<ElfFileParams>
>> + class ElfFile
>> +@@ -191,9 +223,14 @@ public:
>> + 
>> +     void setInterpreter(const std::string & newInterpreter);
>> + 
>> +-    typedef enum { rpPrint, rpShrink, rpSet, rpRemove } RPathOp;
>> ++    typedef enum { rpPrint, rpShrink, rpMakeRelative, rpSet, rpRemove} RPathOp;
>> + 
>> +-    void modifyRPath(RPathOp op, const std::vector<std::string> & allowedRpathPrefixes, std::string newRPath);
>> ++    bool libFoundInRPath(const std::string & dirName,
>> ++			 const std::vector<std::string> neededLibs);
>> ++
>> ++    void modifyRPath(RPathOp op,
>> ++                     const std::vector<std::string> & allowedRpathPrefixes,
>> ++                     std::string rootDir, int flags, std::string newRPath);
> 
>  So here I think it should be 'bool noStdLibDirs' rather than flags.
> 
>  However, wouldn't it be better to instead add forbiddenRpathPrefixes? That
> makes it symmetrical with allowedRpathPrefixes and easier to understand IMHO.

I implemented "forbiddenRpathPrefixes" but I did not find it useful for
our purpose. What do you have in mind?

>> + 
>> +     void addNeeded(const std::set<std::string> & libs);
>> + 
>> +@@ -1099,10 +1136,35 @@ static void concatToRPath(std::string & rpath, const std::string & path)
>> +     rpath += path;
>> + }
>> + 
>> ++template<ElfFileParams>
>> ++bool ElfFile<ElfFileParamNames>::libFoundInRPath(const std::string & dirName,
>> ++    const std::vector<std::string> neededLibs)
>> ++{
>> ++    std::vector<bool> neededLibFound(neededLibs.size(), false);
>> ++
>> ++    /* For each library that we haven't found yet, see if it
>> ++       exists in this directory. */
>> ++    bool libFound = false;
>> ++    for (unsigned int j = 0; j < neededLibs.size(); ++j)
>> ++	if (!neededLibFound[j]) {
>> ++	    std::string libName = dirName + "/" + neededLibs[j];
>> ++	    try {
>> ++		if (getElfType(readFile(libName, sizeof(Elf32_Ehdr))).machine == rdi(hdr->e_machine)) {
>> ++		    neededLibFound[j] = true;
>> ++		    libFound = true;
>> ++		} else
>> ++		    debug("ignoring library '%s' because its machine type differs\n", libName.c_str());
>> ++	    } catch (SysError & e) {
>> ++		if (e.errNo != ENOENT) throw;
>> ++	    }
>> ++	}
>> ++    return libFound;
>> ++}
> 
>  I would do this refactoring part in a separate patch as well.

I agree.

>> + 
>> + template<ElfFileParams>
>> + void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op,
>> +-    const std::vector<std::string> & allowedRpathPrefixes, std::string newRPath)
>> ++    const std::vector<std::string> & allowedRpathPrefixes,
>> ++    std::string rootDir, int flags, std::string newRPath)
>> + {
>> +     Elf_Shdr & shdrDynamic = findSection(".dynamic");
>> + 
>> +@@ -1153,11 +1215,14 @@ void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op,
>> +         return;
>> +     }
>> + 
>> ++    if (op == rpMakeRelative && !rpath) {
>> ++        debug("no RPATH to make relative\n");
>> ++        return;
>> ++    }
> 
>  Minor nit: this should either be merged in the condition for rpShrink above, or
> it should move just before the handling of rpMakeRelative below.

OK.

> [snip]
>> + 
>> ++    /* Make the the RPATH relative to the specified path */
>> ++    if (op == rpMakeRelative) {
>> ++        std::string fileDir = fileName.substr(0, fileName.find_last_of("/"));
>> ++        newRPath = "";
>> ++
>> ++        for (auto & dirName : splitColonDelimitedString(rpath)) {
>> ++            std::string canonicalPath;
> 
>  Call it absolutePath, since it is the return value of absolutePathExists().

The path returned is the canonical one. The absolutePath is an input parameter of that function.

> 
>> ++            std::string path;
> 
>  This doesn't say much. How about resolvedPath? Because basically you're
> resolving the path relative to $ORIGIN and rootDir.

It's just a helper variable used for different things.

> 
>> ++
>> ++            /* Figure out if we should keep or discard the path; there are several
>> ++               cases to handled:
>> ++               "dirName" starts with "$ORIGIN":
>> ++                   The original build-system already took care of setting a relative
>> ++                   RPATH, resolve it and test if it is worthwhile to keep it.
>> ++               "dirName" start with "rootDir":
>> ++                   The original build-system added some absolute RPATH (absolute on
>> ++                   the build machine). While this is wrong, it can still be fixed; so
>> ++                   test if it is worthwhile to keep it.
>> ++               "rootDir"/"dirName" exists:
>> ++                    The original build-system already took care of setting an absolute
>> ++                    RPATH (absolute in the final rootfs), resolve it and test if it is
>> ++                    worthwhile to keep it;
>> ++                "dirName" points somewhere else:
>> ++                    (can be anywhere: build trees, staging tree, host location,
>> ++                    non-existing location, etc.). Just discard such a path. */
>> ++            if (!dirName.compare(0, 7, "$ORIGIN")) {
>> ++                path = fileDir + dirName.substr(7);
>> ++                if (!absolutePathExists(path, canonicalPath)) {
>> ++                    debug("removing directory '%s' from RPATH because it doesn't exist\n", dirName.c_str());
>> ++                    continue;
>> ++                }
>> ++            } else if (!dirName.compare(0, rootDir.length(), rootDir)) {
>> ++                if (!absolutePathExists(dirName, canonicalPath)) {
>> ++                    debug("removing directory '%s' from RPATH because it doesn't exist\n", dirName.c_str());
>> ++                    continue;
>> ++                }
>> ++            } else {
>> ++                path = rootDir + dirName;
>> ++                if (!absolutePathExists(path, canonicalPath)) {
>> ++                    debug("removing directory '%s' from RPATH because it's not under the root directory\n",
>> ++                          dirName.c_str());
>> ++                    continue;
>> ++                }
>> ++            }
> 
>  This bit could be refactored a little, where you assign path = ... in each
> branch of the condition, and check absolutePathExists afterwards.

It makes the code more complex and the reason for the reject needs then
to be handled by a separate variable.

> 
>> ++
>> ++            if (flags & MODIFY_FLAG_NO_STD_LIB_DIRS) {
>> ++                if (!canonicalPath.compare(rootDir + "/lib") ||
>> ++                    !canonicalPath.compare(rootDir + "/usr/lib")) {
>> ++                    debug("removing directory '%s' from RPATH because it's a standard library directory\n",
>> ++                         dirName.c_str());
>> ++                    continue;
>> ++                }
>> ++            }
>> ++
>> ++            if (!libFoundInRPath(canonicalPath, neededLibs)) {
>> ++                debug("removing directory '%s' from RPATH\n", dirName.c_str());
>> ++                continue;
>> ++	    }
> 
>  Tab-space mixup.

I should remove all tabs, I know :(.

> 
>> ++
>> ++            /* Finally make "canonicalPath" relative to "filedir" in "rootDir" */
>> ++            concatToRPath(newRPath, makePathRelative(canonicalPath, fileDir, rootDir));
>> ++	    debug("keeping relative path of %s", canonicalPath.c_str());
> 
>  Also tab-space mixup.
> 
>> ++        }
>> ++    }
> 
>  Looking at the whole of this functionality, it seems to me that it makes more
> sense to completely separate the rpMakeRelative functionality from the rpShrink
> functionality. You would be allowed to combine the --make-rpath-relative option
> with the --shrink-rpath option.

rpMakeRelative *is* separated from the rShrinkRpath case here:

    if (shrinkRPath)
        elfFile.modifyRPath(elfFile.rpShrink, allowedRpathPrefixes, "", modifyFlags, "");
    else if (removeRPath)
        elfFile.modifyRPath(elfFile.rpRemove, {}, "", modifyFlags, "");
    else if (setRPath)
        elfFile.modifyRPath(elfFile.rpSet, {}, "", modifyFlags, newRPath);
    else if (makeRPathRelative)
        elfFile.modifyRPath(elfFile.rpMakeRelative, {}, rootDir, modifyFlags, "");

But maybe I have missed something.

> 
>  So something like the following sequence of changes (each a separate patch of
> course):
> 
> 1. Extend the rpShrink functionality to also remove paths that don't exist
> (including relative paths). This is something that could be considered a fix of
> the current shrink functionality.

You mean pathes not within within a specified rootfs tree?

> 2. Extend the rpShrink functionality with removal of standard search paths. This
> would probably be an extra flag similar to --allowed-rpath-prefixes. Actually,
> I'd not even speak of "standard search paths", instead require the user to pass
> a list of paths to remove, with an argument e.g. --remove-rpaths.
> 
> 3. Add an option which *only* does conversion to relative paths, prior to the
> shrink step.
> 
>  For the conversion to relative paths, you pass the rootDir. Strictly speaking,
> this is not needed for conversion to relative paths; you could have a separate
> step that verifies that the relative path doesn't go out of the rootDir. Still,
> we also have to deal with the case where the cross-compilation correctly used an
> absolute path relative to rootDir rather than a full absolute path including the
> build directory. So this is probably more elegant.

Yes, "rootDir"/"dirName" exists. But to check if the path is OK we need to extend
it to an absolute path first.

The question is if the single steps are useful for other purposes as well or if we
need to apply them all together anyway... and just screw-up/misuse the
"--shrink-rpath" case.

>  I realize that what I'm suggesting here is a big change, and I'm not even sure
> that this approach would work. So it's completely optional.

See above. Let's wait and see what the patchelf maintainers think?

> [snip]
>> diff --git a/package/patchelf/patchelf.hash b/package/patchelf/patchelf.hash
>> index 653eb46..7188b2e 100644
>> --- a/package/patchelf/patchelf.hash
>> +++ b/package/patchelf/patchelf.hash
>> @@ -1,2 +1,2 @@
>>  # Locally calculated
>> -sha256	a0f65c1ba148890e9f2f7823f4bedf7ecad5417772f64f994004f59a39014f83	patchelf-0.9.tar.bz2
>> +sha256	d90cbedb2efa516b2373640560aa6b37f0e29c4967611c3312981e30dbbab966  patchelf-c1f89c077e44a495c62ed0dcfaeca21510df93ef.tar.gz
> 
>  If you convert the tab to two spaces (which is a good idea), also do it for the
> first tab.

OK.

Thanks for reviewing.

Wolfgang.
