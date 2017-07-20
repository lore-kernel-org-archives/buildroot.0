From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jul 2017 22:29:35 +0200
Subject: [Buildroot] [git commit] package/patchelf: add patch for rpath
	sanitization under a root directory
Message-ID: <20170720202609.7ECFB802B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=07b05f439a145edc061c8a2460f849de069c32cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch allows to use patchelf to sanitize the rpath of the buildroot
libraries and binaries using the option "--make-rpath-relative <rootdir>".
Recent versions of patchelf will not built on old Debian and RHEL systems
due to C++11 constructs. Therefore we stick with v0.9 for the time being.

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...move-apparently-incorrect-usage-of-static.patch |  56 ++++
 ...unction-for-splitting-a-colon-separated-s.patch |  63 ++++
 ...to-make-the-rpath-relative-under-a-specif.patch | 332 +++++++++++++++++++++
 3 files changed, 451 insertions(+)

diff --git a/package/patchelf/0001-Remove-apparently-incorrect-usage-of-static.patch b/package/patchelf/0001-Remove-apparently-incorrect-usage-of-static.patch
new file mode 100644
index 0000000..dc462ef
--- /dev/null
+++ b/package/patchelf/0001-Remove-apparently-incorrect-usage-of-static.patch
@@ -0,0 +1,56 @@
+From 2480efa8411523cf046094492192a5ee451aae5d Mon Sep 17 00:00:00 2001
+From: Eelco Dolstra <eelco.dolstra@logicblox.com>
+Date: Mon, 19 Sep 2016 17:31:37 +0200
+Subject: [PATCH] Remove apparently incorrect usage of "static"
+
+[Upstream-commit: https://github.com/NixOS/patchelf/commit/a365bcb7d7025da51b33165ef7ebc7180199a05e
+This patch also removes the DT_INIT symbols from needed_libs (DT_INIT
+points to library initialisation function, not to needed libraries...)]
+Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
+---
+ src/patchelf.cc | 8 +++-----
+ 1 file changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/src/patchelf.cc b/src/patchelf.cc
+index 136098f..c870638 100644
+--- a/src/patchelf.cc
++++ b/src/patchelf.cc
+@@ -941,7 +941,6 @@ void ElfFile<ElfFileParamNames>::modifySoname(sonameMode op, const string & newS
+     assert(strTabAddr == rdi(shdrDynStr.sh_addr));
+ 
+     /* Walk through the dynamic section, look for the DT_SONAME entry. */
+-    static vector<string> neededLibs;
+     dyn = (Elf_Dyn *) (contents + rdi(shdrDynamic.sh_offset));
+     Elf_Dyn * dynSoname = 0;
+     char * soname = 0;
+@@ -949,8 +948,7 @@ void ElfFile<ElfFileParamNames>::modifySoname(sonameMode op, const string & newS
+         if (rdi(dyn->d_tag) == DT_SONAME) {
+             dynSoname = dyn;
+             soname = strTab + rdi(dyn->d_un.d_val);
+-        } else if (rdi(dyn->d_tag) == DT_INIT)
+-            neededLibs.push_back(string(strTab + rdi(dyn->d_un.d_val)));
++        }
+     }
+ 
+     if (op == printSoname) {
+@@ -1058,7 +1056,7 @@ void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op, string newRPath)
+        unless you use its `--enable-new-dtag' option, in which case it
+        generates a DT_RPATH and DT_RUNPATH pointing at the same
+        string. */
+-    static vector<string> neededLibs;
++    vector<string> neededLibs;
+     dyn = (Elf_Dyn *) (contents + rdi(shdrDynamic.sh_offset));
+     Elf_Dyn * dynRPath = 0, * dynRunPath = 0;
+     char * rpath = 0;
+@@ -1091,7 +1089,7 @@ void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op, string newRPath)
+     /* For each directory in the RPATH, check if it contains any
+        needed library. */
+     if (op == rpShrink) {
+-        static vector<bool> neededLibFound(neededLibs.size(), false);
++        vector<bool> neededLibFound(neededLibs.size(), false);
+ 
+         newRPath = "";
+ 
+-- 
+1.9.1
+
diff --git a/package/patchelf/0002-Extract-a-function-for-splitting-a-colon-separated-s.patch b/package/patchelf/0002-Extract-a-function-for-splitting-a-colon-separated-s.patch
new file mode 100644
index 0000000..330bea2
--- /dev/null
+++ b/package/patchelf/0002-Extract-a-function-for-splitting-a-colon-separated-s.patch
@@ -0,0 +1,63 @@
+From a8452dc7e80eb17572c7458e33a4f4d609e6a3da Mon Sep 17 00:00:00 2001
+From: Tuomas Tynkkynen <tuomas@tuxera.com>
+Date: Fri, 3 Jun 2016 23:03:51 +0300
+Subject: [PATCH] Extract a function for splitting a colon-separated string
+
+We're going to need this logic in another place, so make a function of
+this.
+
+[Upstream-commit: https://github.com/NixOS/patchelf/commit/2e3fdc2030c75c19df6fc2924083cfad53856562]
+Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
+---
+ src/patchelf.cc | 28 +++++++++++++++++++---------
+ 1 file changed, 19 insertions(+), 9 deletions(-)
+
+diff --git a/src/patchelf.cc b/src/patchelf.cc
+index c870638..1d9a772 100644
+--- a/src/patchelf.cc
++++ b/src/patchelf.cc
+@@ -57,6 +57,22 @@ unsigned char * contents = 0;
+ #define ElfFileParamNames Elf_Ehdr, Elf_Phdr, Elf_Shdr, Elf_Addr, Elf_Off, Elf_Dyn, Elf_Sym
+ 
+ 
++static vector<string> splitColonDelimitedString(const char * s){
++    vector<string> parts;
++    const char * pos = s;
++    while (*pos) {
++        const char * end = strchr(pos, ':');
++        if (!end) end = strchr(pos, 0);
++
++        parts.push_back(string(pos, end - pos));
++        if (*end == ':') ++end;
++        pos = end;
++    }
++
++    return parts;
++}
++
++
+ static unsigned int getPageSize(){
+     return pageSize;
+ }
+@@ -1093,15 +1109,9 @@ void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op, string newRPath)
+ 
+         newRPath = "";
+ 
+-        char * pos = rpath;
+-        while (*pos) {
+-            char * end = strchr(pos, ':');
+-            if (!end) end = strchr(pos, 0);
+-
+-            /* Get the name of the directory. */
+-            string dirName(pos, end - pos);
+-            if (*end == ':') ++end;
+-            pos = end;
++        vector<string> rpathDirs = splitColonDelimitedString(rpath);
++        for (vector<string>::iterator it = rpathDirs.begin(); it != rpathDirs.end(); ++it) {
++            const string & dirName = *it;
+ 
+             /* Non-absolute entries are allowed (e.g., the special
+                "$ORIGIN" hack). */
+-- 
+1.9.1
+
diff --git a/package/patchelf/0003-Add-option-to-make-the-rpath-relative-under-a-specif.patch b/package/patchelf/0003-Add-option-to-make-the-rpath-relative-under-a-specif.patch
new file mode 100644
index 0000000..feec627
--- /dev/null
+++ b/package/patchelf/0003-Add-option-to-make-the-rpath-relative-under-a-specif.patch
@@ -0,0 +1,332 @@
+From 618220bfb55c875d6a4d197cb24fe632ac93ec85 Mon Sep 17 00:00:00 2001
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
+The option "--no-standard-libs" will discard RPATHDIRs ROOTDIR/lib and
+ROOTDIR/usr/lib. Like "--shrink-rpath", RPATHDIRs are also discarded
+if the directories do not contain a library referenced by the
+DT_NEEDED fields.
+If the option "--relative-to-file" is given, the rpath will start
+with "$ORIGIN" making it relative to the ELF file, otherwise an
+absolute path relative to ROOTDIR will be used.
+
+A pull request for a similar patch [2] for mainline inclusion is
+pending.
+
+[1] http://lists.busybox.net/pipermail/buildroot/2016-April/159422.html
+[2] https://github.com/NixOS/patchelf/pull/118
+
+Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
+---
+ src/patchelf.cc | 196 ++++++++++++++++++++++++++++++++++++++++++++++++++------
+ 1 file changed, 175 insertions(+), 21 deletions(-)
+
+diff --git a/src/patchelf.cc b/src/patchelf.cc
+index 1d9a772..35b4a33 100644
+--- a/src/patchelf.cc
++++ b/src/patchelf.cc
+@@ -46,6 +46,10 @@ static bool debugMode = false;
+ 
+ static bool forceRPath = false;
+ 
++static bool noStandardLibDirs = false;
++
++static bool relativeToFile = false;
++
+ static string fileName;
+ static int pageSize = PAGESIZE;
+ 
+@@ -77,6 +81,49 @@ static unsigned int getPageSize(){
+     return pageSize;
+ }
+ 
++static bool absolutePathExists(const string & path, string & canonicalPath)
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
++static string makePathRelative(const string & path,
++    const string & refPath)
++{
++    string relPath = "$ORIGIN";
++    string p = path, refP = refPath;
++    size_t pos;
++
++    /* Strip the common part of path and refPath */
++    while (true) {
++        pos = p.find_first_of('/', 1);
++        if (refP.find_first_of('/', 1) != pos)
++            break;
++        if (p.substr(0, pos) != refP.substr(0, pos))
++            break;
++        if (pos == string::npos)
++            break;
++        p = p.substr(pos);
++        refP = refP.substr(pos);
++    }
++    /* Check if both pathes are equal */
++    if (p != refP) {
++        pos = 0;
++        while (pos != string::npos) {
++            pos =refP.find_first_of('/', pos + 1);
++            relPath.append("/..");
++        }
++        relPath.append(p);
++    }
++
++    return relPath;
++}
+ 
+ template<ElfFileParams>
+ class ElfFile
+@@ -183,9 +230,13 @@ public:
+ 
+     void setInterpreter(const string & newInterpreter);
+ 
+-    typedef enum { rpPrint, rpShrink, rpSet, rpRemove } RPathOp;
++    typedef enum { rpPrint, rpShrink, rpMakeRelative, rpSet, rpRemove} RPathOp;
++
++    bool libFoundInRPath(const string & dirName,
++                         const vector<string> neededLibs,
++                         vector<bool> & neededLibFound);
+ 
+-    void modifyRPath(RPathOp op, string newRPath);
++    void modifyRPath(RPathOp op, string rootDir, string newRPath);
+ 
+     void addNeeded(set<string> libs);
+ 
+@@ -1041,7 +1092,27 @@ static void concatToRPath(string & rpath, const string & path)
+ 
+ 
+ template<ElfFileParams>
+-void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op, string newRPath)
++bool ElfFile<ElfFileParamNames>::libFoundInRPath(const string & dirName,
++    const vector<string> neededLibs, vector<bool> & neededLibFound)
++{
++    /* For each library that we haven't found yet, see if it
++       exists in this directory. */
++    bool libFound = false;
++    for (unsigned int j = 0; j < neededLibs.size(); ++j)
++        if (!neededLibFound[j]) {
++            string libName = dirName + "/" + neededLibs[j];
++            struct stat st;
++            if (stat(libName.c_str(), &st) == 0) {
++                neededLibFound[j] = true;
++                libFound = true;
++            }
++        }
++    return libFound;
++}
++
++
++template<ElfFileParams>
++void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op, string rootDir, string newRPath)
+ {
+     Elf_Shdr & shdrDynamic = findSection(".dynamic");
+ 
+@@ -1096,6 +1167,11 @@ void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op, string newRPath)
+         return;
+     }
+ 
++    if (op == rpMakeRelative && !rpath) {
++        debug("no RPATH to make relative\n");
++        return;
++    }
++
+     if (op == rpShrink && !rpath) {
+         debug("no RPATH to shrink\n");
+         return;
+@@ -1120,26 +1196,86 @@ void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op, string newRPath)
+                 continue;
+             }
+ 
+-            /* For each library that we haven't found yet, see if it
+-               exists in this directory. */
+-            bool libFound = false;
+-            for (unsigned int j = 0; j < neededLibs.size(); ++j)
+-                if (!neededLibFound[j]) {
+-                    string libName = dirName + "/" + neededLibs[j];
+-                    struct stat st;
+-                    if (stat(libName.c_str(), &st) == 0) {
+-                        neededLibFound[j] = true;
+-                        libFound = true;
+-                    }
+-                }
+-
+-            if (!libFound)
++            if (!libFoundInRPath(dirName, neededLibs, neededLibFound))
+                 debug("removing directory `%s' from RPATH\n", dirName.c_str());
+             else
+                 concatToRPath(newRPath, dirName);
+         }
+     }
+ 
++    /* Make the the RPATH relative to the specified path */
++    if (op == rpMakeRelative) {
++        vector<bool> neededLibFound(neededLibs.size(), false);
++        string fileDir = fileName.substr(0, fileName.find_last_of("/"));
++
++        newRPath = "";
++
++        vector<string> rpathDirs = splitColonDelimitedString(rpath);
++        for (vector<string>::iterator it = rpathDirs.begin(); it != rpathDirs.end(); ++it) {
++            const string & dirName = *it;
++
++            string canonicalPath;
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
++                string path = fileDir + dirName.substr(7);
++                if (!absolutePathExists(path, canonicalPath)) {
++                    debug("removing directory '%s' from RPATH because '%s' doesn't exist\n",
++                          dirName.c_str(), path.c_str());
++                    continue;
++                }
++            } else if (!dirName.compare(0, rootDir.length(), rootDir)) {
++                if (!absolutePathExists(dirName, canonicalPath)) {
++                    debug("removing directory '%s' from RPATH because it doesn't exist\n", dirName.c_str());
++                    continue;
++                }
++            } else {
++                string path = rootDir + dirName;
++                if (!absolutePathExists(path, canonicalPath)) {
++                    debug("removing directory '%s' from RPATH because it's not in rootdir\n",
++                          dirName.c_str());
++                    continue;
++                }
++            }
++
++            if (noStandardLibDirs) {
++                if (!canonicalPath.compare(rootDir + "/lib") ||
++                    !canonicalPath.compare(rootDir + "/usr/lib")) {
++                    debug("removing directory '%s' from RPATH because it's a standard library directory\n",
++                         dirName.c_str());
++                    continue;
++                }
++            }
++
++            if (!libFoundInRPath(canonicalPath, neededLibs, neededLibFound)) {
++                debug("removing directory '%s' from RPATH because it does not contain needed libs\n",
++                      dirName.c_str());
++                continue;
++            }
++
++            /* Finally make "canonicalPath" relative to "filedir" in "rootDir" */
++            if (relativeToFile)
++                concatToRPath(newRPath, makePathRelative(canonicalPath, fileDir));
++            else
++                concatToRPath(newRPath, canonicalPath.substr(rootDir.length()));
++            debug("keeping relative path of %s\n", canonicalPath.c_str());
++        }
++    }
++
+     if (op == rpRemove) {
+         if (!rpath) {
+             debug("no RPATH to delete\n");
+@@ -1413,7 +1549,9 @@ static bool shrinkRPath = false;
+ static bool removeRPath = false;
+ static bool setRPath = false;
+ static bool printRPath = false;
++static bool makeRPathRelative = false;
+ static string newRPath;
++static string rootDir;
+ static set<string> neededLibsToRemove;
+ static map<string, string> neededLibsToReplace;
+ static set<string> neededLibsToAdd;
+@@ -1438,14 +1576,16 @@ static void patchElf2(ElfFile & elfFile)
+         elfFile.setInterpreter(newInterpreter);
+ 
+     if (printRPath)
+-        elfFile.modifyRPath(elfFile.rpPrint, "");
++        elfFile.modifyRPath(elfFile.rpPrint, "", "");
+ 
+     if (shrinkRPath)
+-        elfFile.modifyRPath(elfFile.rpShrink, "");
++        elfFile.modifyRPath(elfFile.rpShrink, "", "");
+     else if (removeRPath)
+-        elfFile.modifyRPath(elfFile.rpRemove, "");
++        elfFile.modifyRPath(elfFile.rpRemove, "", "");
+     else if (setRPath)
+-        elfFile.modifyRPath(elfFile.rpSet, newRPath);
++        elfFile.modifyRPath(elfFile.rpSet, "", newRPath);
++    else if (makeRPathRelative)
++        elfFile.modifyRPath(elfFile.rpMakeRelative, rootDir, "");
+ 
+     if (printNeeded) elfFile.printNeededLibs();
+ 
+@@ -1508,6 +1648,9 @@ void showHelp(const string & progName)
+   [--set-rpath RPATH]\n\
+   [--remove-rpath]\n\
+   [--shrink-rpath]\n\
++  [--make-rpath-relative ROOTDIR]\n\
++  [--no-standard-lib-dirs]\n\
++  [--relative-to-file]\n\
+   [--print-rpath]\n\
+   [--force-rpath]\n\
+   [--add-needed LIBRARY]\n\
+@@ -1564,6 +1707,17 @@ int main(int argc, char * * argv)
+             setRPath = true;
+             newRPath = argv[i];
+         }
++        else if (arg == "--make-rpath-relative") {
++            if (++i == argc) error("missing argument to --make-rpath-relative");
++            makeRPathRelative = true;
++            rootDir = argv[i];
++        }
++        else if (arg == "--no-standard-lib-dirs") {
++            noStandardLibDirs = true;
++        }
++        else if (arg == "--relative-to-file") {
++            relativeToFile = true;
++        }
+         else if (arg == "--print-rpath") {
+             printRPath = true;
+         }
+-- 
+1.9.1
+
