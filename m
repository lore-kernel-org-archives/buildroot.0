From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 23:19:15 +0200
Subject: [Buildroot] [PATCH v4 3/4] python/python3: globalize *.pyc files
	compilation
In-Reply-To: <1463519956-5599-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1463519956-5599-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1463519956-5599-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Currently, each python package (be it the python interpreter package
itself or external python modules) is responsible for compiling its
.py into .pyc files. Unfortunately, this is not ideal as some packages
only install .py files without compiling them into .pyc files. In this
case, if the Buildroot configuration specifies to keep only the .pyc
files, the .py files are removed and lost.

To address this, this commit changes the logic by making the
compilation of .pyc files a global operation: the python interpreter
packages register a target finalize hook that is in charge of
compiling all installed .py files.

The *.pyc generation on a per package basis is disabled in the
python-package infrastructure by passing the "--no-compile" option to
setup.py.

The *.pyc generation for the Python interpreter internal modules is
disabled through --disable-pyc-build configure option.

A small helper script is used to perform the compilation, the purpose
of this script is to abort the compilation process if one of the .py
file cannot be compiled. It has been provided by Samuel Martin and
integrated into this commit.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Samuel Martin <s.martin49@gmail.com>
[Thomas:
 - rework for python 3.5
 - integrate Samuel proposal that allows to detect compilation
   failures.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
---
 package/pkg-python.mk        |  2 +-
 package/python/python.mk     | 16 +++++++++++++++-
 package/python3/python3.mk   | 20 +++++++++++++++-----
 support/scripts/pycompile.py | 24 ++++++++++++++++++++++++
 4 files changed, 55 insertions(+), 7 deletions(-)
 create mode 100644 support/scripts/pycompile.py

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index b7a702d..9725d24 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -253,7 +253,7 @@ ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	(cd $$($$(PKG)_BUILDDIR)/; \
 		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
-		$$($(2)_PYTHON_INTERPRETER) setup.py install \
+		$$($(2)_PYTHON_INTERPRETER) setup.py install --no-compile \
 		$$($$(PKG)_BASE_INSTALL_TARGET_OPTS) \
 		$$($$(PKG)_INSTALL_TARGET_OPTS))
 endef
diff --git a/package/python/python.mk b/package/python/python.mk
index 4e92766..913dc2c 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -143,7 +143,8 @@ PYTHON_CONF_OPTS += \
 	--disable-tk		\
 	--disable-nis		\
 	--disable-dbm		\
-	--disable-pyo-build
+	--disable-pyo-build	\
+	--disable-pyc-build
 
 # This is needed to make sure the Python build process doesn't try to
 # regenerate those files with the pgen program. Otherwise, it builds
@@ -217,6 +218,17 @@ PYTHON_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/sysconfigdata/
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
+define PYTHON_CREATE_PYC_FILES
+	PYTHONPATH="$(PYTHON_PATH)" \
+	$(HOST_DIR)/usr/bin/python$(PYTHON_VERSION_MAJOR) \
+		support/scripts/pycompile.py \
+		$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)
+endef
+
+ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY)$(BR2_PACKAGE_PYTHON_PY_PYC),y)
+TARGET_FINALIZE_HOOKS += PYTHON_CREATE_PYC_FILES
+endif
+
 ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
 define PYTHON_REMOVE_PY_FILES
 	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.py' -print0 | \
@@ -225,6 +237,8 @@ endef
 TARGET_FINALIZE_HOOKS += PYTHON_REMOVE_PY_FILES
 endif
 
+# Normally, *.pyc files should not have been compiled, but just in
+# case, we make sure we remove all of them.
 ifeq ($(BR2_PACKAGE_PYTHON_PY_ONLY),y)
 define PYTHON_REMOVE_PYC_FILES
 	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.pyc' -print0 | \
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 3089c03..8459b11 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -78,10 +78,6 @@ ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
 PYTHON3_CONF_OPTS += --enable-old-stdlib-cache
 endif
 
-ifeq ($(BR2_PACKAGE_PYTHON3_PY_ONLY),y)
-PYTHON3_CONF_OPTS += --disable-pyc-build
-endif
-
 ifeq ($(BR2_PACKAGE_PYTHON3_SQLITE),y)
 PYTHON3_DEPENDENCIES += sqlite
 else
@@ -135,7 +131,8 @@ PYTHON3_CONF_OPTS += \
 	--disable-lib2to3	\
 	--disable-tk		\
 	--disable-nis		\
-	--disable-idle3
+	--disable-idle3		\
+	--disable-pyc-build
 
 # Python builds two tools to generate code: 'pgen' and
 # '_freeze_importlib'. Unfortunately, for the target Python, they are
@@ -212,6 +209,17 @@ PYTHON3_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/sysconfigdat
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
+define PYTHON3_CREATE_PYC_FILES
+	PYTHONPATH="$(PYTHON3_PATH)" \
+	$(HOST_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR) \
+		support/scripts/pycompile.py \
+		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)
+endef
+
+ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY)$(BR2_PACKAGE_PYTHON3_PY_PYC),y)
+TARGET_FINALIZE_HOOKS += PYTHON3_CREATE_PYC_FILES
+endif
+
 ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
 define PYTHON3_REMOVE_PY_FILES
 	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) -name '*.py' -print0 | \
@@ -220,6 +228,8 @@ endef
 TARGET_FINALIZE_HOOKS += PYTHON3_REMOVE_PY_FILES
 endif
 
+# Normally, *.pyc files should not have been compiled, but just in
+# case, we make sure we remove all of them.
 ifeq ($(BR2_PACKAGE_PYTHON3_PY_ONLY),y)
 define PYTHON3_REMOVE_PYC_FILES
 	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) -name '*.pyc' -print0 | \
diff --git a/support/scripts/pycompile.py b/support/scripts/pycompile.py
new file mode 100644
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
-- 
2.7.4
