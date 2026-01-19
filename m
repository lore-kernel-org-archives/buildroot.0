Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A84AD2ECE6
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 21:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49B2E8426C;
	Mon, 19 Jan 2026 21:32:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oRjeSNs6di5E; Mon, 19 Jan 2026 21:32:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5B5584270
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768858328;
	bh=jaAvuJ95tkWpQLS7tjeSaY8KF3n5+Oj2/J1p+pQLb6s=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kH0zCUpbn1XaFdFTqL2NKspiJyHi7izA0M0rCULOwYV3Gp8E+7HXZS2B32wxXx7Th
	 0W0hmJkN2STUZM0GetbU/9161LRuW/6zX018zskCH5f9VRBZrcYqIaWzTzBsjTapNx
	 Dph4xjAXLHvvI3Gu3c2JB9b2cdX9KVPt5KgoUauu/lpsXeZiYv1PNU0EwOxY/dYOfj
	 f37kmXL0/WU3JKdp0tRA1x35wIMx6e+mwN+GpFGCfc2EItCH0PxGxLifUTkyyIK5aW
	 HU3d6wAWyLY7DXgJvY6L3S9iVTAAZp49P+HCKCHZIrhVQ9oZovGcBjZ5QJ1hwV++pe
	 FjX+hCBrWpwLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5B5584270;
	Mon, 19 Jan 2026 21:32:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D88CB122
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 21:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEF94616B3
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 21:32:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vzXZSKb4aCms for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 21:32:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1C32461682
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C32461682
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C32461682
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 21:32:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c7cb.dip0.t-ipconnect.de [79.214.199.203])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F17FBA4C3C18
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 22:31:58 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39556)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vhwqr-000000000x8-0JIn
 for buildroot@buildroot.org; Mon, 19 Jan 2026 21:31:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 19 Jan 2026 22:31:57 +0100
Message-ID: <20260119213157.3681054-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260119213157.3681054-1-bernd@kuhls.net>
References: <20260119213157.3681054-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768858319;
 bh=LiN/KvVcOPST/9GdJ6pXtztJN6WcRV6CEQH/yzsOBeI=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=J4G7vL8V0xMjIx5zS3cYte22qSnDgxKashTYIHzJd+hXiueePk0Gp8wC5TyzBzfTL
 NqkTzgbBSKpKnS3BDJ7XMQT0V+788rp0rCIos/h78V2VPVLdSVmGcLFrWzKbbQ0gsC
 h+iMGH4IzigsBsLUzi/L0zHNAPALkDyOEHh9cpQhmyLTF7ZXZP72/OCFcuLH2JqZkl
 HHehs55BjiajFCgRY2IQT1B1ajSG7JtfGpS2/4tIwySgunBQesg3TL/jm6Yvy+1490
 R1GIXTxvaV3RmyBDVsDaPmW4fxWrRo3j9U6QBGSthZHsUw9FBKq5KbkEMycF+zUDoM
 Cvr1BbGJljZ6Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=J4G7vL8V
Subject: [Buildroot] [PATCH v2 2/2] package/php: bump version to 8.5.2
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

Release notes:
https://www.php.net/releases/8.5/en.php
https://news-web.php.net/php.announce/474
https://news-web.php.net/php.announce/475
https://news-web.php.net/php.announce/481

Rebased patches 0001-0003.

Removed patch 0005 due to the configure check being non-fatal now:
https://github.com/php/php-src/commit/e4078a6a70d5ad7896049bc19f3affe2fe806c24

opcache is not an optional dependency anymore:
https://github.com/php/php-src/commit/7b4c14dc10167b65ce51371507d7b37b74252077

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: removed .checkpackageignore entry of patch 0005 (Julien)

 .checkpackageignore                           |  1 -
 ...1-acinclude.m4-don-t-unset-variables.patch |  6 +--
 .../0002-iconv-tweak-iconv-detection.patch    | 12 +++---
 ...0003-configure-disable-the-phar-tool.patch |  4 +-
 .../0005-allow-opcache-cross-compiling.patch  | 42 -------------------
 package/php/Config.ext                        |  9 ----
 package/php/php.hash                          |  2 +-
 package/php/php.mk                            | 13 +++---
 8 files changed, 17 insertions(+), 72 deletions(-)
 delete mode 100644 package/php/0005-allow-opcache-cross-compiling.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 76be145bbd..16544f9316 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -781,7 +781,6 @@ package/php/0001-acinclude.m4-don-t-unset-variables.patch lib_patch.Upstream
 package/php/0002-iconv-tweak-iconv-detection.patch lib_patch.Upstream
 package/php/0003-configure-disable-the-phar-tool.patch lib_patch.Upstream
 package/php/0004-Call-apxs-with-correct-prefix.patch lib_patch.Upstream
