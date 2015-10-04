From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Oct 2015 20:17:35 +0200
Subject: [Buildroot] [git commit] u-boot: add an option to indicate that DTC
	is needed
Message-ID: <20151004181804.86CED7F939@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=76f2230d2c3b99a4ade2590e7dfc0feee312a5f3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some U-Boot configurations require the Device Tree compiler to be
available, so we need to depend on host-dtc (example configuration:
zynq_zed).

However, we don't want to build it unconditionally, since the vast
majority of U-Boot configurations don't need it (and host-dtc itself
has a bunch of dependencies).

So, we simply add a Config.in option that allows users to indicate
whether their U-Boot needs DTC or not, and depend on host-dtc if this
option is enabled.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/Config.in |    7 +++++++
 boot/uboot/uboot.mk  |    4 ++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index be51642..8643dab 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -139,6 +139,13 @@ config BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE
 	  Path to the U-Boot configuration file.
 endif
 
+config BR2_TARGET_UBOOT_NEEDS_DTC
+	bool "U-Boot needs dtc"
+	select BR2_PACKAGE_HOST_DTC
+	help
+	  Select this option if your U-Boot board configuration
+	  requires the Device Tree compiler to be available.
+
 choice
 	prompt "U-Boot binary format"
 	default BR2_TARGET_UBOOT_FORMAT_BIN
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 7494078..eee0dba 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -77,6 +77,10 @@ UBOOT_MAKE_OPTS += \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	ARCH=$(UBOOT_ARCH)
 
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
+UBOOT_DEPENDENCIES += host-dtc
+endif
+
 # Helper function to fill the U-Boot config.h file.
 # Argument 1: option name
 # Argument 2: option value
