From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Jun 2017 23:50:08 +0200
Subject: [Buildroot] [PATCH 4/8 v3] tools: move check-package out of
	support/scripts/
In-Reply-To: <cover.1498859395.git.yann.morin.1998@free.fr>
References: <cover.1498859395.git.yann.morin.1998@free.fr>
Message-ID: <e96777578aa1c881ebc64342454b738886544a20.1498859395.git.yann.morin.1998@free.fr>
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
Changes v2 -> v3:
  - fix leftover paths in comments  (Ricardo)
  - update paths in DEVELOPPERS  (Ricardo)
---
 DEVELOPERS                                         |   3 +-
 support/scripts/check-package                      | 145 +--------------------
 support/scripts/pkg-stats                          |   2 +-
 tools/check-package                                | 144 ++++++++++++++++++++
 .../scripts => tools}/checkpackagelib/__init__.py  |   0
 {support/scripts => tools}/checkpackagelib/base.py |   2 +-
 {support/scripts => tools}/checkpackagelib/lib.py  |   2 +-
 .../checkpackagelib/lib_config.py                  |   2 +-
 .../scripts => tools}/checkpackagelib/lib_hash.py  |   2 +-
 .../scripts => tools}/checkpackagelib/lib_mk.py    |   2 +-
 .../scripts => tools}/checkpackagelib/lib_patch.py |   2 +-
 .../scripts => tools}/checkpackagelib/readme.txt   |  10 +-
 tools/readme.txt                                   |   4 +
 13 files changed, 163 insertions(+), 157 deletions(-)
 mode change 100755 => 120000 support/scripts/check-package
 create mode 100755 tools/check-package
 rename {support/scripts => tools}/checkpackagelib/__init__.py (100%)
 rename {support/scripts => tools}/checkpackagelib/base.py (78%)
 rename {support/scripts => tools}/checkpackagelib/lib.py (95%)
 rename {support/scripts => tools}/checkpackagelib/lib_config.py (98%)
 rename {support/scripts => tools}/checkpackagelib/lib_hash.py (96%)
 rename {support/scripts => tools}/checkpackagelib/lib_mk.py (99%)
 rename {support/scripts => tools}/checkpackagelib/lib_patch.py (96%)
 rename {support/scripts => tools}/checkpackagelib/readme.txt (91%)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9e421f4b41..ca5101b0e2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1386,7 +1386,8 @@ N:	Rhys Williams <github@wilberforce.co.nz>
 F:	package/lirc-tools/
 
 N:	Ricardo Martincoski <ricardo.martincoski@gmail.com>
-F:	support/scripts/check*package*
+F:	tools/check-package
+F:	tools/checkpackagelib/
 
 N:	Richard Braun <rbraun@sceen.net>
 F:	package/curlftpfs/
