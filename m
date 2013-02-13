From: Przemyslaw Wrzos <przemyslaw.wrzos@calyptech.com>
Date: Wed, 13 Feb 2013 15:21:58 +1100
Subject: [Buildroot] [PATCH 1/1] python: fix to ensure libpython is stripped
Message-ID: <1360729319-28028-1-git-send-email-przemyslaw.wrzos@calyptech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: przemyslaw <przemyslaw.wrzos@calyptech.com>

The python and python3 builds mark libpython as read-only which prevents
it from being stripped out correctly for the target.

Signed-off-by: przemyslaw <przemyslaw.wrzos@calyptech.com>
---
 package/python/python.mk   |    9 +++++++++
 package/python3/python3.mk |    9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/package/python/python.mk b/package/python/python.mk
index 71591b7..b5d409c 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -163,6 +163,15 @@ endef
 
 PYTHON_POST_INSTALL_TARGET_HOOKS += PYTHON_REMOVE_USELESS_FILES
 
+#
+# Make sure libpython gets stripped out on target
+#
+define PYTHON_ENSURE_LIBPYTHON_STRIPPED
+	chmod u+w $(TARGET_DIR)/usr/lib/libpython$(PYTHON_VERSION_MAJOR)*.so
+endef
+
+PYTHON_POST_INSTALL_TARGET_HOOKS += PYTHON_ENSURE_LIBPYTHON_STRIPPED
+
 PYTHON_AUTORECONF = YES
 
 $(eval $(autotools-package))
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 7551a7b..d551115 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -150,6 +150,15 @@ endef
 
 PYTHON3_POST_INSTALL_TARGET_HOOKS += PYTHON3_REMOVE_USELESS_FILES
 
+#
+# Make sure libpython gets stripped out on target
+#
+define PYTHON3_ENSURE_LIBPYTHON_STRIPPED
+	chmod u+w $(TARGET_DIR)/usr/lib/libpython$(PYTHON3_VERSION_MAJOR)*.so
+endef
+
+PYTHON3_POST_INSTALL_TARGET_HOOKS += PYTHON3_ENSURE_LIBPYTHON_STRIPPED
+
 PYTHON3_AUTORECONF = YES
 
 define PYTHON3_INSTALL_SYMLINK
-- 
1.7.10.4
