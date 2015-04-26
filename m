From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Apr 2015 18:30:19 +0200
Subject: [Buildroot] [PATCH] python: Allow pyo only and variants
Message-ID: <1430065819-12745-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable the fact that you may want to use only pyo files on you target.
The main differences between the file format are as follow:

    - py: The source file
    - pyc: It's a compiled bytecode, makes import faster.
    - pyo: It's an optimized bytecode, mainly it removes the asserts

Also adding the various "mix" options a user may want between theses
three options.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/python/Config.in | 16 ++++++++++++++--
 package/python/python.mk | 32 +++++++++++++++++++++++++++-----
 2 files changed, 41 insertions(+), 7 deletions(-)

diff --git a/package/python/Config.in b/package/python/Config.in
index 8d71dc9..a03a11f 100644
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -18,9 +18,9 @@ if BR2_PACKAGE_PYTHON
 
 choice
 	prompt "python module format to install"
-	default BR2_PACKAGE_PYTHON_PYC_ONLY
+	default BR2_PACKAGE_PYTHON_PYO_ONLY
 	help
-	  Select Python module format to install on target (py, pyc or both)
+	  Select Python module format to install on target (py, pyc, pyo or a mix)
 
 config BR2_PACKAGE_PYTHON_PY_ONLY
 	bool ".py sources only"
@@ -28,9 +28,21 @@ config BR2_PACKAGE_PYTHON_PY_ONLY
 config BR2_PACKAGE_PYTHON_PYC_ONLY
 	bool ".pyc compiled sources only"
 
+config BR2_PACKAGE_PYTHON_PYO_ONLY
+	bool ".pyo compiled sources only"
+
 config BR2_PACKAGE_PYTHON_PY_PYC
 	bool ".py sources and .pyc compiled"
 
+config BR2_PACKAGE_PYTHON_PY_PYO
+	bool ".py sources and .pyo compiled"
+
+config BR2_PACKAGE_PYTHON_PYC_PYO
+	bool ".pyc and .pyo compiled sources"
+
+config BR2_PACKAGE_PYTHON_PY_PYC_PYO
+	bool ".py sources and both .pyc, .pyo compiled"
+
 endchoice
 
 menu "core python modules"
diff --git a/package/python/python.mk b/package/python/python.mk
index 4a3e71c..a175f19 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -33,8 +33,7 @@ HOST_PYTHON_CONF_OPTS += 	\
 	--disable-test-modules	\
 	--disable-bz2		\
 	--disable-ssl		\
-	--disable-ossaudiodev	\
-	--disable-pyo-build
+	--disable-ossaudiodev
 
 # Make sure that LD_LIBRARY_PATH overrides -rpath.
 # This is needed because libpython may be installed at the same time that
@@ -142,8 +141,7 @@ PYTHON_CONF_OPTS += \
 	--disable-gdbm		\
 	--disable-tk		\
 	--disable-nis		\
-	--disable-dbm		\
-	--disable-pyo-build
+	--disable-dbm
 
 # This is needed to make sure the Python build process doesn't try to
 # regenerate those files with the pgen program. Otherwise, it builds
@@ -217,16 +215,40 @@ PYTHON_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/sysconfigdata/
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
+ifeq ($(BR2_PACKAGE_PYTHON_PYO_ONLY),y)
+define PYTHON_FINALIZE_TARGET
+	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) \( -name '*.py' -or -name '*.pyc' \) -print0 | xargs -0 rm -f
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
 define PYTHON_FINALIZE_TARGET
-	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.py' -print0 | xargs -0 rm -f
+	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) \( -name '*.py' -or -name '*.pyo' \) -print0 | xargs -0 rm -f
 endef
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON_PY_ONLY),y)
 define PYTHON_FINALIZE_TARGET
+	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) \( -name '*.pyc' -or -name '*.pyo' \) -print0 | xargs -0 rm -f
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON_PY_PYC),y)
+define PYTHON_FINALIZE_TARGET
+	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.pyo' -print0 | xargs -0 rm -f
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON_PY_PYO),y)
+define PYTHON_FINALIZE_TARGET
 	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.pyc' -print0 | xargs -0 rm -f
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON_PYC_PYO),y)
+define PYTHON_FINALIZE_TARGET
+	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.py' -print0 | xargs -0 rm -f
+endef
+endif
+
 TARGET_FINALIZE_HOOKS += PYTHON_FINALIZE_TARGET
-- 
2.1.4
