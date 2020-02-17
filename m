From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 17 Feb 2020 15:30:30 +0100
Subject: [Buildroot] [PATCH 4/4] package/udisks: bump version to 2.8.4
In-Reply-To: <20200217143030.5031-1-giulio.benetti@benettiengineering.com>
References: <20200217143030.5031-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200217143030.5031-5-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 2.8.4 of udisks. All patches have been upstremed, so
drop them all.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS                                    |  1 +
 ...-fix-build-with-newer-glibc-versions.patch | 29 -------
 .../0002-Fix-systemd-service-file.patch       | 33 --------
 ...issue-with-missing-sys-sysmacros.h-i.patch | 81 -------------------
 package/udisks/Config.in                      | 31 ++++---
 package/udisks/udisks.hash                    |  4 +-
 package/udisks/udisks.mk                      | 23 ++++--
 7 files changed, 38 insertions(+), 164 deletions(-)
 delete mode 100644 package/udisks/0001-fix-build-with-newer-glibc-versions.patch
 delete mode 100644 package/udisks/0002-Fix-systemd-service-file.patch
 delete mode 100644 package/udisks/0003-Fix-compilation-issue-with-missing-sys-sysmacros.h-i.patch

diff --git a/DEVELOPERS b/DEVELOPERS
index 514b850c08..6aac009de4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1018,6 +1018,7 @@ F:	package/nfs-utils/
 F:	package/sunxi-mali-mainline/
 F:	package/sunxi-mali-mainline-driver/
 F:	package/volume_key/
+F:	package/udisks/
 
 N:	Gregory Dymarek <gregd72002@gmail.com>
 F:	package/ding-libs/
