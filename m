From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 15:40:18 +0200
Subject: [Buildroot] [git commit] package/systemd: support new v246 options
Message-ID: <20200805133452.BA3DE7F96C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9854f5ba5aa3dc4c8fc04b214574664a2e58af9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This adds switches for new options:

initrd: Installs services if systemd is used on an initramfs,
useless otherwise

kernel-install: helper scripts to update kernel with an
systemd-boot partition

analyze: tool to analyze bootup and dependencies

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/Config.in  | 25 +++++++++++++++++++++++++
 package/systemd/systemd.mk | 18 ++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index dd3b8c534d..30a5c960f5 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -112,6 +112,30 @@ config BR2_PACKAGE_SYSTEMD_BOOT
 
 	  https://www.freedesktop.org/wiki/Software/systemd/systemd-boot/
 
+config BR2_PACKAGE_SYSTEMD_INITRD
+	bool "Services for booting from initrd"
+	help
+	  Install various services that are only useful if systemd is
+	  run from an initrd.
+
+config BR2_PACKAGE_SYSTEMD_KERNELINSTALL
+	bool "install kernel-install and related files"
+	help
+	  kernel-install is used to install and remove kernel and
+	  initramfs images to and from the boot loader partition.
+	  The boot loader partition will usually be one of
+	  /boot, /efi, or /boot/efi.
+
+config BR2_PACKAGE_SYSTEMD_ANALYZE
+	bool "systemd-analyze"
+	help
+	  systemd-analyze may be used to determine system boot-up
+	  performance statistics and retrieve other state and tracing
+	  information from the system and service manager, and to
+	  verify the correctness of unit files.
+	  It is also used to access special functions useful for
+	  advanced system manager debugging.
+
 config BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH
 	string
 	default "ia32"  if BR2_i386
@@ -187,6 +211,7 @@ config BR2_PACKAGE_SYSTEMD_FIRSTBOOT
 
 config BR2_PACKAGE_SYSTEMD_HIBERNATE
 	bool "enable hibernation support"
+	select BR2_PACKAGE_SYSTEMD_INITRD
 	help
 	  When this features is enabled, additional tools and services
 	  are built to support suspending and resuming the system.
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 87265c97ad..00ab5fd383 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -208,6 +208,24 @@ else
 SYSTEMD_CONF_OPTS += -Dpcre2=false
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_INITRD),y)
+SYSTEMD_CONF_OPTS += -Dinitrd=true
+else
+SYSTEMD_CONF_OPTS += -Dinitrd=false
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD_KERNELINSTALL),y)
+SYSTEMD_CONF_OPTS += -Dkernel-install=true
+else
+SYSTEMD_CONF_OPTS += -Dkernel-install=false
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD_ANALYZE),y)
+SYSTEMD_CONF_OPTS += -Danalyze=true
+else
+SYSTEMD_CONF_OPTS += -Danalyze=false
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY),y)
 SYSTEMD_DEPENDENCIES += libmicrohttpd
 SYSTEMD_CONF_OPTS += -Dmicrohttpd=true
