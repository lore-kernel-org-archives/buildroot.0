From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 4 Mar 2017 12:26:19 +0100
Subject: [Buildroot] [RFC PATCH 1/9] package/patchelf: use a recent
 version and add "--make-rpath-relative" patch
In-Reply-To: <1488550733-3956-2-git-send-email-wg@grandegger.com>
References: <1488550733-3956-1-git-send-email-wg@grandegger.com>
 <1488550733-3956-2-git-send-email-wg@grandegger.com>
Message-ID: <6f9b5eb0-34dc-498c-b23e-cb6449071210@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Wolfgang,

 The "and" in your subject indicates that this should be two patches: one to
bump the version, a second one to add the feature.

 For the version bump, it would be useful to explain why it is needed, because
we bump from a released version to a development commit.

On 03-03-17 15:18, Wolfgang Grandegger wrote:
> The patch allows to use patchelf to sanitize the rpath of the buildroot
> libraries and binaries.
> 
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
> ---
>  ...to-make-the-rpath-relative-within-a-speci.patch | 313 +++++++++++++++++++++
>  package/patchelf/patchelf.hash                     |   2 +-
>  package/patchelf/patchelf.mk                       |   6 +-
>  3 files changed, 317 insertions(+), 4 deletions(-)
>  create mode 100644 package/patchelf/0001-Add-option-to-make-the-rpath-relative-within-a-speci.patch
> 
> diff --git a/package/patchelf/0001-Add-option-to-make-the-rpath-relative-within-a-speci.patch b/package/patchelf/0001-Add-option-to-make-the-rpath-relative-within-a-speci.patch
> new file mode 100644
> index 0000000..44b1742
> --- /dev/null
> +++ b/package/patchelf/0001-Add-option-to-make-the-rpath-relative-within-a-speci.patch
> @@ -0,0 +1,313 @@
> +From cc9f15bb80cf36b4a88e10000c3b1c1989b51197 Mon Sep 17 00:00:00 2001
> +From: Wolfgang Grandegger <wg@grandegger.com>
> +Date: Mon, 20 Feb 2017 16:29:24 +0100
> +Subject: [PATCH] Add option to make the rpath relative within a specified root
> + directory
> +
> +Running "patchelf" with the option "--make-rpath-relative ROOTDIR" will
> +modify or delete the RPATHDIRs according the following rules, similar
> +to Martin's patches [1] making the build/SDK relocatable.

 For upstream, you probably should start the commit message with an explanation
why we want this, i.e. to be able to move binaries to a different runtime
location then where they were built.

> +
> +RPATHDIR starts with "$ORIGIN":
> +    The original build-system already took care of setting a relative
> +    RPATH, resolve it and test if it is worthwhile to keep it.

 IIUC, the --make-rpath-relative by itself doesn't evaluate the "worthwhile to
keep it", so I'd just say "leave unchanged". Same for the others below.

> +
> +RPATHDIR starts with ROOTDIR:
> +    The original build-system added some absolute RPATH (absolute on
> +    the build machine). While this is wrong, it can still be fixed; so
> +    test if it is worthwhile to keep it.

 It is not wrong per se, it's only wrong if you move the binary (i.e. it is
wrong for cross-compilation).


> +ROOTDIR/RPATHDIR exists:
> +    The original build-system already took care of setting an absolute
> +    RPATH (absolute in the final rootfs), resolve it and test if it's
> +    worthwhile to keep it.

 *This* bit is in fact only relevant if --no-standard-libs is specified (i.e.
not for host binaries, only for target binaries).

> +
> +RPATHDIR points somewhere else:
> +    (can be anywhere: build trees, staging tree, host location,
> +    non-existing location, etc.). Just discard such a path.

 I think a warning should be printed in this case, certainly if
--no-standard-libs is specified.

> +In addition, the option "--no-standard-libs" will discard RPATHDIRs
> +ROOTDIR/lib and ROOTDIR/usr/lib. Like "--shrink-rpath", RPATHDIRs
> +are discarded if the directories do not contain a library
> +referenced by DT_NEEDED fields.

 Again, since you're doing two separate things here, I would think that it makes
