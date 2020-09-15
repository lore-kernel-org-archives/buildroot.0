From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Sep 2020 20:04:06 +0200
Subject: [Buildroot] [git commit branch/2020.08.x]
 support/scripts/pycompile: fix .pyc original source file paths
Message-ID: <20200915185503.9EEBD868C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e3986d44a7b426ad46d80f66244b0807a099100
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

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

Previously, we had a --force option to tell compileall.compiledir() to
forcibly recompile files if they had changed. Now, we would have to
handle it ourselves. It turns out to not be easy and would need us to
delve into the format of bytecompiled files to extract metadata and
compare it with the expected values, that being even dependent on the
python version being used (fortunately, only two for us: python 2.7 and
the latext 3.x).

Still, this is deemed too complex, and byte-compiling is pretty fast, so
much so that it should be eclipsed by the build duration anyway.

So we just drop support for --force, and instead we always byte-compile.

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Robin Jarry <robin.jarry@6wind.com>
[yann.morin.1998 at free.fr:
  - always byte-compile
  - drop --force
  - expand commit log to state so and explain why
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c566f5206a8783d757f2d8b3dace5ebc963344c9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python/python.mk     |   6 +--
 package/python3/python3.mk   |   6 +--
 support/scripts/pycompile.py | 105 +++++++++++++++++++++++--------------------
 3 files changed, 62 insertions(+), 55 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index ccaaadd012..1320770eab 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -260,10 +260,10 @@ endif
 define PYTHON_CREATE_PYC_FILES
 	$(PYTHON_FIX_TIME)
 	PYTHONPATH="$(PYTHON_PATH)" \
-	cd $(TARGET_DIR) && $(HOST_DIR)/bin/python$(PYTHON_VERSION_MAJOR) \
+	$(HOST_DIR)/bin/python$(PYTHON_VERSION_MAJOR) \
 		$(TOPDIR)/support/scripts/pycompile.py \
-		$(if $(BR2_REPRODUCIBLE),--force) \
-		usr/lib/python$(PYTHON_VERSION_MAJOR)
+		--strip-root $(TARGET_DIR) \
+		$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)
 endef
 
 ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY)$(BR2_PACKAGE_PYTHON_PY_PYC),y)
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 31e7ca3d3a..7daf893712 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -277,10 +277,10 @@ endif
 define PYTHON3_CREATE_PYC_FILES
 	$(PYTHON3_FIX_TIME)
 	PYTHONPATH="$(PYTHON3_PATH)" \
-	cd $(TARGET_DIR) && $(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) \
+	$(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) \
 		$(TOPDIR)/support/scripts/pycompile.py \
-		$(if $(BR2_REPRODUCIBLE),--force) \
-		usr/lib/python$(PYTHON3_VERSION_MAJOR)
+		--strip-root $(TARGET_DIR) \
+		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)
 endef
 
 ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY)$(BR2_PACKAGE_PYTHON3_PY_PYC),y)
diff --git a/support/scripts/pycompile.py b/support/scripts/pycompile.py
index b713fe1932..8399d57936 100644
--- a/support/scripts/pycompile.py
+++ b/support/scripts/pycompile.py
@@ -1,75 +1,82 @@
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
+def compile_one(host_path, strip_root=None):
+    """
+    Compile a .py file into a .pyc file located next to it.
 
-    def __new__(cls, *args, **kwargs):
-        return int.__new__(cls, ReportProblem.VALUE, **kwargs)
+    :arg host_path:
+        Absolute path to the file to compile on the host running the build.
+    :arg strip_root:
+        Prefix to remove from the original source paths encoded in compiled
+        files.
+    """
+    if os.path.islink(host_path) or not os.path.isfile(host_path):
+        return  # only compile real files
 
-    @check_for_errors
-    def __lt__(self, other):
-        return ReportProblem.VALUE < other
+    if not re.match(r"^[_A-Za-z][_A-Za-z0-9]+\.py$",
+                    os.path.basename(host_path)):
+        return  # only compile "importable" python modules
 
-    @check_for_errors
-    def __eq__(self, other):
-        return ReportProblem.VALUE == other
+    if strip_root is not None:
+        # determine the runtime path of the file (i.e.: relative path to root
+        # dir prepended with "/").
+        runtime_path = os.path.join("/", os.path.relpath(host_path, strip_root))
+    else:
+        runtime_path = host_path
 
-    def __ge__(self, other):
-        return not self < other
+    # will raise an error if the file cannot be compiled
+    py_compile.compile(host_path, cfile=host_path + "c",
+                       dfile=runtime_path, doraise=True)
 
-    def __gt__(self, other):
-        return not self < other and not self == other
 
-    def __ne__(self, other):
-        return not self == other
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
-    parser.add_argument("--force", action="store_true",
-                        help="Force compilation even if already compiled")
+    parser.add_argument("dirs", metavar="DIR", nargs="+", type=existing_dir_abs,
+                        help="Directory to recursively scan and compile")
+    parser.add_argument("--strip-root", metavar="ROOT", type=existing_dir_abs,
+                        help="""
+                        Prefix to remove from the original source paths encoded
+                        in compiled files
+                        """)
 
     args = parser.parse_args()
 
-    compileall.compile_dir(args.target, force=args.force, quiet=ReportProblem())
+    try:
+        for d in args.dirs:
+            if args.strip_root and ".." in os.path.relpath(d, args.strip_root):
+                parser.error("DIR: not inside ROOT dir: {!r}".format(d))
+            for parent, _, files in os.walk(d):
+                for f in files:
+                    compile_one(os.path.join(parent, f), args.strip_root)
+
+    except Exception as e:
+        print("error: {}".format(e))
+        return 1
 
     return 0
 
