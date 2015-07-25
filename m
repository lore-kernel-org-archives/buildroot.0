From: Christian Stewart <christian@paral.in>
Date: Sat, 25 Jul 2015 10:51:01 -0700
Subject: [Buildroot] [PATCH v9 1/1] rtl8821au: new package
Message-ID: <1437846661-27442-1-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds the rtl8821au wifi driver. The driver is sourced from
ulli-kroll's work on GitHub, which includes various fixes and better LED
handling. Currently USB3 support is broken in this driver - it will
only connect to the EHCI controller in a USB3 port.

Signed-off-by: Christian Stewart <christian@paral.in>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---

[All:
  - Removed intermediate endian flag variable
  - Added Yann's reviewed by]

 package/Config.in                                  |  1 +
 package/rtl8821au/0001-disable-default-debug.patch | 24 +++++++++++++++++++++
 package/rtl8821au/Config.in                        | 10 +++++++++
 package/rtl8821au/rtl8821au.mk                     | 25 ++++++++++++++++++++++
 4 files changed, 60 insertions(+)
 create mode 100644 package/rtl8821au/0001-disable-default-debug.patch
 create mode 100644 package/rtl8821au/Config.in
 create mode 100644 package/rtl8821au/rtl8821au.mk

diff --git a/package/Config.in b/package/Config.in
index cfa7512..070ec6a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -404,6 +404,7 @@ endif
 	source "package/read-edid/Config.in"
 	source "package/rng-tools/Config.in"
 	source "package/rpi-userland/Config.in"
+	source "package/rtl8821au/Config.in"
 	source "package/sane-backends/Config.in"
 	source "package/sdparm/Config.in"
 	source "package/setserial/Config.in"
diff --git a/package/rtl8821au/0001-disable-default-debug.patch b/package/rtl8821au/0001-disable-default-debug.patch
new file mode 100644
index 0000000..de6fc62
--- /dev/null
+++ b/package/rtl8821au/0001-disable-default-debug.patch
@@ -0,0 +1,24 @@
+Comment out the hardcoded debug defines. If extra debug is needed, we can add it
+as a define in the make flags.
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+
+diff --git a/include/autoconf.h b/include/autoconf.h
+--- a/include/autoconf.h
++++ b/include/autoconf.h
+@@ -130,12 +130,12 @@
+ /*
+  * Debug Related Config
+  */
+-#define DBG	1
++//#define DBG	1
+ 
+-#define CONFIG_DEBUG /* DBG_871X, etc... */
++//#define CONFIG_DEBUG /* DBG_871X, etc... */
+ //#define CONFIG_DEBUG_RTL871X /* RT_TRACE, RT_PRINT_DATA, _func_enter_, _func_exit_ */
+ 
+-#define CONFIG_PROC_DEBUG
++//#define CONFIG_PROC_DEBUG
+ 
+ 
+ //#define DBG_TX
diff --git a/package/rtl8821au/Config.in b/package/rtl8821au/Config.in
new file mode 100644
index 0000000..9827ad5
--- /dev/null
+++ b/package/rtl8821au/Config.in
@@ -0,0 +1,10 @@
+comment "rtl8821au needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_RTL8821AU
+	bool "rtl8821au"
+	depends on BR2_LINUX_KERNEL
+	help
+	  rtl8821au wifi driver
+
+	  https://github.com/paralin/rtl8821au
diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
new file mode 100644
index 0000000..d218e3c
--- /dev/null
+++ b/package/rtl8821au/rtl8821au.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# rtl8821au
+#
+################################################################################
+
+RTL8821AU_VERSION = f58e4a7fb27551bdbb4aee9db6086dd6ad996c8d
+RTL8821AU_SITE = $(call github,ulli-kroll,rtl8821au,$(RTL8821AU_VERSION))
+RTL8821AU_LICENSE = GPLv2, proprietary (rtl8821au.bin firmware)
+RTL8821AU_LICENSE_FILES = COPYING
+
+RTL8821AU_MODULE_MAKE_OPTS = \
+	CONFIG_RTL8812AU_8821AU=m \
+	KVER=$(LINUX_VERSION_PROBED) \
+	USER_EXTRA_CFLAGS=-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN
+
+define RTL8821AU_FIRMWARE_INSTALL
+	mkdir -p $(TARGET_DIR)/lib/firmware/rtlwifi/
+	$(INSTALL) -D -m 0644 $(@D)/firmware/* $(TARGET_DIR)/lib/firmware/rtlwifi/
+endef
+
+RTL8821AU_POST_INSTALL_TARGET_HOOKS += RTL8821AU_FIRMWARE_INSTALL
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
-- 
2.1.4
