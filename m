From: Wolfgang Grandegger <wg@grandegger.com>
Date: Sat, 1 Jul 2017 22:30:59 +0200
Subject: [Buildroot] [RFC PATCH v5 02/11] package/patchelf: add patch
 for rpath sanitation under a root directory
In-Reply-To: <e0092045-3a44-4b99-9220-5e8e05fef090@mind.be>
References: <1498811828-6893-1-git-send-email-wg@grandegger.com>
 <1498811828-6893-3-git-send-email-wg@grandegger.com>
 <e0092045-3a44-4b99-9220-5e8e05fef090@mind.be>
Message-ID: <76510517-2a82-ab5d-1f5a-792831c18342@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Am 01.07.2017 um 00:13 schrieb Arnout Vandecappelle:
>   Hi Wolfgang,
> 
> On 30-06-17 10:36, Wolfgang Grandegger wrote:
>> The patch allows to use patchelf to sanitize the rpath of the buildroot
>> libraries and binaries using the option "--make-rpath-relative <rootdir>".
>>
>> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
> 
>   I still have quite a few remarks, one of which is important: when the same
> libfoo.so is present in two directories of the rpath, the second directory
> should be removed but it isn't. See below for details.

Not sure if I understand you correctly. The rpath is for example 
"/usr/lib/dir1:/usr/lib/dir2" and libfoo.so is in both directories!?
>> ---
>>   ...to-make-the-rpath-relative-under-a-specif.patch | 326 +++++++++++++++++++++
>>   1 file changed, 326 insertions(+)
>>   create mode 100644 package/patchelf/0001-Add-option-to-make-the-rpath-relative-under-a-specif.patch
>>
>> diff --git a/package/patchelf/0001-Add-option-to-make-the-rpath-relative-under-a-specif.patch b/package/patchelf/0001-Add-option-to-make-the-rpath-relative-under-a-specif.patch
>> new file mode 100644
>> index 0000000..609eacf
>> --- /dev/null
>> +++ b/package/patchelf/0001-Add-option-to-make-the-rpath-relative-under-a-specif.patch
>> @@ -0,0 +1,326 @@
>> +From af8d4a24a0ef613bdb47f0b1c3d962d59c53a4be Mon Sep 17 00:00:00 2001
>> +From: Wolfgang Grandegger <wg@grandegger.com>
>> +Date: Mon, 20 Feb 2017 16:29:24 +0100
>> +Subject: [PATCH] Add option to make the rpath relative under a specified root
>> + directory
>> +
>> +Running "patchelf" with the option "--make-rpath-relative ROOTDIR" will
>> +modify or delete the RPATHDIRs according the following rules
>> +similar to Martin's patches [1] making the Buildroot toolchaing/SDK
>> +relocatable.
>> +
>> +RPATHDIR starts with "$ORIGIN":
>> +    The original build-system already took care of setting a relative
>> +    RPATH, resolve it and test if it's valid (does exist)
>> +
>> +RPATHDIR starts with ROOTDIR:
>> +    The original build-system added some absolute RPATH (absolute on
>> +    the build machine). Test if it's valid (does exist).
>> +
>> +ROOTDIR/RPATHDIR exists:
>> +    The original build-system already took care of setting an absolute
>> +    RPATH (absolute in the final rootfs), resolve it and test if it's
>> +    valid (does exist).
>> +
>> +RPATHDIR points somewhere else:
>> +    (can be anywhere: build trees, staging tree, host location,
>> +    non-existing location, etc.). Just discard such a path.
>> +
>> +The option "--no-standard-libs" will discard RPATHDIRs ROOTDIR/lib and
>> +ROOTDIR/usr/lib. Like "--shrink-rpath", RPATHDIRs are also discarded
>> +if the directories do not contain a library referenced by the
>> +DT_NEEDED fields.
>> +If the option "--relative-to-file" is given, the rpath will start
>> +with "$ORIGIN" making it relative to the ELF file, otherwise an
>> +absolute path relative to ROOTDIR will be used.
>> +
>> +[1] http://lists.busybox.net/pipermail/buildroot/2016-April/159422.html
>> +
>> +Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
>> +---
>> + src/patchelf.cc | 187 ++++++++++++++++++++++++++++++++++++++++++++++++--------
>> + 1 file changed, 161 insertions(+), 26 deletions(-)
>> +
>> +diff --git a/src/patchelf.cc b/src/patchelf.cc
>> +index 55b38e3..60295b3 100644
>> +--- a/src/patchelf.cc
>> ++++ b/src/patchelf.cc
>> +@@ -50,6 +50,9 @@ static int pageSize = PAGESIZE;
>> +
>> + typedef std::shared_ptr<std::vector<unsigned char>> FileContents;
>> +
>> ++#define MODIFY_FLAG_NO_STD_LIB_DIRS 0x1
>> ++#define MODIFY_FLAG_RELATIVE_TO_FILE 0x2
>> ++static int modifyFlags;
> 
>   I still find it a bad idea to use flags here rather than two separate booleans,
> but I guess that's bikeshedding.

