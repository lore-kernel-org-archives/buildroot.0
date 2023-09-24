Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC377CE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 20:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7807060EF8;
	Sun, 24 Sep 2023 20:44:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7807060EF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d4KXRsjMDT_L; Sun, 24 Sep 2023 20:44:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D6E560EC9;
	Sun, 24 Sep 2023 20:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D6E560EC9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 85BE61BF313
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 20:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B18360E50
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 20:43:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B18360E50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kYpSvSZ_ycak for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 20:43:57 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1141B60EC9
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 20:43:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1141B60EC9
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-31f7400cb74so4633435f8f.2
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 13:43:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695588235; x=1696193035;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xNzrXdYBiY50a/3NhpRWgeA90Ljs6eRRvprxut6jT7I=;
 b=bp3mAJgv4mxj6a3lcHSFkn93zrlGEwG6deOzN/RL7Uq2BE1WG1fzQCdG8f22qqSPyl
 WWNlmfsrcTmQkUyS1brHXVf5Zx8fsBDa8vOfpj1ZUHLaz36nL+9frdyzfdEsbi9Odezr
 riVcHJcqM8LXqrzqwDIQ4SI9z4T9jLxrVz75Rj9V5OkqKmYSWTdSbcBgP41OgjX6ikJd
 OCNK1f9Wr79/uQwf4ioKSzIRw1XSnrj79lkmwaixpFL0QoJltNQYvql/8WhC2+x3N6Np
 pJwz4RL2a7JHPtlaW5uXmXigczwZMLioRfWZDwxfvpj2Z3JMMUyv7U8UgudaRMXqnn64
 kD9w==
X-Gm-Message-State: AOJu0YwuJJlYhLPp0yF7KGNcAptXi35gB/CoC2aUEKudDtv5jtnElY3t
 HcP3Uzz96mOwGSBkMcI485vozFVRSPA=
X-Google-Smtp-Source: AGHT+IHTvj3yuMcK6gUHlTi/R9Yg9z4Hixw6RTcN71jjAJBoU4c7I/YXqxYqDfIY4q54r6x3iaf+PQ==
X-Received: by 2002:adf:fa0f:0:b0:313:f783:262b with SMTP id
 m15-20020adffa0f000000b00313f783262bmr4641781wrr.26.1695588234483; 
 Sun, 24 Sep 2023 13:43:54 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 d4-20020adffd84000000b0031f34a395e7sm9944627wrr.45.2023.09.24.13.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 13:43:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 22:43:49 +0200
Message-Id: <20230924204349.1543942-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695588235; x=1696193035; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xNzrXdYBiY50a/3NhpRWgeA90Ljs6eRRvprxut6jT7I=;
 b=W15m+inzLeQ/BNo5jbQrFJ+DNmiDgj81S3J/Y7Mn/YgxkDXBb2SCHQ3NjFHGOJVLVm
 OGl1kmOL3jClVMlo6CbRp9cntVcsHCVBQygRga8JaLuuKgFKAHzK/TGJf0kIkIk0j1KX
 FyLf8Fqsd3kuCx0A9GNnNk5lphFOrfzTrODMGXnPk+Neo/cl5dbjam5ZdaX/yxj1sWQY
 kj7Kdc8enGOER11AeUQQrr6qu3xKkdsyY6vHIE4BjlkIFI/R8jeVY2YGqqzcOWrP1iNy
 NcNIptZjgPr1wWqCcNO71iR86dtj/Ey0s5xIlNlQ+WrSnIxWmDlyKTahH1gHnlupX6Hv
 7+5Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=W15m+inz
Subject: [Buildroot] [PATCH 1/1] package/neon: drop patches
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Patches (and so autoreconf) are not needed since bump to version 0.32.4
in commit f39ac8336e9cd933de50970a657e32a8d9601c67 and
https://github.com/notroj/neon/commit/9924d4d31525f8b61e37076b18004c603fd01761

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  2 -
 ...se-TS_SSL-feature-with-OpenSSL-1.1.0.patch | 76 -------------------
 .../0002-configure.ac-fix-autoreconf.patch    | 28 -------
 package/neon/neon.mk                          |  2 -
 4 files changed, 108 deletions(-)
 delete mode 100644 package/neon/0001-Revert-Advertise-TS_SSL-feature-with-OpenSSL-1.1.0.patch
 delete mode 100644 package/neon/0002-configure.ac-fix-autoreconf.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 6c62eb22aa..bca673e8f7 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -935,8 +935,6 @@ package/ne10/0001-CMakeLists-don-t-hard-code-thumb-code-generation.patch Upstrea
 package/ne10/0002-fix-build-without-C.patch Upstream
 package/neard/S53neard Indent Shellcheck Variables
 package/neardal/0001-lib-neardal.h-fix-build-with-gcc-10.patch Upstream
-package/neon/0001-Revert-Advertise-TS_SSL-feature-with-OpenSSL-1.1.0.patch Upstream
-package/neon/0002-configure.ac-fix-autoreconf.patch Upstream
 package/netatalk/S50netatalk EmptyLastLine Indent Variables
 package/netcat/0001-signed-bit-counting.patch Sob Upstream
 package/netopeer2/S52netopeer2 Shellcheck Variables
