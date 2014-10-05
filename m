From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 14:32:41 +0200
Subject: [Buildroot] [git commit] python,
	python3: convert py/pyc removal to TARGET_FINALIZE_HOOKS
Message-ID: <20141005123249.C22D8B08F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=899d2af16d3a4345a4966e9eb3f552847b57a116
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the removal of py/pyc files is Python-specific, this commit
moves the logic removing those files to python.mk and python3.mk
respectively.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                   |    6 ------
 package/python/python.mk   |   14 ++++++++++++++
 package/python3/python3.mk |   14 ++++++++++++++
 3 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 53f8ad5..6068e7f 100644
--- a/Makefile
+++ b/Makefile
@@ -573,12 +573,6 @@ endif
 	rm -rf $(TARGET_DIR)/usr/doc $(TARGET_DIR)/usr/share/doc
 	rm -rf $(TARGET_DIR)/usr/share/gtk-doc
 	-rmdir $(TARGET_DIR)/usr/share 2>/dev/null
-ifeq ($(BR2_PACKAGE_PYTHON_PY_ONLY)$(BR2_PACKAGE_PYTHON3_PY_ONLY),y)
-	find $(TARGET_DIR)/usr/lib/ -name '*.pyc' -print0 | xargs -0 rm -f
-endif
-ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY)$(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
-	find $(TARGET_DIR)/usr/lib/ -name '*.py' -print0 | xargs -0 rm -f
-endif
 	$(STRIP_FIND_CMD) | xargs $(STRIPCMD) 2>/dev/null || true
 	if test -d $(TARGET_DIR)/lib/modules; then \
 		find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \
diff --git a/package/python/python.mk b/package/python/python.mk
index f9968ca..24367a3 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -208,3 +208,17 @@ PYTHON_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/sysconfigdata/
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
+
+ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
+define PYTHON_FINALIZE_TARGET
+	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.py' -print0 | xargs -0 rm -f
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON_PY_ONLY),y)
+define PYTHON_FINALIZE_TARGET
+	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.pyc' -print0 | xargs -0 rm -f
+endef
+endif
+
+TARGET_FINALIZE_HOOKS += PYTHON_FINALIZE_TARGET
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 3b01550..d952323 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -187,3 +187,17 @@ PYTHON3_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/sysconfigdat
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
+
+ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
+define PYTHON3_FINALIZE_TARGET
+	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) -name '*.py' -print0 | xargs -0 rm -f
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON3_PY_ONLY),y)
+define PYTHON3_FINALIZE_TARGET
+	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) -name '*.pyc' -print0 | xargs -0 rm -f
+endef
+endif
+
+TARGET_FINALIZE_HOOKS += PYTHON3_FINALIZE_TARGET