Well, coming from the C world, I love the bit-wise flags. Could switch 
to more C++ like flags, no problem.

> 
>> +
>> + #define ElfFileParams class Elf_Ehdr, class Elf_Phdr, class Elf_Shdr, class Elf_Addr, class Elf_Off, class Elf_Dyn, class Elf_Sym, class Elf_Verneed
>> + #define ElfFileParamNames Elf_Ehdr, Elf_Phdr, Elf_Shdr, Elf_Addr, Elf_Off, Elf_Dyn, Elf_Sym, Elf_Verneed
>> +@@ -84,6 +87,36 @@ static unsigned int getPageSize()
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
>                   ^ missing space
> 
>> ++        relPath.append("/..");
>> ++    }
>> ++    relPath.append(p);
> 
>   I probably asked this before already, but why do we need to pass rootDir
> instead of just eliminating the common part of path and refPath? Something like:
> 
>      while (true) {
>          pos = path.find_first_of('/');
>          refPos = refPath.find_first_of('/');
>          std::string chunk = path.substr(0, pos);
>          std::string refChunk = refPath.substr(0, refPos);
>          if (chunk != refChunk)
>              break;
>          path = path.substr(pos);
>          refPath = refPath.substr(refPos);
>      }
> ...followed by the loop you already had.

Could be done. In that case the path ($ORIGIN) is not relative to 
rootdir. But that's not required. The path must just be within rootdir.

> 
>> ++
>> ++    return relPath;
>> ++}
>> +
>> + template<ElfFileParams>
>> + class ElfFile
>> +@@ -194,9 +227,14 @@ public:
>> +
>> +     void setInterpreter(const std::string & newInterpreter);
>> +
>> +-    typedef enum { rpPrint, rpShrink, rpSet, rpRemove } RPathOp;
>> ++    typedef enum { rpPrint, rpShrink, rpMakeRelative, rpSet, rpRemove} RPathOp;
>> +
>> +-    void modifyRPath(RPathOp op, const std::vector<std::string> & allowedRpathPrefixes, std::string newRPath);
>> ++    bool libFoundInRPath(const std::string & dirName,
>> ++                         const std::vector<std::string> neededLibs);
>> ++
>> ++    void modifyRPath(RPathOp op,
>> ++                     const std::vector<std::string> & allowedRpathPrefixes,
>> ++                     std::string rootDir, int flags, std::string newRPath);
>> +
>> +     void addNeeded(const std::set<std::string> & libs);
>> +
>> +@@ -1108,10 +1146,35 @@ static void concatToRPath(std::string & rpath, const std::string & path)
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
>> ++        if (!neededLibFound[j]) {
>> ++            std::string libName = dirName + "/" + neededLibs[j];
>> ++            try {
>> ++                if (getElfType(readFile(libName, sizeof(Elf32_Ehdr))).machine == rdi(hdr->e_machine)) {
>> ++                    neededLibFound[j] = true;
>> ++                    libFound = true;
>> ++                } else
>> ++                    debug("ignoring library '%s' because its machine type differs\n", libName.c_str());
>> ++            } catch (SysError & e) {
>> ++                if (e.errNo != ENOENT) throw;
>> ++            }
>> ++        }
>> ++    return libFound;
>> ++}
>> +
>> + template<ElfFileParams>
>> + void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op,
>> +-    const std::vector<std::string> & allowedRpathPrefixes, std::string newRPath)
>> ++    const std::vector<std::string> & allowedRpathPrefixes,
>> ++    std::string rootDir, int flags, std::string newRPath)
> 
>   Since the modifyFlags are anyway global, and since this function is already
> using the other global parameter forceRPath, I don't think it makes a lot of
> sense to pass flags as an argument. Also, for consistency, it would be better to
> still call it modifyFlags IMO.

I see, will change that.

