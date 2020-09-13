From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Sep 2020 10:28:36 +0200
Subject: [Buildroot] [git commit] support/scripts/pycompile: add --verbose
 option
Message-ID: <20200913085228.E9BBB7FAE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f88dcd3f99bcdd46469a350a044911c163909985
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a new option that prints the (runtime) path of compiled .py files
when VERBOSE=1 is set.

Signed-off-by: Robin Jarry <robin.jarry@6wind.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python/python.mk     |  1 +
 package/python3/python3.mk   |  1 +
 support/scripts/pycompile.py | 12 ++++++++++--
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index 1320770eab..1a3a60bbac 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -262,6 +262,7 @@ define PYTHON_CREATE_PYC_FILES
 	PYTHONPATH="$(PYTHON_PATH)" \
 	$(HOST_DIR)/bin/python$(PYTHON_VERSION_MAJOR) \
 		$(TOPDIR)/support/scripts/pycompile.py \
+		$(if $(VERBOSE),--verbose) \
 		--strip-root $(TARGET_DIR) \
 		$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)
 endef
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 7daf893712..d63a8bc080 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -279,6 +279,7 @@ define PYTHON3_CREATE_PYC_FILES
 	PYTHONPATH="$(PYTHON3_PATH)" \
 	$(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) \
 		$(TOPDIR)/support/scripts/pycompile.py \
+		$(if $(VERBOSE),--verbose) \
 		--strip-root $(TARGET_DIR) \
 		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)
 endef
diff --git a/support/scripts/pycompile.py b/support/scripts/pycompile.py
index 8399d57936..2b636e03cb 100644
--- a/support/scripts/pycompile.py
+++ b/support/scripts/pycompile.py
@@ -15,7 +15,7 @@ import re
 import sys
 
 
-def compile_one(host_path, strip_root=None):
+def compile_one(host_path, strip_root=None, verbose=False):
     """
     Compile a .py file into a .pyc file located next to it.
 
@@ -24,6 +24,8 @@ def compile_one(host_path, strip_root=None):
     :arg strip_root:
         Prefix to remove from the original source paths encoded in compiled
         files.
+    :arg verbose:
+        Print compiled file paths.
     """
     if os.path.islink(host_path) or not os.path.isfile(host_path):
         return  # only compile real files
@@ -39,6 +41,9 @@ def compile_one(host_path, strip_root=None):
     else:
         runtime_path = host_path
 
+    if verbose:
+        print("  PYC  {}".format(runtime_path))
+
     # will raise an error if the file cannot be compiled
     py_compile.compile(host_path, cfile=host_path + "c",
                        dfile=runtime_path, doraise=True)
@@ -63,6 +68,8 @@ def main():
                         Prefix to remove from the original source paths encoded
                         in compiled files
                         """)
+    parser.add_argument("--verbose", action="store_true",
+                        help="Print compiled files")
 
     args = parser.parse_args()
 
@@ -72,7 +79,8 @@ def main():
                 parser.error("DIR: not inside ROOT dir: {!r}".format(d))
             for parent, _, files in os.walk(d):
                 for f in files:
-                    compile_one(os.path.join(parent, f), args.strip_root)
+                    compile_one(os.path.join(parent, f), args.strip_root,
+                                args.verbose)
 
     except Exception as e:
         print("error: {}".format(e))
