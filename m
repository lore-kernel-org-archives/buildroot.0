From: Robin Jarry <robin.jarry@6wind.com>
Date: Tue,  8 Sep 2020 10:10:25 +0200
Subject: [Buildroot] [PATCH v2 3/4] pycompile: fix .pyc original source file
 paths
In-Reply-To: <20200908081026.4701-1-robin.jarry@6wind.com>
References: <20200904112908.21686-1-julien.floret@6wind.com>
 <20200908081026.4701-1-robin.jarry@6wind.com>
Message-ID: <20200908081026.4701-4-robin.jarry@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When generating a .pyc file, the original .py source file path is
encoded in it. It is used for various purposes: traceback generation,
.pyc file comparison with its .py source, and code inspection.

By default, the source path used when invoking compileall is encoded in
the .pyc file. Since we use paths relative to TARGET_DIR, we end up with
paths that are only valid when relative to '/' encoded in the installed
.pyc files on the target.

This breaks code inspection at runtime since the original source path
will be invalid unless the code is executed from '/'.

Unfortunately, compileall cannot be forced to use the proper path. It
was not written with cross-compilation usage in mind.

Rework the script to call py_compile.compile() with pertinent options:

- The script is now called with $(TARGET_DIR) as first argument. This is
  the future runtime /.
- All other (non-optional) arguments are folders in which all
  "importable" .py files will be compiled to .pyc.
- Using the $(TARGET_DIR), the future runtime path of each .py file is
  computed and encoded into the compiled .pyc.

No need to change directory before running the script anymore.

The trickery used to handle error reporting was only applicable with
compileall. Since we implement our own "compileall", error reporting
becomes trivial.

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Robin Jarry <robin.jarry@6wind.com>
---
 package/python/python.mk     |   5 +-
 package/python3/python3.mk   |   5 +-
 support/scripts/pycompile.py | 122 ++++++++++++++++++++---------------
 3 files changed, 76 insertions(+), 56 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index ccaaadd012a5..7000658330e8 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -260,10 +260,11 @@ endif
 define PYTHON_CREATE_PYC_FILES
 	$(PYTHON_FIX_TIME)
 	PYTHONPATH="$(PYTHON_PATH)" \
-	cd $(TARGET_DIR) && $(HOST_DIR)/bin/python$(PYTHON_VERSION_MAJOR) \
+	$(HOST_DIR)/bin/python$(PYTHON_VERSION_MAJOR) \
 		$(TOPDIR)/support/scripts/pycompile.py \
 		$(if $(BR2_REPRODUCIBLE),--force) \
-		usr/lib/python$(PYTHON_VERSION_MAJOR)
+		$(TARGET_DIR) \
+		$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)
 endef
 
 ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY)$(BR2_PACKAGE_PYTHON_PY_PYC),y)
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 31e7ca3d3af3..e8c200b2081e 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -277,10 +277,11 @@ endif
 define PYTHON3_CREATE_PYC_FILES
 	$(PYTHON3_FIX_TIME)
 	PYTHONPATH="$(PYTHON3_PATH)" \
-	cd $(TARGET_DIR) && $(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) \
+	$(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) \
 		$(TOPDIR)/support/scripts/pycompile.py \
 		$(if $(BR2_REPRODUCIBLE),--force) \
-		usr/lib/python$(PYTHON3_VERSION_MAJOR)
+		$(TARGET_DIR) \
+		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)
 endef
 
 ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY)$(BR2_PACKAGE_PYTHON3_PY_PYC),y)
diff --git a/support/scripts/pycompile.py b/support/scripts/pycompile.py
index b713fe19323c..c60d4e13f3b4 100644
--- a/support/scripts/pycompile.py
+++ b/support/scripts/pycompile.py
@@ -1,75 +1,93 @@
 #!/usr/bin/env python
 
-'''Wrapper for python2 and python3 around compileall to raise exception
-when a python byte code generation failed.
-
-Inspired from:
-   http://stackoverflow.com/questions/615632/how-to-detect-errors-from-compileall-compile-dir
-'''
+"""
+Byte compile all .py files from a target dir and encode a proper source runtime
+path into them.
+"""
 
 from __future__ import print_function
 
 import argparse
