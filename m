From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 26 Dec 2018 09:52:30 +0100
Subject: [Buildroot] [PATCH 5/5 v5] boot/systemd-boot: new package
In-Reply-To: <cover.1545814334.git.yann.morin.1998@free.fr>
References: <cover.1545814334.git.yann.morin.1998@free.fr>
Message-ID: <d38239f86f99924e87dcb6e045b2de3ac0cb435f.1545814334.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

systemd-boot is the integration of gummiboot into systemd, and gummiboot
is no longer maintained [0]. However, it is still interesting to use it
as a simple, stand-alone bootloader.

Since systemd-boot is really part of systemd, when systemd is enabled
(as an init system), we rely on it to build the boot blobs, and
systemd-boot (this package) is not available.

Now, when systemd is not enabled, systemd-boot (this package) will
actually build the boot blobs, and only that. No userspace tool is
built.

To avoid duplication, we just symlink the systemd patches as-is. We just
need to add a specific patch, that just relaxes the dependency checks,
since we're only interested in building the boot blobs.

[0] https://cgit.freedesktop.org/gummiboot/commit/?id=55df1539c9d330732e88bd196afee386db6e4a1d

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998 at free.fr:
  - drop the duality due to to interdependence with systemd
  - share boot files with systemd
  - use the new _NINJA_OPTS variable
  - add patch to allow building only systemd-boot
  - specify _SOURCE to be sure to share wth systemd
  - rename the .hash file
  - add comment about syncing the version with systemd
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

---
Changes v2 -> v3 (Yann):
  - changes identified in the commit log

Changes v1 -> v2 (James):
  - split off from systemd into its own package  (Yann)
---
 boot/Config.in                                     |   1 +
 boot/systemd-boot/0001-fix-getty-unit.patch        |   1 +
 .../0002-install-don-t-use-ln-relative.patch       |   1 +
 ...etect-whether-struct-statx-is-defined-in-.patch |   1 +
 ...-linux-stat.h-check-with-other-checks-and.patch |   1 +
 ...sure-we-have-enough-space-for-the-DHCP6-o.patch |   1 +
 ...eson.build-fix-detection-of-Werror-shadow.patch |   1 +
 ...lax-depenencies-to-be-able-to-just-build-.patch |  40 ++++++++
 boot/systemd-boot/Config.in                        |  32 +++++++
 boot/systemd-boot/boot-files                       |   1 +
 boot/systemd-boot/systemd-boot.hash                |   1 +
 boot/systemd-boot/systemd-boot.mk                  | 102 +++++++++++++++++++++
 package/systemd/Config.in                          |   2 +-
 package/systemd/systemd.mk                         |   1 +
 14 files changed, 185 insertions(+), 1 deletion(-)
 create mode 120000 boot/systemd-boot/0001-fix-getty-unit.patch
 create mode 120000 boot/systemd-boot/0002-install-don-t-use-ln-relative.patch
 create mode 120000 boot/systemd-boot/0003-build-sys-Detect-whether-struct-statx-is-defined-in-.patch
 create mode 120000 boot/systemd-boot/0004-meson-unify-linux-stat.h-check-with-other-checks-and.patch
 create mode 120000 boot/systemd-boot/0005-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
 create mode 120000 boot/systemd-boot/0006-meson.build-fix-detection-of-Werror-shadow.patch
 create mode 100644 boot/systemd-boot/1000-buildsys-relax-depenencies-to-be-able-to-just-build-.patch
 create mode 100644 boot/systemd-boot/Config.in
 create mode 120000 boot/systemd-boot/boot-files
 create mode 120000 boot/systemd-boot/systemd-boot.hash
 create mode 100644 boot/systemd-boot/systemd-boot.mk

