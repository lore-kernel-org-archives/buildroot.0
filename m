From: Christophe Vu-Brugier <cvubrugier@yahoo.fr>
Date: Tue,  4 Feb 2014 20:19:45 +0100
Subject: [Buildroot] [PATCH v4 2/2] gummiboot: new package
In-Reply-To: <1391541585-8765-1-git-send-email-cvubrugier@yahoo.fr>
References: <1391541585-8765-1-git-send-email-cvubrugier@yahoo.fr>
Message-ID: <1391541585-8765-2-git-send-email-cvubrugier@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Christophe Vu-Brugier <cvubrugier@yahoo.fr>
---
Changes v3 -> v4:
  - remove the BR2_TARGET_GUMMIBOOT_{I386,X86_64} options
Changes v2 -> v3:
  - depends on BR2_i386 || BR2_x86_64
Changes v1 -> v2:
  - bump version: 38 -> 43
  - remove options not supported by ./configure: --disable-shared --enable-static
  - add --disable-manpages to configure
  - fix typo: s/GUMMIBOOT_IMG_ARCH/GUMMIBOOT_IMGARCH/
---
 boot/Config.in                |  1 +
 boot/gummiboot/Config.in      | 23 +++++++++++++++++++++++
 boot/gummiboot/buildroot.conf |  4 ++++
 boot/gummiboot/gummiboot.mk   | 42 ++++++++++++++++++++++++++++++++++++++++++
 boot/gummiboot/loader.conf    |  2 ++
 5 files changed, 72 insertions(+)
 create mode 100644 boot/gummiboot/Config.in
 create mode 100644 boot/gummiboot/buildroot.conf
 create mode 100644 boot/gummiboot/gummiboot.mk
 create mode 100644 boot/gummiboot/loader.conf

diff --git a/boot/Config.in b/boot/Config.in
index d23c761..3094be1 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -6,6 +6,7 @@ source "boot/at91dataflashboot/Config.in"
 source "boot/barebox/Config.in"
 source "boot/boot-wrapper-aarch64/Config.in"
 source "boot/grub/Config.in"
+source "boot/gummiboot/Config.in"
 source "boot/lpc32xxcdl/Config.in"
 source "boot/mxs-bootlets/Config.in"
 source "boot/syslinux/Config.in"
diff --git a/boot/gummiboot/Config.in b/boot/gummiboot/Config.in
new file mode 100644
index 0000000..11dbc4f
--- /dev/null
+++ b/boot/gummiboot/Config.in
@@ -0,0 +1,23 @@
+config BR2_TARGET_GUMMIBOOT
+	bool "gummiboot"
+	depends on BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_GNU_EFI
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	help
+	  gummiboot is a simple UEFI boot manager which executes
+	  configured EFI images. The default entry is selected by a
+	  configured pattern (glob) or an on-screen menu.
+
+	  gummiboot operates on the EFI System Partition (ESP)
+	  only. Configuration file fragments, kernels, initrds, other
+	  EFI images need to reside on the ESP. Linux kernels need to
+	  be built with CONFIG_EFI_STUB to be able to be directly
+	  executed as an EFI image.
+
+	  See the Grub2 help text for details on preparing an EFI
+	  capable disk image using Gummiboot: the instructions are
+	  exactly the same, except that the Gummiboot configuration
+	  files will be located in /loader/ inside the EFI partition.
+
+	  http://freedesktop.org/wiki/Software/gummiboot/
diff --git a/boot/gummiboot/buildroot.conf b/boot/gummiboot/buildroot.conf
new file mode 100644
index 0000000..8a6f02e
--- /dev/null
+++ b/boot/gummiboot/buildroot.conf
@@ -0,0 +1,4 @@
+title	Buildroot
+version	1
+linux	/bzImage
+options	console=ttyS0 root=/dev/sda2
diff --git a/boot/gummiboot/gummiboot.mk b/boot/gummiboot/gummiboot.mk
new file mode 100644
index 0000000..165a1b0
--- /dev/null
+++ b/boot/gummiboot/gummiboot.mk
@@ -0,0 +1,42 @@
+################################################################################
+#
+# gummiboot
+#
+################################################################################
+
+GUMMIBOOT_SITE = git://anongit.freedesktop.org/gummiboot
+GUMMIBOOT_VERSION = 43
+GUMMIBOOT_LICENSE = LGPLv2.1+
+GUMMIBOOT_LICENSE_FILES = LICENSE
+
+# The git archive does not have the autoconf/automake stuff generated.
+GUMMIBOOT_AUTORECONF = YES
+GUMMIBOOT_DEPENDENCIES = gnu-efi host-pkgconf util-linux
+GUMMIBOOT_INSTALL_TARGET = NO
+GUMMIBOOT_INSTALL_IMAGES = YES
+
+ifeq ($(BR2_i386),y)
+GUMMIBOOT_IMGARCH = ia32
+else ifeq ($(BR2_x86_64),y)
+GUMMIBOOT_IMGARCH = x64
+endif
+
+GUMMIBOOT_CONF_OPT = \
+	--host=$(BR2_ARCH) \
+	--with-efi-libdir=$(STAGING_DIR)/usr/lib \
+	--with-efi-ldsdir=$(STAGING_DIR)/usr/lib \
+	--with-efi-includedir=$(STAGING_DIR)/usr/include \
+	--disable-manpages
+
+define GUMMIBOOT_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/gummiboot$(GUMMIBOOT_IMGARCH).efi \
+		$(BINARIES_DIR)/efi-part/EFI/BOOT/boot$(GUMMIBOOT_IMGARCH).efi
+	echo "boot$(GUMMIBOOT_IMGARCH).efi" > \
+		$(BINARIES_DIR)/efi-part/startup.nsh
+	$(INSTALL) -D -m 0644 boot/gummiboot/loader.conf \
+		$(BINARIES_DIR)/efi-part/loader/loader.conf
+	$(INSTALL) -D -m 0644 boot/gummiboot/buildroot.conf \
+		$(BINARIES_DIR)/efi-part/loader/entries/buildroot.conf
+endef
+
+$(eval $(autotools-package))
diff --git a/boot/gummiboot/loader.conf b/boot/gummiboot/loader.conf
new file mode 100644
index 0000000..93b77b8
--- /dev/null
+++ b/boot/gummiboot/loader.conf
@@ -0,0 +1,2 @@
+timeout 3
+default buildroot
-- 
1.9.rc1
