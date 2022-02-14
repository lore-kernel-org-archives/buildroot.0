Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F06C433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 20:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74AC860E69;
	Mon, 14 Feb 2022 20:15:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dwvZpaTzx-Kv; Mon, 14 Feb 2022 20:15:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 834B460F2C;
	Mon, 14 Feb 2022 20:15:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5CFCB1BF348
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BF4260F2C
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:14:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WEcvYgqfmZCT for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 20:14:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5064160E69
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 20:14:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 29DA181734; Mon, 14 Feb 2022 20:06:42 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 21:04:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3e4d43911365653e0f9e2423d473fef85d347e32
X-Git-Newrev: 6d5061c711fe0e64c0fef466f1221aa8e6202608
X-Patchwork-Hint: ignore
Message-Id: <20220214200642.29DA181734@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/neon: fix ssl build without threads
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6d5061c711fe0e64c0fef466f1221aa8e6202608
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following ssl build failure without threads raised since bump to
version 0.32.2 in commit 029a6dc3e3320984c6369747e0b79060f13b2afc and
https://github.com/notroj/neon/commit/281c84fc3996c757efdf6e9b3f906d7a1fc08b1d:

ne_openssl.c:43:10: fatal error: pthread.h: No such file or directory
   43 | #include <pthread.h>
      |          ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/da995ef26001357e51a5907de9c6111b9ff89bdf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...vertise-TS_SSL-feature-with-OpenSSL-1.1.0.patch | 76 ++++++++++++++++++++++
 .../neon/0002-configure.ac-fix-autoreconf.patch    | 28 ++++++++
 package/neon/neon.mk                               |  2 +
 3 files changed, 106 insertions(+)