-import compileall
+import importlib
+import os
 import py_compile
+import re
+import struct
 import sys
 
 
-def check_for_errors(comparison):
-    '''Wrap comparison operator with code checking for PyCompileError.
-    If PyCompileError was raised, re-raise it again to abort execution,
-    otherwise perform comparison as expected.
-    '''
-    def operator(self, other):
-        exc_type, value, traceback = sys.exc_info()
-        if exc_type is not None and issubclass(exc_type,
-                                               py_compile.PyCompileError):
-            print("Cannot compile %s" % value.file)
-            raise value
-
-        return comparison(self, other)
-
-    return operator
-
-
-class ReportProblem(int):
-    '''Class that pretends to be an int() object but implements all of its
-    comparison operators such that it'd detect being called in
-    PyCompileError handling context and abort execution
-    '''
-    VALUE = 1
-
-    def __new__(cls, *args, **kwargs):
-        return int.__new__(cls, ReportProblem.VALUE, **kwargs)
-
-    @check_for_errors
-    def __lt__(self, other):
-        return ReportProblem.VALUE < other
-
-    @check_for_errors
-    def __eq__(self, other):
-        return ReportProblem.VALUE == other
-
-    def __ge__(self, other):
-        return not self < other
-
-    def __gt__(self, other):
-        return not self < other and not self == other
-
-    def __ne__(self, other):
-        return not self == other
+def compile_one(host_path, target_root, force=False):
+    """
+    Compile a .py file into a .pyc file located next to it.
+
+    :arg host_path:
+        Absolute path to the file to compile on the host running the build.
+    :arg target_root:
+        Absolute path of the target dir (i.e. the future /).
+    :arg force:
+        Recompile even if already up-to-date.
+    """
+    if os.path.islink(host_path):
+        return  # only compile real files
+
+    if not re.match(r"^[_A-Za-z][_A-Za-z0-9]+\.py$",
+                    os.path.basename(host_path)):
+        return  # only compile "importable" python modules
+
+    if not force:
+        # inspired from compileall.compile_file in the standard library
+        try:
+            with open(host_path + "c", "rb") as f:
+                header = f.read(12)
+            expect = struct.pack("<4sll", importlib.util.MAGIC_NUMBER,
+                                 0, int(os.stat(host_path).st_mtime))
+            if header == expect:
+                return  # .pyc file already up to date.
+        except OSError:
+            pass  # .pyc file does not exist
+
+    # determine the runtime path of the file (i.e.: relative path to target
+    # root dir prepended with "/").
+    runtime_path = os.path.join("/", os.path.relpath(host_path, target_root))
+
+    # will raise an error if the file cannot be compiled
+    py_compile.compile(host_path, cfile=host_path + "c",
+                       dfile=runtime_path, doraise=True)
 
 
 def main():
     parser = argparse.ArgumentParser(description=__doc__)
     parser.add_argument("target", metavar="TARGET",
-                        help="Directory to scan")
+                        help="Path on the build host that will be /@runtime")
+    parser.add_argument("dirs", metavar="PATH", nargs="+",
+                        help="Folder located inside TARGET to scan and compile")
     parser.add_argument("--force", action="store_true",
                         help="Force compilation even if already compiled")
 
     args = parser.parse_args()
 
-    compileall.compile_dir(args.target, force=args.force, quiet=ReportProblem())
+    if not os.path.isdir(args.target):
+        parser.error("TARGET: no such directory: %r" % args.target)
+
+    # only work with absolute paths
+    args.target = os.path.abspath(args.target)
+
+    try:
+        # Make sure that all scanned dirs do exist and that they are located
+        # *inside* the target dir.
+        for d in args.dirs:
+            if not os.path.isdir(d):
+                parser.error("PATH: no such directory: %r" % d)
+            d = os.path.abspath(d)
+            if ".." in os.path.relpath(d, args.target):
+                parser.error("PATH: not inside TARGET dir: %r" % d)
+            for parent, _, files in os.walk(d):
+                for f in files:
+                    compile_one(os.path.join(parent, f), args.target, args.force)
+
+    except Exception as e:
+        print("error: %s" % e, file=sys.stderr)
+        return 1
 
     return 0
 
-- 
2.28.0
