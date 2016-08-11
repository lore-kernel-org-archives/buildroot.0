From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Thu, 11 Aug 2016 23:39:56 +0530
Subject: [Buildroot] [PATCH 1/1] util-linux: bump version to 2.28.1
Message-ID: <1470938996-10477-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patch 0001-build-sys-fix-uClibc-ng-scanf-check.patch.
Add support for new config option --enable-libuuid-force-uuidd

Release notes:
https://www.kernel.org/pub/linux/utils/util-linux/v2.28/v2.28.1-ReleaseNotes

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 .../0001-build-sys-fix-uClibc-ng-scanf-check.patch | 34 ----------------------
 package/util-linux/Config.in                       | 10 +++++++
 package/util-linux/util-linux.hash                 |  2 +-
 package/util-linux/util-linux.mk                   |  8 ++---
 4 files changed, 15 insertions(+), 39 deletions(-)
 delete mode 100644 package/util-linux/0001-build-sys-fix-uClibc-ng-scanf-check.patch

diff --git a/package/util-linux/0001-build-sys-fix-uClibc-ng-scanf-check.patch b/package/util-linux/0001-build-sys-fix-uClibc-ng-scanf-check.patch
deleted file mode 100644
index 801b72b..0000000
--- a/package/util-linux/0001-build-sys-fix-uClibc-ng-scanf-check.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From bac7fbdb2d141879526ca4342d56d2c749ba8af5 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@uclibc-ng.org>
-Date: Fri, 3 Jun 2016 04:23:28 +0200
-Subject: [PATCH] build-sys: fix uClibc-ng scanf check
-
-uClibc-ng tries to be compatible with GNU libc and defines
-__GLIBC__ and pretend to be version 2.2.
-We once changed it to 2.10, but then some hard to fix problems
-in different software packages (gcc) occured.
-It would be better if we disable the special GNU libc checks
-for uClibc-ng here. uClibc-ng implements the required scanf
-functionality.
-
-Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 3ba723f..ec197ee 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -581,7 +581,7 @@ AC_CACHE_VAL([scanf_cv_alloc_modifier],
-      #include <stdio.h>
-      #include <unistd.h>
- 
--     #ifdef __GLIBC__
-+     #if defined(__GLIBC__) && !defined(__UCLIBC__)
- 
-      #if !(__GLIBC_PREREQ(2, 7))
-      #error %m is not available
--- 
-2.1.4
-
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 429dfa7..e5956b3 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -36,6 +36,16 @@ config BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  Install libuuid.
 
+if BR2_PACKAGE_UTIL_LINUX_LIBUUID
+
+config BR2_PACKAGE_UTIL_LINUX_LIBUUID_FORCE_UUIDD
+	bool "force uuidd"
+	depends on !BR2_PACKAGE_UTIL_LINUX_UUIDD
+	help
+	  Support uuidd even though the uuidd daemon is disabled.
+
+endif
+
 config BR2_PACKAGE_UTIL_LINUX_BINARIES
 	bool "install utilities"
 	depends on BR2_USE_MMU # fork()
diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index ca58102..17094f4 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/util-linux/v2.28/sha256sums.asc
-sha256	395847e2a18a2c317170f238892751e73a57104565344f8644090c8b091014bb	util-linux-2.28.tar.xz
+sha256	3ece4ea4a34ef786b68f5c415e848390424232abd1ee00f7ee5bddc30657b60f	util-linux-2.28.1.tar.xz
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 9c7bd87..d20902a 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -4,16 +4,15 @@
 #
 ################################################################################
 
-UTIL_LINUX_VERSION = 2.28
+UTIL_LINUX_VERSION_MAJOR = 2.28
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).1
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
-UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION)
+UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
 # README.licensing claims that some files are GPLv2-only, but this is not true.
 # Some files are GPLv3+ but only in tests.
 UTIL_LINUX_LICENSE = GPLv2+, BSD-4c, libblkid and libmount LGPLv2.1+, libuuid BSD-3c
 UTIL_LINUX_LICENSE_FILES = README.licensing Documentation/licenses/COPYING.GPLv2 Documentation/licenses/COPYING.UCB Documentation/licenses/COPYING.LGPLv2.1 Documentation/licenses/COPYING.BSD-3
-# For 0001-build-sys-fix-uClibc-ng-scanf-check.patch
-UTIL_LINUX_AUTORECONF = YES
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = host-pkgconf
 # uClibc needs NTP_LEGACY for sys/timex.h -> ntp_gettime() support
@@ -81,6 +80,7 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),--enable-libmount,--disable-libmount) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS),--enable-libsmartcols,--disable-libsmartcols) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBUUID),--enable-libuuid,--disable-libuuid) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBUUID_FORCE_UUIDD),--enable-libuuid-force-uuidd) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LINE),--enable-line,--disable-line) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),--enable-last --enable-login --enable-runuser --enable-su --enable-sulogin,--disable-last --disable-login --disable-runuser --disable-su --disable-sulogin) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOSETUP),--enable-losetup,--disable-losetup) \
-- 
2.6.2
