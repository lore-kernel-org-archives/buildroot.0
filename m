From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 2 Jun 2021 20:14:24 +0200
Subject: [Buildroot] [git commit branch/next] package/udisks: bump to
 version 2.92
Message-ID: <20210602195918.9B4A68A5A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=66ddec89e8867435e696dcd4e50473f62f3bc8d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump version to 2.92 by:
- removing local patches that have been upstreamed
- adding BR2_TOOLCHAIN_HAS_SYNC_4 dependency
- adding libblockdev dependencies
- adding libmount(contained in util-linux package) dependency
- moving download site to github since it's the new upstream address
- disabling all useless udisks's build option to shrink its size and t
  use it as a daemon

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-fix-build-with-newer-glibc-versions.patch | 29 --------
 package/udisks/0002-Fix-systemd-service-file.patch | 33 ---------
 ...tion-issue-with-missing-sys-sysmacros.h-i.patch | 81 ----------------------
 package/udisks/Config.in                           | 17 +++--
 package/udisks/udisks.hash                         |  4 +-
 package/udisks/udisks.mk                           | 27 ++++++--
 6 files changed, 35 insertions(+), 156 deletions(-)

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
index efd3b619bf..e128a48ab5 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -7,18 +7,26 @@ config BR2_PACKAGE_UDISKS
 	depends on BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS # spidermonkey
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # spidermonkey
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # polkit
-	depends on BR2_USE_MMU # lvm2
 	depends on BR2_USE_WCHAR # dbus-glib -> glib2
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC # polkit, lvm2
-	depends on !BR2_STATIC_LIBS # lvm2, spidermonkey
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libblockdev -> cryptsetup -> json-c
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # polkit
+	depends on !BR2_STATIC_LIBS # spidermonkey
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
 	select BR2_PACKAGE_LIBATASMART
+	select BR2_PACKAGE_LIBBLOCKDEV
+	select BR2_PACKAGE_LIBBLOCKDEV_CRYPTO
+	select BR2_PACKAGE_LIBBLOCKDEV_FS
+	select BR2_PACKAGE_LIBBLOCKDEV_LOOP
+	select BR2_PACKAGE_LIBBLOCKDEV_MDRAID
+	select BR2_PACKAGE_LIBBLOCKDEV_PART
+	select BR2_PACKAGE_LIBBLOCKDEV_SWAP
 	select BR2_PACKAGE_LIBGUDEV
-	select BR2_PACKAGE_LVM2
 	select BR2_PACKAGE_PARTED
 	select BR2_PACKAGE_POLKIT
 	select BR2_PACKAGE_SG3_UTILS
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	help
 	  The udisks project provides
 
@@ -53,6 +61,7 @@ comment "udisks needs udev /dev management"
 comment "udisks needs a glibc or musl toolchain with locale, C++, wchar, dynamic library, NPTL, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_ENABLE_LOCALE || BR2_TOOLCHAIN_USES_UCLIBC || \
 		!BR2_INSTALL_LIBSTDCPP || \
 		BR2_STATIC_LIBS || \
diff --git a/package/udisks/udisks.hash b/package/udisks/udisks.hash
index b40161e323..303a0aae01 100644
--- a/package/udisks/udisks.hash
+++ b/package/udisks/udisks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 f2ec82eb0ea7e01dc299b5b29b3c18cdf861236ec43dcff66b3552b4b31c6f71  udisks-1.0.5.tar.gz
-sha256 7d30f41a79a9b453b4972a6d7e3425ff104b39232891bde8ba659f1adb21f771  COPYING
+sha256  bda6f9d7edc632c57e55862731a8ffeff2413fa4346708a22bf31ed72b0fe058  udisks-2.9.2.tar.bz2
+sha256  98046e932dc6c739001e79d7079a3bd958fc55475dcd917d27f884c0c93525cc  COPYING
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index c6119a8b80..3a75421f2a 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -4,26 +4,39 @@
 #
 ################################################################################
 
-UDISKS_VERSION = 1.0.5
-UDISKS_SITE = http://hal.freedesktop.org/releases
+UDISKS_VERSION = 2.9.2
+UDISKS_SOURCE = udisks-$(UDISKS_VERSION).tar.bz2
+UDISKS_SITE = https://github.com/storaged-project/udisks/releases/download/udisks-$(UDISKS_VERSION)
 UDISKS_LICENSE = GPL-2.0+
 UDISKS_LICENSE_FILES = COPYING
-# For 0002-Fix-systemd-service-file.patch
-UDISKS_AUTORECONF = YES
 
 UDISKS_DEPENDENCIES = \
 	host-pkgconf \
 	dbus \
 	dbus-glib \
 	libatasmart \
+	libblockdev \
 	libgudev \
-	lvm2 \
 	parted \
 	polkit \
 	sg3_utils \
-	udev
+	udev \
+	util-linux
 
-UDISKS_CONF_OPTS = --disable-remote-access --disable-man-pages
+UDISKS_CONF_OPTS = \
+	--disable-acl \
+	--disable-bcache \
+	--disable-btrfs \
+	--disable-fhs-media \
+	--disable-introspection \
+	--disable-iscsi \
+	--disable-lsm \
+	--disable-lvm2 \
+	--disable-lvmcache \
+	--disable-man \
+	--disable-rpath \
+	--disable-vdo \
+	--disable-zram
 
 ifeq ($(BR2_PACKAGE_UDISKS_LVM2),y)
 UDISKS_CONF_OPTS += --enable-lvm2