>> + {
>> +     Elf_Shdr & shdrDynamic = findSection(".dynamic");
>> +
>> +@@ -1162,11 +1225,14 @@ void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op,
>> +         return;
>> +     }
>> +
>> ++    if (op == rpMakeRelative && !rpath) {
>> ++        debug("no RPATH to make relative\n");
>> ++        return;
>> ++    }
>> +
>> +     /* For each directory in the RPATH, check if it contains any
>> +        needed library. */
>> +     if (op == rpShrink) {
>> +-        std::vector<bool> neededLibFound(neededLibs.size(), false);
> 
>   Darn, I hadn't noticed this before: I think this breaks rpShrink...

Hm, I thought I didn't change rpShrink. I just use a common function to 
avoid duplication code, but ...

>   When you have an rpath /xxx:/yyy, and there is a needed library libfoo.so that
> exists in both /xxx and /yyy, then rpShrink should still remove /yyy. Indeed,
> the one in /xxx gets precedence, and /yyy isn't needed for anything else.
> 
>   However, with your refactoring, the neededLibfound array is reset for every
> iteration of the rpath loop. So when evaluating /yyy, neededLibFound will again
> be false, and /yyy will be kept.
> 
>   Actually, come to think of it, the same problem will occur for the
> rpMakeRelative, no?

... you a right. Good catch! I should pass "neededLibFound" as argument.

> 
>> +
>> +         newRPath = "";
>> +
>> +@@ -1186,30 +1252,81 @@ void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op,
>> +                 continue;
>> +             }
>> +
>> +-            /* For each library that we haven't found yet, see if it
>> +-               exists in this directory. */
>> +-            bool libFound = false;
>> +-            for (unsigned int j = 0; j < neededLibs.size(); ++j)
>> +-                if (!neededLibFound[j]) {
>> +-                    std::string libName = dirName + "/" + neededLibs[j];
>> +-                    try {
>> +-                        if (getElfType(readFile(libName, sizeof(Elf32_Ehdr))).machine == rdi(hdr->e_machine)) {
>> +-                            neededLibFound[j] = true;
>> +-                            libFound = true;
>> +-                        } else
>> +-                            debug("ignoring library '%s' because its machine type differs\n", libName.c_str());
>> +-                    } catch (SysError & e) {
>> +-                        if (e.errNo != ENOENT) throw;
>> +-                    }
>> +-                }
>> +-
>> +-            if (!libFound)
>> ++            if (!libFoundInRPath(dirName, neededLibs))
>> +                 debug("removing directory '%s' from RPATH\n", dirName.c_str());
> 
>   For consistency, we should probably honour --no-standard-lib-dirs here as well.

OK.

>> +             else
>> +                 concatToRPath(newRPath, dirName);
>> +         }
>> +     }
>> +
>> ++    /* Make the the RPATH relative to the specified path */
>> ++    if (op == rpMakeRelative) {
>> ++        std::string fileDir = fileName.substr(0, fileName.find_last_of("/"));
>> ++        newRPath = "";
>> ++
>> ++        for (auto & dirName : splitColonDelimitedString(rpath)) {
>> ++            std::string canonicalPath;
>> ++
>> ++            /* Figure out if we should keep or discard the path. There are several
>> ++               cases to be handled:
>> ++               "dirName" starts with "$ORIGIN":
>> ++                   The original build-system already took care of setting a relative
>> ++                   RPATH. Resolve it and test if it's valid (does exist).
>> ++               "dirName" start with "rootDir":
>> ++                   The original build-system added some absolute RPATH (absolute on
>> ++                   the build machine). Test if it's valid (does exist).
>> ++               "rootDir"/"dirName" exists:
>> ++                    The original build-system already took care of setting an absolute
>> ++                    RPATH (absolute in the final rootfs). Resolve it and test if it's
>> ++                    valid (does exist).
>> ++               "dirName" points somewhere else:
>> ++                    (can be anywhere: build trees, staging tree, host location,
>> ++                    non-existing location, etc.). Just discard such a path. */
>> ++            if (!dirName.compare(0, 7, "$ORIGIN")) {
>> ++                std::string path = fileDir + dirName.substr(7);
>> ++                if (!absolutePathExists(path, canonicalPath)) {
>> ++                    debug("removing directory '%s' from RPATH because '%s' doesn't exist\n",
>> ++			  dirName.c_str(), path.c_str());
>> ++                    continue;
>> ++                }
>> ++            } else if (!dirName.compare(0, rootDir.length(), rootDir)) {
>> ++                if (!absolutePathExists(dirName, canonicalPath)) {
>> ++                    debug("removing directory '%s' from RPATH because it doesn't exist\n", dirName.c_str());
>> ++                    continue;
>> ++                }
>> ++            } else {
>> ++                std::string path = rootDir + dirName;
>> ++                if (!absolutePathExists(path, canonicalPath)) {
>> ++                    debug("removing directory '%s' from RPATH because it's not in rootdir\n",
>> ++			  dirName.c_str());
>> ++                    continue;
>> ++                }
>> ++            }
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
>> ++                debug("removing directory '%s' from RPATH because it does not contain needed libs\n",
>> ++		      dirName.c_str());
>> ++                continue;
>> ++            }
>> ++
>> ++            /* Finally make "canonicalPath" relative to "filedir" in "rootDir" */
>> ++	    if (flags & MODIFY_FLAG_RELATIVE_TO_FILE)
> 
>   Indentation is wrong here (and on the following lines): line starts with tab
> instead of spaces.

OK.

Wolfgang.
