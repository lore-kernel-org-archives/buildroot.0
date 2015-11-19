From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 19 Nov 2015 15:10:51 +0100
Subject: [Buildroot] [PATCH v3] python: rework *.pyc files generation
Message-ID: <1447942251-7742-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

This patch generates all *.pyc files from *.py located in
<target>/usr/lib/python*/site-packages, before stripping the rootfs.

*.pyc generation on per package basis is disabled through
"--no-compile" option.

This prevents modules from packages, that do not compile the *.py
files, from disappearing.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Samuel Martin <s.martin49@gmail.com>
---
Changes:
	v3: put pyc compilation command into own macro (Thomas Petazzoni)
	v2: move finalization code from root Makefile to python.mk and python3.mk (Thomas Petazzoni)


 package/pkg-python.mk      |  2 +-
 package/python/python.mk   | 13 +++++++++++++
 package/python3/python3.mk | 13 +++++++++++++
 3 files changed, 27 insertions(+), 1 deletion(-)

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
index 80ffbde..a2c94bf 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -217,12 +217,25 @@ PYTHON_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/sysconfigdata/
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
+define PYTHON_CREATE_PYC_FILES
+	PYTHONPATH="$(PYTHON_PATH)" \
+		$(HOST_DIR)/usr/bin/python$(PYTHON_VERSION_MAJOR) -c "import compileall; \
+			compileall.compile_dir('$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages')"
+endef
+
 ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
 define PYTHON_FINALIZE_TARGET
+	$(PYTHON_CREATE_PYC_FILES)
 	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.py' -print0 | xargs -0 rm -f
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON_PY_PYC),y)
+define PYTHON_FINALIZE_TARGET
+	$(PYTHON_CREATE_PYC_FILES)
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_PYTHON_PY_ONLY),y)
 define PYTHON_FINALIZE_TARGET
 	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.pyc' -print0 | xargs -0 rm -f
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index fd5709a..caf5c36 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -208,12 +208,25 @@ PYTHON3_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/sysconfigdat
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
+define PYTHON3_CREATE_PYC_FILES
+	PYTHONPATH="$(PYTHON3_PATH)" \
+		$(HOST_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR) -c "import compileall; \
+			compileall.compile_dir('$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages')"
+endef
+
 ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
 define PYTHON3_FINALIZE_TARGET
+	$(PYTHON3_CREATE_PYC_FILES)
 	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) -name '*.py' -print0 | xargs -0 rm -f
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON3_PY_PYC),y)
+define PYTHON3_FINALIZE_TARGET
+	$(PYTHON3_CREATE_PYC_FILES)
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_PYTHON3_PY_ONLY),y)
 define PYTHON3_FINALIZE_TARGET
 	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) -name '*.pyc' -print0 | xargs -0 rm -f
-- 
2.1.4
