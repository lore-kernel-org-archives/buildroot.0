From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 20:07:55 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/dash: Create
 $(TARGET_DIR)/bin before install
Message-ID: <20190124190722.A9BBE84F10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d90ae717e565b580ca71f625d54cccff6929caac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

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
[Peter: use install -D]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit 89fdf21d58c44b58f566d14056a13598e99cd538)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dash/dash.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 2d415558d2..8f15890669 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -28,7 +28,7 @@ DASH_CONF_OPTS += --without-libedit
 endif
 
 define DASH_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 $(@D)/src/dash $(TARGET_DIR)/bin/dash
+	$(INSTALL) -m 0755 -D $(@D)/src/dash $(TARGET_DIR)/bin/dash
 endef
 
 $(eval $(autotools-package))
