From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Wed, 19 Dec 2018 07:41:29 +0800
Subject: [Buildroot] [PATCH 2/2] boot/systemd-boot: new package
In-Reply-To: <1545176489-17146-1-git-send-email-james.hilliard1@gmail.com>
References: <1545176489-17146-1-git-send-email-james.hilliard1@gmail.com>
Message-ID: <1545176489-17146-2-git-send-email-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

This is essentially the successor to gummiboot.

This package will use the existing systemd-boot binaries when systemd
init is selected.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 boot/Config.in                                     |   1 +
 boot/systemd-boot/0001-fix-getty-unit.patch        |   1 +
 .../0002-install-don-t-use-ln-relative.patch       |   1 +
 ...etect-whether-struct-statx-is-defined-in-.patch |   1 +
 ...-linux-stat.h-check-with-other-checks-and.patch |   1 +
 ...sure-we-have-enough-space-for-the-DHCP6-o.patch |   1 +
 ...eson.build-fix-detection-of-Werror-shadow.patch |   1 +
 boot/systemd-boot/Config.in                        |  24 ++++
 boot/systemd-boot/buildroot.conf                   |   3 +
 boot/systemd-boot/loader.conf                      |   2 +
 boot/systemd-boot/systemd-boot.mk                  | 126 +++++++++++++++++++++
 boot/systemd-boot/systemd.hash                     |   1 +
 12 files changed, 163 insertions(+)
 create mode 120000 boot/systemd-boot/0001-fix-getty-unit.patch
 create mode 120000 boot/systemd-boot/0002-install-don-t-use-ln-relative.patch
 create mode 120000 boot/systemd-boot/0003-build-sys-Detect-whether-struct-statx-is-defined-in-.patch
 create mode 120000 boot/systemd-boot/0004-meson-unify-linux-stat.h-check-with-other-checks-and.patch
 create mode 120000 boot/systemd-boot/0005-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
 create mode 120000 boot/systemd-boot/0006-meson.build-fix-detection-of-Werror-shadow.patch
 create mode 100644 boot/systemd-boot/Config.in
 create mode 100644 boot/systemd-boot/buildroot.conf
 create mode 100644 boot/systemd-boot/loader.conf
 create mode 100644 boot/systemd-boot/systemd-boot.mk
 create mode 120000 boot/systemd-boot/systemd.hash

diff --git a/boot/Config.in b/boot/Config.in
index 8e0c8e5..5b7f606 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -16,6 +16,7 @@ source "boot/mxs-bootlets/Config.in"
 source "boot/riscv-pk/Config.in"
 source "boot/s500-bootloader/Config.in"
 source "boot/syslinux/Config.in"
+source "boot/systemd-boot/Config.in"
 source "boot/ts4800-mbrboot/Config.in"
 source "boot/uboot/Config.in"
 source "boot/vexpress-firmware/Config.in"
