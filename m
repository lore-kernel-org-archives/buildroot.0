From: Robin Jarry <robin.jarry@6wind.com>
Date: Tue,  8 Sep 2020 10:10:26 +0200
Subject: [Buildroot] [PATCH v2 4/4] pycompile: add --verbose option
In-Reply-To: <20200908081026.4701-1-robin.jarry@6wind.com>
References: <20200904112908.21686-1-julien.floret@6wind.com>
 <20200908081026.4701-1-robin.jarry@6wind.com>
Message-ID: <20200908081026.4701-5-robin.jarry@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a new option that prints the (runtime) path of compiled .py files
when VERBOSE=1 is set.

Signed-off-by: Robin Jarry <robin.jarry@6wind.com>
---
 package/python/python.mk     |  1 +
 package/python3/python3.mk   |  1 +
 support/scripts/pycompile.py | 11 +++++++++--
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index 7000658330e8..50e77db74628 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -263,6 +263,7 @@ define PYTHON_CREATE_PYC_FILES
 	$(HOST_DIR)/bin/python$(PYTHON_VERSION_MAJOR) \
 		$(TOPDIR)/support/scripts/pycompile.py \
 		$(if $(BR2_REPRODUCIBLE),--force) \
+		$(if $(VERBOSE),--verbose) \
 		$(TARGET_DIR) \
 		$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)
 endef
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index e8c200b2081e..1ef757c6b66f 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -280,6 +280,7 @@ define PYTHON3_CREATE_PYC_FILES
 	$(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) \
 		$(TOPDIR)/support/scripts/pycompile.py \
 		$(if $(BR2_REPRODUCIBLE),--force) \
+		$(if $(VERBOSE),--verbose) \
 		$(TARGET_DIR) \
 		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)
 endef
diff --git a/support/scripts/pycompile.py b/support/scripts/pycompile.py
index c60d4e13f3b4..cb2ba7f5016e 100644
--- a/support/scripts/pycompile.py
+++ b/support/scripts/pycompile.py
@@ -16,7 +16,7 @@ import struct
 import sys
 
 
-def compile_one(host_path, target_root, force=False):
+def compile_one(host_path, target_root, force=False, verbose=False):
     """
     Compile a .py file into a .pyc file located next to it.
 
@@ -26,6 +26,8 @@ def compile_one(host_path, target_root, force=False):
         Absolute path of the target dir (i.e. the future /).
     :arg force:
         Recompile even if already up-to-date.
+    :arg verbose:
+        Print compiled file paths.
     """
     if os.path.islink(host_path):
         return  # only compile real files
@@ -49,6 +51,8 @@ def compile_one(host_path, target_root, force=False):
     # determine the runtime path of the file (i.e.: relative path to target
     # root dir prepended with "/").
     runtime_path = os.path.join("/", os.path.relpath(host_path, target_root))
+    if verbose:
+        print("  PYC  %s" % (runtime_path,))
 
     # will raise an error if the file cannot be compiled
     py_compile.compile(host_path, cfile=host_path + "c",
@@ -63,6 +67,8 @@ def main():
                         help="Folder located inside TARGET to scan and compile")
     parser.add_argument("--force", action="store_true",
                         help="Force compilation even if already compiled")
+    parser.add_argument("--verbose", action="store_true",
+                        help="Print compiled files")
 
     args = parser.parse_args()
 
@@ -83,7 +89,8 @@ def main():
                 parser.error("PATH: not inside TARGET dir: %r" % d)
             for parent, _, files in os.walk(d):
                 for f in files:
-                    compile_one(os.path.join(parent, f), args.target, args.force)
+                    compile_one(os.path.join(parent, f), args.target,
+                                args.force, args.verbose)
 
     except Exception as e:
         print("error: %s" % e, file=sys.stderr)
-- 
2.28.0