sense to split this patch in two for upstream. You can still include both
upstream patches in a single Buildroot commit, but I think for upstream it is
easier to accept the changes if they're separated.

> +
> +[1] http://lists.busybox.net/pipermail/buildroot/2016-April/159422.html
> +---
> + src/patchelf.cc | 179 ++++++++++++++++++++++++++++++++++++++++++++++++--------
> + 1 file changed, 153 insertions(+), 26 deletions(-)
> +
> +diff --git a/src/patchelf.cc b/src/patchelf.cc
> +index 5077cd5..24ebe89 100644
> +--- a/src/patchelf.cc
> ++++ b/src/patchelf.cc
> +@@ -49,6 +49,8 @@ static int pageSize = PAGESIZE;
> + 
> + typedef std::shared_ptr<std::vector<unsigned char>> FileContents;
> + 
> ++#define MODIFY_FLAG_NO_STD_LIB_DIRS 0x1
> ++static int modifyFlags;

 Since this flag can have just one value, it makes more sense to make it a
boolean, no? Also it should be together with the other command line options like
shrinkRPath.

> + 
> + #define ElfFileParams class Elf_Ehdr, class Elf_Phdr, class Elf_Shdr, class Elf_Addr, class Elf_Off, class Elf_Dyn, class Elf_Sym, class Elf_Verneed
> + #define ElfFileParamNames Elf_Ehdr, Elf_Phdr, Elf_Shdr, Elf_Addr, Elf_Off, Elf_Dyn, Elf_Sym, Elf_Verneed
> +@@ -83,6 +85,36 @@ static unsigned int getPageSize()
> +     return pageSize;
> + }
> + 
> ++static bool absolutePathExists(const std::string & path, std::string & canonicalPath)
> ++{
> ++    char *cpath = realpath(path.c_str(), NULL);
> ++    if (cpath) {
> ++        canonicalPath = cpath;
> ++        free(cpath);
> ++        return true;
> ++    } else {
> ++        return false;
> ++    }
> ++}
> ++
> ++static std::string makePathRelative(const std::string & path,
> ++    const std::string & refPath, const std::string & rootDir)
> ++{
> ++    std::string relPath = "$ORIGIN";
> ++
> ++    /* Strip root path first */
> ++    std::string p = path.substr(rootDir.length());
> ++    std::string refP = refPath.substr(rootDir.length());
> ++
> ++    std::size_t pos = refP.find_first_of('/');
> ++    while (pos != std::string::npos) {
> ++        pos =refP.find_first_of('/', pos + 1);
> ++        relPath.append("/..");
> ++    }
> ++    relPath.append(p);
> ++
> ++    return relPath;
> ++}
> + 
> + template<ElfFileParams>
> + class ElfFile
> +@@ -191,9 +223,14 @@ public:
> + 
> +     void setInterpreter(const std::string & newInterpreter);
> + 
> +-    typedef enum { rpPrint, rpShrink, rpSet, rpRemove } RPathOp;
> ++    typedef enum { rpPrint, rpShrink, rpMakeRelative, rpSet, rpRemove} RPathOp;
> + 
> +-    void modifyRPath(RPathOp op, const std::vector<std::string> & allowedRpathPrefixes, std::string newRPath);
> ++    bool libFoundInRPath(const std::string & dirName,
> ++			 const std::vector<std::string> neededLibs);
> ++
> ++    void modifyRPath(RPathOp op,
> ++                     const std::vector<std::string> & allowedRpathPrefixes,
> ++                     std::string rootDir, int flags, std::string newRPath);

 So here I think it should be 'bool noStdLibDirs' rather than flags.

 However, wouldn't it be better to instead add forbiddenRpathPrefixes? That
makes it symmetrical with allowedRpathPrefixes and easier to understand IMHO.

