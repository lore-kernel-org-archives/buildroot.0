From: Wolfgang Grandegger <wg@grandegger.com>
Date: Thu, 16 Mar 2017 15:23:20 +0100
Subject: [Buildroot] [RFC PATCH v2 2/9] package/patchelf: add patch for
	rpath sanitation under a root directory
In-Reply-To: <1489674207-6876-1-git-send-email-wg@grandegger.com>
References: <1489674207-6876-1-git-send-email-wg@grandegger.com>
Message-ID: <1489674207-6876-3-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch allows to use patchelf to sanitize the rpath of the buildroot
libraries and binaries using the option "--make-rpath-rleative <rootdir>".

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 ...to-make-the-rpath-relative-under-a-specif.patch | 315 +++++++++++++++++++++
 1 file changed, 315 insertions(+)
 create mode 100644 package/patchelf/0001-Add-option-to-make-the-rpath-relative-under-a-specif.patch

diff --git a/package/patchelf/0001-Add-option-to-make-the-rpath-relative-under-a-specif.patch b/package/patchelf/0001-Add-option-to-make-the-rpath-relative-under-a-specif.patch
new file mode 100644
index 0000000..25ecaa6
--- /dev/null
+++ b/package/patchelf/0001-Add-option-to-make-the-rpath-relative-under-a-specif.patch
@@ -0,0 +1,315 @@
+From 917df18ac4249116948d39e1217008a43861f1b5 Mon Sep 17 00:00:00 2001
+From: Wolfgang Grandegger <wg@grandegger.com>
+Date: Mon, 20 Feb 2017 16:29:24 +0100
+Subject: [PATCH] Add option to make the rpath relative under a specified root
+ directory
+
+Running "patchelf" with the option "--make-rpath-relative ROOTDIR" will
+modify or delete the RPATHDIRs according the following rules
+similar to Martin's patches [1] making the Buildroot toolchaing/SDK
+relocatable.
+
+RPATHDIR starts with "$ORIGIN":
+    The original build-system already took care of setting a relative
+    RPATH, resolve it and test if it's valid (does exist)
+
+RPATHDIR starts with ROOTDIR:
+    The original build-system added some absolute RPATH (absolute on
+    the build machine). Test if it's valid (does exist).
+
+ROOTDIR/RPATHDIR exists:
+    The original build-system already took care of setting an absolute
+    RPATH (absolute in the final rootfs), resolve it and test if it's
+    valid (does exist).
+
+RPATHDIR points somewhere else:
+    (can be anywhere: build trees, staging tree, host location,
+    non-existing location, etc.). Just discard such a path.
+
+In addition, the option "--no-standard-libs" will discard RPATHDIRs
+ROOTDIR/lib and ROOTDIR/usr/lib. Like "--shrink-rpath", RPATHDIRs
+are also discarded if the directories do not contain a library
+referenced by the DT_NEEDED fields.
+
+[1] http://lists.busybox.net/pipermail/buildroot/2016-April/159422.html
+
+Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
+---
+ src/patchelf.cc | 179 ++++++++++++++++++++++++++++++++++++++++++++++++--------
+ 1 file changed, 153 insertions(+), 26 deletions(-)
+
+diff --git a/src/patchelf.cc b/src/patchelf.cc
+index 5077cd5..99e6915 100644
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
++
++    bool libFoundInRPath(const std::string & dirName,
++                         const std::vector<std::string> neededLibs);
+ 
+-    void modifyRPath(RPathOp op, const std::vector<std::string> & allowedRpathPrefixes, std::string newRPath);
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
++        if (!neededLibFound[j]) {
++            std::string libName = dirName + "/" + neededLibs[j];
++            try {
++                if (getElfType(readFile(libName, sizeof(Elf32_Ehdr))).machine == rdi(hdr->e_machine)) {
++                    neededLibFound[j] = true;
++                    libFound = true;
++                } else
++                    debug("ignoring library '%s' because its machine type differs\n", libName.c_str());
++            } catch (SysError & e) {
++                if (e.errNo != ENOENT) throw;
++            }
++        }
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
++
++            /* Figure out if we should keep or discard the path. There are several
++               cases to be handled:
++               "dirName" starts with "$ORIGIN":
++                   The original build-system already took care of setting a relative
++                   RPATH. Resolve it and test if it's valid (does exist).
++               "dirName" start with "rootDir":
++                   The original build-system added some absolute RPATH (absolute on
++                   the build machine). Test if it's valid (does exist).
++               "rootDir"/"dirName" exists:
++                    The original build-system already took care of setting an absolute
++                    RPATH (absolute in the final rootfs). Resolve it and test if it's
++                    valid (does exist).
++               "dirName" points somewhere else:
++                    (can be anywhere: build trees, staging tree, host location,
++                    non-existing location, etc.). Just discard such a path. */
++            if (!dirName.compare(0, 7, "$ORIGIN")) {
++                std::string path = fileDir + dirName.substr(7);
++                if (!absolutePathExists(path, canonicalPath)) {
++                    debug("removing directory '%s' from RPATH because '%s' doesn't exist\n",
++			  dirName.c_str(), path.c_str());
++                    continue;
++                }
++            } else if (!dirName.compare(0, rootDir.length(), rootDir)) {
++                if (!absolutePathExists(dirName, canonicalPath)) {
++                    debug("removing directory '%s' from RPATH because it doesn't exist\n", dirName.c_str());
++                    continue;
++                }
++            } else {
++                std::string path = rootDir + dirName;
++                if (!absolutePathExists(path, canonicalPath)) {
++                    debug("removing directory '%s' from RPATH because '%s' doesn't exist\n",
++			  dirName.c_str(), path.c_str());
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
++                debug("removing directory '%s' from RPATH because it does not contain needed libs\n",
++		      dirName.c_str());
++                continue;
++            }
++
++            /* Finally make "canonicalPath" relative to "filedir" in "rootDir" */
++            concatToRPath(newRPath, makePathRelative(canonicalPath, fileDir, rootDir));
++            debug("keeping relative path of %s\n", canonicalPath.c_str());
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
-- 
1.9.1
