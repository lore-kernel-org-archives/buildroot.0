Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3C1C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 09:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 564D04177C;
	Mon,  5 Feb 2024 09:53:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 564D04177C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f_qC3M3MAQuJ; Mon,  5 Feb 2024 09:53:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B4BB417A9;
	Mon,  5 Feb 2024 09:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B4BB417A9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B3BEF1BF40B
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 09:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C3AD60EFD
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 09:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C3AD60EFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hUUQzTz3ZPEO for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 09:52:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E1CC60E83
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 09:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E1CC60E83
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED2AA869CD; Mon,  5 Feb 2024 09:52:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 10:52:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 00599be13ed5022bab7e49fee8db07e20af8a4ba
X-Git-Newrev: 6410ac6918add0070716dbcf61327457a676e4fa
X-Patchwork-Hint: ignore
Message-Id: <20240205095256.ED2AA869CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libblockdev: bump to version 3.1.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6410ac6918add0070716dbcf61327457a676e4fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Rework strerror_l() patch by declaring it only in utils.h as a macro
* select BR2_PACKAGE_UTIL_LINUX_LIBUUID since it's now mandatory

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Arnout:
 - Preserve author of patch 0001.
 - Update .checkpackageignore.
]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore                                |   1 -
 ...ovide-replacement-function-for-strerror_l.patch | 158 ++++-----------------
 package/libblockdev/Config.in                      |   5 +-
 package/libblockdev/libblockdev.hash               |   2 +-
 package/libblockdev/libblockdev.mk                 |   2 +-
 5 files changed, 34 insertions(+), 134 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index a95aaf262c..15ceb65fd8 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -594,7 +594,6 @@ package/libatasmart/0001-strpool-cross-flags.patch Upstream
 package/libavl/0001-fix-makefile.patch Upstream
 package/libb64/0001-Integer-overflows.patch Upstream
 package/libb64/0002-Initialize-C++-objects.patch Upstream
-package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch Upstream
 package/libcdaudio/0001-libcdaudio-enable-autoreconf.patch Upstream
 package/libcec/0001-cecloader-h-fix-null-return.patch Upstream
 package/libcgi/0001-CMakeLists.txt-honour-BUILD_TESTING.patch Upstream
diff --git a/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch b/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
index 987d28f82e..f7f75c9c14 100644
--- a/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
+++ b/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
@@ -1,29 +1,25 @@
-From 2acf5a8d4858035396ee45d96c824e0481644d36 Mon Sep 17 00:00:00 2001
+From 01883cc14904e55d90955ad7cd9fc55bc18364ac Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sat, 29 Aug 2020 16:04:15 +0200
+Date: Sat, 20 Jan 2024 13:29:28 +0100
 Subject: [PATCH] Provide replacement function for strerror_l()
 
 strerror_l() is not implemented in some C libraries, such as uClibc,
-so let's provide a simple replacement function that falls back on
-strerror().
+so let's provide a simple replacement define that falls back on
+strerror() in utils.h header and include it where missing.
 
-Upstream status: Not Applicable since it's due uclibc only
+Upstream: N/A since it's due uclibc only
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
-[Giulio: ported to version 3.0+]
+[Giulio: ported to version 3.0 and 3.1]
 ---
