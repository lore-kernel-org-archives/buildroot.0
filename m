From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 26 Dec 2018 09:52:29 +0100
Subject: [Buildroot] [PATCH 4/5 v5] package/systemd: enable building of
 systemd-boot
In-Reply-To: <cover.1545814334.git.yann.morin.1998@free.fr>
References: <cover.1545814334.git.yann.morin.1998@free.fr>
Message-ID: <ee29899e3557cda33763768cfb580f094c54723a.1545814334.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

systemd-boot is the integration of gummiboot into systemd, when
gummiboot is no longer maintained [0].

Add an option to build systemd-boot as part of the systemd build.

Install the boot files, that can serve as a template for the user
to tweak for their system.

[0] https://cgit.freedesktop.org/gummiboot/commit/?id=55df1539c9d330732e88bd196afee386db6e4a1d

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998 at free.fr:
  - add missing depends on i386 || x86_64
  - add missing dependency to gnu-efi
  - add missing boot files (they will be shared with standalone
    systemd-boot later)
]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/systemd/Config.in                 | 28 +++++++++++++++++++++++++
 package/systemd/boot-files/buildroot.conf |  3 +++
 package/systemd/boot-files/loader.conf    |  2 ++
 package/systemd/systemd.mk                | 34 +++++++++++++++++++++++++++++--
 4 files changed, 65 insertions(+), 2 deletions(-)
 create mode 100644 package/systemd/boot-files/buildroot.conf
 create mode 100644 package/systemd/boot-files/loader.conf

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 25f322e8f3..50d09b34a5 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -77,6 +77,34 @@ if BR2_PACKAGE_SYSTEMD
 config BR2_PACKAGE_PROVIDES_UDEV
 	default "systemd"
 
+config BR2_PACKAGE_SYSTEMD_BOOT
+	bool "systemd-boot"
+	depends on BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_GNU_EFI
+	help
+	  systemd-boot is a simple UEFI boot manager which executes
+	  configured EFI images. The default entry is selected by a
+	  configured pattern (glob) or an on-screen menu.
+
+	  systemd-boot operates on the EFI System Partition (ESP)
+	  only. Configuration file fragments, kernels, initrds, other
+	  EFI images need to reside on the ESP. Linux kernels need to
+	  be built with CONFIG_EFI_STUB to be able to be directly
+	  executed as an EFI image.
+
+	  See the Grub2 help text for details on preparing an EFI
+	  capable disk image using systemd-boot: the instructions are
+	  exactly the same, except that the systemd-boot configuration
+	  files will be located in /loader/ inside the EFI partition.
+
+	  https://www.freedesktop.org/wiki/Software/systemd/systemd-boot/
+
+config BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH
+	string
+	depends on BR2_PACKAGE_SYSTEMD_BOOT
+	default "ia32"  if BR2_i386
+	default "x64"   if BR2_x86_64
+
 config BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY
 	bool "HTTP server for journal events"
 	select BR2_PACKAGE_LIBMICROHTTPD
diff --git a/package/systemd/boot-files/buildroot.conf b/package/systemd/boot-files/buildroot.conf
new file mode 100644
index 0000000000..16d4d85f4a
--- /dev/null
+++ b/package/systemd/boot-files/buildroot.conf
@@ -0,0 +1,3 @@
+title	Buildroot
+linux	/bzImage
+options	root=/dev/sda2 rootwait console=tty1
diff --git a/package/systemd/boot-files/loader.conf b/package/systemd/boot-files/loader.conf
new file mode 100644
index 0000000000..93b77b8f93
--- /dev/null
+++ b/package/systemd/boot-files/loader.conf
@@ -0,0 +1,2 @@
+timeout 3
+default buildroot
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index e53f0b699a..2822d4423c 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -24,8 +24,6 @@ SYSTEMD_CONF_OPTS += \
 	-Dman=false \
 	-Dima=false \
 	-Dlibcryptsetup=false \
-	-Defi=false \
-	-Dgnu-efi=false \
 	-Dldconfig=false \
 	-Ddefault-dnssec=no \
 	-Dtests=false \
@@ -332,6 +330,34 @@ else
 SYSTEMD_CONF_OPTS += -Dhibernate=false
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_BOOT),y)
+SYSTEMD_INSTALL_IMAGES = YES
+SYSTEMD_DEPENDENCIES += gnu-efi
+SYSTEMD_CONF_OPTS += \
+	-Defi=true \
+	-Dgnu-efi=true \
+	-Defi-cc=$(TARGET_CC) \
+	-Defi-ld=$(TARGET_LD) \
+	-Defi-libdir=$(STAGING_DIR)/usr/lib \
+	-Defi-ldsdir=$(STAGING_DIR)/usr/lib \
+	-Defi-includedir=$(STAGING_DIR)/usr/include/efi
+
+SYSTEMD_BOOT_EFI_ARCH = $(call qstrip,$(BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH))
+define SYSTEMD_INSTALL_BOOT_FILES
+	$(INSTALL) -D -m 0644 $(@D)/build/src/boot/efi/systemd-boot$(SYSTEMD_BOOT_EFI_ARCH).efi \
+		$(BINARIES_DIR)/efi-part/EFI/BOOT/boot$(SYSTEMD_BOOT_EFI_ARCH).efi
+	echo "boot$(SYSTEMD_BOOT_EFI_ARCH).efi" > \
+		$(BINARIES_DIR)/efi-part/startup.nsh
+	$(INSTALL) -D -m 0644 $(SYSTEMD_PKGDIR)/boot-files/loader.conf \
+		$(BINARIES_DIR)/efi-part/loader/loader.conf
+	$(INSTALL) -D -m 0644 $(SYSTEMD_PKGDIR)/boot-files/buildroot.conf \
+		$(BINARIES_DIR)/efi-part/loader/entries/buildroot.conf
+endef
+
+else
+SYSTEMD_CONF_OPTS += -Defi=false -Dgnu-efi=false
+endif # BR2_PACKAGE_SYSTEMD_BOOT == y
+
 SYSTEMD_FALLBACK_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
 ifneq ($(SYSTEMD_FALLBACK_HOSTNAME),)
 SYSTEMD_CONF_OPTS += -Dfallback-hostname=$(SYSTEMD_FALLBACK_HOSTNAME)
@@ -356,6 +382,10 @@ SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
 	SYSTEMD_INSTALL_MACHINEID_HOOK \
 	SYSTEMD_INSTALL_RESOLVCONF_HOOK
 
+define SYSTEMD_INSTALL_IMAGES_CMDS
+	$(SYSTEMD_INSTALL_BOOT_FILES)
+endef
+
 define SYSTEMD_USERS
 	- - input -1 * - - - Input device group
 	- - systemd-journal -1 * - - - Journal
-- 
2.14.1