diff --git a/package/neon/0001-Revert-Advertise-TS_SSL-feature-with-OpenSSL-1.1.0.patch b/package/neon/0001-Revert-Advertise-TS_SSL-feature-with-OpenSSL-1.1.0.patch
new file mode 100644
index 0000000000..02088bfe02
--- /dev/null
+++ b/package/neon/0001-Revert-Advertise-TS_SSL-feature-with-OpenSSL-1.1.0.patch
@@ -0,0 +1,76 @@
+From 8f9e110b391f065536780d19c2257ad7afd83522 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 31 Jan 2022 23:42:13 +0100
+Subject: [PATCH] Revert "Advertise TS_SSL feature with OpenSSL >= 1.1.0."
+
+This reverts commit 281c84fc3996c757efdf6e9b3f906d7a1fc08b1d.
+
+Indeed openssl can be built on toolchains without threads support which
+will result in the following build failure:
+
+ne_openssl.c:43:10: fatal error: pthread.h: No such file or directory
+   43 | #include <pthread.h>
+      |          ^~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/da995ef26001357e51a5907de9c6111b9ff89bdf
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/notroj/neon/pull/71]
+---
+ macros/neon.m4   | 15 ++++-----------
+ src/ne_openssl.c |  4 ++--
+ 2 files changed, 6 insertions(+), 13 deletions(-)
+
+diff --git a/macros/neon.m4 b/macros/neon.m4
+index 129d4ac..5a5fb1b 100644
+--- a/macros/neon.m4
++++ b/macros/neon.m4
+@@ -960,13 +960,9 @@ yes|openssl)
+    AC_CHECK_HEADERS(openssl/ssl.h openssl/opensslv.h,,
+    [AC_MSG_ERROR([OpenSSL headers not found, cannot enable SSL support])])
+ 
++   # Enable EGD support if using 0.9.7 or newer
+    NE_CHECK_OPENSSLVER(ne_cv_lib_ssl097, 0.9.7, 0x00907000L)
+-   NE_CHECK_OPENSSLVER(ne_cv_lib_ssl110, 1.1.0, 0x10100000L)
+-   if test "$ne_cv_lib_ssl110" = "yes"; then
+-      NE_ENABLE_SUPPORT(SSL, [SSL support enabled, using OpenSSL $NE_SSL_VERSION])
+-      AC_DEFINE(HAVE_OPENSSL11, 1, [Enable OpenSSL 1.1 support])
+-   elif test "$ne_cv_lib_ssl097" = "yes"; then
+-      # Enable EGD support if using 0.9.7 or newer
++   if test "$ne_cv_lib_ssl097" = "yes"; then
+       AC_MSG_NOTICE([OpenSSL >= 0.9.7; EGD support not needed in neon])
+       NE_ENABLE_SUPPORT(SSL, [SSL support enabled, using OpenSSL $NE_SSL_VERSION])
+       NE_CHECK_FUNCS(CRYPTO_set_idptr_callback SSL_SESSION_cmp)
+@@ -1074,11 +1070,8 @@ CC/CFLAGS/LIBS must be used to make the POSIX library interfaces
+ available]),,
+ enable_threadsafe_ssl=no)
+ 
+-case ${enable_threadsafe_ssl}X${ne_cv_lib_ssl110} in
+-*Xyes)
+-  NE_ENABLE_SUPPORT(TS_SSL, [OpenSSL is natively thread-safe])
+-  ;;
+-posixX*|yesX*)
++case $enable_threadsafe_ssl in
++posix|yes)
+   ne_pthr_ok=yes
+   AC_CHECK_FUNCS([pthread_mutex_init pthread_mutex_lock],,[ne_pthr_ok=no])
+   if test "${ne_pthr_ok}" = "no"; then
+diff --git a/src/ne_openssl.c b/src/ne_openssl.c
+index 41a5c05..96c768e 100644
+--- a/src/ne_openssl.c
++++ b/src/ne_openssl.c
+@@ -1194,8 +1194,8 @@ char *ne_vstrhash(unsigned int flags, va_list ap)
+     return ne__strhash2hex(v, vlen, flags);
+ }
+ 
+-#if defined(NE_HAVE_TS_SSL) && OPENSSL_VERSION_NUMBER < 0x10100000L
+-/* From OpenSSL 1.1.0 locking callbacks are no longer needed. */
++#if defined(NE_HAVE_TS_SSL) && OPENSSL_VERSION_NUMBER < 0x10101000L
++/* For OpenSSL 1.1.1 locking callbacks are no longer need at all. */
+ #define WITH_OPENSSL_LOCKING (1)
+ 
+ /* Implementation of locking callbacks to make OpenSSL thread-safe.
+-- 
+2.34.1
+
diff --git a/package/neon/0002-configure.ac-fix-autoreconf.patch b/package/neon/0002-configure.ac-fix-autoreconf.patch
new file mode 100644
index 0000000000..cd63d1ed41
--- /dev/null
+++ b/package/neon/0002-configure.ac-fix-autoreconf.patch
@@ -0,0 +1,28 @@
+From cf779609a5dd38f0a8fdb3c4539371f13fd3a24a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 8 Feb 2022 18:34:25 +0100
+Subject: [PATCH] configure.ac: fix autoreconf
+
+Add AC_CONFIG_MACRO_DIR(macros) to fix autoreconf
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not sent yet]
+---
+ configure.ac | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 37b14ec..122151d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1,5 +1,7 @@
+ AC_PREREQ(2.58) dnl 2.58 required for AS_HELP_STRING
+ 
++AC_CONFIG_MACRO_DIR(macros)
++
+ dnl Extract the version (sans LF) from .version, created at release-time.
+ m4_define(ne_version, [m4_translit(m4_include(.version), [
+ ])])
+-- 
+2.34.1
+
diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 3bbd12561f..eae6bfbad6 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -10,6 +10,8 @@ NEON_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (manual and tests)
 NEON_LICENSE_FILES = src/COPYING.LIB test/COPYING README.md
 NEON_CPE_ID_VENDOR = webdav
 NEON_INSTALL_STAGING = YES
+# We're patching configure.ac
+NEON_AUTORECONF = YES
 NEON_CONF_OPTS = --without-gssapi --disable-rpath
 NEON_CONFIG_SCRIPTS = neon-config
 NEON_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
