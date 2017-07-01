From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 18:07:00 +0200
Subject: [Buildroot] [git commit] tools: rename to 'utils'
Message-ID: <20170701160503.EB7957FAEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ca9fc3170de1a41fbcbc5dfdc2838c75bff72a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After some discussion, we found out that "tools" has the four first
letters identical to the "toolchain" subfolder, which makes it a bit
unpractical with tab-completion. So, this commit renames "tools" to
"utils", which is more tab-completion-friendly.

This has been discussed with Arnout and Yann.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-tips.txt           |  8 ++++----
 docs/manual/contribute.txt                     |  2 +-
 docs/manual/writing-rules.txt                  |  2 +-
 support/scripts/pkg-stats                      |  2 +-
 {tools => utils}/brmake                        |  0
 {tools => utils}/check-package                 |  2 +-
 {tools => utils}/checkpackagelib/__init__.py   |  0
 {tools => utils}/checkpackagelib/base.py       |  2 +-
 {tools => utils}/checkpackagelib/lib.py        |  2 +-
 {tools => utils}/checkpackagelib/lib_config.py |  2 +-
 {tools => utils}/checkpackagelib/lib_hash.py   |  2 +-
 {tools => utils}/checkpackagelib/lib_mk.py     |  2 +-
 {tools => utils}/checkpackagelib/lib_patch.py  |  2 +-
 {tools => utils}/checkpackagelib/readme.txt    | 10 +++++-----
 {tools => utils}/get-developers                |  0
 {tools => utils}/getdeveloperlib.py            |  0
 {tools => utils}/readme.txt                    |  0
 {tools => utils}/scancpan                      |  0
 {tools => utils}/scanpypi                      |  0
 {tools => utils}/size-stats-compare            |  0
 {tools => utils}/test-pkg                      |  0
 21 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index 0047dfd..8b2361d 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -45,7 +45,7 @@ continuously test random configurations. However, these only build the
 `master` branch of the git tree, and your new fancy package is not yet
 there.
 
-Buildroot provides a script in +tools/test-pkg+ that uses the same base
+Buildroot provides a script in +utils/test-pkg+ that uses the same base
 configurations as used by the autobuilders so you can test your package
 in the same conditions.
 
@@ -74,7 +74,7 @@ Then run the +test-pkg+ script, by telling it what config snippet to use
 and what package to test:
 
 ----
-$ ./tools/test-pkg -c libcurl.config -p libcurl
+$ ./utils/test-pkg -c libcurl.config -p libcurl
 ----
 
 This will try to build your package against all the toolchains used
@@ -83,7 +83,7 @@ too long to do so). The output lists all toolchains and the corresponding
 result (excerpt, results are fake):
 
 ----
-$ ./tools/test-pkg -c libcurl.config -p libcurl
+$ ./utils/test-pkg -c libcurl.config -p libcurl
                 armv5-ctng-linux-gnueabi [ 1/11]: OK
               armv7-ctng-linux-gnueabihf [ 2/11]: OK
                         br-aarch64-glibc [ 3/11]: SKIPPED
@@ -124,7 +124,7 @@ The +test-pkg+ script accepts a few options, for which you can get some
 help by running:
 
 ----
-$ ./tools/test-pkg -h
+$ ./utils/test-pkg -h
 ----
 
 [[github-download-url]]
diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index c105877..a58945f 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -295,7 +295,7 @@ information). This tool reads your patches and outputs the appropriate
 +git send-email+ command to use:
 
 ---------------------
