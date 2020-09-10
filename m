From: Robin Jarry <robin.jarry@6wind.com>
Date: Thu, 10 Sep 2020 10:32:51 +0200
Subject: [Buildroot] [PATCH v4 1/2] support/scripts/pycompile: fix .pyc
 original source file paths
In-Reply-To: <20200910083252.7102-1-robin.jarry@6wind.com>
References: <20200904112908.21686-1-julien.floret@6wind.com>
 <20200910083252.7102-1-robin.jarry@6wind.com>
Message-ID: <20200910083252.7102-2-robin.jarry@6wind.com>
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

Rework the script to call py_compile.compile() directly with pertinent
options:

- The script now has a new --strip-root argument. This argument is
  optional but will always be specified when compiling py files in
  buildroot.
- All other (non-optional) arguments are folders in which all
  "importable" .py files will be compiled to .pyc.
- Using --strip-root=$(TARGET_DIR), the future runtime path of each .py
  file is computed and encoded into the compiled .pyc.

No need to change directory before running the script anymore.

The trickery used to handle error reporting was only applicable with
compileall. Since we implement our own "compileall", error reporting
becomes trivial.

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Robin Jarry <robin.jarry@6wind.com>
---
 package/python/python.mk     |   5 +-
 package/python3/python3.mk   |   5 +-
 support/scripts/pycompile.py | 146 ++++++++++++++++++++++-------------
 3 files changed, 99 insertions(+), 57 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index ccaaadd012a5..3fe5ecd00462 100644
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
+		--strip-root $(TARGET_DIR) \
+		$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)
 endef
 
 ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY)$(BR2_PACKAGE_PYTHON_PY_PYC),y)
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 31e7ca3d3af3..4c8a12c7a3ad 100644
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
+		--strip-root $(TARGET_DIR) \
+		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)
 endef
 
 ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY)$(BR2_PACKAGE_PYTHON3_PY_PYC),y)
diff --git a/support/scripts/pycompile.py b/support/scripts/pycompile.py
index b713fe19323c..04193f4a02c2 100644
--- a/support/scripts/pycompile.py
+++ b/support/scripts/pycompile.py
@@ -1,75 +1,115 @@
 #!/usr/bin/env python
 
-'''Wrapper for python2 and python3 around compileall to raise exception
-when a python byte code generation failed.
-
-Inspired from:
-   http://stackoverflow.com/questions/615632/how-to-detect-errors-from-compileall-compile-dir
-'''
+"""
+Byte compile all .py files from provided directories. This script is an
+alternative implementation of compileall.compile_dir written with
+cross-compilation in mind.
+"""
 
 from __future__ import print_function
 
 import argparse
-import compileall
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
+if sys.version_info < (3, 4):
+    import imp  # import here to avoid deprecation warning when >=3.4
+    PYC_HEADER_ARGS = (imp.get_magic(),)
+else:
+    import importlib
+    PYC_HEADER_ARGS = (importlib.util.MAGIC_NUMBER,)
+if sys.version_info < (3, 7):
+    PYC_HEADER_LEN = 8
+    PYC_HEADER_FMT = "<4sl"
+else:
+    PYC_HEADER_LEN = 12
+    PYC_HEADER_FMT = "<4sll"
+    PYC_HEADER_ARGS += (0,)  # zero hash, we use timestamp invalidation
+
+
+def compile_one(host_path, strip_root=None, force=False):
+    """
+    Compile a .py file into a .pyc file located next to it.
+
+    :arg host_path:
+        Absolute path to the file to compile on the host running the build.
+    :arg strip_root:
+        Prefix to remove from the original source paths encoded in compiled
+        files.
+    :arg force:
+        Recompile even if already up-to-date.
+    """
+    if os.path.islink(host_path) or not os.path.isfile(host_path):
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
+                header = f.read(PYC_HEADER_LEN)
+            header_args = PYC_HEADER_ARGS + (int(os.stat(host_path).st_mtime),)
+            expect = struct.pack(PYC_HEADER_FMT, *header_args)
+            if header == expect:
+                return  # .pyc file already up to date.
+        except OSError:
+            pass  # .pyc file does not exist
+
+    if strip_root is not None:
+        # determine the runtime path of the file (i.e.: relative path to root
+        # dir prepended with "/").
+        runtime_path = os.path.join("/", os.path.relpath(host_path, strip_root))
+    else:
+        runtime_path = host_path
+
+    # will raise an error if the file cannot be compiled
+    py_compile.compile(host_path, cfile=host_path + "c",
+                       dfile=runtime_path, doraise=True)
+
+
+def existing_dir_abs(arg):
+    """
+    argparse type callback that checks that argument is a directory and returns
+    its absolute path.
+    """
+    if not os.path.isdir(arg):
+        raise argparse.ArgumentTypeError('no such directory: {!r}'.format(arg))
+    return os.path.abspath(arg)
 
 
 def main():
     parser = argparse.ArgumentParser(description=__doc__)
-    parser.add_argument("target", metavar="TARGET",
-                        help="Directory to scan")
+    parser.add_argument("dirs", metavar="DIR", nargs="+", type=existing_dir_abs,
+                        help="Directory to recursively scan and compile")
+    parser.add_argument("--strip-root", metavar="ROOT", type=existing_dir_abs,
+                        help="""
+                        Prefix to remove from the original source paths encoded
+                        in compiled files
+                        """)
     parser.add_argument("--force", action="store_true",
                         help="Force compilation even if already compiled")
 
     args = parser.parse_args()
 
-    compileall.compile_dir(args.target, force=args.force, quiet=ReportProblem())
+    try:
+        for d in args.dirs:
+            if args.strip_root and ".." in os.path.relpath(d, args.strip_root):
+                parser.error("DIR: not inside ROOT dir: {!r}".format(d))
+            for parent, _, files in os.walk(d):
+                for f in files:
+                    compile_one(os.path.join(parent, f), args.strip_root,
+                                args.force)
+
+    except Exception as e:
+        print("error: {}".format(e))
+        return 1
 
     return 0
 
-- 
2.28.0
