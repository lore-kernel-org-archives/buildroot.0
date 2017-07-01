From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  1 Jul 2017 16:31:03 +0200
Subject: [Buildroot] [PATCH 3/7 v4] tools: move check-package out of
	support/scripts/
In-Reply-To: <cover.1498919458.git.yann.morin.1998@free.fr>
References: <cover.1498919458.git.yann.morin.1998@free.fr>
Message-ID: <4fe057937128752c8b833386dc429798a9fc0332.1498919458.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move it to the top-level tools/ directory, so that it is easier to
find for users.

Add a legacy symlink for those users who already used them, so as
not to break their habits.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Changes v3 -> v4:
  - drop legacy symlink  (Arnout, Thomas)

Changes v2 -> v3:
  - fix leftover paths in comments  (Ricardo)
  - update paths in DEVELOPPERS  (Ricardo)
---
 DEVELOPERS                                               |  3 ++-
 support/scripts/pkg-stats                                |  2 +-
 {support/scripts => tools}/check-package                 |  2 +-
 {support/scripts => tools}/checkpackagelib/__init__.py   |  0
 {support/scripts => tools}/checkpackagelib/base.py       |  2 +-
 {support/scripts => tools}/checkpackagelib/lib.py        |  2 +-
 {support/scripts => tools}/checkpackagelib/lib_config.py |  2 +-
 {support/scripts => tools}/checkpackagelib/lib_hash.py   |  2 +-
 {support/scripts => tools}/checkpackagelib/lib_mk.py     |  2 +-
 {support/scripts => tools}/checkpackagelib/lib_patch.py  |  2 +-
 {support/scripts => tools}/checkpackagelib/readme.txt    | 10 +++++-----
 tools/readme.txt                                         |  4 ++++
 12 files changed, 19 insertions(+), 14 deletions(-)
 rename {support/scripts => tools}/check-package (98%)
 rename {support/scripts => tools}/checkpackagelib/__init__.py (100%)
 rename {support/scripts => tools}/checkpackagelib/base.py (78%)
 rename {support/scripts => tools}/checkpackagelib/lib.py (95%)
 rename {support/scripts => tools}/checkpackagelib/lib_config.py (98%)
 rename {support/scripts => tools}/checkpackagelib/lib_hash.py (96%)
 rename {support/scripts => tools}/checkpackagelib/lib_mk.py (99%)
 rename {support/scripts => tools}/checkpackagelib/lib_patch.py (96%)
 rename {support/scripts => tools}/checkpackagelib/readme.txt (91%)

diff --git a/DEVELOPERS b/DEVELOPERS
index df974f9f64..700123f7f1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1389,7 +1389,8 @@ N:	Rhys Williams <github@wilberforce.co.nz>
 F:	package/lirc-tools/
 
 N:	Ricardo Martincoski <ricardo.martincoski@gmail.com>
-F:	support/scripts/check*package*
+F:	tools/check-package
+F:	tools/checkpackagelib/
 
 N:	Richard Braun <rbraun@sceen.net>
 F:	package/curlftpfs/
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 4cf1f82518..f827877052 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -337,7 +337,7 @@ for i in $(find boot/ linux/ package/ toolchain/ -name '*.mk' | sort) ; do
     fi
 
     file_list=$(find ${package_dir} -name '*.mk' -o -name '*.in*' -o -name '*.hash')
-    nwarnings=$(./support/scripts/check-package ${file_list} 2>&1 | sed '/\([0-9]*\) warnings generated/!d; s//\1/')
+    nwarnings=$(./tools/check-package ${file_list} 2>&1 | sed '/\([0-9]*\) warnings generated/!d; s//\1/')
     if [ ${nwarnings} -eq 0 ] ; then
 	echo "<td class=\"centered correct\">${nwarnings}</td>"
     else
diff --git a/support/scripts/check-package b/tools/check-package
similarity index 98%
rename from support/scripts/check-package
rename to tools/check-package
index 74ea46f819..cdbac94929 100755
--- a/support/scripts/check-package
+++ b/tools/check-package
@@ -1,5 +1,5 @@
 #!/usr/bin/env python
-# See support/scripts/checkpackagelib/readme.txt before editing this file.
+# See tools/checkpackagelib/readme.txt before editing this file.
 
 from __future__ import print_function
 import argparse
diff --git a/support/scripts/checkpackagelib/__init__.py b/tools/checkpackagelib/__init__.py
similarity index 100%
rename from support/scripts/checkpackagelib/__init__.py
rename to tools/checkpackagelib/__init__.py
diff --git a/support/scripts/checkpackagelib/base.py b/tools/checkpackagelib/base.py
similarity index 78%
rename from support/scripts/checkpackagelib/base.py
rename to tools/checkpackagelib/base.py
index 7669775f06..4b376f0597 100644
--- a/support/scripts/checkpackagelib/base.py
+++ b/tools/checkpackagelib/base.py
@@ -1,4 +1,4 @@
-# See support/scripts/checkpackagelib/readme.txt before editing this file.
+# See tools/checkpackagelib/readme.txt before editing this file.
 
 
 class _CheckFunction(object):
diff --git a/support/scripts/checkpackagelib/lib.py b/tools/checkpackagelib/lib.py
similarity index 95%
rename from support/scripts/checkpackagelib/lib.py
rename to tools/checkpackagelib/lib.py
index 3077f518b3..1a7db44b38 100644
--- a/support/scripts/checkpackagelib/lib.py
+++ b/tools/checkpackagelib/lib.py
@@ -1,4 +1,4 @@
-# See support/scripts/checkpackagelib/readme.txt before editing this file.
+# See tools/checkpackagelib/readme.txt before editing this file.
 
 from base import _CheckFunction
 
