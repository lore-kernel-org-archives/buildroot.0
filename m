From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jul 2013 17:18:53 +0200
Subject: [Buildroot] [git commit] sunxi-cedarx: add CedarX hardware video
	decoding library
Message-ID: <20130728152108.A1C9E99C90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e7481560127a894325a4fabd5c6938637c670724
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: rename package to sunxi-cedarx, improve help text
description, install libraries with executable permissions to make
sure they get stripped at the end of the build.]

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |    1 +
 package/sunxi-cedarx/Config.in       |   14 +++++++++
 package/sunxi-cedarx/sunxi-cedarx.mk |   49 ++++++++++++++++++++++++++++++++++
 3 files changed, 64 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index d347709..ac7b16d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -295,6 +295,7 @@ source "package/smartmontools/Config.in"
 source "package/snowball-hdmiservice/Config.in"
 source "package/sredird/Config.in"
 source "package/statserial/Config.in"
+source "package/sunxi-cedarx/Config.in"
 source "package/sunxi-mali/Config.in"
 source "package/sunxi-mali-prop/Config.in"
 source "package/sysstat/Config.in"
diff --git a/package/sunxi-cedarx/Config.in b/package/sunxi-cedarx/Config.in
new file mode 100644
index 0000000..b280db0
--- /dev/null
+++ b/package/sunxi-cedarx/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_SUNXI_CEDARX
+	bool "sunxi-cedarx"
+	depends on BR2_TOOLCHAIN_USES_GLIBC && BR2_arm
+	help
+	  Sunxi CedarX decoder libraries. CedarX is Allwinner's
+	  multimedia co-processing technology for hardware accelerated
+	  video and image decoding, as used inside their A10 SoC's and
+	  others.
+
+	  http://github.com/linux-sunxi/cedarx-libs
+	  http://linux-sunxi.org/CedarX
+
+comment "sunxi-cedarx requires an eglibc/glibc based toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC && BR2_arm
diff --git a/package/sunxi-cedarx/sunxi-cedarx.mk b/package/sunxi-cedarx/sunxi-cedarx.mk
new file mode 100644
index 0000000..b1c3717
--- /dev/null
+++ b/package/sunxi-cedarx/sunxi-cedarx.mk
@@ -0,0 +1,49 @@
+################################################################################
+#
+# sunxi-cedarx
+#
+################################################################################
+
+SUNXI_CEDARX_VERSION = 74923e55fc
+SUNXI_CEDARX_SITE = http://github.com/linux-sunxi/cedarx-libs/tarball/$(SUNXI_CEDARX_VERSION)
+
+SUNXI_CEDARX_INSTALL_STAGING = YES
+
+ifeq ($(BR2_ARM_EABIHF),y)
+SUNXI_CEDARX_BIN_DIR = $(@D)/libcedarv/linux-armhf
+else
+SUNXI_CEDARX_BIN_DIR = $(@D)/libcedarv/linux-armel
+endif
+
+define SUNXI_CEDARX_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(SUNXI_CEDARX_BIN_DIR)
+	$(TARGET_CC) $(TARGET_CFLAGS) \
+		-c $(SUNXI_CEDARX_BIN_DIR)/adapter/avheap/avheap.c \
+		-o $(SUNXI_CEDARX_BIN_DIR)/adapter/avheap/avheap.o \
+		-I $(SUNXI_CEDARX_BIN_DIR)/adapter/avheap \
+		-I $(SUNXI_CEDARX_BIN_DIR)/
+	$(TARGET_CC) -shared -L./ -Wl,-soname,libavheap.so \
+		-o $(SUNXI_CEDARX_BIN_DIR)/adapter/avheap/libavheap.so \
+		$(SUNXI_CEDARX_BIN_DIR)/adapter/avheap/avheap.o
+endef
+
+define SUNXI_CEDARX_INSTALL_STAGING_CMDS
+	$(INSTALL) -d -m 755 $(STAGING_DIR)/usr/include/libvecore
+	$(INSTALL) -m 664 $(SUNXI_CEDARX_BIN_DIR)/libvecore/*.h \
+		$(STAGING_DIR)/usr/include/libvecore
+	$(INSTALL) -m 644 $(SUNXI_CEDARX_BIN_DIR)/*.h \
+		$(STAGING_DIR)/usr/include/
+	$(INSTALL) -D -m 755 $(SUNXI_CEDARX_BIN_DIR)/libvecore/libvecore.so \
+		$(STAGING_DIR)/usr/lib/libvecore.so
+	$(INSTALL) -D -m 755 $(SUNXI_CEDARX_BIN_DIR)/adapter/avheap/libavheap.so \
+		$(STAGING_DIR)/usr/lib/libavheap.so
+endef
+
+define SUNXI_CEDARX_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(SUNXI_CEDARX_BIN_DIR)/libvecore/libvecore.so \
+		$(TARGET_DIR)/usr/lib/libvecore.so
+	$(INSTALL) -D -m 755 $(SUNXI_CEDARX_BIN_DIR)/adapter/avheap/libavheap.so \
+		$(TARGET_DIR)/usr/lib/libavheap.so
+endef
+
+$(eval $(generic-package))
