From: Christian Stewart <christian@paral.in>
Date: Tue, 14 Jul 2015 16:01:01 -0700
Subject: [Buildroot] [PATCH v1 1/1] rtl8821au: new package
Message-ID: <1436914861-10912-1-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding a kernel module based USB wifi driver. There is no official
version of this driver that works properly on ARM and with newer USB
WiFi cards. This driver version builds module 8821au and is based on a
kernel module release from ASUS with various fixes integrated in.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/linux-firmware/Config.in |  5 +++++
 package/rtl8821au/rtl8821au.hash |  1 +
 package/rtl8821au/rtl8821au.mk   | 22 ++++++++++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 package/rtl8821au/rtl8821au.hash
 create mode 100644 package/rtl8821au/rtl8821au.mk

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 2e4c205..a99b877 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -189,6 +189,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX
 	help
 	  Realtek rtl8821ae
 
+config BR2_PACKAGE_RTL8821AU
+	bool "Realtek 8821AU"
+	help
+	  Realtek rtl8821au kernel module
+
 config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X
 	bool "TI wl127x"
 	help
diff --git a/package/rtl8821au/rtl8821au.hash b/package/rtl8821au/rtl8821au.hash
new file mode 100644
index 0000000..21f47a2
--- /dev/null
+++ b/package/rtl8821au/rtl8821au.hash
@@ -0,0 +1 @@
+sha256 7ab9aae237ff562d5c40675115ffb9e36a4774490df0a6a8a4c7746dfd567e14  rtl8821au-4.3.14.tar.gz
diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
new file mode 100644
index 0000000..f5f3da6
--- /dev/null
+++ b/package/rtl8821au/rtl8821au.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# rtl8821au
+#
+################################################################################
+
+RTL8821AU_VERSION = 4.3.14
+RTL8821AU_SITE = $(call github,paralin,rtl8821au,v$(RTL8821AU_VERSION))
+
+define RTL8821AU_BUILD_CMDS
+	$(SED) "s/CONFIG_PLATFORM_I386_PC = y/CONFIG_PLATFORM_I386_PC = n/g" -i $(@D)/Makefile
+	$(MAKE) -C $(@D) ARCH="$(ARCH)" KVER="$(LINUX_VERSION_PROBED)" USER_EXTRA_CFLAGS="-DCONFIG_LITTLE_ENDIAN" CROSS_COMPILE="$(CROSS_COMPILE)" KSRC="$(LINUX_BUILDDIR)" CC="$(TARGET_CC)" LD="$(TARGET_LD)" modules
+endef
+
+define RTL8821AU_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -p -m 644 $(@D)/8821au.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/kernel/drivers/net/wireless/
+	$(HOST_DIR)/sbin/depmod -a --basedir=$(TARGET_DIR) $(LINUX_VERSION_PROBED)
+endef
+
+RTL8821AU_DEPENDENCIES = linux linux-firmware
+
+$(eval $(generic-package))
-- 
2.1.4