diff --git a/support/scripts/check-package b/support/scripts/check-package
deleted file mode 100755
index 74ea46f819..0000000000
--- a/support/scripts/check-package
+++ /dev/null
@@ -1,144 +0,0 @@
-#!/usr/bin/env python
-# See support/scripts/checkpackagelib/readme.txt before editing this file.
-
-from __future__ import print_function
-import argparse
-import inspect
-import re
-import sys
-
-import checkpackagelib.lib_config
-import checkpackagelib.lib_hash
-import checkpackagelib.lib_mk
-import checkpackagelib.lib_patch
-
-VERBOSE_LEVEL_TO_SHOW_IGNORED_FILES = 3
-flags = None  # Command line arguments.
-
-
-def parse_args():
-    parser = argparse.ArgumentParser()
-
-    # Do not use argparse.FileType("r") here because only files with known
-    # format will be open based on the filename.
-    parser.add_argument("files", metavar="F", type=str, nargs="*",
-                        help="list of files")
-
-    parser.add_argument("--manual-url", action="store",
-                        default="http://nightly.buildroot.org/",
-                        help="default: %(default)s")
-    parser.add_argument("--verbose", "-v", action="count", default=0)
-
-    # Now the debug options in the order they are processed.
-    parser.add_argument("--include-only", dest="include_list", action="append",
-                        help="run only the specified functions (debug)")
-    parser.add_argument("--exclude", dest="exclude_list", action="append",
-                        help="do not run the specified functions (debug)")
-    parser.add_argument("--dry-run", action="store_true", help="print the "
-                        "functions that would be called for each file (debug)")
-
-    return parser.parse_args()
-
-
-CONFIG_IN_FILENAME = re.compile("/Config\.\S*$")
-FILE_IS_FROM_A_PACKAGE = re.compile("package/[^/]*/")
-
-
-def get_lib_from_filename(fname):
-    if FILE_IS_FROM_A_PACKAGE.search(fname) is None:
-        return None
-    if CONFIG_IN_FILENAME.search(fname):
-        return checkpackagelib.lib_config
-    if fname.endswith(".hash"):
-        return checkpackagelib.lib_hash
-    if fname.endswith(".mk"):
-        return checkpackagelib.lib_mk
-    if fname.endswith(".patch"):
-        return checkpackagelib.lib_patch
-    return None
-
-
-def is_a_check_function(m):
-    if not inspect.isclass(m):
-        return False
-    # do not call the base class
-    if m.__name__.startswith("_"):
-        return False
-    if flags.include_list and m.__name__ not in flags.include_list:
-        return False
-    if flags.exclude_list and m.__name__ in flags.exclude_list:
-        return False
-    return True
-
-
-def print_warnings(warnings):
-    # Avoid the need to use 'return []' at the end of every check function.
-    if warnings is None:
-        return 0  # No warning generated.
-
-    for level, message in enumerate(warnings):
-        if flags.verbose >= level:
-            print(message.replace("\t", "< tab  >").rstrip())
-    return 1  # One more warning to count.
-
-
-def check_file_using_lib(fname):
-    # Count number of warnings generated and lines processed.
-    nwarnings = 0
-    nlines = 0
-
-    lib = get_lib_from_filename(fname)
-    if not lib:
-        if flags.verbose >= VERBOSE_LEVEL_TO_SHOW_IGNORED_FILES:
-            print("{}: ignored".format(fname))
-        return nwarnings, nlines
-    classes = inspect.getmembers(lib, is_a_check_function)
-
-    if flags.dry_run:
-        functions_to_run = [c[0] for c in classes]
-        print("{}: would run: {}".format(fname, functions_to_run))
-        return nwarnings, nlines
-
-    objects = [c[1](fname, flags.manual_url) for c in classes]
-
-    for cf in objects:
-        nwarnings += print_warnings(cf.before())
-    for lineno, text in enumerate(open(fname, "r").readlines()):
-        nlines += 1
-        for cf in objects:
-            nwarnings += print_warnings(cf.check_line(lineno + 1, text))
-    for cf in objects:
-        nwarnings += print_warnings(cf.after())
-
-    return nwarnings, nlines
-
-
-def __main__():
-    global flags
-    flags = parse_args()
-
-    if len(flags.files) == 0:
-        print("No files to check style")
-        sys.exit(1)
-
-    # Accumulate number of warnings generated and lines processed.
-    total_warnings = 0
-    total_lines = 0
-
-    for fname in flags.files:
-        nwarnings, nlines = check_file_using_lib(fname)
-        total_warnings += nwarnings
-        total_lines += nlines
-
-    # The warning messages are printed to stdout and can be post-processed
-    # (e.g. counted by 'wc'), so for stats use stderr. Wait all warnings are
-    # printed, for the case there are many of them, before printing stats.
-    sys.stdout.flush()
-    print("{} lines processed".format(total_lines), file=sys.stderr)
-    print("{} warnings generated".format(total_warnings), file=sys.stderr)
-
-    if total_warnings > 0:
-        sys.exit(1)
-
-
-__main__()
diff --git a/support/scripts/check-package b/support/scripts/check-package
new file mode 120000
index 0000000000..16a6051e3a
--- /dev/null
+++ b/support/scripts/check-package
@@ -0,0 +1 @@
+../../tools/check-package
\ No newline at end of file
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
diff --git a/tools/check-package b/tools/check-package
new file mode 100755
index 0000000000..cdbac94929
--- /dev/null
+++ b/tools/check-package
@@ -0,0 +1,144 @@
+#!/usr/bin/env python
+# See tools/checkpackagelib/readme.txt before editing this file.
+
+from __future__ import print_function
+import argparse
+import inspect
+import re
+import sys
+
+import checkpackagelib.lib_config
+import checkpackagelib.lib_hash
+import checkpackagelib.lib_mk
+import checkpackagelib.lib_patch
+
+VERBOSE_LEVEL_TO_SHOW_IGNORED_FILES = 3
+flags = None  # Command line arguments.
+
+
+def parse_args():
+    parser = argparse.ArgumentParser()
+
+    # Do not use argparse.FileType("r") here because only files with known
+    # format will be open based on the filename.
+    parser.add_argument("files", metavar="F", type=str, nargs="*",
+                        help="list of files")
+
+    parser.add_argument("--manual-url", action="store",
+                        default="http://nightly.buildroot.org/",
+                        help="default: %(default)s")
+    parser.add_argument("--verbose", "-v", action="count", default=0)
+
+    # Now the debug options in the order they are processed.
+    parser.add_argument("--include-only", dest="include_list", action="append",
+                        help="run only the specified functions (debug)")
+    parser.add_argument("--exclude", dest="exclude_list", action="append",
+                        help="do not run the specified functions (debug)")
+    parser.add_argument("--dry-run", action="store_true", help="print the "
+                        "functions that would be called for each file (debug)")
+
+    return parser.parse_args()
+
+
+CONFIG_IN_FILENAME = re.compile("/Config\.\S*$")
+FILE_IS_FROM_A_PACKAGE = re.compile("package/[^/]*/")
+
+
+def get_lib_from_filename(fname):
+    if FILE_IS_FROM_A_PACKAGE.search(fname) is None:
+        return None
+    if CONFIG_IN_FILENAME.search(fname):
+        return checkpackagelib.lib_config
+    if fname.endswith(".hash"):
+        return checkpackagelib.lib_hash
+    if fname.endswith(".mk"):
+        return checkpackagelib.lib_mk
+    if fname.endswith(".patch"):
+        return checkpackagelib.lib_patch
+    return None
+
+
+def is_a_check_function(m):
+    if not inspect.isclass(m):
+        return False
+    # do not call the base class
+    if m.__name__.startswith("_"):
+        return False
+    if flags.include_list and m.__name__ not in flags.include_list:
+        return False
+    if flags.exclude_list and m.__name__ in flags.exclude_list:
+        return False
+    return True
+
+
+def print_warnings(warnings):
+    # Avoid the need to use 'return []' at the end of every check function.
+    if warnings is None:
+        return 0  # No warning generated.
+
+    for level, message in enumerate(warnings):
+        if flags.verbose >= level:
+            print(message.replace("\t", "< tab  >").rstrip())
+    return 1  # One more warning to count.
+
+
+def check_file_using_lib(fname):
+    # Count number of warnings generated and lines processed.
+    nwarnings = 0
+    nlines = 0
+
+    lib = get_lib_from_filename(fname)
+    if not lib:
+        if flags.verbose >= VERBOSE_LEVEL_TO_SHOW_IGNORED_FILES:
+            print("{}: ignored".format(fname))
+        return nwarnings, nlines
+    classes = inspect.getmembers(lib, is_a_check_function)
+
+    if flags.dry_run:
+        functions_to_run = [c[0] for c in classes]
+        print("{}: would run: {}".format(fname, functions_to_run))
+        return nwarnings, nlines
+
+    objects = [c[1](fname, flags.manual_url) for c in classes]
+
+    for cf in objects:
+        nwarnings += print_warnings(cf.before())
+    for lineno, text in enumerate(open(fname, "r").readlines()):
+        nlines += 1
+        for cf in objects:
+            nwarnings += print_warnings(cf.check_line(lineno + 1, text))
+    for cf in objects:
+        nwarnings += print_warnings(cf.after())
+
+    return nwarnings, nlines
+
+
+def __main__():
+    global flags
+    flags = parse_args()
+
+    if len(flags.files) == 0:
+        print("No files to check style")
+        sys.exit(1)
+
+    # Accumulate number of warnings generated and lines processed.
+    total_warnings = 0
+    total_lines = 0
+
+    for fname in flags.files:
+        nwarnings, nlines = check_file_using_lib(fname)
+        total_warnings += nwarnings
+        total_lines += nlines
+
+    # The warning messages are printed to stdout and can be post-processed
+    # (e.g. counted by 'wc'), so for stats use stderr. Wait all warnings are
+    # printed, for the case there are many of them, before printing stats.
+    sys.stdout.flush()
+    print("{} lines processed".format(total_lines), file=sys.stderr)
+    print("{} warnings generated".format(total_warnings), file=sys.stderr)
+
+    if total_warnings > 0:
+        sys.exit(1)
+
+
+__main__()
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
index 151e1f1c8e..ba7a2058a4 100644
--- a/tools/readme.txt
+++ b/tools/readme.txt
@@ -8,6 +8,10 @@ brmake
     ("'br.log' in the current directory), and just outputs the Buildroot
     messages (those lines starting with >>>) on stdout.
 
+check-package
+    a script that checks the coding style of a package's Config.in and
+    .mk files, and also tests them for various types of typoes.
+
 get-developpers
     a script to return the list of people interested in a specific part
     of Buildroot, so they can be Cc:ed on a mail. Accepts a patch as
-- 
2.11.0
