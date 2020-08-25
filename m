From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Aug 2020 13:11:24 +0200
Subject: [Buildroot] [git commit] package/patchelf: keep RPATH entries even
 without DT_NEEDED libraries
Message-ID: <20200825110428.40F71815AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bcdb74512d9f6e7eca878c53aca2eb3eccac7ef3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Our patch
0003-Add-option-to-make-the-rpath-relative-under-a-specif.patch adds
an option --make-rpath-relative, which we use to tweak RPATH of target
binaries.

However, one of the effect of this option is that it drops RPATH
entries if the corresponding directory does not contain a library that
is referenced by a DT_NEEDED entry of the binary.

This unfortunately isn't correct, as RPATH entries are not only used
by the dynamic linker to resolve the location of libraries listed
through DT_NEEDED entries: RPATH entries are also used by dlopen()
when resolving the location of libraries that are loaded at runtime.

Therefore, the removal of RPATH entries that don't correspond to
directories containing libraries referenced by DT_NEEDED entries break
legitimate uses of RPATH for dlopen()ed libraries.

This issue was even pointed out during the review of the upstream pull
request:

  https://github.com/NixOS/patchelf/pull/118#discussion_r329660138

This fixes tst-origin uClibc-ng unit test:

https://github.com/wbx-github/uclibc-ng-test/blob/master/test/dlopen/Makefile.in#L25
https://github.com/wbx-github/uclibc-ng-test/blob/master/test/dlopen/tst-origin.c#L15

Without this patch:

$ gcc -o toto toto.c -Wl,-rpath,/tmp/test/bar
$ readelf -d toto | grep PATH
 0x000000000000000f (RPATH)              Library rpath: [/tmp/test/bar]
$ ./output/host/bin/patchelf --debug --make-rpath-relative /tmp/
toto
patching ELF file `toto'
Kernel page size is 4096 bytes
removing directory '/tmp/test/bar' from RPATH because it does not contain needed libs
new rpath is `'
$ readelf -d toto | grep PATH
 0x000000000000001d (RUNPATH)            Library runpath: []

With the patch applied:

$ gcc -o toto toto.c -Wl,-rpath,/tmp/test/bar
$ readelf -d toto | grep PATH
 0x000000000000000f (RPATH)              Library rpath: [/tmp/test/bar]
$ ./output/host/bin/patchelf --debug --make-rpath-relative /tmp/ toto
patching ELF file `toto'
Kernel page size is 4096 bytes
keeping relative path of /tmp/test/bar
new rpath is `test/bar'
$ readelf -d toto | grep PATH
 0x000000000000001d (RUNPATH)            Library runpath: [test/bar]

Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ption-to-make-the-rpath-relative-under-a-specif.patch | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/package/patchelf/0003-Add-option-to-make-the-rpath-relative-under-a-specif.patch b/package/patchelf/0003-Add-option-to-make-the-rpath-relative-under-a-specif.patch
index feec627680..f9f2537a6c 100644
--- a/package/patchelf/0003-Add-option-to-make-the-rpath-relative-under-a-specif.patch
+++ b/package/patchelf/0003-Add-option-to-make-the-rpath-relative-under-a-specif.patch
@@ -167,7 +167,7 @@ index 1d9a772..35b4a33 100644
      if (op == rpShrink && !rpath) {
          debug("no RPATH to shrink\n");
          return;
-@@ -1120,26 +1196,86 @@ void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op, string newRPath)
+@@ -1120,26 +1196,80 @@ void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op, string newRPath)
                  continue;
              }
  
@@ -250,12 +250,6 @@ index 1d9a772..35b4a33 100644
 +                }
 +            }
 +
-+            if (!libFoundInRPath(canonicalPath, neededLibs, neededLibFound)) {
-+                debug("removing directory '%s' from RPATH because it does not contain needed libs\n",
-+                      dirName.c_str());
-+                continue;
-+            }
-+
 +            /* Finally make "canonicalPath" relative to "filedir" in "rootDir" */
 +            if (relativeToFile)
 +                concatToRPath(newRPath, makePathRelative(canonicalPath, fileDir));
@@ -268,7 +262,7 @@ index 1d9a772..35b4a33 100644
      if (op == rpRemove) {
          if (!rpath) {
              debug("no RPATH to delete\n");
-@@ -1413,7 +1549,9 @@ static bool shrinkRPath = false;
+@@ -1413,7 +1543,9 @@ static bool shrinkRPath = false;
  static bool removeRPath = false;
  static bool setRPath = false;
  static bool printRPath = false;
@@ -278,7 +272,7 @@ index 1d9a772..35b4a33 100644
  static set<string> neededLibsToRemove;
  static map<string, string> neededLibsToReplace;
  static set<string> neededLibsToAdd;
-@@ -1438,14 +1576,16 @@ static void patchElf2(ElfFile & elfFile)
+@@ -1438,14 +1570,16 @@ static void patchElf2(ElfFile & elfFile)
          elfFile.setInterpreter(newInterpreter);
  
      if (printRPath)
@@ -299,7 +293,7 @@ index 1d9a772..35b4a33 100644
  
      if (printNeeded) elfFile.printNeededLibs();
  
-@@ -1508,6 +1648,9 @@ void showHelp(const string & progName)
+@@ -1508,6 +1642,9 @@ void showHelp(const string & progName)
    [--set-rpath RPATH]\n\
    [--remove-rpath]\n\
    [--shrink-rpath]\n\
@@ -309,7 +303,7 @@ index 1d9a772..35b4a33 100644
    [--print-rpath]\n\
    [--force-rpath]\n\
    [--add-needed LIBRARY]\n\
-@@ -1564,6 +1707,17 @@ int main(int argc, char * * argv)
+@@ -1564,6 +1701,17 @@ int main(int argc, char * * argv)
              setRPath = true;
              newRPath = argv[i];
          }
