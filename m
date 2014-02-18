From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Feb 2014 21:40:07 +0100
Subject: [Buildroot] [PATCH v2 14/20] python,
	python3: fix to ensure libpython is stripped
In-Reply-To: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1392756013-27757-15-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Przemyslaw Wrzos <przemyslaw.wrzos@calyptech.com>

The python and python3 builds mark libpython as read-only which
prevents it from being stripped out correctly for the target.

Signed-off-by: Przemyslaw Wrzos <przemyslaw.wrzos@calyptech.com>
Acked-by: Thomas De Schampheleire <thomas.de_schampheleire@alcatel-lucent.com>
Tested-by: Thomas De Schampheleire <thomas.de_schampheleire@alcatel-lucent.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python/python.mk   | 9 +++++++++
 package/python3/python3.mk | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/package/python/python.mk b/package/python/python.mk
index 3b0a4dd..94765cb 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -160,6 +160,15 @@ endef
 
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
 
 # Provided to other packages
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 62642c8..2d9d1f2 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -131,6 +131,15 @@ endef
 
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
1.8.3.2