diff --git a/boot/systemd-boot/0001-fix-getty-unit.patch b/boot/systemd-boot/0001-fix-getty-unit.patch
new file mode 120000
index 0000000..ffb5f53
--- /dev/null
+++ b/boot/systemd-boot/0001-fix-getty-unit.patch
@@ -0,0 +1 @@
+../../package/systemd/0001-fix-getty-unit.patch
\ No newline at end of file
diff --git a/boot/systemd-boot/0002-install-don-t-use-ln-relative.patch b/boot/systemd-boot/0002-install-don-t-use-ln-relative.patch
new file mode 120000
index 0000000..cfe0291
--- /dev/null
+++ b/boot/systemd-boot/0002-install-don-t-use-ln-relative.patch
@@ -0,0 +1 @@
+../../package/systemd/0002-install-don-t-use-ln-relative.patch
\ No newline at end of file
diff --git a/boot/systemd-boot/0003-build-sys-Detect-whether-struct-statx-is-defined-in-.patch b/boot/systemd-boot/0003-build-sys-Detect-whether-struct-statx-is-defined-in-.patch
new file mode 120000
index 0000000..ded8b4f
--- /dev/null
+++ b/boot/systemd-boot/0003-build-sys-Detect-whether-struct-statx-is-defined-in-.patch
@@ -0,0 +1 @@
+../../package/systemd/0003-build-sys-Detect-whether-struct-statx-is-defined-in-.patch
\ No newline at end of file
diff --git a/boot/systemd-boot/0004-meson-unify-linux-stat.h-check-with-other-checks-and.patch b/boot/systemd-boot/0004-meson-unify-linux-stat.h-check-with-other-checks-and.patch
new file mode 120000
index 0000000..32bc435
--- /dev/null
+++ b/boot/systemd-boot/0004-meson-unify-linux-stat.h-check-with-other-checks-and.patch
@@ -0,0 +1 @@
+../../package/systemd/0004-meson-unify-linux-stat.h-check-with-other-checks-and.patch
\ No newline at end of file
diff --git a/boot/systemd-boot/0005-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch b/boot/systemd-boot/0005-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
new file mode 120000
index 0000000..003d6a7
--- /dev/null
+++ b/boot/systemd-boot/0005-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
@@ -0,0 +1 @@
+../../package/systemd/0005-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
\ No newline at end of file
diff --git a/boot/systemd-boot/0006-meson.build-fix-detection-of-Werror-shadow.patch b/boot/systemd-boot/0006-meson.build-fix-detection-of-Werror-shadow.patch
new file mode 120000
index 0000000..0e0a5cf
--- /dev/null
+++ b/boot/systemd-boot/0006-meson.build-fix-detection-of-Werror-shadow.patch
@@ -0,0 +1 @@
+../../package/systemd/0006-meson.build-fix-detection-of-Werror-shadow.patch
\ No newline at end of file
diff --git a/boot/systemd-boot/Config.in b/boot/systemd-boot/Config.in
new file mode 100644
index 0000000..922bb07
--- /dev/null
+++ b/boot/systemd-boot/Config.in
@@ -0,0 +1,24 @@
+config BR2_TARGET_SYSTEMD_BOOT
+	bool "systemd-boot"
+	depends on BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_SYSTEMD_BOOT if BR2_INIT_SYSTEMD
+	select BR2_PACKAGE_GNU_EFI
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
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
diff --git a/boot/systemd-boot/buildroot.conf b/boot/systemd-boot/buildroot.conf
new file mode 100644
index 0000000..16d4d85
--- /dev/null
+++ b/boot/systemd-boot/buildroot.conf
@@ -0,0 +1,3 @@
+title	Buildroot
+linux	/bzImage
+options	root=/dev/sda2 rootwait console=tty1
diff --git a/boot/systemd-boot/loader.conf b/boot/systemd-boot/loader.conf
new file mode 100644
index 0000000..93b77b8
--- /dev/null
+++ b/boot/systemd-boot/loader.conf
@@ -0,0 +1,2 @@
+timeout 3
+default buildroot
diff --git a/boot/systemd-boot/systemd-boot.mk b/boot/systemd-boot/systemd-boot.mk
new file mode 100644
index 0000000..7f97ef0
--- /dev/null
+++ b/boot/systemd-boot/systemd-boot.mk
@@ -0,0 +1,126 @@
+################################################################################
+#
+# systemd-boot
+#
+################################################################################
+
+SYSTEMD_BOOT_VERSION = 239
+SYSTEMD_BOOT_SITE = $(call github,systemd,systemd,v$(SYSTEMD_BOOT_VERSION))
+SYSTEMD_BOOT_DL_SUBDIR = systemd
+SYSTEMD_BOOT_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README)
+SYSTEMD_BOOT_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README
+SYSTEMD_BOOT_INSTALL_STAGING = NO
+SYSTEMD_BOOT_INSTALL_TARGET = NO
+SYSTEMD_BOOT_INSTALL_IMAGES = YES
+SYSTEMD_BOOT_DEPENDENCIES = \
+	gnu-efi \
+	util-linux
+ifeq ($(BR2_PACKAGE_SYSTEMD_BOOT),y)
+SYSTEMD_BOOT_DEPENDENCIES += systemd
+endif
+
+ifeq ($(BR2_i386),y)
+SYSTEMD_BOOT_IMGARCH = ia32
+else ifeq ($(BR2_x86_64),y)
+SYSTEMD_BOOT_IMGARCH = x64
+endif
+
+ifneq ($(BR2_PACKAGE_SYSTEMD_BOOT),y)
+SYSTEMD_BOOT_CONF_OPTS += \
+	-Drootlibdir='/usr/lib' \
+	-Dblkid=true \
+	-Dman=false \
+	-Dima=false \
+	-Dlibcryptsetup=false \
+	-Defi=true \
+	-Defi-cc=$(TARGET_CC) \
+	-Defi-ld=$(TARGET_LD) \
+	-Defi-libdir=$(STAGING_DIR)/usr/lib \
+	-Defi-ldsdir=$(STAGING_DIR)/usr/lib \
+	-Defi-includedir=$(STAGING_DIR)/usr/include/efi \
+	-Dgnu-efi=true \
+	-Dldconfig=false \
+	-Ddefault-dnssec=no \
+	-Dtests=false \
+	-Dnobody-group=nogroup \
+	-Didn=true \
+	-Dnss-systemd=true \
+	-Dacl=false \
+	-Daudit=false \
+	-Delfutils=false \
+	-Dlibidn=false \
+	-Dlibidn2=false \
+	-Dseccomp=false \
+	-Dxkbcommon=false \
+	-Dbzip2=false \
+	-Dlz4=false \
+	-Dpam=false \
+	-Dxz=false \
+	-Dzlib=false \
+	-Dlibcurl=false \
+	-Dgcrypt=false \
+	-Dpcre2=false \
+	-Dmicrohttpd=false \
+	-Dqrencode=false \
+	-Dselinux=false \
+	-Dhwdb=false \
+	-Dbinfmt=false \
+	-Dvconsole=false \
+	-Dquotacheck=false \
+	-Dtmpfiles=false \
+	-Dsysusers=false \
+	-Dfirstboot=false \
+	-Drandomseed=false \
+	-Dbacklight=false \
+	-Drfkill=false \
+	-Dlogind=false \
+	-Dmachined=false \
+	-Dimportd=false \
+	-Dhostnamed=false \
+	-Dmyhostname=false \
+	-Dtimedated=false \
+	-Dlocaled=false \
+	-Dcoredump=false \
+	-Dpolkit=false \
+	-Dnetworkd=false \
+	-Dresolve=false \
+	-Dtimesyncd=false \
+	-Dsmack=false \
+	-Dhibernate=false
+endif
+
+SYSTEMD_BOOT_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
+SYSTEMD_BOOT_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
+
+ifeq ($(BR2_PACKAGE_SYSTEMD_BOOT),y)
+define SYSTEMD_BOOT_BUILD_CMDS
+	mkdir -p $(@D)/build/src/boot/efi
+	cp $(TARGET_DIR)/usr/lib/systemd/boot/efi/systemd-boot$(SYSTEMD_BOOT_IMGARCH).efi \
+		$(@D)/build/src/boot/efi/systemd-boot$(SYSTEMD_BOOT_IMGARCH).efi
+	cp $(TARGET_DIR)/usr/lib/systemd/boot/efi/linux$(SYSTEMD_BOOT_IMGARCH).efi.stub \
+		$(@D)/build/src/boot/efi/linux$(SYSTEMD_BOOT_IMGARCH).efi.stub
+endef
+else
+define SYSTEMD_BOOT_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(SYSTEMD_BOOT_NINJA_ENV) \
+		$(NINJA) $(NINJA_OPTS) -C $(@D)/build \
+		src/boot/efi/{systemd-boot$(SYSTEMD_BOOT_IMGARCH).efi,linux$(SYSTEMD_BOOT_IMGARCH).efi.stub}
+endef
+endif
+
+define SYSTEMD_BOOT_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/build/src/boot/efi/systemd-boot$(SYSTEMD_BOOT_IMGARCH).efi \
+		$(BINARIES_DIR)/efi-part/EFI/BOOT/boot$(SYSTEMD_BOOT_IMGARCH).efi
+	echo "boot$(SYSTEMD_BOOT_IMGARCH).efi" > \
+		$(BINARIES_DIR)/efi-part/startup.nsh
+	$(INSTALL) -D -m 0644 $(SYSTEMD_BOOT_PKGDIR)/loader.conf \
+		$(BINARIES_DIR)/efi-part/loader/loader.conf
+	$(INSTALL) -D -m 0644 $(SYSTEMD_BOOT_PKGDIR)/buildroot.conf \
+		$(BINARIES_DIR)/efi-part/loader/entries/buildroot.conf
+endef
+
+ifeq ($(BR2_PACKAGE_SYSTEMD_BOOT),y)
+$(eval $(generic-package))
+else
+$(eval $(meson-package))
+endif
diff --git a/boot/systemd-boot/systemd.hash b/boot/systemd-boot/systemd.hash
new file mode 120000
index 0000000..4259f40
--- /dev/null
+++ b/boot/systemd-boot/systemd.hash
@@ -0,0 +1 @@
+../../package/systemd/systemd.hash
\ No newline at end of file
-- 
2.7.4
