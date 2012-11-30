From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Nov 2012 07:58:22 -0800
Subject: [Buildroot] [git commit] snowball-hdmiservice: new package
Message-ID: <20121203145714.2C11F99808@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e9f8ad164e4776ff89e0f7d674e77032a472d54
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 (on various archs and toolchains)
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |    1 +
 package/snowball-hdmiservice/Config.in             |   10 +++++
 .../snowball-hdmiservice/snowball-hdmiservice.mk   |   41 ++++++++++++++++++++
 3 files changed, 52 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index f3ca496..663a17b 100644
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