diff --git a/package/neon/0001-Revert-Advertise-TS_SSL-feature-with-OpenSSL-1.1.0.patch b/package/neon/0001-Revert-Advertise-TS_SSL-feature-with-OpenSSL-1.1.0.patch
deleted file mode 100644
index 02088bfe02..0000000000
--- a/package/neon/0001-Revert-Advertise-TS_SSL-feature-with-OpenSSL-1.1.0.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 8f9e110b391f065536780d19c2257ad7afd83522 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 31 Jan 2022 23:42:13 +0100
-Subject: [PATCH] Revert "Advertise TS_SSL feature with OpenSSL >= 1.1.0."
-
-This reverts commit 281c84fc3996c757efdf6e9b3f906d7a1fc08b1d.
-
-Indeed openssl can be built on toolchains without threads support which
-will result in the following build failure:
-
-ne_openssl.c:43:10: fatal error: pthread.h: No such file or directory
-   43 | #include <pthread.h>
-      |          ^~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/da995ef26001357e51a5907de9c6111b9ff89bdf
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/notroj/neon/pull/71]
----
- macros/neon.m4   | 15 ++++-----------
- src/ne_openssl.c |  4 ++--
- 2 files changed, 6 insertions(+), 13 deletions(-)
-
-diff --git a/macros/neon.m4 b/macros/neon.m4
-index 129d4ac..5a5fb1b 100644
---- a/macros/neon.m4
-+++ b/macros/neon.m4
-@@ -960,13 +960,9 @@ yes|openssl)
-    AC_CHECK_HEADERS(openssl/ssl.h openssl/opensslv.h,,
-    [AC_MSG_ERROR([OpenSSL headers not found, cannot enable SSL support])])
- 
-+   # Enable EGD support if using 0.9.7 or newer
-    NE_CHECK_OPENSSLVER(ne_cv_lib_ssl097, 0.9.7, 0x00907000L)
--   NE_CHECK_OPENSSLVER(ne_cv_lib_ssl110, 1.1.0, 0x10100000L)
--   if test "$ne_cv_lib_ssl110" = "yes"; then
--      NE_ENABLE_SUPPORT(SSL, [SSL support enabled, using OpenSSL $NE_SSL_VERSION])
--      AC_DEFINE(HAVE_OPENSSL11, 1, [Enable OpenSSL 1.1 support])
--   elif test "$ne_cv_lib_ssl097" = "yes"; then
--      # Enable EGD support if using 0.9.7 or newer
-+   if test "$ne_cv_lib_ssl097" = "yes"; then
-       AC_MSG_NOTICE([OpenSSL >= 0.9.7; EGD support not needed in neon])
-       NE_ENABLE_SUPPORT(SSL, [SSL support enabled, using OpenSSL $NE_SSL_VERSION])
-       NE_CHECK_FUNCS(CRYPTO_set_idptr_callback SSL_SESSION_cmp)
-@@ -1074,11 +1070,8 @@ CC/CFLAGS/LIBS must be used to make the POSIX library interfaces
- available]),,
- enable_threadsafe_ssl=no)
- 
--case ${enable_threadsafe_ssl}X${ne_cv_lib_ssl110} in
--*Xyes)
--  NE_ENABLE_SUPPORT(TS_SSL, [OpenSSL is natively thread-safe])
--  ;;
--posixX*|yesX*)
-+case $enable_threadsafe_ssl in
-+posix|yes)
-   ne_pthr_ok=yes
-   AC_CHECK_FUNCS([pthread_mutex_init pthread_mutex_lock],,[ne_pthr_ok=no])
-   if test "${ne_pthr_ok}" = "no"; then
-diff --git a/src/ne_openssl.c b/src/ne_openssl.c
-index 41a5c05..96c768e 100644
---- a/src/ne_openssl.c
-+++ b/src/ne_openssl.c
-@@ -1194,8 +1194,8 @@ char *ne_vstrhash(unsigned int flags, va_list ap)
-     return ne__strhash2hex(v, vlen, flags);
- }
- 
--#if defined(NE_HAVE_TS_SSL) && OPENSSL_VERSION_NUMBER < 0x10100000L
--/* From OpenSSL 1.1.0 locking callbacks are no longer needed. */
-+#if defined(NE_HAVE_TS_SSL) && OPENSSL_VERSION_NUMBER < 0x10101000L
-+/* For OpenSSL 1.1.1 locking callbacks are no longer need at all. */
- #define WITH_OPENSSL_LOCKING (1)
- 
- /* Implementation of locking callbacks to make OpenSSL thread-safe.
--- 
-2.34.1
-
diff --git a/package/neon/0002-configure.ac-fix-autoreconf.patch b/package/neon/0002-configure.ac-fix-autoreconf.patch
deleted file mode 100644
index cd63d1ed41..0000000000
--- a/package/neon/0002-configure.ac-fix-autoreconf.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From cf779609a5dd38f0a8fdb3c4539371f13fd3a24a Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 8 Feb 2022 18:34:25 +0100
-Subject: [PATCH] configure.ac: fix autoreconf
-
-Add AC_CONFIG_MACRO_DIR(macros) to fix autoreconf
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not sent yet]
----
- configure.ac | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 37b14ec..122151d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1,5 +1,7 @@
- AC_PREREQ(2.58) dnl 2.58 required for AS_HELP_STRING
- 
-+AC_CONFIG_MACRO_DIR(macros)
-+
- dnl Extract the version (sans LF) from .version, created at release-time.
- m4_define(ne_version, [m4_translit(m4_include(.version), [
- ])])
--- 
-2.34.1
-
diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 1ce8f1ff16..96ee608780 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -10,8 +10,6 @@ NEON_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (manual and tests)
 NEON_LICENSE_FILES = src/COPYING.LIB test/COPYING README.md
 NEON_CPE_ID_VENDOR = webdav
 NEON_INSTALL_STAGING = YES
-# We're patching configure.ac
-NEON_AUTORECONF = YES
 NEON_CONF_OPTS = --without-gssapi --disable-rpath
 NEON_CONFIG_SCRIPTS = neon-config
 NEON_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
