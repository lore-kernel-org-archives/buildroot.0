From: Gregory Hermant <gregory.hermant@calao-systems.com>
Date: Mon, 12 Nov 2012 18:41:37 +0100
Subject: [Buildroot] [PATCH v2 1/6] hdmiservice: new package
In-Reply-To: <1352742102-19010-1-git-send-email-gregory.hermant@calao-systems.com>
References: <1352742102-19010-1-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <1352742102-19010-2-git-send-email-gregory.hermant@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
---
 package/Config.in                  |    1 +
 package/hdmiservice/Config.in      |   10 +++++++++
 package/hdmiservice/hdmiservice.mk |   43 ++++++++++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+)
 create mode 100644 package/hdmiservice/Config.in
 create mode 100644 package/hdmiservice/hdmiservice.mk

diff --git a/package/Config.in b/package/Config.in
index 074e9df..cb78d2f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -217,6 +217,7 @@ source "package/gadgetfs-test/Config.in"
 source "package/gdisk/Config.in"
 source "package/gpsd/Config.in"
 source "package/gvfs/Config.in"
+source "package/hdmiservice/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/hdparm/Config.in"
 endif
diff --git a/package/hdmiservice/Config.in b/package/hdmiservice/Config.in
new file mode 100644
index 0000000..7fb2cf4
--- /dev/null
+++ b/package/hdmiservice/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_HDMISERVICE
+	bool "hdmiservice"
+	depends on BR2_TOOLCHAIN_HAS_THREADS	
+	help
+	  HDMI userspace control daemon
+
+	  This package contains the HDMI userspace control daemon for the 
+	  snowball board
+	  
+	  http://www.igloocommunity.org
diff --git a/package/hdmiservice/hdmiservice.mk b/package/hdmiservice/hdmiservice.mk
new file mode 100644
index 0000000..7199f1c
--- /dev/null
+++ b/package/hdmiservice/hdmiservice.mk
@@ -0,0 +1,43 @@
+#############################################################
+#
+# hdmiservice
+#
+#############################################################
+HDMISERVICE_VERSION = f75c99d1c52707240a78b4ba78e41d20d3aa3b08
+HDMISERVICE_SITE = git://igloocommunity.org/git/bsp/hdmiservice.git
+HDMISERVICE_LICENSE = MIT
+HDMISERVICE_LICENSE_FILES = debian/copyright
+HDMISERVICE_INSTALL_STAGING = YES
+
+define HDMISERVICE_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" -C $(@D)
+endef
+
+define HDMISERVICE_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/hdmiservice.so $(STAGING_DIR)/usr/lib/hdmiservice.so
+	$(INSTALL) -D -m 0644 $(@D)/include/hdmi_service_api.h $(STAGING_DIR)/usr/include/hdmi_service_api.h
+	$(INSTALL) -D -m 0644 $(@D)/include/hdmi_service_local.h $(STAGING_DIR)/usr/include/hdmi_service_local.h
+endef
+
+define HDMISERVICE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/hdmiservice.so $(TARGET_DIR)/usr/lib/hdmiservice.so
+	$(INSTALL) -D -m 0755 $(@D)/hdmistart $(TARGET_DIR)/usr/bin/hdmistart
+endef
+
+define HDMISERVICE_UNINSTALL_STAGING_CMDS
+	rm -f $(STAGING_DIR)/usr/lib/hdmiservice.so
+	rm -f $(STAGING_DIR)/usr/include/hdmi_service_api.h
+	rm -f $(STAGING_DIR)/usr/include/hdmi_service_local.h
+endef
+
+define HDMISERVICE_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/lib/hdmiservice.so
+	rm -f $(TARGET_DIR)/usr/bin/hdmistart
+endef
+
+define HDMISERVICE_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+
+$(eval $(generic-package))
-- 
1.7.9.5
