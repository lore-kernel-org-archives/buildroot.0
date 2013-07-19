From: Spenser Gilliland <spenser@gillilanding.com>
Date: Fri, 19 Jul 2013 18:37:54 -0500
Subject: [Buildroot] [PATCH 4/4] sunxi-cedar: add cedar hardware video
	decoding library
In-Reply-To: <1374277074-14455-1-git-send-email-spenser@gillilanding.com>
References: <1374277074-14455-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1374277074-14455-5-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/Config.in                  |  1 +
 package/sunxi-cedar/Config.in      | 10 ++++++++
 package/sunxi-cedar/sunxi-cedar.mk | 49 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 60 insertions(+)
 create mode 100644 package/sunxi-cedar/Config.in
 create mode 100644 package/sunxi-cedar/sunxi-cedar.mk

diff --git a/package/Config.in b/package/Config.in
index e49264f..3825668 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -294,6 +294,7 @@ source "package/smartmontools/Config.in"
 source "package/snowball-hdmiservice/Config.in"
 source "package/sredird/Config.in"
 source "package/statserial/Config.in"
+source "package/sunxi-cedar/Config.in"
 source "package/sunxi-mali/Config.in"
 source "package/sunxi-mali-prop/Config.in"
 source "package/sysstat/Config.in"
diff --git a/package/sunxi-cedar/Config.in b/package/sunxi-cedar/Config.in
new file mode 100644
index 0000000..859de84
--- /dev/null
+++ b/package/sunxi-cedar/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_SUNXI_CEDAR
+	bool "sunxi-cedar"
+	depends on BR2_TOOLCHAIN_USES_GLIBC && BR2_arm
+	help
+	  Sunxi cedar decoder libraries
+
+	  http://github.com/linux-sunxi/cedarx-libs
+
+comment "sunxi-cedar requires an eglibc/glibc based toolchain"
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC) && BR2_arm
diff --git a/package/sunxi-cedar/sunxi-cedar.mk b/package/sunxi-cedar/sunxi-cedar.mk
new file mode 100644
index 0000000..9104ec0
--- /dev/null
+++ b/package/sunxi-cedar/sunxi-cedar.mk
@@ -0,0 +1,49 @@
+################################################################################
+#
+# sunxi-cedar
+#
+################################################################################
+
+SUNXI_CEDAR_VERSION = 74923e55fc
+SUNXI_CEDAR_SITE = http://github.com/linux-sunxi/cedarx-libs/tarball/$(SUNXI_CEDAR_VERSION)
+
+SUNXI_CEDAR_INSTALL_STAGING = YES
+
+ifeq ($(BR2_ARM_EABIHF),y)
+SUNXI_CEDAR_BIN_DIR = $(@D)/libcedarv/linux-armhf
+else
+SUNXI_CEDAR_BIN_DIR = $(@D)/libcedarv/linux-armel
+endif
+
+define SUNXI_CEDAR_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(SUNXI_CEDAR_BIN_DIR)
+	$(TARGET_CC) $(TARGET_CFLAGS) \
+		-c $(SUNXI_CEDAR_BIN_DIR)/adapter/avheap/avheap.c \
+		-o $(SUNXI_CEDAR_BIN_DIR)/adapter/avheap/avheap.o \
+		-I $(SUNXI_CEDAR_BIN_DIR)/adapter/avheap \
+		-I $(SUNXI_CEDAR_BIN_DIR)/
+	$(TARGET_CC) -shared -L./ -Wl,-soname,libavheap.so \
+		-o $(SUNXI_CEDAR_BIN_DIR)/adapter/avheap/libavheap.so \
+		$(SUNXI_CEDAR_BIN_DIR)/adapter/avheap/avheap.o
+endef
+
+define SUNXI_CEDAR_INSTALL_STAGING_CMDS
+	$(INSTALL) -d -m 755 $(STAGING_DIR)/usr/include/libvecore
+	$(INSTALL) -m 664 $(SUNXI_CEDAR_BIN_DIR)/libvecore/*.h \
+		$(STAGING_DIR)/usr/include/libvecore
+	$(INSTALL) -m 644 $(SUNXI_CEDAR_BIN_DIR)/*.h \
+		$(STAGING_DIR)/usr/include/
+	$(INSTALL) -m 644 $(SUNXI_CEDAR_BIN_DIR)/libvecore/libvecore.so \
+		$(STAGING_DIR)/usr/lib/
+	$(INSTALL) -m 644 $(SUNXI_CEDAR_BIN_DIR)/adapter/avheap/libavheap.so \
+		$(STAGING_DIR)/usr/lib/
+endef
+
+define SUNXI_CEDAR_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 644 $(SUNXI_CEDAR_BIN_DIR)/libvecore/libvecore.so \
+		$(TARGET_DIR)/usr/lib/
+	$(INSTALL) -m 644 $(SUNXI_CEDAR_BIN_DIR)/adapter/avheap/libavheap.so \
+		$(TARGET_DIR)/usr/lib/
+endef
+
+$(eval $(generic-package))
-- 
1.8.1.2
