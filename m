From: Wolfgang Grandegger <wg@grandegger.com>
Date: Fri,  3 Mar 2017 15:18:45 +0100
Subject: [Buildroot] [RFC PATCH 1/9] package/patchelf: use a recent version
	and add "--make-rpath-relative" patch
In-Reply-To: <1488550733-3956-1-git-send-email-wg@grandegger.com>
References: <1488550733-3956-1-git-send-email-wg@grandegger.com>
Message-ID: <1488550733-3956-2-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch allows to use patchelf to sanitize the rpath of the buildroot
libraries and binaries.

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 ...to-make-the-rpath-relative-within-a-speci.patch | 313 +++++++++++++++++++++
 package/patchelf/patchelf.hash                     |   2 +-
 package/patchelf/patchelf.mk                       |   6 +-
 3 files changed, 317 insertions(+), 4 deletions(-)
 create mode 100644 package/patchelf/0001-Add-option-to-make-the-rpath-relative-within-a-speci.patch

diff --git a/package/patchelf/0001-Add-option-to-make-the-rpath-relative-within-a-speci.patch b/package/patchelf/0001-Add-option-to-make-the-rpath-relative-within-a-speci.patch
new file mode 100644
index 0000000..44b1742
--- /dev/null
+++ b/package/patchelf/0001-Add-option-to-make-the-rpath-relative-within-a-speci.patch
@@ -0,0 +1,313 @@
+From cc9f15bb80cf36b4a88e10000c3b1c1989b51197 Mon Sep 17 00:00:00 2001
+From: Wolfgang Grandegger <wg@grandegger.com>
+Date: Mon, 20 Feb 2017 16:29:24 +0100
+Subject: [PATCH] Add option to make the rpath relative within a specified root
+ directory
+
+Running "patchelf" with the option "--make-rpath-relative ROOTDIR" will
+modify or delete the RPATHDIRs according the following rules, similar
+to Martin's patches [1] making the build/SDK relocatable.
+
+RPATHDIR starts with "$ORIGIN":
+    The original build-system already took care of setting a relative
+    RPATH, resolve it and test if it is worthwhile to keep it.
+
+RPATHDIR starts with ROOTDIR:
+    The original build-system added some absolute RPATH (absolute on
+    the build machine). While this is wrong, it can still be fixed; so
+    test if it is worthwhile to keep it.
+
+ROOTDIR/RPATHDIR exists:
+    The original build-system already took care of setting an absolute
+    RPATH (absolute in the final rootfs), resolve it and test if it's
+    worthwhile to keep it.
+
+RPATHDIR points somewhere else:
+    (can be anywhere: build trees, staging tree, host location,
+    non-existing location, etc.). Just discard such a path.
+
+In addition, the option "--no-standard-libs" will discard RPATHDIRs
+ROOTDIR/lib and ROOTDIR/usr/lib. Like "--shrink-rpath", RPATHDIRs
+are discarded if the directories do not contain a library
+referenced by DT_NEEDED fields.
+
+[1] http://lists.busybox.net/pipermail/buildroot/2016-April/159422.html
+---
+ src/patchelf.cc | 179 ++++++++++++++++++++++++++++++++++++++++++++++++--------
+ 1 file changed, 153 insertions(+), 26 deletions(-)
+
+diff --git a/src/patchelf.cc b/src/patchelf.cc
+index 5077cd5..24ebe89 100644
+--- a/src/patchelf.cc
++++ b/src/patchelf.cc
+@@ -49,6 +49,8 @@ static int pageSize = PAGESIZE;
+ 
+ typedef std::shared_ptr<std::vector<unsigned char>> FileContents;
+ 
++#define MODIFY_FLAG_NO_STD_LIB_DIRS 0x1
++static int modifyFlags;
+ 
+ #define ElfFileParams class Elf_Ehdr, class Elf_Phdr, class Elf_Shdr, class Elf_Addr, class Elf_Off, class Elf_Dyn, class Elf_Sym, class Elf_Verneed
+ #define ElfFileParamNames Elf_Ehdr, Elf_Phdr, Elf_Shdr, Elf_Addr, Elf_Off, Elf_Dyn, Elf_Sym, Elf_Verneed
+@@ -83,6 +85,36 @@ static unsigned int getPageSize()
+     return pageSize;
+ }
+ 
++static bool absolutePathExists(const std::string & path, std::string & canonicalPath)
++{
++    char *cpath = realpath(path.c_str(), NULL);
++    if (cpath) {
++        canonicalPath = cpath;
++        free(cpath);
++        return true;
++    } else {
++        return false;
++    }
++}
++
++static std::string makePathRelative(const std::string & path,
++    const std::string & refPath, const std::string & rootDir)
++{
++    std::string relPath = "$ORIGIN";
++
++    /* Strip root path first */
++    std::string p = path.substr(rootDir.length());
++    std::string refP = refPath.substr(rootDir.length());
++
++    std::size_t pos = refP.find_first_of('/');
++    while (pos != std::string::npos) {
++        pos =refP.find_first_of('/', pos + 1);
++        relPath.append("/..");
++    }
++    relPath.append(p);
++
++    return relPath;
++}
+ 
+ template<ElfFileParams>
+ class ElfFile
+@@ -191,9 +223,14 @@ public:
+ 
+     void setInterpreter(const std::string & newInterpreter);
+ 
+-    typedef enum { rpPrint, rpShrink, rpSet, rpRemove } RPathOp;
++    typedef enum { rpPrint, rpShrink, rpMakeRelative, rpSet, rpRemove} RPathOp;
+ 
+-    void modifyRPath(RPathOp op, const std::vector<std::string> & allowedRpathPrefixes, std::string newRPath);
++    bool libFoundInRPath(const std::string & dirName,
++			 const std::vector<std::string> neededLibs);
++
++    void modifyRPath(RPathOp op,
++                     const std::vector<std::string> & allowedRpathPrefixes,
++                     std::string rootDir, int flags, std::string newRPath);
+ 
+     void addNeeded(const std::set<std::string> & libs);
+ 
+@@ -1099,10 +1136,35 @@ static void concatToRPath(std::string & rpath, const std::string & path)
+     rpath += path;
+ }
+ 
++template<ElfFileParams>
++bool ElfFile<ElfFileParamNames>::libFoundInRPath(const std::string & dirName,
++    const std::vector<std::string> neededLibs)
++{
++    std::vector<bool> neededLibFound(neededLibs.size(), false);
++
++    /* For each library that we haven't found yet, see if it
++       exists in this directory. */
++    bool libFound = false;
++    for (unsigned int j = 0; j < neededLibs.size(); ++j)
++	if (!neededLibFound[j]) {
++	    std::string libName = dirName + "/" + neededLibs[j];
++	    try {
++		if (getElfType(readFile(libName, sizeof(Elf32_Ehdr))).machine == rdi(hdr->e_machine)) {
++		    neededLibFound[j] = true;
++		    libFound = true;
++		} else
++		    debug("ignoring library '%s' because its machine type differs\n", libName.c_str());
++	    } catch (SysError & e) {
++		if (e.errNo != ENOENT) throw;
++	    }
++	}
++    return libFound;
++}
+ 
+ template<ElfFileParams>
+ void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op,
+-    const std::vector<std::string> & allowedRpathPrefixes, std::string newRPath)
++    const std::vector<std::string> & allowedRpathPrefixes,
++    std::string rootDir, int flags, std::string newRPath)
+ {
+     Elf_Shdr & shdrDynamic = findSection(".dynamic");
+ 
+@@ -1153,11 +1215,14 @@ void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op,
+         return;
+     }
+ 
++    if (op == rpMakeRelative && !rpath) {
++        debug("no RPATH to make relative\n");
++        return;
++    }
+ 
+     /* For each directory in the RPATH, check if it contains any
+        needed library. */
+     if (op == rpShrink) {
+-        std::vector<bool> neededLibFound(neededLibs.size(), false);
+ 
+         newRPath = "";
+ 
+@@ -1177,30 +1242,78 @@ void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op,
+                 continue;
+             }
+ 
+-            /* For each library that we haven't found yet, see if it
+-               exists in this directory. */
+-            bool libFound = false;
+-            for (unsigned int j = 0; j < neededLibs.size(); ++j)
+-                if (!neededLibFound[j]) {
+-                    std::string libName = dirName + "/" + neededLibs[j];
+-                    try {
+-                        if (getElfType(readFile(libName, sizeof(Elf32_Ehdr))).machine == rdi(hdr->e_machine)) {
+-                            neededLibFound[j] = true;
+-                            libFound = true;
+-                        } else
+-                            debug("ignoring library '%s' because its machine type differs\n", libName.c_str());
+-                    } catch (SysError & e) {
+-                        if (e.errNo != ENOENT) throw;
+-                    }
+-                }
+-
+-            if (!libFound)
++            if (!libFoundInRPath(dirName, neededLibs))
+                 debug("removing directory '%s' from RPATH\n", dirName.c_str());
+             else
+                 concatToRPath(newRPath, dirName);
+         }
+     }
+ 
++    /* Make the the RPATH relative to the specified path */
++    if (op == rpMakeRelative) {
++        std::string fileDir = fileName.substr(0, fileName.find_last_of("/"));
++        newRPath = "";
++
++        for (auto & dirName : splitColonDelimitedString(rpath)) {
++            std::string canonicalPath;
++            std::string path;
++
++            /* Figure out if we should keep or discard the path; there are several
++               cases to handled:
++               "dirName" starts with "$ORIGIN":
++                   The original build-system already took care of setting a relative
++                   RPATH, resolve it and test if it is worthwhile to keep it.
++               "dirName" start with "rootDir":
++                   The original build-system added some absolute RPATH (absolute on
++                   the build machine). While this is wrong, it can still be fixed; so
++                   test if it is worthwhile to keep it.
++               "rootDir"/"dirName" exists:
++                    The original build-system already took care of setting an absolute
++                    RPATH (absolute in the final rootfs), resolve it and test if it is
++                    worthwhile to keep it;
++                "dirName" points somewhere else:
++                    (can be anywhere: build trees, staging tree, host location,
++                    non-existing location, etc.). Just discard such a path. */
++            if (!dirName.compare(0, 7, "$ORIGIN")) {
++                path = fileDir + dirName.substr(7);
++                if (!absolutePathExists(path, canonicalPath)) {
++                    debug("removing directory '%s' from RPATH because it doesn't exist\n", dirName.c_str());
++                    continue;
++                }
++            } else if (!dirName.compare(0, rootDir.length(), rootDir)) {
++                if (!absolutePathExists(dirName, canonicalPath)) {
++                    debug("removing directory '%s' from RPATH because it doesn't exist\n", dirName.c_str());
++                    continue;
++                }
++            } else {
++                path = rootDir + dirName;
++                if (!absolutePathExists(path, canonicalPath)) {
++                    debug("removing directory '%s' from RPATH because it's not under the root directory\n",
++                          dirName.c_str());
++                    continue;
++                }
++            }
++
++            if (flags & MODIFY_FLAG_NO_STD_LIB_DIRS) {
++                if (!canonicalPath.compare(rootDir + "/lib") ||
++                    !canonicalPath.compare(rootDir + "/usr/lib")) {
++                    debug("removing directory '%s' from RPATH because it's a standard library directory\n",
++                         dirName.c_str());
++                    continue;
++                }
++            }
++
++            if (!libFoundInRPath(canonicalPath, neededLibs)) {
++                debug("removing directory '%s' from RPATH\n", dirName.c_str());
++                continue;
++	    }
++
++            /* Finally make "canonicalPath" relative to "filedir" in "rootDir" */
++            concatToRPath(newRPath, makePathRelative(canonicalPath, fileDir, rootDir));
++	    debug("keeping relative path of %s", canonicalPath.c_str());
++        }
++    }
++
+     if (op == rpRemove) {
+         if (!rpath) {
+             debug("no RPATH to delete\n");
+@@ -1528,7 +1641,9 @@ static std::vector<std::string> allowedRpathPrefixes;
+ static bool removeRPath = false;
+ static bool setRPath = false;
+ static bool printRPath = false;
++static bool makeRPathRelative = false;
+ static std::string newRPath;
++static std::string rootDir;
+ static std::set<std::string> neededLibsToRemove;
+ static std::map<std::string, std::string> neededLibsToReplace;
+ static std::set<std::string> neededLibsToAdd;
+@@ -1551,14 +1666,16 @@ static void patchElf2(ElfFile && elfFile)
+         elfFile.setInterpreter(newInterpreter);
+ 
+     if (printRPath)
+-        elfFile.modifyRPath(elfFile.rpPrint, {}, "");
++        elfFile.modifyRPath(elfFile.rpPrint, {}, {}, modifyFlags, "");
+ 
+     if (shrinkRPath)
+-        elfFile.modifyRPath(elfFile.rpShrink, allowedRpathPrefixes, "");
++        elfFile.modifyRPath(elfFile.rpShrink, allowedRpathPrefixes, "", modifyFlags, "");
+     else if (removeRPath)
+-        elfFile.modifyRPath(elfFile.rpRemove, {}, "");
++        elfFile.modifyRPath(elfFile.rpRemove, {}, "", modifyFlags, "");
+     else if (setRPath)
+-        elfFile.modifyRPath(elfFile.rpSet, {}, newRPath);
++        elfFile.modifyRPath(elfFile.rpSet, {}, "", modifyFlags, newRPath);
++    else if (makeRPathRelative)
++        elfFile.modifyRPath(elfFile.rpMakeRelative, {}, rootDir, modifyFlags, "");
+ 
+     if (printNeeded) elfFile.printNeededLibs();
+ 
+@@ -1604,6 +1721,8 @@ void showHelp(const std::string & progName)
+   [--remove-rpath]\n\
+   [--shrink-rpath]\n\
+   [--allowed-rpath-prefixes PREFIXES]\t\tWith '--shrink-rpath', reject rpath entries not starting with the allowed prefix\n\
++  [--make-rpath-relative ROOTDIR]\n\
++  [--no-standard-lib-dirs]\n\
+   [--print-rpath]\n\
+   [--force-rpath]\n\
+   [--add-needed LIBRARY]\n\
+@@ -1664,6 +1783,14 @@ int mainWrapped(int argc, char * * argv)
+             setRPath = true;
+             newRPath = argv[i];
+         }
++        else if (arg == "--make-rpath-relative") {
++            if (++i == argc) error("missing argument to --make-rpath-relative");
++            makeRPathRelative = true;
++            rootDir = argv[i];
++        }
++        else if (arg == "--no-standard-lib-dirs") {
++            modifyFlags |= MODIFY_FLAG_NO_STD_LIB_DIRS;
++        }
+         else if (arg == "--print-rpath") {
+             printRPath = true;
+         }
+-- 
+1.9.1
+
diff --git a/package/patchelf/patchelf.hash b/package/patchelf/patchelf.hash
index 653eb46..7188b2e 100644
--- a/package/patchelf/patchelf.hash
+++ b/package/patchelf/patchelf.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	a0f65c1ba148890e9f2f7823f4bedf7ecad5417772f64f994004f59a39014f83	patchelf-0.9.tar.bz2
+sha256	d90cbedb2efa516b2373640560aa6b37f0e29c4967611c3312981e30dbbab966  patchelf-c1f89c077e44a495c62ed0dcfaeca21510df93ef.tar.gz
diff --git a/package/patchelf/patchelf.mk b/package/patchelf/patchelf.mk
index cf2e43a..c880222 100644
--- a/package/patchelf/patchelf.mk
+++ b/package/patchelf/patchelf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PATCHELF_VERSION = 0.9
-PATCHELF_SITE = http://releases.nixos.org/patchelf/patchelf-$(PATCHELF_VERSION)
-PATCHELF_SOURCE = patchelf-$(PATCHELF_VERSION).tar.bz2
+PATCHELF_VERSION = c1f89c077e44a495c62ed0dcfaeca21510df93ef
+PATCHELF_SITE = $(call github,NixOS,patchelf,$(PATCHELF_VERSION))
+PATCHELF_AUTORECONF = YES
 PATCHELF_LICENSE = GPLv3+
 PATCHELF_LICENSE_FILES = COPYING
 
-- 
1.9.1