diff --git a/package/udisks/0001-fix-build-with-newer-glibc-versions.patch b/package/udisks/0001-fix-build-with-newer-glibc-versions.patch
deleted file mode 100644
index 336fc440a6..0000000000
--- a/package/udisks/0001-fix-build-with-newer-glibc-versions.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Fix build with newer glibc versions
-
-This patch has been backported from upstream:
-
-http://cgit.freedesktop.org/udisks/commit/?h=udisks1&id=9829152b12a8924d2e091a00133ed1a3a7ba75c0
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-From 9829152b12a8924d2e091a00133ed1a3a7ba75c0 Mon Sep 17 00:00:00 2001
-From: Alexandre Rostovtsev <tetromino@gentoo.org>
-Date: Fri, 29 May 2015 21:09:39 -0400
-Subject: fix build with newer glibc versions
-
-https://bugs.freedesktop.org/show_bug.cgi?id=90778
-
-diff --git a/src/helpers/job-drive-detach.c b/src/helpers/job-drive-detach.c
-index eeafcab..d122a1f 100644
---- a/src/helpers/job-drive-detach.c
-+++ b/src/helpers/job-drive-detach.c
-@@ -18,6 +18,7 @@
-  *
-  */
- 
-+#include <sys/stat.h>
- #include <stdio.h>
- #include <string.h>
- #include <errno.h>
--- 
-cgit v0.10.2
diff --git a/package/udisks/0002-Fix-systemd-service-file.patch b/package/udisks/0002-Fix-systemd-service-file.patch
deleted file mode 100644
index ea347aef73..0000000000
--- a/package/udisks/0002-Fix-systemd-service-file.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From bf8b4362cef24a6f747e4329305a4939c8f585d1 Mon Sep 17 00:00:00 2001
-From: David King <amigadave@amigadave.com>
-Date: Thu, 2 Jul 2015 13:49:22 +0100
-Subject: [PATCH] Fix systemd service file
-
-udisks-daemon is installed to $(libexecdir), not $(prefix)/lib/udisks.
-
-https://bugzilla.redhat.com/show_bug.cgi?id=1238664
-https://bugs.freedesktop.org/show_bug.cgi?id=91191
-
-[This patch has been backported from upstream:
-https://cgit.freedesktop.org/udisks/commit/?h=udisks1&id=bf8b4362cef24a6f747e4329305a4939c8f585d1]
-Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
----
- data/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/data/Makefile.am b/data/Makefile.am
-index 411ea0f..08af5f4 100644
---- a/data/Makefile.am
-+++ b/data/Makefile.am
-@@ -31,7 +31,7 @@ systemdservicedir       = $(systemdsystemunitdir)
- systemdservice_DATA     = $(systemdservice_in_files:.service.in=.service)
- 
- $(systemdservice_DATA): $(systemdservice_in_files) Makefile
--	@sed -e "s|\@libexecdir\@|$(prefix)/lib/udisks|" $< > $@
-+	@sed -e "s|\@libexecdir\@|$(libexecdir)|" $< > $@
- endif
- 
- udevrulesdir = $(slashlibdir)/udev/rules.d
--- 
-2.7.4
-
diff --git a/package/udisks/0003-Fix-compilation-issue-with-missing-sys-sysmacros.h-i.patch b/package/udisks/0003-Fix-compilation-issue-with-missing-sys-sysmacros.h-i.patch
deleted file mode 100644
index 71152e5de3..0000000000
--- a/package/udisks/0003-Fix-compilation-issue-with-missing-sys-sysmacros.h-i.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From d934b0fa5ce24a8fd1987b916e435ba991c2ef64 Mon Sep 17 00:00:00 2001
-From: Vadim Kochan <vadim.kochan@petcube.com>
-Date: Mon, 31 Dec 2018 11:00:46 +0200
-Subject: [PATCH] Fix compilation issue due to missing sys/sysmacros.h include
-
-glibc 2.28+ no longer include <sys/sysmacros.h> from <sys/types.h>, so
-<sys/sysmacros.h> must now be explicitly included to use the major,
-minor and makedev macros.
-
-Signed-off-by: Vadim Kochan <vadim.kochan@petcube.com>
----
- src/daemon.c          | 1 +
- src/device.c          | 1 +
- src/mount-monitor.c   | 1 +
- tools/udisks.c        | 1 +
- tools/umount-udisks.c | 1 +
- 5 files changed, 5 insertions(+)
-
-diff --git a/src/daemon.c b/src/daemon.c
-index fafcf9a..4303a6d 100644
---- a/src/daemon.c
-+++ b/src/daemon.c
-@@ -45,6 +45,7 @@
- #include <sys/socket.h>
- #include <sys/un.h>
- #include <sys/utsname.h>
-+#include <sys/sysmacros.h>
- #include <net/if_arp.h>
- #include <fcntl.h>
- #include <signal.h>
-diff --git a/src/device.c b/src/device.c
-index 2ae7f38..20920df 100644
---- a/src/device.c
-+++ b/src/device.c
-@@ -33,6 +33,7 @@
- #include <sys/stat.h>
- #include <sys/time.h>
- #include <sys/resource.h>
-+#include <sys/sysmacros.h>
- #include <fcntl.h>
- #include <pwd.h>
- #include <grp.h>
-diff --git a/src/mount-monitor.c b/src/mount-monitor.c
-index 573a69c..0cfa167 100644
---- a/src/mount-monitor.c
-+++ b/src/mount-monitor.c
-@@ -29,6 +29,7 @@
- #include <string.h>
- #include <sys/types.h>
- #include <sys/stat.h>
-+#include <sys/sysmacros.h>
- #include <mntent.h>
- 
- #include <glib.h>
-diff --git a/tools/udisks.c b/tools/udisks.c
-index 97e80d7..22a7d87 100644
---- a/tools/udisks.c
-+++ b/tools/udisks.c
-@@ -31,6 +31,7 @@
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <sys/wait.h>
-+#include <sys/sysmacros.h>
- #include <fcntl.h>
- #include <pwd.h>
- #include <grp.h>
-diff --git a/tools/umount-udisks.c b/tools/umount-udisks.c
-index 2813fe0..d915660 100644
---- a/tools/umount-udisks.c
-+++ b/tools/umount-udisks.c
-@@ -30,6 +30,7 @@
- #include <string.h>
- #include <sys/types.h>
- #include <sys/stat.h>
-+#include <sys/sysmacros.h>
- #include <fcntl.h>
- #include <pwd.h>
- #include <grp.h>
--- 
-2.14.1
-
diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index 04a632dd8d..909b3c8bd4 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -4,21 +4,27 @@ config BR2_PACKAGE_UDISKS
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # spidermonkey
 	depends on BR2_INSTALL_LIBSTDCPP # spidermonkey
 	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS # gobject-introspection
 	depends on BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS # spidermonkey
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # spidermonkey
+	depends on BR2_SYSTEM_ENABLE_NLS # volume_key
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # spidermonkey, gobject-introspection
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # polkit
-	depends on BR2_USE_MMU # lvm2
+	depends on BR2_USE_MMU # lvm2, gobject-introspection
 	depends on BR2_USE_WCHAR # dbus-glib -> glib2
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # polkit, lvm2, parted
 	depends on !BR2_STATIC_LIBS # lvm2, spidermonkey
+	depends on BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
-	select BR2_PACKAGE_SG3_UTILS
-	select BR2_PACKAGE_POLKIT
-	select BR2_PACKAGE_PARTED
-	select BR2_PACKAGE_LVM2
+	select BR2_PACKAGE_GOBJECT_INTROSPECTION
 	select BR2_PACKAGE_LIBATASMART
+	select BR2_PACKAGE_LIBBLOCKDEV
 	select BR2_PACKAGE_LIBGUDEV
+	select BR2_PACKAGE_LVM2
+	select BR2_PACKAGE_PARTED
+	select BR2_PACKAGE_POLKIT
+	select BR2_PACKAGE_SG3_UTILS
+	select BR2_PACKAGE_LIBXSLT
 	help
 	  The udisks project provides
 
@@ -36,24 +42,25 @@ if BR2_PACKAGE_UDISKS
 config BR2_PACKAGE_UDISKS_LVM2
 	bool "lvm2 support"
 	# The lvm app library can't compile against musl
-	depends on BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_LVM2_APP_LIBRARY
 	help
 	  Enable LVM2 support
 
-comment "lvm2 support needs a glibc toolchain"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
-
 endif
 
 comment "udisks needs udev /dev management"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_HAS_UDEV
 
-comment "udisks needs a glibc or musl toolchain with locale, C++, wchar, dynamic library, NPTL, gcc >= 4.9"
+comment "udisks support needs NLS enabled"
+	depends on !BR2_SYSTEM_ENABLE_NLS
+
+comment "udisks needs a glibc toolchain with locale, C++, wchar, dynamic library, NPTL, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS
-	depends on !BR2_ENABLE_LOCALE || BR2_TOOLCHAIN_USES_UCLIBC || \
+	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
+	depends on !BR2_ENABLE_LOCALE || \
+		!BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_INSTALL_LIBSTDCPP || \
 		BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
diff --git a/package/udisks/udisks.hash b/package/udisks/udisks.hash
index b40161e323..f8947b0b09 100644
--- a/package/udisks/udisks.hash
+++ b/package/udisks/udisks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 f2ec82eb0ea7e01dc299b5b29b3c18cdf861236ec43dcff66b3552b4b31c6f71  udisks-1.0.5.tar.gz
-sha256 7d30f41a79a9b453b4972a6d7e3425ff104b39232891bde8ba659f1adb21f771  COPYING
+sha256 d28367bdacfa039719327e68300b6118427874f2dc53ff7109dedb70a7289819  udisks-2.8.4.tar.bz2
+sha256 98046e932dc6c739001e79d7079a3bd958fc55475dcd917d27f884c0c93525cc  COPYING
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index fe8932a92e..5b37ac3402 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -4,28 +4,37 @@
 #
 ################################################################################
 
-UDISKS_VERSION = 1.0.5
-UDISKS_SITE = http://hal.freedesktop.org/releases
+UDISKS_VERSION = 2.8.4
+UDISKS_SOURCE = udisks-$(UDISKS_VERSION).tar.bz2
+UDISKS_SITE = https://github.com/storaged-project/udisks/releases/download/udisks-$(UDISKS_VERSION)
 UDISKS_LICENSE = GPL-2.0+
 UDISKS_LICENSE_FILES = COPYING
-# For 0002-Fix-systemd-service-file.patch
-UDISKS_AUTORECONF = YES
 
 UDISKS_DEPENDENCIES = \
 	sg3_utils \
+	host-autoconf-archive \
 	host-pkgconf \
+	host-gettext \
 	udev \
 	dbus \
 	dbus-glib \
 	polkit \
 	parted \
-	lvm2 \
 	libatasmart \
-	libgudev
+	libgudev \
+	libblockdev \
+	libxslt
 
-UDISKS_CONF_OPTS = --disable-remote-access --disable-man-pages
+UDISKS_CONF_OPTS = \
+	--disable-remote-access \
+	--disable-man \
+	--disable-btrfs \
+	--disable-iscsi \
+	--disable-lsm \
+	--disable-zram
 
 ifeq ($(BR2_PACKAGE_UDISKS_LVM2),y)
+UDISKS_DEPENDENCIES += lvm2
 UDISKS_CONF_OPTS += --enable-lvm2
 endif
 
-- 
2.20.1
