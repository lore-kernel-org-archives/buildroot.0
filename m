From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Thu, 17 Nov 2016 11:00:36 +0100
Subject: [Buildroot] [PATCH 12/15] python2: generate reproducible .pyc
In-Reply-To: <1479376839-27795-1-git-send-email-jezz@sysmic.org>
References: <1479376839-27795-1-git-send-email-jezz@sysmic.org>
Message-ID: <1479376839-27795-13-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

.pyc files contain modification time of .py source. In order to make
build reproducible, we fix modification time of all .py before to
compile .pyc files.

In order to guarantee .pyc are regenerated regardless their modification time,
we remove .pyc before to compile. However, I wonder if it wouldn't be simpler
to always call compile_all with 'force' flag.

This work was sponsored by `BA Robotic Systems'.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/python/python.mk | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index cc65376..b0ff1fd 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -226,6 +226,26 @@ PYTHON_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/sysconfigdata/
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
+# Normally, *.pyc files should not have been compiled, but just in
+# case, we make sure we remove all of them.
+# However, do not remove .pyc if source .py is not present.
+ifneq ($(BR2_PACKAGE_PYTHON_PY_ONLY)$(BR2_REPRODUCIBLE)),)
+define PYTHON_REMOVE_PYC_FILES
+	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.py' -print0 | \
+		sed -z -e s/py$$/pyc/ | \
+		xargs -0 --no-run-if-empty rm -f
+endef
+PYTHON_TARGET_FINALIZE_HOOKS += PYTHON_REMOVE_PYC_FILES
+endif
+
+ifeq ($(BR2_REPRODUCIBLE),y)
+define PYTHON_FIX_TIME
+find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.py' -print0 | \
+		xargs -0 --no-run-if-empty touch -d @$(SOURCE_DATE_EPOCH)
+endef
+PYTHON_TARGET_FINALIZE_HOOKS += PYTHON_FIX_TIME
+endif
+
 define PYTHON_CREATE_PYC_FILES
 	PYTHONPATH="$(PYTHON_PATH)" \
 	$(HOST_DIR)/usr/bin/python$(PYTHON_VERSION_MAJOR) \
@@ -245,16 +265,6 @@ endef
 PYTHON_TARGET_FINALIZE_HOOKS += PYTHON_REMOVE_PY_FILES
 endif
 
-# Normally, *.pyc files should not have been compiled, but just in
-# case, we make sure we remove all of them.
-ifeq ($(BR2_PACKAGE_PYTHON_PY_ONLY),y)
-define PYTHON_REMOVE_PYC_FILES
-	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.pyc' -print0 | \
-		xargs -0 --no-run-if-empty rm -f
-endef
-PYTHON_TARGET_FINALIZE_HOOKS += PYTHON_REMOVE_PYC_FILES
-endif
-
 # In all cases, we don't want to keep the optimized .pyo files
 define PYTHON_REMOVE_PYO_FILES
 	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.pyo' -print0 | \
-- 
1.9.1
