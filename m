From: Julien Floret <julien.floret@6wind.com>
Date: Fri,  4 Sep 2020 13:29:08 +0200
Subject: [Buildroot] [PATCH] pycompile: fix .pyc original source file paths
Message-ID: <20200904112908.21686-1-julien.floret@6wind.com>
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

Rework the script to call py_compile.compile() with pertinent options.

Signed-off-by: Robin Jarry <robin.jarry@6wind.com>
Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/python/python.mk     |  1 -
 package/python3/python3.mk   |  1 -
 support/scripts/pycompile.py | 74 ++++++++++++++----------------------
 3 files changed, 29 insertions(+), 47 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index ccaaadd012a5..67a7814a2d15 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -262,7 +262,6 @@ define PYTHON_CREATE_PYC_FILES
 	PYTHONPATH="$(PYTHON_PATH)" \
 	cd $(TARGET_DIR) && $(HOST_DIR)/bin/python$(PYTHON_VERSION_MAJOR) \
 		$(TOPDIR)/support/scripts/pycompile.py \
-		$(if $(BR2_REPRODUCIBLE),--force) \
 		usr/lib/python$(PYTHON_VERSION_MAJOR)
 endef
 
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 31e7ca3d3af3..0749bfbe7ebf 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -279,7 +279,6 @@ define PYTHON3_CREATE_PYC_FILES
 	PYTHONPATH="$(PYTHON3_PATH)" \
 	cd $(TARGET_DIR) && $(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) \
 		$(TOPDIR)/support/scripts/pycompile.py \
-		$(if $(BR2_REPRODUCIBLE),--force) \
 		usr/lib/python$(PYTHON3_VERSION_MAJOR)
 endef
 
diff --git a/support/scripts/pycompile.py b/support/scripts/pycompile.py
index 9192a7016a78..bfb82eac2750 100644
--- a/support/scripts/pycompile.py
+++ b/support/scripts/pycompile.py
@@ -9,61 +9,45 @@ Inspired from:
 from __future__ import print_function
 import sys
 import py_compile
-import compileall
 import argparse
+import os
+import re
 
 
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
+def is_importable_py_file(fpath):
+    if not fpath.endswith('.py'):
+        return False
+    if not (fpath.startswith('/usr/lib') or fpath.startswith('/usr/share')):
+        return False
+    return re.match(r'^[_A-Za-z][_A-Za-z0-9]+\.py$', os.path.basename(fpath))
 
 
-class ReportProblem(int):
-    '''Class that pretends to be an int() object but implements all of its
-    comparison operators such that it'd detect being called in
-    PyCompileError handling context and abort execution
-    '''
-    VALUE = 1
+def main():
+    parser = argparse.ArgumentParser(description='Compile Python source files in a directory tree.')
+    parser.add_argument("target", metavar='DIRECTORY',
+                        help='Directory to scan')
 
-    def __new__(cls, *args, **kwargs):
-        return int.__new__(cls, ReportProblem.VALUE, **kwargs)
+    args = parser.parse_args()
 
-    @check_for_errors
-    def __lt__(self, other):
-        return ReportProblem.VALUE < other
+    try:
 
-    @check_for_errors
-    def __eq__(self, other):
-        return ReportProblem.VALUE == other
+        for root, _, files in os.walk(args.target):
+            for f in files:
+                f = os.path.join(root, f)
+                if os.path.islink(f) or os.access(f, os.X_OK):
+                    continue
+                target = os.path.join('/', os.path.relpath(f, args.target))
+                if not is_importable_py_file(target):
+                    continue
 
-    def __ge__(self, other):
-        return not self < other
+                py_compile.compile(f, cfile=f + 'c', dfile=target, doraise=True)
 
-    def __gt__(self, other):
-        return not self < other and not self == other
+    except Exception as e:
+        print('error: %s' % e, file=sys.stderr)
+        return 1
 
-    def __ne__(self, other):
-        return not self == other
+    return 0
 
 
-parser = argparse.ArgumentParser(description='Compile Python source files in a directory tree.')
-parser.add_argument("target", metavar='DIRECTORY',
-                    help='Directory to scan')
-parser.add_argument("--force", action='store_true',
-                    help="Force compilation even if alread compiled")
-
-args = parser.parse_args()
-
-compileall.compile_dir(args.target, force=args.force, quiet=ReportProblem())
+if __name__ == '__main__':
+    sys.exit(main())
-- 
2.25.1
