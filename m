From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 23:41:18 +0200
Subject: [Buildroot] [git commit] at91bootstrap3: make sure
	AT91BOOTSTRAP3_KCONFIG_FILE is always defined
Message-ID: <20150406214221.0DF728074F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7a03f0c89dc76c174bb3f848a9d4b22f13b889c9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For some (silly?) reason, the kconfig-package infra always wants
<pkg>_KCONFIG_FILE to be defined. So let's do like barebox does: use a
temporary AT91BOOTSTRAP3_SOURCE_CONFIG variable, and assign it to
AT91BOOTSTRAP3_KCONFIG_FILE. This way, the latter is always defined,
even if to the empty value.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/at91bootstrap3/at91bootstrap3.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index f35ffc7..3e3b78e 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -32,10 +32,12 @@ define AT91BOOTSTRAP3_INSTALL_IMAGES_CMDS
 endef
 
 ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_DEFCONFIG),y)
-AT91BOOTSTRAP3_KCONFIG_FILE = $(AT91BOOTSTRAP3_DIR)/board/*/$(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG))_defconfig
+AT91BOOTSTRAP3_SOURCE_CONFIG = $(AT91BOOTSTRAP3_DIR)/board/*/$(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG))_defconfig
 else ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_CUSTOM_CONFIG),y)
-AT91BOOTSTRAP3_KCONFIG_FILE = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE))
+AT91BOOTSTRAP3_SOURCE_CONFIG = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE))
 endif
+
+AT91BOOTSTRAP3_KCONFIG_FILE = $(AT91BOOTSTRAP3_SOURCE_CONFIG)
 AT91BOOTSTRAP3_KCONFIG_EDITORS = menuconfig xconfig gconfig
 AT91BOOTSTRAP3_KCONFIG_OPTS = $(AT91BOOTSTRAP3_MAKE_OPTS)
 $(eval $(kconfig-package))
