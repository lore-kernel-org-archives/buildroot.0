Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FA7CAC5B8
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 18:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B45A838E0;
	Sun,  5 Oct 2025 18:01:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gUv6H_ZVMiYA; Sun,  5 Oct 2025 18:01:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DC278239A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DC278239A;
	Sun,  5 Oct 2025 18:01:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 531F4909
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 18:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A10E406C6
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 18:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ncHhEDThBc12 for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 18:01:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A686240B2F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A686240B2F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A686240B2F
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 18:01:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0845.dip0.t-ipconnect.de [91.58.8.69])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 93F28A4C5E05
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 20:01:09 +0200 (CEST)
Received: from [192.168.1.144] (port=48768 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v5T2i-000000005AY-3Ky6
 for buildroot@buildroot.org; Sun, 05 Oct 2025 18:01:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  5 Oct 2025 20:01:08 +0200
Message-ID: <20251005180108.607235-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759687269;
 bh=LEeSQUQ3TEyjXv8mUnVerlq/P5Kzr/a4ibhN7A2yH1U=;
 h=From:To:Subject:Date:From;
 b=eOwSf2yWEh9JXWJ6kSjLg2orO++stR8uPqwo51rnhtyegWCL1B1rYcZgS6G2ltcwf
 ibX47dDlhm6I78Cxwxo8odK7EkZGqlVVpQy/jAFF4/10qQ5r2psy2PNtXNYXBp/wez
 UrfKFF7w7otOVxq0fg2ZUX/9d9llO1Khaf4DR9h6CvAfraMGKuXLKFxFYTBT5uNl0f
 Z4w2J5qeMPMCIE/IznM9bycpLh/B4Ttp+Er72KATjC3Pf0b1i3eDRs553rMb4oU0XR
 ct/7gu7Dqp30cjzv7Y11844TODqXXZwzeImid2RUch3yrwYXw5JsJztSQo9zSOUVQY
 xkEKULl70+NTw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=eOwSf2yW
Subject: [Buildroot] [PATCH 1/1] package/php: bump version to 8.4.13
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://www.php.net/releases/8.4/en.php

Changelog: https://www.php.net/ChangeLog-8.php#PHP_8_4

Removed patch 0006 which is included in this release, rebased remaining
patches.

php commit https://github.com/php/php-src/commit/1f847a0bdfea3f754e5d46f9e016ce2530e5d9a4
added a check on the httpd binary which requires STAGING_DIR being part
of SBINDIR as reported by apxs, adjust apache.mk accordingly.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/apache/apache.mk                      |   1 +
 ...1-acinclude.m4-don-t-unset-variables.patch |   8 +-
 .../0002-iconv-tweak-iconv-detection.patch    |  10 +-
 ...0003-configure-disable-the-phar-tool.patch |   8 +-
 .../0004-Call-apxs-with-correct-prefix.patch  |  16 +-
 .../0005-allow-opcache-cross-compiling.patch  |  21 +-
 .../php/0006-Sync-headers-installation.patch  | 478 ------------------
 package/php/php.hash                          |   4 +-
 package/php/php.mk                            |   2 +-
 9 files changed, 38 insertions(+), 510 deletions(-)
 delete mode 100644 package/php/0006-Sync-headers-installation.patch

diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 23332f3e85..500a45bbca 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -104,6 +104,7 @@ define APACHE_FIX_STAGING_APACHE_CONFIG
 	$(SED) 's%"/usr/bin"%"$(STAGING_DIR)/usr/bin"%' $(STAGING_DIR)/usr/bin/apxs
 	$(SED) 's%/usr/build%$(STAGING_DIR)/usr/build%' $(STAGING_DIR)/usr/bin/apxs
 	$(SED) 's%^prefix =.*%prefix = $(STAGING_DIR)/usr%' $(STAGING_DIR)/usr/build/config_vars.mk
+	$(SED) 's%^sbindir =.*%sbindir = $(STAGING_DIR)/usr/bin%' $(STAGING_DIR)/usr/build/config_vars.mk
 endef
 APACHE_POST_INSTALL_STAGING_HOOKS += APACHE_FIX_STAGING_APACHE_CONFIG
 
diff --git a/package/php/0001-acinclude.m4-don-t-unset-variables.patch b/package/php/0001-acinclude.m4-don-t-unset-variables.patch
index 9badbd1cc2..fe92fb4f55 100644
--- a/package/php/0001-acinclude.m4-don-t-unset-variables.patch
+++ b/package/php/0001-acinclude.m4-don-t-unset-variables.patch
@@ -9,8 +9,8 @@ Terminate them with extreme prejudice.
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [aduskett@gmail.com: Update for 7.3.0]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Bernd: rebased for 8.1.7]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[Bernd: rebased for 8.4.13]
 ---
  build/php.m4 | 4 ----
  1 file changed, 4 deletions(-)
@@ -19,7 +19,7 @@ diff --git a/build/php.m4 b/build/php.m4
 index e91ef988..9586c490 100644
 --- a/build/php.m4
 +++ b/build/php.m4