> + 
> +     void addNeeded(const std::set<std::string> & libs);
> + 
> +@@ -1099,10 +1136,35 @@ static void concatToRPath(std::string & rpath, const std::string & path)
> +     rpath += path;
> + }
> + 
> ++template<ElfFileParams>
> ++bool ElfFile<ElfFileParamNames>::libFoundInRPath(const std::string & dirName,
> ++    const std::vector<std::string> neededLibs)
> ++{
> ++    std::vector<bool> neededLibFound(neededLibs.size(), false);
> ++
> ++    /* For each library that we haven't found yet, see if it
> ++       exists in this directory. */
> ++    bool libFound = false;
> ++    for (unsigned int j = 0; j < neededLibs.size(); ++j)
> ++	if (!neededLibFound[j]) {
> ++	    std::string libName = dirName + "/" + neededLibs[j];
> ++	    try {
> ++		if (getElfType(readFile(libName, sizeof(Elf32_Ehdr))).machine == rdi(hdr->e_machine)) {
> ++		    neededLibFound[j] = true;
> ++		    libFound = true;
> ++		} else
> ++		    debug("ignoring library '%s' because its machine type differs\n", libName.c_str());
> ++	    } catch (SysError & e) {
> ++		if (e.errNo != ENOENT) throw;
> ++	    }
> ++	}
> ++    return libFound;
> ++}

 I would do this refactoring part in a separate patch as well.

> + 
> + template<ElfFileParams>
> + void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op,
> +-    const std::vector<std::string> & allowedRpathPrefixes, std::string newRPath)
> ++    const std::vector<std::string> & allowedRpathPrefixes,
> ++    std::string rootDir, int flags, std::string newRPath)
> + {
> +     Elf_Shdr & shdrDynamic = findSection(".dynamic");
> + 
> +@@ -1153,11 +1215,14 @@ void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op,
> +         return;
> +     }
> + 
> ++    if (op == rpMakeRelative && !rpath) {
> ++        debug("no RPATH to make relative\n");
> ++        return;
> ++    }

 Minor nit: this should either be merged in the condition for rpShrink above, or
it should move just before the handling of rpMakeRelative below.

[snip]
> + 
> ++    /* Make the the RPATH relative to the specified path */
> ++    if (op == rpMakeRelative) {
> ++        std::string fileDir = fileName.substr(0, fileName.find_last_of("/"));
> ++        newRPath = "";
> ++
> ++        for (auto & dirName : splitColonDelimitedString(rpath)) {
> ++            std::string canonicalPath;

 Call it absolutePath, since it is the return value of absolutePathExists().

> ++            std::string path;

 This doesn't say much. How about resolvedPath? Because basically you're
resolving the path relative to $ORIGIN and rootDir.

> ++
> ++            /* Figure out if we should keep or discard the path; there are several
> ++               cases to handled:
> ++               "dirName" starts with "$ORIGIN":
> ++                   The original build-system already took care of setting a relative
> ++                   RPATH, resolve it and test if it is worthwhile to keep it.
> ++               "dirName" start with "rootDir":
> ++                   The original build-system added some absolute RPATH (absolute on
> ++                   the build machine). While this is wrong, it can still be fixed; so
> ++                   test if it is worthwhile to keep it.
> ++               "rootDir"/"dirName" exists:
> ++                    The original build-system already took care of setting an absolute
> ++                    RPATH (absolute in the final rootfs), resolve it and test if it is
> ++                    worthwhile to keep it;
> ++                "dirName" points somewhere else:
> ++                    (can be anywhere: build trees, staging tree, host location,
> ++                    non-existing location, etc.). Just discard such a path. */
> ++            if (!dirName.compare(0, 7, "$ORIGIN")) {
> ++                path = fileDir + dirName.substr(7);
> ++                if (!absolutePathExists(path, canonicalPath)) {
> ++                    debug("removing directory '%s' from RPATH because it doesn't exist\n", dirName.c_str());
> ++                    continue;
> ++                }
> ++            } else if (!dirName.compare(0, rootDir.length(), rootDir)) {
> ++                if (!absolutePathExists(dirName, canonicalPath)) {
> ++                    debug("removing directory '%s' from RPATH because it doesn't exist\n", dirName.c_str());
> ++                    continue;
> ++                }
> ++            } else {
> ++                path = rootDir + dirName;
> ++                if (!absolutePathExists(path, canonicalPath)) {
> ++                    debug("removing directory '%s' from RPATH because it's not under the root directory\n",
> ++                          dirName.c_str());
> ++                    continue;
> ++                }
> ++            }

 This bit could be refactored a little, where you assign path = ... in each
branch of the condition, and check absolutePathExists afterwards.

> ++
> ++            if (flags & MODIFY_FLAG_NO_STD_LIB_DIRS) {
> ++                if (!canonicalPath.compare(rootDir + "/lib") ||
> ++                    !canonicalPath.compare(rootDir + "/usr/lib")) {
> ++                    debug("removing directory '%s' from RPATH because it's a standard library directory\n",
> ++                         dirName.c_str());
> ++                    continue;
> ++                }
> ++            }
> ++
> ++            if (!libFoundInRPath(canonicalPath, neededLibs)) {
> ++                debug("removing directory '%s' from RPATH\n", dirName.c_str());
> ++                continue;
> ++	    }

 Tab-space mixup.

> ++
> ++            /* Finally make "canonicalPath" relative to "filedir" in "rootDir" */
> ++            concatToRPath(newRPath, makePathRelative(canonicalPath, fileDir, rootDir));
> ++	    debug("keeping relative path of %s", canonicalPath.c_str());

 Also tab-space mixup.

> ++        }
> ++    }

 Looking at the whole of this functionality, it seems to me that it makes more
