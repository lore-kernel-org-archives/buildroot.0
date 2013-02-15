From: Patrick Gerber <kpa_info@yahoo.fr>
Date: Fri, 15 Feb 2013 11:00:09 +0100
Subject: [Buildroot] [PATCH v4 2/5] Add python3 config directory simlink
In-Reply-To: <1360922412-32559-1-git-send-email-kpa_info@yahoo.fr>
References: <1360922412-32559-1-git-send-email-kpa_info@yahoo.fr>
Message-ID: <1360922412-32559-3-git-send-email-kpa_info@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When using host python to install an external module, the setup tool
look for some files in python3.3/config/. The python3 package config
directory is called config-3.3m. This is why we need to alias config
to config-3.3m.

Signed-off-by: Patrick Gerber <kpa_info@yahoo.fr>
---
 package/python3/python3.mk |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 7551a7b..74af9b4 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -160,6 +160,15 @@ ifneq ($(BR2_PACKAGE_PYTHON),y)
 PYTHON3_POST_INSTALL_TARGET_HOOKS += PYTHON3_INSTALL_SYMLINK
 endif
 
+# Alias the python3.3/config-3.3m to python3.3/config
+# This is needed when installing an external python module, because
+# the setup is looking for files in python3.3/config/
+define HOST_PYTHON3_INSTALL_SYMLINK
+	ln -fs config-3.3m $(HOST_DIR)/usr/lib/python3.3/config
+endef
+
+HOST_PYTHON3_POST_INSTALL_HOOKS += HOST_PYTHON3_INSTALL_SYMLINK
+
 ifeq ($(BR2_PACKAGE_PYTHON3_PY_ONLY),y)
 define PYTHON3_REMOVE_MODULES_FILES
 	for i in `find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) \
-- 
1.7.9.5