diff --git a/support/scripts/checkpackagelib/lib_config.py b/tools/checkpackagelib/lib_config.py
similarity index 98%
rename from support/scripts/checkpackagelib/lib_config.py
rename to tools/checkpackagelib/lib_config.py
index 8f49224e95..9e93c05eb8 100644
--- a/support/scripts/checkpackagelib/lib_config.py
+++ b/tools/checkpackagelib/lib_config.py
@@ -1,4 +1,4 @@
-# See support/scripts/checkpackagelib/readme.txt before editing this file.
+# See tools/checkpackagelib/readme.txt before editing this file.
 # Kconfig generates errors if someone introduces a typo like "boool" instead of
 # "bool", so below check functions don't need to check for things already
 # checked by running "make menuconfig".
diff --git a/support/scripts/checkpackagelib/lib_hash.py b/tools/checkpackagelib/lib_hash.py
similarity index 96%
rename from support/scripts/checkpackagelib/lib_hash.py
rename to tools/checkpackagelib/lib_hash.py
index c76abb43f1..cc1a5e43c3 100644
--- a/support/scripts/checkpackagelib/lib_hash.py
+++ b/tools/checkpackagelib/lib_hash.py
@@ -1,4 +1,4 @@
-# See support/scripts/checkpackagelib/readme.txt before editing this file.
+# See tools/checkpackagelib/readme.txt before editing this file.
 # The validity of the hashes itself is checked when building, so below check
 # functions don't need to check for things already checked by running
 # "make package-dirclean package-source".
diff --git a/support/scripts/checkpackagelib/lib_mk.py b/tools/checkpackagelib/lib_mk.py
similarity index 99%
rename from support/scripts/checkpackagelib/lib_mk.py
rename to tools/checkpackagelib/lib_mk.py
index a51e0e3ce6..8cbb358b1b 100644
--- a/support/scripts/checkpackagelib/lib_mk.py
+++ b/tools/checkpackagelib/lib_mk.py
@@ -1,4 +1,4 @@
-# See support/scripts/checkpackagelib/readme.txt before editing this file.
+# See tools/checkpackagelib/readme.txt before editing this file.
 # There are already dependency checks during the build, so below check
 # functions don't need to check for things already checked by exploring the
 # menu options using "make menuconfig" and by running "make" with appropriate
diff --git a/support/scripts/checkpackagelib/lib_patch.py b/tools/checkpackagelib/lib_patch.py
similarity index 96%
rename from support/scripts/checkpackagelib/lib_patch.py
rename to tools/checkpackagelib/lib_patch.py
index c191d262e2..3e1dae5f98 100644
--- a/support/scripts/checkpackagelib/lib_patch.py
+++ b/tools/checkpackagelib/lib_patch.py
@@ -1,4 +1,4 @@
-# See support/scripts/checkpackagelib/readme.txt before editing this file.
+# See tools/checkpackagelib/readme.txt before editing this file.
 # The format of the patch files is tested during the build, so below check
 # functions don't need to check for things already checked by running
 # "make package-dirclean package-patch".
diff --git a/support/scripts/checkpackagelib/readme.txt b/tools/checkpackagelib/readme.txt
similarity index 91%
rename from support/scripts/checkpackagelib/readme.txt
rename to tools/checkpackagelib/readme.txt
index 0444d17992..8012c72e39 100644
--- a/support/scripts/checkpackagelib/readme.txt
+++ b/tools/checkpackagelib/readme.txt
@@ -57,19 +57,19 @@ Some hints when changing this code:
 Usage examples:
 - to get a list of check functions that would be called without actually
   calling them you can use the --dry-run option:
-$ support/scripts/check-package --dry-run package/yourfavorite/*
+$ tools/check-package --dry-run package/yourfavorite/*
 
 - when you just added a new check function, e.g. Something, check how it behaves
   for all current packages:
-$ support/scripts/check-package --include-only Something $(find package -type f)
+$ tools/check-package --include-only Something $(find package -type f)
 
 - the effective processing time (when the .pyc were already generated and all
   files to be processed are cached in the RAM) should stay in the order of few
   seconds:
-$ support/scripts/check-package $(find package -type f) >/dev/null ; \
-  time support/scripts/check-package $(find package -type f) >/dev/null
+$ tools/check-package $(find package -type f) >/dev/null ; \
+  time tools/check-package $(find package -type f) >/dev/null
 
 - vim users can navigate the warnings (most editors probably have similar
   function) since warnings are generated in the form 'path/file:line: warning':
 $ find package/ -name 'Config.*' > filelist && vim -c \
-  'set makeprg=support/scripts/check-package\ $(cat\ filelist)' -c make -c copen
+  'set makeprg=tools/check-package\ $(cat\ filelist)' -c make -c copen
diff --git a/tools/readme.txt b/tools/readme.txt
index 1439a0a99f..fc1108fded 100644
--- a/tools/readme.txt
+++ b/tools/readme.txt
@@ -2,6 +2,10 @@ This directory contains various useful scripts and tools for working
 with Buildroot. You need not add this directory in your PATH to use
 any of those tools, but you may do so if you want.
 
+check-package
+    a script that checks the coding style of a package's Config.in and
+    .mk files, and also tests them for various types of typoes.
+
 get-developpers
     a script to return the list of people interested in a specific part
     of Buildroot, so they can be Cc:ed on a mail. Accepts a patch as
-- 
2.11.0