-$ ./tools/get-developers outgoing/*
+$ ./utils/get-developers outgoing/*
 ---------------------
 
 Use the output of +get-developers+ to send your patches:
diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
index c144874..ca43272 100644
--- a/docs/manual/writing-rules.txt
+++ b/docs/manual/writing-rules.txt
@@ -146,6 +146,6 @@ syntax, refer to http://www.methods.co.nz/asciidoc/userguide.html[].
 
 === Support scripts
 
-Some scripts in the +support/+ and +tools/+ directories are written in
+Some scripts in the +support/+ and +utils/+ directories are written in
 Python and should follow the
 https://www.python.org/dev/peps/pep-0008/[PEP8 Style Guide for Python Code].
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index f827877..1956941 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -337,7 +337,7 @@ for i in $(find boot/ linux/ package/ toolchain/ -name '*.mk' | sort) ; do
     fi
 
     file_list=$(find ${package_dir} -name '*.mk' -o -name '*.in*' -o -name '*.hash')
-    nwarnings=$(./tools/check-package ${file_list} 2>&1 | sed '/\([0-9]*\) warnings generated/!d; s//\1/')
+    nwarnings=$(./utils/check-package ${file_list} 2>&1 | sed '/\([0-9]*\) warnings generated/!d; s//\1/')
     if [ ${nwarnings} -eq 0 ] ; then
 	echo "<td class=\"centered correct\">${nwarnings}</td>"
     else
diff --git a/tools/brmake b/utils/brmake
similarity index 100%
rename from tools/brmake
rename to utils/brmake
diff --git a/tools/check-package b/utils/check-package
similarity index 98%
rename from tools/check-package
rename to utils/check-package
index cdbac94..a87a74d 100755
--- a/tools/check-package
+++ b/utils/check-package
@@ -1,5 +1,5 @@
 #!/usr/bin/env python
-# See tools/checkpackagelib/readme.txt before editing this file.
+# See utils/checkpackagelib/readme.txt before editing this file.
 
 from __future__ import print_function
 import argparse
diff --git a/tools/checkpackagelib/__init__.py b/utils/checkpackagelib/__init__.py
similarity index 100%
rename from tools/checkpackagelib/__init__.py
rename to utils/checkpackagelib/__init__.py
diff --git a/tools/checkpackagelib/base.py b/utils/checkpackagelib/base.py
similarity index 81%
rename from tools/checkpackagelib/base.py
rename to utils/checkpackagelib/base.py
index 4b376f0..fc09bec 100644
--- a/tools/checkpackagelib/base.py
+++ b/utils/checkpackagelib/base.py
@@ -1,4 +1,4 @@
-# See tools/checkpackagelib/readme.txt before editing this file.
+# See utils/checkpackagelib/readme.txt before editing this file.
 
 
 class _CheckFunction(object):
diff --git a/tools/checkpackagelib/lib.py b/utils/checkpackagelib/lib.py
similarity index 95%
rename from tools/checkpackagelib/lib.py
rename to utils/checkpackagelib/lib.py
index 1a7db44..91f4ad4 100644
--- a/tools/checkpackagelib/lib.py
+++ b/utils/checkpackagelib/lib.py
@@ -1,4 +1,4 @@
-# See tools/checkpackagelib/readme.txt before editing this file.
+# See utils/checkpackagelib/readme.txt before editing this file.
 
 from base import _CheckFunction
 
diff --git a/tools/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
similarity index 98%
rename from tools/checkpackagelib/lib_config.py
rename to utils/checkpackagelib/lib_config.py
index 9e93c05..26ebb39 100644
--- a/tools/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -1,4 +1,4 @@
-# See tools/checkpackagelib/readme.txt before editing this file.
+# See utils/checkpackagelib/readme.txt before editing this file.
 # Kconfig generates errors if someone introduces a typo like "boool" instead of
 # "bool", so below check functions don't need to check for things already
 # checked by running "make menuconfig".
diff --git a/tools/checkpackagelib/lib_hash.py b/utils/checkpackagelib/lib_hash.py
similarity index 97%
rename from tools/checkpackagelib/lib_hash.py
rename to utils/checkpackagelib/lib_hash.py
index cc1a5e4..10b2748 100644
--- a/tools/checkpackagelib/lib_hash.py
+++ b/utils/checkpackagelib/lib_hash.py
@@ -1,4 +1,4 @@
-# See tools/checkpackagelib/readme.txt before editing this file.
+# See utils/checkpackagelib/readme.txt before editing this file.
 # The validity of the hashes itself is checked when building, so below check
 # functions don't need to check for things already checked by running
 # "make package-dirclean package-source".
diff --git a/tools/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
similarity index 99%
rename from tools/checkpackagelib/lib_mk.py
rename to utils/checkpackagelib/lib_mk.py
index 8cbb358..6ed6011 100644
--- a/tools/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -1,4 +1,4 @@
-# See tools/checkpackagelib/readme.txt before editing this file.
+# See utils/checkpackagelib/readme.txt before editing this file.
 # There are already dependency checks during the build, so below check
 # functions don't need to check for things already checked by exploring the
 # menu options using "make menuconfig" and by running "make" with appropriate
diff --git a/tools/checkpackagelib/lib_patch.py b/utils/checkpackagelib/lib_patch.py
similarity index 96%
rename from tools/checkpackagelib/lib_patch.py
rename to utils/checkpackagelib/lib_patch.py
index 3e1dae5..591f13c 100644
--- a/tools/checkpackagelib/lib_patch.py
+++ b/utils/checkpackagelib/lib_patch.py
@@ -1,4 +1,4 @@
-# See tools/checkpackagelib/readme.txt before editing this file.
+# See utils/checkpackagelib/readme.txt before editing this file.
 # The format of the patch files is tested during the build, so below check
 # functions don't need to check for things already checked by running
 # "make package-dirclean package-patch".
diff --git a/tools/checkpackagelib/readme.txt b/utils/checkpackagelib/readme.txt
similarity index 93%
rename from tools/checkpackagelib/readme.txt
rename to utils/checkpackagelib/readme.txt
index 8012c72..85e10fe 100644
--- a/tools/checkpackagelib/readme.txt
+++ b/utils/checkpackagelib/readme.txt
@@ -57,19 +57,19 @@ Some hints when changing this code:
 Usage examples:
 - to get a list of check functions that would be called without actually
   calling them you can use the --dry-run option:
-$ tools/check-package --dry-run package/yourfavorite/*
+$ utils/check-package --dry-run package/yourfavorite/*
 
 - when you just added a new check function, e.g. Something, check how it behaves
   for all current packages:
-$ tools/check-package --include-only Something $(find package -type f)
+$ utils/check-package --include-only Something $(find package -type f)
 
 - the effective processing time (when the .pyc were already generated and all
   files to be processed are cached in the RAM) should stay in the order of few
   seconds:
-$ tools/check-package $(find package -type f) >/dev/null ; \
-  time tools/check-package $(find package -type f) >/dev/null
+$ utils/check-package $(find package -type f) >/dev/null ; \
+  time utils/check-package $(find package -type f) >/dev/null
 
 - vim users can navigate the warnings (most editors probably have similar
   function) since warnings are generated in the form 'path/file:line: warning':
 $ find package/ -name 'Config.*' > filelist && vim -c \
-  'set makeprg=tools/check-package\ $(cat\ filelist)' -c make -c copen
+  'set makeprg=utils/check-package\ $(cat\ filelist)' -c make -c copen
diff --git a/tools/get-developers b/utils/get-developers
similarity index 100%
rename from tools/get-developers
rename to utils/get-developers
diff --git a/tools/getdeveloperlib.py b/utils/getdeveloperlib.py
similarity index 100%
rename from tools/getdeveloperlib.py
rename to utils/getdeveloperlib.py
diff --git a/tools/readme.txt b/utils/readme.txt
similarity index 100%
rename from tools/readme.txt
rename to utils/readme.txt
diff --git a/tools/scancpan b/utils/scancpan
similarity index 100%
rename from tools/scancpan
rename to utils/scancpan
diff --git a/tools/scanpypi b/utils/scanpypi
similarity index 100%
rename from tools/scanpypi
rename to utils/scanpypi
diff --git a/tools/size-stats-compare b/utils/size-stats-compare
similarity index 100%
rename from tools/size-stats-compare
rename to utils/size-stats-compare
diff --git a/tools/test-pkg b/utils/test-pkg
similarity index 100%
rename from tools/test-pkg
rename to utils/test-pkg
