From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 8 Feb 2016 22:51:48 +0100
Subject: [Buildroot] [RFC] Python pyc compilation check
Message-ID: <CAGm1_ks382K2C96g7BV1ZAxETEPMu_DAGznGrq45RV2hLRmE3g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As promised Samuel's patch:

diff --git a/package/python/python.mk b/package/python/python.mk
index 5ef3589..1d131c0 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -220,8 +220,9 @@ $(eval $(host-autotools-package))

 define PYTHON_CREATE_PYC_FILES
  PYTHONPATH="$(PYTHON_PATH)" \
- $(HOST_DIR)/usr/bin/python$(PYTHON_VERSION_MAJOR) -c "import compileall; \
- compileall.compile_dir('$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)')"
+ $(HOST_DIR)/usr/bin/python$(PYTHON_VERSION_MAJOR) \
+ $(TOPDIR)/support/scripts/pycompile.py \
+ "$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)"
 endef

 ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 507c610..1eb356b 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -217,8 +217,9 @@ $(eval $(host-autotools-package))

 define PYTHON3_CREATE_PYC_FILES
  PYTHONPATH="$(PYTHON3_PATH)" \
- $(HOST_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR) -c "import compileall; \
- compileall.compile_dir('$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)')"
+ $(HOST_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR) \
+ $(TOPDIR)/support/scripts/pycompile.py \
+ "$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
 endef

 ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
diff --git a/support/scripts/pycompile.py b/support/scripts/pycompile.py
new file mode 100755
index 0000000..fde711a
--- /dev/null
+++ b/support/scripts/pycompile.py
@@ -0,0 +1,24 @@
+#!/usr/bin/env python
+
+# Wrapper for python2 and python3 around compileall to raise exception
+# when a python byte code generation failed.
+#
+# Inspired from:
+#   http://stackoverflow.com/questions/615632/how-to-detect-errors-from-compileall-compile-dir
+
+from __future__ import print_function
+import sys
+import py_compile
+import compileall
+
+class ReportProblem:
+    def __nonzero__(self):
+        type, value, traceback = sys.exc_info()
+        if type is not None and issubclass(type, py_compile.PyCompileError):
+            print("Cannot compile %s" %value.file)
+            raise value
+        return 1
+
+report_problem = ReportProblem()
+
+compileall.compile_dir(sys.argv[1], quiet=report_problem)

Yegor