sense to completely separate the rpMakeRelative functionality from the rpShrink
functionality. You would be allowed to combine the --make-rpath-relative option
with the --shrink-rpath option.

 So something like the following sequence of changes (each a separate patch of
course):

1. Extend the rpShrink functionality to also remove paths that don't exist
(including relative paths). This is something that could be considered a fix of
the current shrink functionality.

2. Extend the rpShrink functionality with removal of standard search paths. This
would probably be an extra flag similar to --allowed-rpath-prefixes. Actually,
I'd not even speak of "standard search paths", instead require the user to pass
a list of paths to remove, with an argument e.g. --remove-rpaths.

3. Add an option which *only* does conversion to relative paths, prior to the
shrink step.

 For the conversion to relative paths, you pass the rootDir. Strictly speaking,
this is not needed for conversion to relative paths; you could have a separate
step that verifies that the relative path doesn't go out of the rootDir. Still,
we also have to deal with the case where the cross-compilation correctly used an
absolute path relative to rootDir rather than a full absolute path including the
build directory. So this is probably more elegant.

 I realize that what I'm suggesting here is a big change, and I'm not even sure
that this approach would work. So it's completely optional.

[snip]
> diff --git a/package/patchelf/patchelf.hash b/package/patchelf/patchelf.hash
> index 653eb46..7188b2e 100644
> --- a/package/patchelf/patchelf.hash
> +++ b/package/patchelf/patchelf.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256	a0f65c1ba148890e9f2f7823f4bedf7ecad5417772f64f994004f59a39014f83	patchelf-0.9.tar.bz2
> +sha256	d90cbedb2efa516b2373640560aa6b37f0e29c4967611c3312981e30dbbab966  patchelf-c1f89c077e44a495c62ed0dcfaeca21510df93ef.tar.gz

 If you convert the tab to two spaces (which is a good idea), also do it for the
first tab.

 Regards,
 Arnout

> diff --git a/package/patchelf/patchelf.mk b/package/patchelf/patchelf.mk
> index cf2e43a..c880222 100644
> --- a/package/patchelf/patchelf.mk
> +++ b/package/patchelf/patchelf.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PATCHELF_VERSION = 0.9
> -PATCHELF_SITE = http://releases.nixos.org/patchelf/patchelf-$(PATCHELF_VERSION)
> -PATCHELF_SOURCE = patchelf-$(PATCHELF_VERSION).tar.bz2
> +PATCHELF_VERSION = c1f89c077e44a495c62ed0dcfaeca21510df93ef
> +PATCHELF_SITE = $(call github,NixOS,patchelf,$(PATCHELF_VERSION))
> +PATCHELF_AUTORECONF = YES
>  PATCHELF_LICENSE = GPLv3+
>  PATCHELF_LICENSE_FILES = COPYING
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
