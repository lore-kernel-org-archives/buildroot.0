From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 23:40:56 +0200
Subject: [Buildroot] [git commit branch/next] rtl8188eu: new package
Message-ID: <20150808105644.8429C7FD83@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ff6ba2f7e512ab8617265003ea2917187e2f74af
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas:
  - remove patches 0001 and 0002, they are not needed since when using
    the kernel-module infrastructure, we directly call the kernel
    build system and bypass the one provided by the external module
  - install the firmware directly in the Buildroot .mk file, which
    allows to also remove patch 0003.
  - remove RTL8188EU_DEPENDENCIES = linux, since this is already
    handled by the kernel-module infrastructure.]

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |    1 +
 package/rtl8188eu/Config.in    |   19 +++++++++++++++++++
 package/rtl8188eu/rtl8188eu.mk |   21 +++++++++++++++++++++
 3 files changed, 41 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 2242f67..840d593 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -405,6 +405,7 @@ endif
 	source "package/read-edid/Config.in"
 	source "package/rng-tools/Config.in"
 	source "package/rpi-userland/Config.in"
+	source "package/rtl8188eu/Config.in"
 	source "package/rtl8821au/Config.in"
 	source "package/sane-backends/Config.in"
 	source "package/sdparm/Config.in"
diff --git a/package/rtl8188eu/Config.in b/package/rtl8188eu/Config.in
new file mode 100644
index 0000000..09cde24
--- /dev/null
+++ b/package/rtl8188eu/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_RTL8188EU
+	bool "rtl8188eu"
+	depends on BR2_LINUX_KERNEL
+	help
+	  A standalone driver for the RTL8188EU USB Wi-Fi adapter.
+	  This is needed only for Linux kernels before 3.12.
+	  Since 3.12, there is a (staging) driver in mainline, with a similar
+	  codebase.
+
+	  Make sure your target kernel has the CONFIG_WIRELESS_EXT config
+	  option enabled.
+
+	  Note: this package needs a firmware loading mechanism to load the
+	  binary blob for the chip to work.
+
+	  https://github.com/lwfinger/rtl8188eu
+
+comment "rtl8188eu needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
new file mode 100644
index 0000000..d1034c4
--- /dev/null
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# rtl8188eu
+#
+################################################################################
+
+RTL8188EU_VERSION = 3091828c8f4b4a01cbec6025128bf77e6e7b9f97
+RTL8188EU_SITE = $(call github,lwfinger,rtl8188eu,$(RTL8188EU_VERSION))
+RTL8188EU_LICENSE = GPLv2, proprietary (rtl8188eufw.bin firmware blob)
+RTL8188EU_LICENSE_FILES = COPYING
+RTL8188EU_MODULE_MAKE_OPTS = CONFIG_RTL8188EU=m
+
+$(eval $(kernel-module))
+
+define RTL8188EU_INSTALL_FIRMWARE
+	$(INSTALL) -D -m 644 $(@D)/rtl8188eufw.bin \
+		$(TARGET_DIR)/lib/firmware/rtlwifi/rtl8188eufw.bin
+endef
+RTL8188EU_POST_INSTALL_TARGET_HOOKS += RTL8188EU_INSTALL_FIRMWARE
+
+$(eval $(generic-package))
