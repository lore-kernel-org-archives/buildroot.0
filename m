From: Christian Stewart <christian@paral.in>
Date: Wed, 22 Jul 2015 09:39:13 -0700
Subject: [Buildroot] [PATCH v3 1/1] rtl8821au: new package
Message-ID: <1437583153-31359-1-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding a kernel module based USB wifi driver. There is no official
version of this driver that works properly on ARM and with newer USB
WiFi cards. This driver version builds module 8821au and is based on a
kernel module release from ASUS with various fixes integrated in.

[Thomas, Yann, Luca:
  - Using the new kernel-module setup
  - Compacted endian flag define to one line]

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in                |  1 +
 package/rtl8821au/Config.in      |  7 +++++++
 package/rtl8821au/rtl8821au.hash |  1 +
 package/rtl8821au/rtl8821au.mk   | 21 +++++++++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/rtl8821au/Config.in
 create mode 100644 package/rtl8821au/rtl8821au.hash
 create mode 100644 package/rtl8821au/rtl8821au.mk

diff --git a/package/Config.in b/package/Config.in
index 9942e3a..04f2136 100644
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
diff --git a/package/rtl8821au/Config.in b/package/rtl8821au/Config.in
new file mode 100644
index 0000000..0a8cd74
--- /dev/null
+++ b/package/rtl8821au/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_RTL8821AU
+	bool "rtl8821au"
+	depends on BR2_LINUX_KERNEL
+	help
+		rtl8821au wifi driver
+
+		https://github.com/paralin/rtl8821au
diff --git a/package/rtl8821au/rtl8821au.hash b/package/rtl8821au/rtl8821au.hash
new file mode 100644
index 0000000..21f47a2
--- /dev/null
+++ b/package/rtl8821au/rtl8821au.hash
@@ -0,0 +1 @@
+sha256 7ab9aae237ff562d5c40675115ffb9e36a4774490df0a6a8a4c7746dfd567e14  rtl8821au-4.3.14.tar.gz
diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
new file mode 100644
index 0000000..9c3d286
--- /dev/null
+++ b/package/rtl8821au/rtl8821au.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# rtl8821au
+#
+################################################################################
+
+RTL8821AU_VERSION = 4.3.14
+RTL8821AU_SITE = $(call github,paralin,rtl8821au,v$(RTL8821AU_VERSION))
+RTL8821AU_CFLAGS_ENDIAN = -DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN
+
+define RTL8821AU_CONFIGURE_CMDS
+	$(SED) "s/CONFIG_PLATFORM_I386_PC = y/CONFIG_PLATFORM_I386_PC = n/g" $(@D)/Makefile
+endef
+
+RTL8821AU_MODULE_MAKE_OPTS = \
+	CONFIG_RTL8821AU=m \
+	KVER=$(LINUX_VERSION_PROBED) \
+	USER_EXTRA_CFLAGS=$(RTL8821AU_CFLAGS_ENDIAN)
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
-- 
2.1.4