-@@ -1580,8 +1580,6 @@ dnl PHP_CHECK_FUNC_LIB
+@@ -1462,8 +1462,6 @@ dnl PHP_CHECK_FUNC_LIB
  dnl
  AC_DEFUN([PHP_CHECK_FUNC_LIB],[
    ifelse($2,,:,[
@@ -28,7 +28,7 @@ index e91ef988..9586c490 100644
    unset found
    AC_CHECK_LIB($2, $1, [found=yes], [
      AC_CHECK_LIB($2, __$1, [found=yes], [found=no])
-@@ -1616,8 +1616,6 @@ dnl and as a fall back in the specified library. Defines HAVE_func and
+@@ -1496,8 +1496,6 @@ dnl and as a fall back in the specified library. Defines HAVE_func and
  dnl HAVE_library if found and adds the library to LIBS.
  dnl
  AC_DEFUN([PHP_CHECK_FUNC],[
diff --git a/package/php/0002-iconv-tweak-iconv-detection.patch b/package/php/0002-iconv-tweak-iconv-detection.patch
index 758dd6133b..536a69fd18 100644
--- a/package/php/0002-iconv-tweak-iconv-detection.patch
+++ b/package/php/0002-iconv-tweak-iconv-detection.patch
@@ -15,8 +15,8 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 [Gustavo: update for 5.6.10]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [aduskett@gmail.com: Update for 8.0.7]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Bernd: rebased for 7.4.10, 7.4.13 & 8.1.7]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[Bernd: rebased for 8.4.13]
 ---
  build/php.m4 | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -25,10 +25,10 @@ diff --git a/build/php.m4 b/build/php.m4
 index 9586c490..8b3d47ed 100644
 --- a/build/php.m4
 +++ b/build/php.m4
-@@ -1976,7 +1976,7 @@ AC_DEFUN([PHP_SETUP_ICONV], [
-   dnl Check external libs for iconv funcs.
-   if test "$found_iconv" = "no"; then
+@@ -1839,7 +1839,7 @@
  
+   dnl Check external libs for iconv funcs.
+   AS_VAR_IF([found_iconv], [no], [
 -    for i in $PHP_ICONV /usr/local /usr; do
 +    for i in $PHP_ICONV; do
        if test -r $i/include/gnu-libiconv/iconv.h; then
diff --git a/package/php/0003-configure-disable-the-phar-tool.patch b/package/php/0003-configure-disable-the-phar-tool.patch
index 6bfaf6640f..ebde912861 100644
--- a/package/php/0003-configure-disable-the-phar-tool.patch
+++ b/package/php/0003-configure-disable-the-phar-tool.patch
@@ -12,8 +12,8 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 [Gustavo: update for autoreconf/configure.in]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [Aduskett: update for 8.0.7]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Bernd: rebased for 7.4.10, 7.4.13 & 8.1.7]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[Bernd: rebased for 8.4.13]
 ---
  configure.ac | 9 ++-------
  1 file changed, 2 insertions(+), 7 deletions(-)
@@ -22,7 +22,7 @@ diff --git a/configure.ac b/configure.ac
 index 0dfab302..6026fb66 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1638,13 +1638,8 @@ CFLAGS_CLEAN="$CFLAGS \$(PROF_FLAGS)"
+@@ -1585,13 +1585,8 @@ CFLAGS_CLEAN="$CFLAGS \$(PROF_FLAGS)"
  CFLAGS="\$(CFLAGS_CLEAN) $standard_libtool_flag"
  CXXFLAGS="$CXXFLAGS $standard_libtool_flag \$(PROF_FLAGS)"
  
@@ -36,7 +36,7 @@ index 0dfab302..6026fb66 100644
 +pharcmd=
 +pharcmd_install=
  
- all_targets="$lcov_target \$(OVERALL_TARGET) \$(PHP_MODULES) \$(PHP_ZEND_EX) \$(PHP_BINARIES) $pharcmd"
+ all_targets="\$(OVERALL_TARGET) \$(PHP_MODULES) \$(PHP_ZEND_EX) \$(PHP_BINARIES) $pharcmd"
  install_targets="$install_sapi $install_modules $install_binaries install-build install-headers install-programs $install_pear $pharcmd_install"
 -- 
 2.14.3
diff --git a/package/php/0004-Call-apxs-with-correct-prefix.patch b/package/php/0004-Call-apxs-with-correct-prefix.patch
index 3a1a580084..cf8fe2cbfd 100644
--- a/package/php/0004-Call-apxs-with-correct-prefix.patch
+++ b/package/php/0004-Call-apxs-with-correct-prefix.patch
@@ -17,6 +17,8 @@ To fix this, add -S PREFIX='$(INSTALL_ROOT)/usr' to apxs call in configure
 Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [aduskett@gmail.com: Update for 8.0.7]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[Bernd: rebased for 8.4.13]
 ---
  sapi/apache2handler/config.m4 | 3 +++
  1 file changed, 3 insertions(+)
@@ -25,20 +27,20 @@ diff --git a/sapi/apache2handler/config.m4 b/sapi/apache2handler/config.m4
 index 55c16179..68ce66c0 100644
 --- a/sapi/apache2handler/config.m4
 +++ b/sapi/apache2handler/config.m4
-@@ -63,10 +63,12 @@ if test "$PHP_APXS2" != "no"; then
-     AC_MSG_ERROR([Please note that Apache version >= 2.0.44 is required])
-   fi
+@@ -68,10 +68,12 @@
+   AS_VERSION_COMPARE([$APACHE_VERSION], [2.4.0],
+     [AC_MSG_ERROR([Please note that Apache version >= 2.4 is required])])
  
 +  APXS_PREFIX='$(INSTALL_ROOT)'/usr
-   APXS_LIBEXECDIR='$(INSTALL_ROOT)'`$APXS -q LIBEXECDIR`
-   if test -z `$APXS -q SYSCONFDIR`; then
+   APXS_LIBEXECDIR='$(INSTALL_ROOT)'$($APXS -q LIBEXECDIR)
+   if test -z $($APXS -q SYSCONFDIR); then
      INSTALL_IT="\$(mkinstalldirs) '$APXS_LIBEXECDIR' && \
                   $APXS -S LIBEXECDIR='$APXS_LIBEXECDIR' \
 +                       -S PREFIX='$APXS_PREFIX' \
                         -i -n php"
    else
-     APXS_SYSCONFDIR='$(INSTALL_ROOT)'`$APXS -q SYSCONFDIR`
-@@ -74,6 +76,7 @@ if test "$PHP_APXS2" != "no"; then
+     APXS_SYSCONFDIR='$(INSTALL_ROOT)'$($APXS -q SYSCONFDIR)
+@@ -79,6 +81,7 @@ if test "$PHP_APXS2" != "no"; then
                  \$(mkinstalldirs) '$APXS_SYSCONFDIR' && \
                   $APXS -S LIBEXECDIR='$APXS_LIBEXECDIR' \
                         -S SYSCONFDIR='$APXS_SYSCONFDIR' \
diff --git a/package/php/0005-allow-opcache-cross-compiling.patch b/package/php/0005-allow-opcache-cross-compiling.patch
index 468864b0a4..1031b45f19 100644
--- a/package/php/0005-allow-opcache-cross-compiling.patch
+++ b/package/php/0005-allow-opcache-cross-compiling.patch
@@ -13,8 +13,8 @@ CFLAGS when opcache is enabled:
   -DHAVE_SHM_MMAP_FILE
 
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Bernd: rebased for 8.1.7 & 8.3.3]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[Bernd: rebased for 8.4.13]
 ---
  ext/opcache/config.m4 | 4 ----
  1 file changed, 4 deletions(-)
@@ -23,17 +23,20 @@ diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4
 index 5492fd92..10c150ff 100644
 --- a/ext/opcache/config.m4
 +++ b/ext/opcache/config.m4
-@@ -315,10 +315,6 @@ int main() {
- 
+@@ -346,13 +346,6 @@
+   PHP_ADD_EXTENSION_DEP(opcache, date)
    PHP_ADD_EXTENSION_DEP(opcache, pcre)
  
--  if test "$have_shm_ipc" != "yes" && test "$have_shm_mmap_posix" != "yes" && test "$have_shm_mmap_anon" != "yes"; then
--    AC_MSG_ERROR([No supported shared memory caching support was found when configuring opcache. Check config.log for any errors or missing dependencies.])
+-  if test "$php_cv_shm_ipc" != "yes" && test "$php_cv_shm_mmap_posix" != "yes" && test "$php_cv_shm_mmap_anon" != "yes"; then
+-    AC_MSG_FAILURE(m4_text_wrap([
+-      No supported shared memory caching support was found when configuring
+-      opcache.
+-    ]))
 -  fi
 -
-   if test "$PHP_OPCACHE_JIT" = "yes"; then
-     PHP_ADD_BUILD_DIR([$ext_builddir/jit], 1)
-     PHP_ADD_MAKEFILE_FRAGMENT($ext_srcdir/jit/Makefile.frag)
+   AS_VAR_IF([PHP_OPCACHE_JIT], [yes], [
+     PHP_ADD_BUILD_DIR([
+       $ext_builddir/jit
 -- 
 2.31.1
 
diff --git a/package/php/0006-Sync-headers-installation.patch b/package/php/0006-Sync-headers-installation.patch
deleted file mode 100644
index da1c6a6e4c..0000000000
--- a/package/php/0006-Sync-headers-installation.patch
+++ /dev/null
@@ -1,478 +0,0 @@
-From e77015d6e5a15d9ec7e30cba73465adc30861355 Mon Sep 17 00:00:00 2001
-From: Peter Kokot <peterkokot@gmail.com>
-Date: Sun, 28 Jan 2024 19:50:55 +0100
-Subject: [PATCH] Sync headers installation
-
-This syncs the installed sapi and extension headers on *nix and Windows
-systems by installing only what is intended outside of php-src.
-
-- ext/gd: without gd_arginfo.h and gd_compat.h
-- ext/hash: php_hash_joaat.h and php_hash_fnv.h added also on Windows
-  installation; xxhash/xxhash.h added on both installations as it is
-  included in php_hash_xxhash.h; Include path for xxhash.h changed to
-  relative so the php_hash_xxhash.h can be included outside of php-src;
-  Redundant include flags removed
-- ext/iconv: without iconv_arginfo.h
-- ext/mysqli: mysqli_mysqlnd.h was missing on Windows
-- ext/phar: php_phar.h was missing on Windows
-- ext/sodium: php_libsodium.h was missing on *nix
-- ext/xml: without xml_arginfo.h
-- sapi/cli: cli.h was missing on Windows
-
-Closes GH-13210
-Closes GH-13213
-
-[Thomas: minor backporting tweaks]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream: https://github.com/php/php-src/commit/52dba99d47563f38d8ed5f84690a3cb2c1785475
----
- ext/date/config.w32        |  2 +-
- ext/dom/config.m4          |  2 +-
- ext/filter/config.m4       |  2 +-
- ext/gd/config.m4           |  5 ++---
- ext/gd/config.w32          |  2 +-
- ext/gmp/config.m4          |  2 +-
- ext/hash/config.m4         |  3 +--
- ext/hash/config.w32        | 10 +++-------
- ext/hash/php_hash_xxhash.h |  2 +-
- ext/iconv/config.m4        |  2 +-
- ext/iconv/config.w32       |  2 +-
- ext/json/config.w32        |  2 +-
- ext/libxml/config.w32      |  2 +-
- ext/libxml/config0.m4      |  2 +-
- ext/mysqli/config.m4       |  8 ++------
- ext/mysqli/config.w32      |  2 +-
- ext/pdo/config.m4          |  2 +-
- ext/phar/config.w32        |  1 +
- ext/session/config.m4      |  4 ++--
- ext/session/config.w32     |  2 +-
- ext/simplexml/config.m4    |  2 +-
- ext/simplexml/config.w32   |  2 +-
- ext/sockets/config.m4      |  2 +-
- ext/sodium/config.m4       |  1 +
- ext/sodium/config.w32      |  2 +-
- ext/xml/config.m4          |  2 +-
- ext/xml/config.w32         |  2 +-
- sapi/cli/config.m4         |  2 +-
- sapi/cli/config.w32        |  1 +
- sapi/embed/config.m4       |  2 +-
- 30 files changed, 35 insertions(+), 42 deletions(-)
-
-diff --git a/ext/date/config.w32 b/ext/date/config.w32
-index cf9e220c558..23af2f7d658 100644
---- a/ext/date/config.w32
-+++ b/ext/date/config.w32
-@@ -19,5 +19,5 @@ tl_config.WriteLine("#define timelib_strndup estrndup");
- tl_config.WriteLine("#define timelib_free    efree");
- tl_config.Close();
- 
--PHP_INSTALL_HEADERS("ext/date/", "php_date.h lib/timelib.h lib/timelib_config.h");
-+PHP_INSTALL_HEADERS("ext/date", "php_date.h lib/timelib.h lib/timelib_config.h");
- AC_DEFINE('HAVE_TIMELIB_CONFIG_H', 1, 'Have timelib_config.h')
-diff --git a/ext/dom/config.m4 b/ext/dom/config.m4
-index 6a83d10c8e2..27fef334794 100644
---- a/ext/dom/config.m4
-+++ b/ext/dom/config.m4
-@@ -24,7 +24,7 @@ if test "$PHP_DOM" != "no"; then
-                             namednodemap.c],
-                             $ext_shared)
-     PHP_SUBST(DOM_SHARED_LIBADD)
--    PHP_INSTALL_HEADERS([ext/dom/xml_common.h])
-+    PHP_INSTALL_HEADERS([ext/dom], [xml_common.h])
-     PHP_ADD_EXTENSION_DEP(dom, libxml)
-   ])
- fi
-diff --git a/ext/filter/config.m4 b/ext/filter/config.m4
-index 0108a17fb7a..b7934701bb6 100644
---- a/ext/filter/config.m4
-+++ b/ext/filter/config.m4
-@@ -8,6 +8,6 @@ if test "$PHP_FILTER" != "no"; then
-   PHP_NEW_EXTENSION(filter, filter.c sanitizing_filters.c logical_filters.c callback_filter.c, $ext_shared,, -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1)
-   PHP_SUBST(FILTER_SHARED_LIBADD)
- 
--  PHP_INSTALL_HEADERS([ext/filter/php_filter.h])
-+  PHP_INSTALL_HEADERS([ext/filter], [php_filter.h])
-   PHP_ADD_EXTENSION_DEP(filter, pcre)
- fi
-diff --git a/ext/gd/config.m4 b/ext/gd/config.m4
-index b31c9b2c0bd..ef55212d1ee 100644
---- a/ext/gd/config.m4
-+++ b/ext/gd/config.m4
-@@ -238,7 +238,7 @@ dnl Various checks for GD features
-     PHP_NEW_EXTENSION(gd, gd.c $extra_sources, $ext_shared,, \\$(GD_CFLAGS))
-     PHP_ADD_BUILD_DIR($ext_builddir/libgd)
-     GD_CFLAGS="-Wno-strict-prototypes -I$ext_srcdir/libgd $GD_CFLAGS"
--    GD_HEADER_DIRS="ext/gd/ ext/gd/libgd/"
-+    PHP_INSTALL_HEADERS([ext/gd], [php_gd.h libgd/])
- 
-     PHP_TEST_BUILD(foobar, [], [
-       AC_MSG_ERROR([GD build test failed. Please check the config.log for details.])
-@@ -253,13 +253,12 @@ dnl Various checks for GD features
-     PHP_GD_CHECK_VERSION
- 
-     PHP_NEW_EXTENSION(gd, gd.c $extra_sources, $ext_shared)
--    GD_HEADER_DIRS="ext/gd/"
-+    PHP_INSTALL_HEADERS([ext/gd], [php_gd.h])
-     PHP_CHECK_LIBRARY(gd, gdImageCreate, [], [
-       AC_MSG_ERROR([GD build test failed. Please check the config.log for details.])
-     ], [ $GD_SHARED_LIBADD ])
-   fi
- 
--  PHP_INSTALL_HEADERS([$GD_HEADER_DIRS])
-   PHP_SUBST(GD_CFLAGS)
-   PHP_SUBST(GDLIB_CFLAGS)
-   PHP_SUBST(GDLIB_LIBS)
-diff --git a/ext/gd/config.w32 b/ext/gd/config.w32
-index 09b09df95d3..b779df48e91 100644
---- a/ext/gd/config.w32
-+++ b/ext/gd/config.w32
-@@ -75,7 +75,7 @@ if (PHP_GD != "no") {
- 			ADD_FLAG("LDFLAGS_GD", "/nodefaultlib:libcmt");
- 		}
- 
--		PHP_INSTALL_HEADERS("", "ext/gd ext/gd/libgd" );
-+		PHP_INSTALL_HEADERS("ext/gd", "php_gd.h libgd/");
- 	} else {
- 		WARNING("gd not enabled; libraries and headers not found");
- 	}
-diff --git a/ext/gmp/config.m4 b/ext/gmp/config.m4
-index fa55751cf16..657e43b407f 100644
---- a/ext/gmp/config.m4
-+++ b/ext/gmp/config.m4
-@@ -27,7 +27,7 @@ if test "$PHP_GMP" != "no"; then
-     PHP_ADD_INCLUDE($PHP_GMP/include)
-   fi
- 
--  PHP_INSTALL_HEADERS([ext/gmp/php_gmp_int.h])
-+  PHP_INSTALL_HEADERS([ext/gmp], [php_gmp_int.h])
- 
-   PHP_NEW_EXTENSION(gmp, gmp.c, $ext_shared,, -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1)
-   PHP_SUBST(GMP_SHARED_LIBADD)
-diff --git a/ext/hash/config.m4 b/ext/hash/config.m4
-index 46e66aa9f8c..1e1d2e3f698 100644
---- a/ext/hash/config.m4
-+++ b/ext/hash/config.m4
-@@ -36,7 +36,6 @@ else
- fi
- 
- PHP_ADD_BUILD_DIR(ext/hash/murmur, 1)
--PHP_HASH_CFLAGS="$PHP_HASH_CFLAGS -I@ext_srcdir@/xxhash"
- 
- EXT_HASH_SOURCES="hash.c hash_md.c hash_sha.c hash_ripemd.c hash_haval.c \
-   hash_tiger.c hash_gost.c hash_snefru.c hash_whirlpool.c hash_adler32.c \
-@@ -46,7 +45,7 @@ EXT_HASH_HEADERS="php_hash.h php_hash_md.h php_hash_sha.h php_hash_ripemd.h \
-   php_hash_haval.h php_hash_tiger.h php_hash_gost.h php_hash_snefru.h \
-   php_hash_whirlpool.h php_hash_adler32.h php_hash_crc32.h \
-   php_hash_fnv.h php_hash_joaat.h php_hash_sha3.h php_hash_murmur.h \
--  php_hash_xxhash.h"
-+  php_hash_xxhash.h xxhash/xxhash.h"
- 
- PHP_NEW_EXTENSION(hash, $EXT_HASH_SOURCES, 0,,$PHP_HASH_CFLAGS)
- PHP_INSTALL_HEADERS(ext/hash, $EXT_HASH_HEADERS)
-diff --git a/ext/hash/config.w32 b/ext/hash/config.w32
-index d38b032efd3..bafbd0b9f8d 100644
---- a/ext/hash/config.w32
-+++ b/ext/hash/config.w32
-@@ -34,13 +34,9 @@ if (!CHECK_HEADER_ADD_INCLUDE('PMurHash.h', 'CFLAGS_HASH', hash_murmur_dir)) {
- }
- ADD_SOURCES(hash_murmur_dir, 'PMurHash.c PMurHash128.c', 'hash');
- 
--var hash_xxhash_dir = 'ext/hash/xxhash';
--if (!CHECK_HEADER_ADD_INCLUDE('xxhash.h', 'CFLAGS_HASH', hash_xxhash_dir)) {
--	ERROR('Unable to locate xxhash headers');
--}
--
--PHP_INSTALL_HEADERS('ext/hash/',	'php_hash.h php_hash_md.h php_hash_sha.h ' +
-+PHP_INSTALL_HEADERS('ext/hash',	'php_hash.h php_hash_md.h php_hash_sha.h ' +
- 									'php_hash_ripemd.h php_hash_haval.h php_hash_tiger.h ' +
- 									'php_hash_gost.h php_hash_snefru.h php_hash_whirlpool.h ' +
- 									'php_hash_adler32.h php_hash_crc32.h php_hash_sha3.h ' +
--									'php_hash_murmur.h php_hash_xxhash.h');
-+									'php_hash_murmur.h php_hash_xxhash.h php_hash_fnv.h ' +
-+									'php_hash_joaat.h xxhash/xxhash.h');
-diff --git a/ext/hash/php_hash_xxhash.h b/ext/hash/php_hash_xxhash.h
-index a1e8840ce27..ace70deedb0 100644
---- a/ext/hash/php_hash_xxhash.h
-+++ b/ext/hash/php_hash_xxhash.h
-@@ -18,7 +18,7 @@
- #define PHP_HASH_XXHASH_H
- 
- #define XXH_INLINE_ALL 1
--#include "xxhash.h"
-+#include "xxhash/xxhash.h"
- 
- typedef struct {
- 	XXH32_state_t s;
-diff --git a/ext/iconv/config.m4 b/ext/iconv/config.m4
-index 3cf400fe962..63221eddb0b 100644
---- a/ext/iconv/config.m4
-+++ b/ext/iconv/config.m4
-@@ -149,7 +149,7 @@ int main(void) {
- 
-     PHP_NEW_EXTENSION(iconv, iconv.c, $ext_shared,, [-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1])
-     PHP_SUBST(ICONV_SHARED_LIBADD)
--    PHP_INSTALL_HEADERS([ext/iconv/])
-+    PHP_INSTALL_HEADERS([ext/iconv], [php_iconv.h])
-   else
-     AC_MSG_ERROR(Please reinstall the iconv library.)
-   fi
-diff --git a/ext/iconv/config.w32 b/ext/iconv/config.w32
-index 31423dd121e..0087df54fe5 100644
---- a/ext/iconv/config.w32
-+++ b/ext/iconv/config.w32
-@@ -17,7 +17,7 @@ if (PHP_ICONV != "no") {
- 		if (!PHP_ICONV_SHARED) {
- 			ADD_DEF_FILE("ext\\iconv\\php_iconv.def");
- 		}
--		PHP_INSTALL_HEADERS("", "ext/iconv");
-+		PHP_INSTALL_HEADERS("ext/iconv", "php_iconv.h");
- 	} else {
- 		WARNING("iconv support can't be enabled, libraries or headers are missing")
- 		PHP_ICONV = "no";
-diff --git a/ext/json/config.w32 b/ext/json/config.w32
-index 255f2787728..84f77b6f8c9 100644
---- a/ext/json/config.w32
-+++ b/ext/json/config.w32
-@@ -6,4 +6,4 @@ ADD_SOURCES(configure_module_dirname, "json_encoder.c json_parser.tab.c json_sca
- 
- ADD_MAKEFILE_FRAGMENT();
- 
--PHP_INSTALL_HEADERS("ext/json/", "php_json.h php_json_parser.h php_json_scanner.h");
-+PHP_INSTALL_HEADERS("ext/json", "php_json.h php_json_parser.h php_json_scanner.h");
-diff --git a/ext/libxml/config.w32 b/ext/libxml/config.w32
-index b11c57bc44a..e890ee4fc4e 100644
---- a/ext/libxml/config.w32
-+++ b/ext/libxml/config.w32
-@@ -15,7 +15,7 @@ if (PHP_LIBXML == "yes") {
- 		if (!PHP_LIBXML_SHARED) {
- 			ADD_DEF_FILE("ext\\libxml\\php_libxml2.def");
- 		}
--		PHP_INSTALL_HEADERS("ext/libxml/", "php_libxml.h");
-+		PHP_INSTALL_HEADERS("ext/libxml", "php_libxml.h");
- 	} else {
- 		WARNING("libxml support can't be enabled, iconv or libxml are missing")
- 		PHP_LIBXML = "no"
-diff --git a/ext/libxml/config0.m4 b/ext/libxml/config0.m4
-index 044a58fa624..7bee0126378 100644
---- a/ext/libxml/config0.m4
-+++ b/ext/libxml/config0.m4
-@@ -12,6 +12,6 @@ if test "$PHP_LIBXML" != "no"; then
-   PHP_SETUP_LIBXML(LIBXML_SHARED_LIBADD, [
-     AC_DEFINE(HAVE_LIBXML,1,[ ])
-     PHP_NEW_EXTENSION(libxml, [libxml.c], $ext_shared,, -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1)
--    PHP_INSTALL_HEADERS([ext/libxml/php_libxml.h])
-+    PHP_INSTALL_HEADERS([ext/libxml], [php_libxml.h])
-   ])
- fi
-diff --git a/ext/mysqli/config.m4 b/ext/mysqli/config.m4
-index ad7fb7f6bfa..ab060ebc4f1 100644
---- a/ext/mysqli/config.m4
-+++ b/ext/mysqli/config.m4
-@@ -65,10 +65,6 @@ if test "$PHP_MYSQLI" != "no"; then
-                   mysqli_exception.c mysqli_result_iterator.c"
-   PHP_NEW_EXTENSION(mysqli, $mysqli_sources, $ext_shared,, -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1)
-   PHP_SUBST(MYSQLI_SHARED_LIBADD)
--  PHP_INSTALL_HEADERS([ext/mysqli/php_mysqli_structs.h])
--
--  if test "$PHP_MYSQLI" = "yes" || test "$PHP_MYSQLI" = "mysqlnd"; then
--    PHP_ADD_EXTENSION_DEP(mysqli, mysqlnd)
--    PHP_INSTALL_HEADERS([ext/mysqli/mysqli_mysqlnd.h])
--  fi
-+  PHP_INSTALL_HEADERS([ext/mysqli], [php_mysqli_structs.h mysqli_mysqlnd.h])
-+  PHP_ADD_EXTENSION_DEP(mysqli, mysqlnd)
- fi
-diff --git a/ext/mysqli/config.w32 b/ext/mysqli/config.w32
-index c2c4781dd36..141f993afda 100644
---- a/ext/mysqli/config.w32
-+++ b/ext/mysqli/config.w32
-@@ -22,6 +22,6 @@ if (PHP_MYSQLI != "no") {
- 	if (PHP_MYSQLI != "no") {
- 		EXTENSION("mysqli", mysqli_source, PHP_MYSQLI_SHARED, "/DZEND_ENABLE_STATIC_TSRMLS_CACHE=1");
- 		ADD_EXTENSION_DEP('mysqli', 'mysqlnd', true);
--		PHP_INSTALL_HEADERS("ext/mysqli", "php_mysqli_structs.h");
-+		PHP_INSTALL_HEADERS("ext/mysqli", "php_mysqli_structs.h mysqli_mysqlnd.h");
- 	}
- }
-diff --git a/ext/pdo/config.m4 b/ext/pdo/config.m4
-index 9b9a3e36df7..2b182d1e516 100644
---- a/ext/pdo/config.m4
-+++ b/ext/pdo/config.m4
-@@ -11,7 +11,7 @@ if test "$PHP_PDO" != "no"; then
- 
-   PHP_NEW_EXTENSION(pdo, pdo.c pdo_dbh.c pdo_stmt.c pdo_sql_parser.c pdo_sqlstate.c, $ext_shared)
-   PHP_ADD_EXTENSION_DEP(pdo, spl, true)
--  PHP_INSTALL_HEADERS(ext/pdo, [php_pdo.h php_pdo_driver.h php_pdo_error.h])
-+  PHP_INSTALL_HEADERS([ext/pdo], [php_pdo.h php_pdo_driver.h php_pdo_error.h])
- 
-   dnl so we always include the known-good working hack.
-   PHP_ADD_MAKEFILE_FRAGMENT
-diff --git a/ext/phar/config.w32 b/ext/phar/config.w32
-index c68ba08f2ca..16432165167 100644
---- a/ext/phar/config.w32
-+++ b/ext/phar/config.w32
-@@ -35,6 +35,7 @@ if (PHP_PHAR != "no") {
- 		}
- 	}
- 	ADD_EXTENSION_DEP('phar', 'spl', true);
-+	PHP_INSTALL_HEADERS("ext/phar", "php_phar.h");
- 
- 	ADD_MAKEFILE_FRAGMENT();
- }
-diff --git a/ext/session/config.m4 b/ext/session/config.m4
-index da31bbde86c..f356102ac46 100644
---- a/ext/session/config.m4
-+++ b/ext/session/config.m4
-@@ -18,7 +18,7 @@ if test "$PHP_SESSION" != "no"; then
-   PHP_ADD_EXTENSION_DEP(session, hash, true)
-   PHP_ADD_EXTENSION_DEP(session, spl)
-   PHP_SUBST(SESSION_SHARED_LIBADD)
--  PHP_INSTALL_HEADERS(ext/session, [php_session.h mod_files.h mod_user.h])
-+  PHP_INSTALL_HEADERS([ext/session], [php_session.h mod_files.h mod_user.h])
-   AC_DEFINE(HAVE_PHP_SESSION,1,[ ])
- fi
- 
-@@ -38,6 +38,6 @@ if test "$PHP_MM" != "no"; then
- 
-   PHP_ADD_LIBRARY_WITH_PATH(mm, $MM_DIR/$PHP_LIBDIR, SESSION_SHARED_LIBADD)
-   PHP_ADD_INCLUDE($MM_DIR/include)
--  PHP_INSTALL_HEADERS([ext/session/mod_mm.h])
-+  PHP_INSTALL_HEADERS([ext/session], [mod_mm.h])
-   AC_DEFINE(HAVE_LIBMM, 1, [Whether you have libmm])
- fi
-diff --git a/ext/session/config.w32 b/ext/session/config.w32
-index aff34f3c847..bb3df15ac29 100644
---- a/ext/session/config.w32
-+++ b/ext/session/config.w32
-@@ -5,5 +5,5 @@ ARG_ENABLE("session", "session support", "yes");
- if (PHP_SESSION == "yes") {
- 	EXTENSION("session", "mod_user_class.c session.c mod_files.c mod_mm.c mod_user.c", false /* never shared */, "/DZEND_ENABLE_STATIC_TSRMLS_CACHE=1");
- 	AC_DEFINE("HAVE_PHP_SESSION", 1, "Session support");
--	PHP_INSTALL_HEADERS("ext/session/", "mod_mm.h php_session.h mod_files.h mod_user.h");
-+	PHP_INSTALL_HEADERS("ext/session", "mod_mm.h php_session.h mod_files.h mod_user.h");
- }
-diff --git a/ext/simplexml/config.m4 b/ext/simplexml/config.m4
-index 8b8a6f814a1..734aa080fde 100644
---- a/ext/simplexml/config.m4
-+++ b/ext/simplexml/config.m4
-@@ -13,7 +13,7 @@ if test "$PHP_SIMPLEXML" != "no"; then
-   PHP_SETUP_LIBXML(SIMPLEXML_SHARED_LIBADD, [
-     AC_DEFINE(HAVE_SIMPLEXML,1,[ ])
-     PHP_NEW_EXTENSION(simplexml, simplexml.c, $ext_shared)
--    PHP_INSTALL_HEADERS([ext/simplexml/php_simplexml.h ext/simplexml/php_simplexml_exports.h])
-+    PHP_INSTALL_HEADERS([ext/simplexml], [php_simplexml.h php_simplexml_exports.h])
-     PHP_SUBST(SIMPLEXML_SHARED_LIBADD)
-   ])
-   PHP_ADD_EXTENSION_DEP(simplexml, libxml)
-diff --git a/ext/simplexml/config.w32 b/ext/simplexml/config.w32
-index a6011fedc20..8a1190d5272 100644
---- a/ext/simplexml/config.w32
-+++ b/ext/simplexml/config.w32
-@@ -21,7 +21,7 @@ if (PHP_SIMPLEXML == "yes") {
- 			MESSAGE("\tSPL support in simplexml disabled");
- 		}
- 		ADD_FLAG("CFLAGS_SIMPLEXML", "/D PHP_SIMPLEXML_EXPORTS ");
--		PHP_INSTALL_HEADERS("ext/simplexml/", "php_simplexml.h php_simplexml_exports.h");
-+		PHP_INSTALL_HEADERS("ext/simplexml", "php_simplexml.h php_simplexml_exports.h");
- 	} else {
- 		PHP_SIMPLEXML = "no";
- 		WARNING("simplexml not enabled; libraries and headers not found");
-diff --git a/ext/sockets/config.m4 b/ext/sockets/config.m4
-index d0fad902114..0fb11e773f2 100644
---- a/ext/sockets/config.m4
-+++ b/ext/sockets/config.m4
-@@ -103,5 +103,5 @@ if test "$PHP_SOCKETS" != "no"; then
-     [sockets.c multicast.c conversions.c sockaddr_conv.c sendrecvmsg.c],
-     [$ext_shared],,
-     $PHP_SOCKETS_CFLAGS)
--  PHP_INSTALL_HEADERS([ext/sockets/], [php_sockets.h])
-+  PHP_INSTALL_HEADERS([ext/sockets], [php_sockets.h])
- fi
-diff --git a/ext/sodium/config.m4 b/ext/sodium/config.m4
-index 05d9ebd5a13..a7a9131602e 100644
---- a/ext/sodium/config.m4
-+++ b/ext/sodium/config.m4
-@@ -15,5 +15,6 @@ if test "$PHP_SODIUM" != "no"; then
-   SODIUM_COMPILER_FLAGS="$LIBSODIUM_CFLAGS -Wno-type-limits"
-   AX_CHECK_COMPILE_FLAG([-Wno-logical-op], SODIUM_COMPILER_FLAGS="$SODIUM_COMPILER_FLAGS -Wno-logical-op", , [-Werror])
-   PHP_NEW_EXTENSION(sodium, libsodium.c sodium_pwhash.c, $ext_shared, , $SODIUM_COMPILER_FLAGS)
-+  PHP_INSTALL_HEADERS([ext/sodium], [php_libsodium.h])
-   PHP_SUBST(SODIUM_SHARED_LIBADD)
- fi
-diff --git a/ext/sodium/config.w32 b/ext/sodium/config.w32
-index 2ff8b998d2d..738ef666eb0 100644
---- a/ext/sodium/config.w32
-+++ b/ext/sodium/config.w32
-@@ -6,7 +6,7 @@ if (PHP_SODIUM != "no") {
- 	if (CHECK_LIB("libsodium.lib", "sodium", PHP_SODIUM) && CHECK_HEADER_ADD_INCLUDE("sodium.h", "CFLAGS_SODIUM")) {
- 		EXTENSION("sodium", "libsodium.c sodium_pwhash.c");
- 		AC_DEFINE('HAVE_LIBSODIUMLIB', 1 , 'Have the Sodium library');
--		PHP_INSTALL_HEADERS("ext/sodium/", "php_libsodium.h");
-+		PHP_INSTALL_HEADERS("ext/sodium", "php_libsodium.h");
- 	} else {
- 		WARNING("libsodium not enabled; libraries and headers not found");
- 	}
-diff --git a/ext/xml/config.m4 b/ext/xml/config.m4
-index 208f9e4c160..5c07ce079de 100644
---- a/ext/xml/config.m4
-+++ b/ext/xml/config.m4
-@@ -32,6 +32,6 @@ if test "$PHP_XML" != "no"; then
- 
-   PHP_NEW_EXTENSION(xml, xml.c $xml_extra_sources, $ext_shared,, -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1)
-   PHP_SUBST(XML_SHARED_LIBADD)
--  PHP_INSTALL_HEADERS([ext/xml/])
-+  PHP_INSTALL_HEADERS([ext/xml], [expat_compat.h php_xml.h])
-   AC_DEFINE(HAVE_XML, 1, [ ])
- fi
-diff --git a/ext/xml/config.w32 b/ext/xml/config.w32
-index c0bb3168e88..f4fec691909 100644
---- a/ext/xml/config.w32
-+++ b/ext/xml/config.w32
-@@ -13,7 +13,7 @@ if (PHP_XML == "yes") {
- 		if (!PHP_XML_SHARED) {
- 			ADD_FLAG("CFLAGS_XML", "/D LIBXML_STATIC ");
- 		}
--		PHP_INSTALL_HEADERS("", "ext/xml");
-+		PHP_INSTALL_HEADERS("ext/xml", "expat_compat.h php_xml.h");
- 	} else {
- 		WARNING("xml support can't be enabled, libraries or headers are missing")
- 		PHP_XML = "no"
-diff --git a/sapi/cli/config.m4 b/sapi/cli/config.m4
-index 1b8e67f0b39..3e58a9aeb74 100644
---- a/sapi/cli/config.m4
-+++ b/sapi/cli/config.m4
-@@ -56,6 +56,6 @@ if test "$PHP_CLI" != "no"; then
- 
-   PHP_OUTPUT(sapi/cli/php.1)
- 
--  PHP_INSTALL_HEADERS([sapi/cli/cli.h])
-+  PHP_INSTALL_HEADERS([sapi/cli], [cli.h])
- fi
- AC_MSG_RESULT($PHP_CLI)
-diff --git a/sapi/cli/config.w32 b/sapi/cli/config.w32
-index 28bb2fd4c6d..2a3475e5de6 100644
---- a/sapi/cli/config.w32
-+++ b/sapi/cli/config.w32
-@@ -8,6 +8,7 @@ if (PHP_CLI == "yes") {
- 	ADD_FLAG("LIBS_CLI", "ws2_32.lib");
- 	ADD_FLAG("LIBS_CLI", "shell32.lib");
- 	ADD_FLAG("LDFLAGS_CLI", "/stack:67108864");
-+	PHP_INSTALL_HEADERS("sapi/cli", "cli.h");
- 
- 	if (CHECK_LIB("edit_a.lib;edit.lib", "cli", PHP_CLI) &&
- 		CHECK_HEADER_ADD_INCLUDE("editline/readline.h", "CFLAGS_CLI")) {
-diff --git a/sapi/embed/config.m4 b/sapi/embed/config.m4
-index 39d7dcf0a3f..1b44ee94120 100644
---- a/sapi/embed/config.m4
-+++ b/sapi/embed/config.m4
-@@ -26,7 +26,7 @@ if test "$PHP_EMBED" != "no"; then
-   if test "$PHP_EMBED_TYPE" != "no"; then
-     PHP_SUBST(LIBPHP_CFLAGS)
-     PHP_SELECT_SAPI(embed, $PHP_EMBED_TYPE, php_embed.c, -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1)
--    PHP_INSTALL_HEADERS([sapi/embed/php_embed.h])
-+    PHP_INSTALL_HEADERS([sapi/embed], [php_embed.h])
-   fi
-   AC_MSG_RESULT([$PHP_EMBED_TYPE])
- else
--- 
-2.47.1
-
diff --git a/package/php/php.hash b/package/php/php.hash
index dbb130f30b..6774ba1936 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
-# From https://www.php.net/downloads.php
-sha256  388ee5fd111097e97bae439bff46aec4ea27f816d3f0c2cb5490a41410d44251  php-8.3.24.tar.xz
+# From https://www.php.net/downloads.php?source=Y
+sha256  b4f27adf30bcf262eacf93c78250dd811980f20f3b90d79a3dc11248681842df  php-8.4.13.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 5460f440cb..1b47facee3 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.3.24
+PHP_VERSION = 8.4.13
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
