From: Vadim Kochan <vadim4j@gmail.com>
Date: Mon, 14 Jan 2019 05:55:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/dash: Create $(TARGET_DIR)/bin
 before install
Message-ID: <20190114035532.23010-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The build fails because $(TARGET_DIR)/bin folder may not exist if for
example to use the following defconfig:

	BR2_x86_64=y
	BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
	BR2_SYSTEM_BIN_SH_DASH=y
	BR2_TARGET_GENERIC_GETTY_PORT="tty1"
	BR2_LINUX_KERNEL=y
	BR2_LINUX_KERNEL_CUSTOM_VERSION=y
	BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
	BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
	BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
	BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
	BR2_PACKAGE_S6_LINUX_INIT=y
	BR2_TARGET_ROOTFS_EXT2=y

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 package/dash/dash.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index f699f40686..606b5db34a 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -28,6 +28,7 @@ DASH_CONF_OPTS += --without-libedit
 endif
 
 define DASH_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/bin
 	$(INSTALL) -m 0755 $(@D)/src/dash $(TARGET_DIR)/bin/dash
 endef
 
-- 
2.14.1