- configure.ac                    | 2 ++
- src/plugins/crypto.c            | 7 +++++++
- src/plugins/nvme/nvme-error.c   | 8 ++++++++
- src/plugins/nvme/nvme-fabrics.c | 8 ++++++++
- src/plugins/nvme/nvme-op.c      | 8 ++++++++
- src/plugins/part.c              | 9 +++++++++
- src/utils/module.c              | 8 +++++++-
- 7 files changed, 49 insertions(+), 1 deletion(-)
+ configure.ac       | 2 ++
+ src/utils/module.c | 1 +
+ src/utils/utils.h  | 4 ++++
+ 3 files changed, 7 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 0a8ce4a7..dfbddb39 100644
+index 02b26e3e..67341134 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -120,6 +120,8 @@ AC_CHECK_HEADERS([dlfcn.h string.h unistd.h sys/fcntl.h sys/ioctl.h linux/random
@@ -35,127 +31,33 @@ index 0a8ce4a7..dfbddb39 100644
  AC_ARG_WITH([escrow],
      AS_HELP_STRING([--with-escrow], [support escrow @<:@default=yes@:>@]),
      [],
-diff --git a/src/plugins/crypto.c b/src/plugins/crypto.c
-index c5f719ca..b2ae3f56 100644
---- a/src/plugins/crypto.c
-+++ b/src/plugins/crypto.c
-@@ -62,6 +62,13 @@
- 
- #define UNUSED __attribute__((unused))
- 
-+#if !defined(HAVE_STRERROR_L)
-+static char *strerror_l(int errnum, locale_t locale UNUSED)
-+{
-+	return strerror(errnum);
-+}
-+#endif
-+
- /**
-  * SECTION: crypto
-  * @short_description: plugin for operations with encrypted devices
-diff --git a/src/plugins/nvme/nvme-error.c b/src/plugins/nvme/nvme-error.c
-index 4bd4d771..618b6aef 100644
---- a/src/plugins/nvme/nvme-error.c
-+++ b/src/plugins/nvme/nvme-error.c
-@@ -34,6 +34,14 @@
- #include "nvme.h"
- #include "nvme-private.h"
- 
-+#define UNUSED __attribute__((unused))
-+
-+#if !defined(HAVE_STRERROR_L)
-+static char *strerror_l(int errnum, locale_t locale UNUSED)
-+{
-+    return strerror(errnum);
-+}
-+#endif
- 
- /**
-  * bd_nvme_error_quark: (skip)
-diff --git a/src/plugins/nvme/nvme-fabrics.c b/src/plugins/nvme/nvme-fabrics.c
-index 1877845f..5fcbeddc 100644
---- a/src/plugins/nvme/nvme-fabrics.c
-+++ b/src/plugins/nvme/nvme-fabrics.c
-@@ -36,6 +36,14 @@
- #include "nvme.h"
- #include "nvme-private.h"
- 
-+#define UNUSED __attribute__((unused))
-+
-+#if !defined(HAVE_STRERROR_L)
-+static char *strerror_l(int errnum, locale_t locale UNUSED)
-+{
-+    return strerror(errnum);
-+}
-+#endif
- 
- /* nvme-cli defaults */
- #define PATH_NVMF_CONFIG  "/etc/nvme/config.json"
-diff --git a/src/plugins/nvme/nvme-op.c b/src/plugins/nvme/nvme-op.c
-index dbef4f3a..7bafd7a3 100644
---- a/src/plugins/nvme/nvme-op.c
-+++ b/src/plugins/nvme/nvme-op.c
-@@ -35,6 +35,14 @@
- #include "nvme.h"
- #include "nvme-private.h"
- 
-+#define UNUSED __attribute__((unused))
-+
-+#if !defined(HAVE_STRERROR_L)
-+static char *strerror_l(int errnum, locale_t locale UNUSED)
-+{
-+    return strerror(errnum);
-+}
-+#endif
- 
- /**
-  * bd_nvme_device_self_test:
-diff --git a/src/plugins/part.c b/src/plugins/part.c
-index 46d31137..6234e013 100644
---- a/src/plugins/part.c
-+++ b/src/plugins/part.c
-@@ -26,6 +26,15 @@
- 
- #include "part.h"
- 
-+#define UNUSED __attribute__((unused))
-+
-+#if !defined(HAVE_STRERROR_L)
-+static char *strerror_l(int errnum, locale_t locale UNUSED)
-+{
-+	return strerror(errnum);
-+}
-+#endif
-+
- /**
-  * SECTION: part
-  * @short_description: plugin for operations with partition tables
 diff --git a/src/utils/module.c b/src/utils/module.c
-index 6557c3ab..69dd4731 100644
+index 6557c3ab..5893f0ac 100644
 --- a/src/utils/module.c
 +++ b/src/utils/module.c
-@@ -74,6 +74,13 @@ static void set_kmod_logging (struct kmod_ctx *ctx) {
-     kmod_set_log_fn (ctx, utils_kmod_log_redirect, NULL);
- }
+@@ -28,6 +28,7 @@
+ #include "module.h"
+ #include "exec.h"
+ #include "logging.h"
++#include "utils.h"
+ 
+ #define UNUSED __attribute__((unused))
+ 
+diff --git a/src/utils/utils.h b/src/utils/utils.h
+index 801a8b6e..b2bdf0d0 100644
+--- a/src/utils/utils.h
++++ b/src/utils/utils.h
+@@ -9,6 +9,10 @@
+ #include "dbus.h"
+ #include "logging.h"
  
 +#if !defined(HAVE_STRERROR_L)
-+static char *strerror_l(int errnum, locale_t locale UNUSED)
-+{
-+	return strerror(errnum);
-+}
++#define strerror_l(errnum, locale)      strerror(errnum)
 +#endif
 +
  /**
-  * bd_utils_have_kernel_module:
-  * @module_name: name of the kernel module to check
-@@ -259,7 +266,6 @@ gboolean bd_utils_unload_kernel_module (const gchar *module_name, GError **error
-     return TRUE;
- }
- 
--
- static BDUtilsLinuxVersion detected_linux_ver;
- static gboolean have_linux_ver = FALSE;
- 
+  * SECTION: utils
+  * @short_description: library providing utility functions used by the blockdev library and its plugins
 -- 
 2.34.1
 
diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
index 527ba79e4e..e0449628b4 100644
--- a/package/libblockdev/Config.in
+++ b/package/libblockdev/Config.in
@@ -8,6 +8,8 @@ config BR2_PACKAGE_LIBBLOCKDEV
 	depends on BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_KMOD
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  libblockdev is a C library supporting GObject introspection
 	  for manipulation of block devices. It has a plugin-based
@@ -30,7 +32,6 @@ config BR2_PACKAGE_LIBBLOCKDEV_CRYPTO
 config BR2_PACKAGE_LIBBLOCKDEV_FS
 	bool "filesystem"
 	depends on BR2_ENABLE_LOCALE # parted
-	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	select BR2_PACKAGE_PARTED
 	select BR2_PACKAGE_E2FSPROGS
@@ -62,7 +63,6 @@ config BR2_PACKAGE_LIBBLOCKDEV_PART
 	bool "part"
 	depends on BR2_ENABLE_LOCALE # parted
 	select BR2_PACKAGE_PARTED
-	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK
 
 comment "part plugin needs a toolchain w/ locale"
@@ -70,7 +70,6 @@ comment "part plugin needs a toolchain w/ locale"
 
 config BR2_PACKAGE_LIBBLOCKDEV_SWAP
 	bool "swap"
-	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 
 endif
diff --git a/package/libblockdev/libblockdev.hash b/package/libblockdev/libblockdev.hash
index 5f9a8a7e6c..79700a4996 100644
--- a/package/libblockdev/libblockdev.hash
+++ b/package/libblockdev/libblockdev.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  49841ff92db0ab032931e6f2b5eab63e5969b0ddc14b067b60e46a6eb6c60e47  libblockdev-3.0.4.tar.gz
+sha256  41e4af66c9d78e795302d37825dfd88a4970f82da7b4ebe6487feba2afae44fb  libblockdev-3.1.0.tar.gz
 sha256  97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  LICENSE
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index e0fca2b95c..ebf01acfb5 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBLOCKDEV_VERSION = 3.0.4
+LIBBLOCKDEV_VERSION = 3.1.0
 LIBBLOCKDEV_SITE = https://github.com/storaged-project/libblockdev/releases/download/$(LIBBLOCKDEV_VERSION)-1
 LIBBLOCKDEV_LICENSE = LGPL-2.1
 LIBBLOCKDEV_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
