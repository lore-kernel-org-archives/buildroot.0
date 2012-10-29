From: Gregory Hermant <gregory.hermant@calao-systems.com>
Date: Mon, 29 Oct 2012 09:41:09 +0100
Subject: [Buildroot] [PATCH 2/6] Add hdmiservice package for the snowball
	board
In-Reply-To: <1351500073-4351-1-git-send-email-gregory.hermant@calao-systems.com>
References: <1351500073-4351-1-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <1351500073-4351-3-git-send-email-gregory.hermant@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
---
 package/Config.in                  |    1 +
 package/hdmiservice/Config.in      |   10 ++++++++++
 package/hdmiservice/hdmiservice.mk |   19 +++++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 package/hdmiservice/Config.in
 create mode 100644 package/hdmiservice/hdmiservice.mk

diff --git a/package/Config.in b/package/Config.in
index 6ebf2ce..097a94d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -529,6 +529,7 @@ menu "Miscellaneous"
 source "package/collectd/Config.in"
 source "package/empty/Config.in"
 source "package/googlefontdirectory/Config.in"
+source "package/hdmiservice/Config.in"
 source "package/mobile-broadband-provider-info/Config.in"
 source "package/shared-mime-info/Config.in"
 source "package/sound-theme-borealis/Config.in"
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
index 0000000..28fc584
--- /dev/null
+++ b/package/hdmiservice/hdmiservice.mk
@@ -0,0 +1,19 @@
+#############################################################
+#
+# hdmiservice
+#
+#############################################################
+HDMISERVICE_VERSION = f75c99d1c52707240a78b4ba78e41d20d3aa3b08
+HDMISERVICE_SITE = git://igloocommunity.org/git/bsp/hdmiservice.git
+HDMISERVICE_LICENSE = PROPRIETARY
+
+define HDMISERVICE_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)
+endef
+
+define HDMISERVICE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/hdmiservice.so $(TARGET_DIR)/usr/lib/hdmiservice.so
+	$(INSTALL) -D -m 0755 $(@D)/hdmistart $(TARGET_DIR)/usr/bin/hdmistart
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