-package/php/0005-allow-opcache-cross-compiling.patch lib_patch.Upstream
 package/pifmrds/0001-Makefile-cross-compile-friendly.patch lib_patch.Upstream
 package/pifmrds/0002-Makefile-use-LDFLAGS.patch lib_patch.Upstream
 package/pifmrds/0003-Makefile-fix-static-link.patch lib_patch.Upstream
diff --git a/package/php/0001-acinclude.m4-don-t-unset-variables.patch b/package/php/0001-acinclude.m4-don-t-unset-variables.patch
index fe92fb4f55..0d8796e6dd 100644
--- a/package/php/0001-acinclude.m4-don-t-unset-variables.patch
+++ b/package/php/0001-acinclude.m4-don-t-unset-variables.patch
@@ -10,7 +10,7 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [aduskett@gmail.com: Update for 7.3.0]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
-[Bernd: rebased for 8.4.13]
+[Bernd: rebased for 8.5.2]
 ---
  build/php.m4 | 4 ----
  1 file changed, 4 deletions(-)
@@ -19,7 +19,7 @@ diff --git a/build/php.m4 b/build/php.m4
 index e91ef988..9586c490 100644
 --- a/build/php.m4
 +++ b/build/php.m4
-@@ -1462,8 +1462,6 @@ dnl PHP_CHECK_FUNC_LIB
+@@ -1444,8 +1444,6 @@ dnl PHP_CHECK_FUNC_LIB
  dnl
  AC_DEFUN([PHP_CHECK_FUNC_LIB],[
    ifelse($2,,:,[
@@ -28,7 +28,7 @@ index e91ef988..9586c490 100644
    unset found
    AC_CHECK_LIB($2, $1, [found=yes], [
      AC_CHECK_LIB($2, __$1, [found=yes], [found=no])
-@@ -1496,8 +1496,6 @@ dnl and as a fall back in the specified library. Defines HAVE_func and
+@@ -1482,8 +1482,6 @@ dnl and as a fall back in the specified library. Defines HAVE_func and
  dnl HAVE_library if found and adds the library to LIBS.
  dnl
  AC_DEFUN([PHP_CHECK_FUNC],[
diff --git a/package/php/0002-iconv-tweak-iconv-detection.patch b/package/php/0002-iconv-tweak-iconv-detection.patch
index 536a69fd18..afa9e7f26f 100644
--- a/package/php/0002-iconv-tweak-iconv-detection.patch
+++ b/package/php/0002-iconv-tweak-iconv-detection.patch
@@ -16,7 +16,7 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [aduskett@gmail.com: Update for 8.0.7]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
-[Bernd: rebased for 8.4.13]
+[Bernd: rebased for 8.5.2]
 ---
  build/php.m4 | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -25,12 +25,12 @@ diff --git a/build/php.m4 b/build/php.m4
 index 9586c490..8b3d47ed 100644
 --- a/build/php.m4
 +++ b/build/php.m4
-@@ -1839,7 +1839,7 @@
+@@ -1806,7 +1806,7 @@
+       php_brew_prefix=$($BREW --prefix 2> /dev/null)
+     fi
  
-   dnl Check external libs for iconv funcs.
-   AS_VAR_IF([found_iconv], [no], [
--    for i in $PHP_ICONV /usr/local /usr; do
-+    for i in $PHP_ICONV; do
+-    for i in $PHP_ICONV $php_brew_prefix/opt/libiconv /usr/local /usr; do
++    for i in $PHP_ICONV $php_brew_prefix/opt/libiconv; do
        if test -r $i/include/gnu-libiconv/iconv.h; then
          ICONV_DIR=$i
          ICONV_INCLUDE_DIR=$i/include/gnu-libiconv
diff --git a/package/php/0003-configure-disable-the-phar-tool.patch b/package/php/0003-configure-disable-the-phar-tool.patch
index ebde912861..6f977b5df0 100644
--- a/package/php/0003-configure-disable-the-phar-tool.patch
+++ b/package/php/0003-configure-disable-the-phar-tool.patch
@@ -13,7 +13,7 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [Aduskett: update for 8.0.7]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
-[Bernd: rebased for 8.4.13]
+[Bernd: rebased for 8.5.2]
 ---
  configure.ac | 9 ++-------
  1 file changed, 2 insertions(+), 7 deletions(-)
@@ -22,7 +22,7 @@ diff --git a/configure.ac b/configure.ac
 index 0dfab302..6026fb66 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1585,13 +1585,8 @@ CFLAGS_CLEAN="$CFLAGS \$(PROF_FLAGS)"
+@@ -1613,13 +1613,8 @@ CFLAGS_CLEAN="$CFLAGS \$(PROF_FLAGS)"
  CFLAGS="\$(CFLAGS_CLEAN) $standard_libtool_flag"
  CXXFLAGS="$CXXFLAGS $standard_libtool_flag \$(PROF_FLAGS)"
  
diff --git a/package/php/0005-allow-opcache-cross-compiling.patch b/package/php/0005-allow-opcache-cross-compiling.patch
deleted file mode 100644
index 1031b45f19..0000000000
--- a/package/php/0005-allow-opcache-cross-compiling.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 9bb316c41a69935ee2072626467241889594bed4 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <aduskett@gmail.com>
-Date: Mon, 28 Jun 2021 11:12:36 -0700
-Subject: [PATCH] allow opcache cross-compiling
-
-Remove the check at the end of ext/opcache/config.m4 that prevents opcache from
-being enabled in a cross-compiled environment. We pass the following as a
-CFLAGS when opcache is enabled:
-  -DHAVE_SHM_IPC
-  -DHAVE_SHM_MMAP_ANON
-  -DHAVE_SHM_MMAP_ZERO
-  -DHAVE_SHM_MMAP_POSIX
-  -DHAVE_SHM_MMAP_FILE
-
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
-[Bernd: rebased for 8.4.13]
----
- ext/opcache/config.m4 | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4
-index 5492fd92..10c150ff 100644
---- a/ext/opcache/config.m4
-+++ b/ext/opcache/config.m4
-@@ -346,13 +346,6 @@
-   PHP_ADD_EXTENSION_DEP(opcache, date)
-   PHP_ADD_EXTENSION_DEP(opcache, pcre)
- 
--  if test "$php_cv_shm_ipc" != "yes" && test "$php_cv_shm_mmap_posix" != "yes" && test "$php_cv_shm_mmap_anon" != "yes"; then
--    AC_MSG_FAILURE(m4_text_wrap([
--      No supported shared memory caching support was found when configuring
--      opcache.
--    ]))
--  fi
--
-   AS_VAR_IF([PHP_OPCACHE_JIT], [yes], [
-     PHP_ADD_BUILD_DIR([
-       $ext_builddir/jit
--- 
-2.31.1
-
diff --git a/package/php/Config.ext b/package/php/Config.ext
index e6f29cdf4c..8948ff3484 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -10,15 +10,6 @@ config BR2_PACKAGE_PHP_EXT_FILEINFO
 	help
 	  File Information support
 
-comment "OPcache needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
-
-config BR2_PACKAGE_PHP_EXT_OPCACHE
-	bool "OPcache"
-	depends on !BR2_STATIC_LIBS
-	help
-	  Enable the Zend OPcache accelerator.
-
 comment "Readline needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
 
diff --git a/package/php/php.hash b/package/php/php.hash
index 23ca842b72..6d13f11e56 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php?source=Y
-sha256  28b234e347286158cae921d61283eb1169d89bc9d2e5f5976567260ff38b0bfa  php-8.4.17.tar.xz
+sha256  cb75a9b00a2806f7390dd64858ef42a47b443b3475769c8af6af33a18b1381f1  php-8.5.2.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index aa6050c1a7..2c91ef7b63 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.4.17
+PHP_VERSION = 8.5.2
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
@@ -26,9 +26,11 @@ PHP_CONF_OPTS = \
 	--with-external-pcre \
 	--without-pear \
 	--with-config-file-path=/etc \
+	--disable-opcache-jit \
 	--disable-phpdbg \
 	--disable-rpath
 PHP_CONF_ENV = \
+	ac_cv_func_mprotect=yes \
 	EXTRA_LIBS="$(PHP_EXTRA_LIBS)"
 
 ifeq ($(BR2_STATIC_LIBS),y)
@@ -78,16 +80,12 @@ PHP_CXXFLAGS = $(TARGET_CXXFLAGS)
 
 # The OPcache extension isn't cross-compile friendly
 # Throw some defines here to avoid patching heavily
-ifeq ($(BR2_PACKAGE_PHP_EXT_OPCACHE),y)
-PHP_CONF_OPTS += --enable-opcache --disable-opcache-jit
-PHP_CONF_ENV += ac_cv_func_mprotect=yes
 PHP_CFLAGS += \
 	-DHAVE_SHM_IPC \
 	-DHAVE_SHM_MMAP_ANON \
 	-DHAVE_SHM_MMAP_ZERO \
 	-DHAVE_SHM_MMAP_POSIX \
 	-DHAVE_SHM_MMAP_FILE
-endif
 
 # We need to force dl "detection"
 ifeq ($(BR2_STATIC_LIBS),)
@@ -358,9 +356,8 @@ define PHP_INSTALL_FIXUP
 		$(TARGET_DIR)/etc/php.ini
 	$(SED) 's%;date.timezone =.*%date.timezone = $(PHP_LOCALTIME)%' \
 		$(TARGET_DIR)/etc/php.ini
-	$(if $(BR2_PACKAGE_PHP_EXT_OPCACHE),
-		$(SED) '/;extension=php_xsl.dll/azend_extension=opcache.so' \
-		$(TARGET_DIR)/etc/php.ini)
+	$(SED) '/;extension=php_xsl.dll/azend_extension=opcache.so' \
+		$(TARGET_DIR)/etc/php.ini
 endef
 
 PHP_POST_INSTALL_TARGET_HOOKS += PHP_INSTALL_FIXUP
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
