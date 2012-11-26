From: Gregory Hermant <gregory.hermant@calao-systems.com>
Date: Mon, 26 Nov 2012 12:05:14 +0100
Subject: [Buildroot] [PATCH v4 1/6] snowball-hdmiservice: new package
In-Reply-To: <1353927919-7250-1-git-send-email-gregory.hermant@calao-systems.com>
References: <1353927919-7250-1-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <1353927919-7250-2-git-send-email-gregory.hermant@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
---
 package/Config.in                                  |    1 +
 package/snowball-hdmiservice/Config.in             |   10 +++++
 .../snowball-hdmiservice/snowball-hdmiservice.mk   |   41 ++++++++++++++++++++
 3 files changed, 52 insertions(+)
 create mode 100644 package/snowball-hdmiservice/Config.in
 create mode 100644 package/snowball-hdmiservice/snowball-hdmiservice.mk

diff --git a/package/Config.in b/package/Config.in
index 5d9783a..54cc841 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -250,6 +250,7 @@ source "package/sane-backends/Config.in"
 source "package/sdparm/Config.in"
 source "package/setserial/Config.in"
 source "package/smartmontools/Config.in"
+source "package/snowball-hdmiservice/Config.in"
 source "package/sredird/Config.in"
 source "package/statserial/Config.in"
 source "package/sysstat/Config.in"
diff --git a/package/snowball-hdmiservice/Config.in b/package/snowball-hdmiservice/Config.in
new file mode 100644
index 0000000..0ea7c81
--- /dev/null
+++ b/package/snowball-hdmiservice/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_SNOWBALL_HDMISERVICE
+	bool "snowball-hdmiservice"
+	depends on BR2_TOOLCHAIN_HAS_THREADS	
+	help
+	  HDMI userspace control daemon
+
+	  This package contains the HDMI userspace control daemon for the 
+	  snowball board
+	  
+	  http://www.igloocommunity.org
diff --git a/package/snowball-hdmiservice/snowball-hdmiservice.mk b/package/snowball-hdmiservice/snowball-hdmiservice.mk
new file mode 100644
index 0000000..ebd65df
--- /dev/null
+++ b/package/snowball-hdmiservice/snowball-hdmiservice.mk
@@ -0,0 +1,41 @@
+#############################################################
+#
+# snowball-hdmiservice
+#
+#############################################################
+SNOWBALL_HDMISERVICE_VERSION = f75c99d1c52707240a78b4ba78e41d20d3aa3b08
+SNOWBALL_HDMISERVICE_SITE = git://igloocommunity.org/git/bsp/hdmiservice.git
+SNOWBALL_HDMISERVICE_LICENSE = MIT
+SNOWBALL_HDMISERVICE_LICENSE_FILES = debian/copyright
+SNOWBALL_HDMISERVICE_INSTALL_STAGING = YES
+
+define SNOWBALL_HDMISERVICE_BUILD_CMDS
+	$(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS)" 	
+endef
+
+define SNOWBALL_HDMISERVICE_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS)" DESTDIR=$(STAGING_DIR) install
+endef
+
+define SNOWBALL_HDMISERVICE_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS)" DESTDIR=$(TARGET_DIR) install
+endef
+
+define SNOWBALL_HDMISERVICE_UNINSTALL_STAGING_CMDS
+	rm -f $(STAGING_DIR)/usr/lib/hdmiservice.so
+	rm -f $(STAGING_DIR)/usr/bin/hdmistart
+	rm -f $(STAGING_DIR)/usr/include/hdmi_service_api.h
+	rm -f $(STAGING_DIR)/usr/include/hdmi_service_local.h
+endef
+
+define SNOWBALL_HDMISERVICE_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/lib/hdmiservice.so
+	rm -f $(TARGET_DIR)/usr/bin/hdmistart
+endef
+
+define SNOWBALL_HDMISERVICE_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+
+$(eval $(generic-package))
-- 
1.7.9.5