diff --git a/boot/Config.in b/boot/Config.in
index 8e0c8e5df4..5b7f606343 100644
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
index 0000000000..ffb5f5306d
--- /dev/null
+++ b/boot/systemd-boot/0001-fix-getty-unit.patch
@@ -0,0 +1 @@
+../../package/systemd/0001-fix-getty-unit.patch
\ No newline at end of file
diff --git a/boot/systemd-boot/0002-install-don-t-use-ln-relative.patch b/boot/systemd-boot/0002-install-don-t-use-ln-relative.patch
new file mode 120000
index 0000000000..cfe0291c86
--- /dev/null
+++ b/boot/systemd-boot/0002-install-don-t-use-ln-relative.patch
@@ -0,0 +1 @@
+../../package/systemd/0002-install-don-t-use-ln-relative.patch
\ No newline at end of file
diff --git a/boot/systemd-boot/0003-build-sys-Detect-whether-struct-statx-is-defined-in-.patch b/boot/systemd-boot/0003-build-sys-Detect-whether-struct-statx-is-defined-in-.patch
new file mode 120000
index 0000000000..ded8b4f6aa
--- /dev/null
+++ b/boot/systemd-boot/0003-build-sys-Detect-whether-struct-statx-is-defined-in-.patch
@@ -0,0 +1 @@
+../../package/systemd/0003-build-sys-Detect-whether-struct-statx-is-defined-in-.patch
\ No newline at end of file
diff --git a/boot/systemd-boot/0004-meson-unify-linux-stat.h-check-with-other-checks-and.patch b/boot/systemd-boot/0004-meson-unify-linux-stat.h-check-with-other-checks-and.patch
new file mode 120000
index 0000000000..32bc435aa1
--- /dev/null
+++ b/boot/systemd-boot/0004-meson-unify-linux-stat.h-check-with-other-checks-and.patch
@@ -0,0 +1 @@
+../../package/systemd/0004-meson-unify-linux-stat.h-check-with-other-checks-and.patch
\ No newline at end of file
diff --git a/boot/systemd-boot/0005-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch b/boot/systemd-boot/0005-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
new file mode 120000
index 0000000000..003d6a7821
--- /dev/null
+++ b/boot/systemd-boot/0005-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
@@ -0,0 +1 @@
+../../package/systemd/0005-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
\ No newline at end of file
diff --git a/boot/systemd-boot/0006-meson.build-fix-detection-of-Werror-shadow.patch b/boot/systemd-boot/0006-meson.build-fix-detection-of-Werror-shadow.patch
new file mode 120000
index 0000000000..0e0a5cfab1
--- /dev/null
+++ b/boot/systemd-boot/0006-meson.build-fix-detection-of-Werror-shadow.patch
@@ -0,0 +1 @@
+../../package/systemd/0006-meson.build-fix-detection-of-Werror-shadow.patch
\ No newline at end of file
diff --git a/boot/systemd-boot/1000-buildsys-relax-depenencies-to-be-able-to-just-build-.patch b/boot/systemd-boot/1000-buildsys-relax-depenencies-to-be-able-to-just-build-.patch
new file mode 100644
index 0000000000..46cfe31866
--- /dev/null
+++ b/boot/systemd-boot/1000-buildsys-relax-depenencies-to-be-able-to-just-build-.patch
@@ -0,0 +1,40 @@
+From 6fd68b581997cd79cee2c957fe3e2d7328727e71 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Tue, 25 Dec 2018 10:36:32 +0100
+Subject: [PATCH] buildsys: relax depenencies to be able to just build
+ systemd-boot
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ meson.build | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 04331dd41..1d9157d19 100644
+--- a/meson.build
++++ b/meson.build
+@@ -591,7 +591,7 @@ conf.set('GPERF_LEN_TYPE', gperf_len_type,
+ ############################################################
+ 
+ if not cc.has_header('sys/capability.h')
+-        error('POSIX caps headers not found')
++        warning('POSIX caps headers not found')
+ endif
+ foreach header : ['crypt.h',
+                   'linux/btrfs.h',
+@@ -789,10 +789,10 @@ libcrypt = cc.find_library('crypt')
+ libcap = dependency('libcap', required : false)
+ if not libcap.found()
+         # Compat with Ubuntu 14.04 which ships libcap w/o .pc file
+-        libcap = cc.find_library('cap')
++        libcap = cc.find_library('cap', required : false)
+ endif
+ 
+-libmount = dependency('mount',
++libmount = dependency('mount', required : false,
+                       version : fuzzer_build ? '>= 0' : '>= 2.30')
+ 
+ want_seccomp = get_option('seccomp')
+-- 
+2.14.1
+
diff --git a/boot/systemd-boot/Config.in b/boot/systemd-boot/Config.in
new file mode 100644
index 0000000000..51dcebbf42
--- /dev/null
+++ b/boot/systemd-boot/Config.in
@@ -0,0 +1,32 @@
+config BR2_TARGET_SYSTEMD_BOOT
+	bool "systemd-boot"
+	depends on BR2_i386 || BR2_x86_64
+	depends on !BR2_PACKAGE_SYSTEMD
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
+config BR2_TARGET_SYSTEMD_BOOT_EFI_ARCH
+	string
+	default "ia32"  if BR2_i386
+	default "x64"   if BR2_x86_64
+	depends on BR2_TARGET_SYSTEMD_BOOT
+
+comment "systemd-boot is provided by systemd"
+	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_SYSTEMD
diff --git a/boot/systemd-boot/boot-files b/boot/systemd-boot/boot-files
new file mode 120000
index 0000000000..0ff51d4e0a
--- /dev/null
+++ b/boot/systemd-boot/boot-files
@@ -0,0 +1 @@
+../../package/systemd/boot-files
\ No newline at end of file
diff --git a/boot/systemd-boot/systemd-boot.hash b/boot/systemd-boot/systemd-boot.hash
new file mode 120000
index 0000000000..4259f40c21
--- /dev/null
+++ b/boot/systemd-boot/systemd-boot.hash
@@ -0,0 +1 @@
+../../package/systemd/systemd.hash
\ No newline at end of file
diff --git a/boot/systemd-boot/systemd-boot.mk b/boot/systemd-boot/systemd-boot.mk
new file mode 100644
index 0000000000..0b0a356041
--- /dev/null
+++ b/boot/systemd-boot/systemd-boot.mk
@@ -0,0 +1,102 @@
+################################################################################
+#
+# systemd-boot
+#
+################################################################################
+
+# When updating this version, please also update it in package/systemd/
+SYSTEMD_BOOT_VERSION = 239
+SYSTEMD_BOOT_SITE = $(call github,systemd,systemd,v$(SYSTEMD_BOOT_VERSION))
+SYSTEMD_BOOT_SOURCE = systemd-239.tar.gz
+SYSTEMD_BOOT_DL_SUBDIR = systemd
+
+SYSTEMD_BOOT_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README)
+SYSTEMD_BOOT_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README
+
+SYSTEMD_BOOT_DEPENDENCIES = gnu-efi
+
+SYSTEMD_BOOT_INSTALL_TARGET = NO
+SYSTEMD_BOOT_INSTALL_IMAGES = YES
+
+SYSTEMD_BOOT_CONF_OPTS += \
+	-Drootlibdir='/usr/lib' \
+	-Dblkid=false \
+	-Dman=false \
+	-Dima=false \
+	-Dlibcryptsetup=false \
+	-Defi=true \
+	-Dgnu-efi=true \
+	-Defi-cc=$(TARGET_CC) \
+	-Defi-ld=$(TARGET_LD) \
+	-Defi-libdir=$(STAGING_DIR)/usr/lib \
+	-Defi-ldsdir=$(STAGING_DIR)/usr/lib \
+	-Defi-includedir=$(STAGING_DIR)/usr/include/efi \
+	-Dldconfig=false \
+	-Ddefault-dnssec=no \
+	-Dtests=false \
+	-Dnobody-group=nogroup \
+	-Didn=false \
+	-Dnss-systemd=false \
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
+
+SYSTEMD_BOOT_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
+SYSTEMD_BOOT_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
+
+SYSTEMD_BOOT_TARGET_EFI_ARCH = $(call qstrip,$(BR2_TARGET_SYSTEMD_BOOT_EFI_ARCH))
+SYSTEMD_BOOT_NINJA_OPTS = \
+	src/boot/efi/systemd-boot$(SYSTEMD_BOOT_TARGET_EFI_ARCH).efi \
+	src/boot/efi/linux$(SYSTEMD_BOOT_TARGET_EFI_ARCH).efi.stub
+
+define SYSTEMD_BOOT_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/build/src/boot/efi/systemd-boot$(SYSTEMD_BOOT_TARGET_EFI_ARCH).efi \
+		$(BINARIES_DIR)/efi-part/EFI/BOOT/boot$(SYSTEMD_BOOT_TARGET_EFI_ARCH).efi
+	echo "boot$(SYSTEMD_BOOT_TARGET_EFI_ARCH).efi" > \
+		$(BINARIES_DIR)/efi-part/startup.nsh
+	$(INSTALL) -D -m 0644 $(SYSTEMD_BOOT_PKGDIR)/boot-files/loader.conf \
+		$(BINARIES_DIR)/efi-part/loader/loader.conf
+	$(INSTALL) -D -m 0644 $(SYSTEMD_BOOT_PKGDIR)/boot-files/buildroot.conf \
+		$(BINARIES_DIR)/efi-part/loader/entries/buildroot.conf
+endef
+
+$(eval $(meson-package))
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 50d09b34a5..a99358fc7b 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -101,9 +101,9 @@ config BR2_PACKAGE_SYSTEMD_BOOT
 
 config BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH
 	string
-	depends on BR2_PACKAGE_SYSTEMD_BOOT
 	default "ia32"  if BR2_i386
 	default "x64"   if BR2_x86_64
+	depends on BR2_PACKAGE_SYSTEMD_BOOT
 
 config BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY
 	bool "HTTP server for journal events"
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 2822d4423c..3f8f7aaac3 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# When updating this version, please also update it in boot/systemd-boot/
 SYSTEMD_VERSION = 239
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README)
-- 
2.14.1
