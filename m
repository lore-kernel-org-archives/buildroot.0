From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri, 18 Nov 2016 10:10:21 +0100
Subject: [Buildroot] [PATCH v2 12/15] python3: generate reproducible .pyc
In-Reply-To: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
Message-ID: <1479460224-6119-13-git-send-email-jezz@sysmic.org>
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
 package/python3/python3.mk | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index b3f31c0..158c29c 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -219,6 +219,25 @@ PYTHON3_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/sysconfigdat
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
+# Normally, *.pyc files should not have been compiled, but just in
+# case, we make sure we remove all of them.
+ifeq ($(BR2_PACKAGE_PYTHON3_PY_ONLY),y)
+define PYTHON3_REMOVE_PYC_FILES
+	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) -name '*.py' -print0 | \
+		sed -z -e s/py$$/pyc/ | \
+		xargs -0 --no-run-if-empty rm -f
+endef
+PYTHON3_TARGET_FINALIZE_HOOKS += PYTHON3_REMOVE_PYC_FILES
+endif
+
+ifeq ($(BR2_REPRODUCIBLE),y)
+define PYTHON3_FIX_TIME
+	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) -name '*.py' -print0 | \
+		xargs -0 --no-run-if-empty touch -d @$(SOURCE_DATE_EPOCH)
+endef
+PYTHON3_TARGET_FINALIZE_HOOKS += PYTHON3_FIX_TIME
+endif
+
 define PYTHON3_CREATE_PYC_FILES
 	PYTHONPATH="$(PYTHON3_PATH)" \
 	$(HOST_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR) \
@@ -238,16 +257,6 @@ endef
 PYTHON3_TARGET_FINALIZE_HOOKS += PYTHON3_REMOVE_PY_FILES
 endif
 
-# Normally, *.pyc files should not have been compiled, but just in
-# case, we make sure we remove all of them.
-ifeq ($(BR2_PACKAGE_PYTHON3_PY_ONLY),y)
-define PYTHON3_REMOVE_PYC_FILES
-	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) -name '*.pyc' -print0 | \
-		xargs -0 --no-run-if-empty rm -f
-endef
-PYTHON3_TARGET_FINALIZE_HOOKS += PYTHON3_REMOVE_PYC_FILES
-endif
-
 # In all cases, we don't want to keep the optimized .opt-1.pyc and
 # .opt-2.pyc files, since they can't work without their non-optimized
 # variant.
-- 
1.9.1
