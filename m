Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B911CC46CD4
	for <buildroot@archiver.kernel.org>; Fri, 29 Dec 2023 21:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3939D401A1;
	Fri, 29 Dec 2023 21:44:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3939D401A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NCPJloe9yOmT; Fri, 29 Dec 2023 21:44:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E15314017B;
	Fri, 29 Dec 2023 21:44:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E15314017B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1FF581BF5AA
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05DDC814C9
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05DDC814C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uEI_UBguhMmY for <buildroot@lists.busybox.net>;
 Fri, 29 Dec 2023 21:44:32 +0000 (UTC)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84E7C812B5
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 21:44:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84E7C812B5
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3366ddd1eddso6733732f8f.0
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 13:44:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703886270; x=1704491070;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nnB2QyaOgl4nhFqiYynu4/g3bI6hTIcHl7g2QAnAE+o=;
 b=B+aGlcGBUnSICtc8h3gp8OlAU5r/qLBL0Wk3o85gb307U76vHl/DjKSp0hzdZDkq7d
 KsnUh/zT/X45tVawZ/EZ/aFXSBB4/sIyFXsK/wW9Z4Ock7p5W3tveIcRx3TnlcBgKodG
 aunkSp+HJ5FtLb5kk+tqwRIJCwvSVNkIiiOeLtcAqxFD+TIEWpbNyFfMWhp7drhmACQ3
 sn7LdgJTfTy/5FVe+xf50nsjrMcVtrfbtueexDWG9NkkwEC+Ec9q2B8jMfsayVc7cW6K
 VOz0dTmdCVHjW9O2Qi7KRQl5zZysgcEcUpw6NTec5aUZZgWK6PKej8JQSj3QrbDaxnKv
 uCFg==
X-Gm-Message-State: AOJu0Yytws1TUngla1mDtyZbomZEc/mP6jykvp/ZK3KgwE4oK4YELJhF
 JsoHpvx3xK+AbOrubbQoEXZ7x1sQt0w=
X-Google-Smtp-Source: AGHT+IHxRjhjTszSBZQaevJHNaV7958JkHYddYrhRGbkV4a/U6GWWjkkmAZFNfWJTDoQ6pyCe7FwVA==
X-Received: by 2002:adf:f643:0:b0:336:b93f:5e19 with SMTP id
 x3-20020adff643000000b00336b93f5e19mr2025055wrp.127.1703886269426; 
 Fri, 29 Dec 2023 13:44:29 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 d5-20020adffbc5000000b00336e69fbc32sm8615410wrs.102.2023.12.29.13.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Dec 2023 13:44:28 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 29 Dec 2023 22:44:18 +0100
Message-ID: <20231229214418.9331-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703886270; x=1704491070; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nnB2QyaOgl4nhFqiYynu4/g3bI6hTIcHl7g2QAnAE+o=;
 b=Ebaa4lnrsvjv2GB2DvEjxwMYuTrHRuwQQvmQwojPAeYEDrSf9HGbnOTiddx4rMbNMq
 PuG0Twx4OWr6nZElFqVWq326jRtpBuhEZRcw4YBTUAUh/s4BVUZyNHKT4FnQBb89DSLC
 c8tqgUg8HCqqx9RHCqc4fYJo5CLG7PFM9NsUTdhIaxI53xwOtubq6a9/KEGo48iFkRDk
 tcnd0duPFKrpXHZ89j8fAw2G4EYJfdCafS1zfq/fGECHpTbQUdUXqdbwfgWFd9lhNuxp
 Xu4CN3JKf7TVntzAPCcnRoiJhZYAS9iCpsB55v36JKhSqGziiPqkiqxuDF8NFdDHesbY
 UNig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ebaa4lnr
Subject: [Buildroot] [PATCH 1/1] package/rsync: fix openssl static build
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following openssl static build raised since commit
80fa5672da85a110e60be0d2143e85f9e08a0f4a:

/home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/aarch64_be-buildroot-linux-uclibc/12.3.0/../../../../aarch64_be-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/aarch64_be-buildroot-linux-uclibc/sysroot/lib/../lib64/libcrypto.a(libcrypto-lib-c_zlib.o): in function `zlib_oneshot_expand_block':
c_zlib.c:(.text+0xaec): undefined reference to `uncompress'

Commit b9a062b354953f3fbfee702bb5b5007598299925 can also be reverted as
pkg-config will also retrieve -latomic to avoid the following build
failure:

/home/autobuild/autobuild/instance-1/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-1/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(threads_pthread.o): in function `CRYPTO_atomic_add':
threads_pthread.c:(.text+0x208): undefined reference to `__atomic_is_lock_free'

RSYNC_POST_CONFIGURE_HOOKS must be added to call reconfigure and avoid
the following build failure after autoreconf:

autoconf -o configure.sh
autoheader && touch config.h.in
configure.sh has CHANGED.
config.h.in is unchanged.
You may need to run:
  make reconfigure

Fixes:
 - http://autobuild.buildroot.org/results/6c1636f7556e7370a4c9f6d02c63cf3e20dc985c
 - http://autobuild.buildroot.org/results/49abbaa1eab94b248bff434b40728065d687e278

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...py-in-crypto-lib-instead-of-MD5_Init.patch | 28 +++++++++++
 ...-pkg-config-to-retrieve-openssl-depe.patch | 48 +++++++++++++++++++
 package/rsync/rsync.mk                        | 12 +++--
 3 files changed, 84 insertions(+), 4 deletions(-)
 create mode 100644 package/rsync/0001-Check-for-EVP_MD_CTX_copy-in-crypto-lib-instead-of-MD5_Init.patch
 create mode 100644 package/rsync/0002-configure.ac-use-pkg-config-to-retrieve-openssl-depe.patch

diff --git a/package/rsync/0001-Check-for-EVP_MD_CTX_copy-in-crypto-lib-instead-of-MD5_Init.patch b/package/rsync/0001-Check-for-EVP_MD_CTX_copy-in-crypto-lib-instead-of-MD5_Init.patch
new file mode 100644
index 0000000000..5381159968
--- /dev/null
+++ b/package/rsync/0001-Check-for-EVP_MD_CTX_copy-in-crypto-lib-instead-of-MD5_Init.patch
@@ -0,0 +1,28 @@
+From 556a2c5bc2f6244f140a96302d4df92cfc25af8b Mon Sep 17 00:00:00 2001
+From: Wayne Davison <wayne@opencoder.net>
+Date: Tue, 25 Oct 2022 21:55:53 -0700
+Subject: [PATCH] Check for EVP_MD_CTX_copy in crypto lib instead of MD5_Init.
+
+Upstream: https://github.com/WayneD/rsync/commit/556a2c5bc2f6244f140a96302d4df92cfc25af8b
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index a2c99558..ccad7f13 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -432,10 +432,10 @@ AH_TEMPLATE([USE_OPENSSL],
+ if test x"$enable_openssl" != x"no"; then
+     if test x"$ac_cv_header_openssl_md4_h" = x"yes" && test x"$ac_cv_header_openssl_md5_h" = x"yes"; then
+       AC_MSG_RESULT(yes)
+-      AC_SEARCH_LIBS(MD5_Init, crypto,
++      AC_SEARCH_LIBS(EVP_MD_CTX_copy, crypto,
+           [AC_DEFINE(USE_OPENSSL)
+ 	   enable_openssl=yes],
+-          [err_msg="$err_msg$nl- Failed to find MD5_Init function in openssl crypto lib.";
++          [err_msg="$err_msg$nl- Failed to find EVP_MD_CTX_copy function in openssl crypto lib.";
+ 	   no_lib="$no_lib openssl"])
+     else
+         AC_MSG_RESULT(no)
diff --git a/package/rsync/0002-configure.ac-use-pkg-config-to-retrieve-openssl-depe.patch b/package/rsync/0002-configure.ac-use-pkg-config-to-retrieve-openssl-depe.patch
new file mode 100644
index 0000000000..61fe4b0269
--- /dev/null
+++ b/package/rsync/0002-configure.ac-use-pkg-config-to-retrieve-openssl-depe.patch
@@ -0,0 +1,48 @@
+From 93865bad4c00e7d3c867965663fdb9a1a0448db8 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 1 Jan 2023 16:53:23 +0100
+Subject: [PATCH] configure.ac: use pkg-config to retrieve openssl dependencies
+
+Use pkg-config to retrieve openssl dependencies such as -latomic and
+avoids the following build failure when building statically on
+architectures such as sparc:
+
+/home/autobuild/autobuild/instance-1/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-1/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(threads_pthread.o): in function `CRYPTO_atomic_add':
+threads_pthread.c:(.text+0x208): undefined reference to `__atomic_is_lock_free'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/49abbaa1eab94b248bff434b40728065d687e278
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/WayneD/rsync/pull/426
+---
+ configure.ac | 12 ++++++++----
+ 1 file changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index ccad7f13..b9591866 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -432,11 +432,15 @@ AH_TEMPLATE([USE_OPENSSL],
+ if test x"$enable_openssl" != x"no"; then
+     if test x"$ac_cv_header_openssl_md4_h" = x"yes" && test x"$ac_cv_header_openssl_md5_h" = x"yes"; then
+       AC_MSG_RESULT(yes)
+-      AC_SEARCH_LIBS(EVP_MD_CTX_copy, crypto,
++      PKG_CHECK_MODULES(LIBCRYPTO, libcrypto,
+           [AC_DEFINE(USE_OPENSSL)
+-	   enable_openssl=yes],
+-          [err_msg="$err_msg$nl- Failed to find EVP_MD_CTX_copy function in openssl crypto lib.";
+-	   no_lib="$no_lib openssl"])
++           enable_openssl=yes
++           LIBS="$LIBS $LIBCRYPTO_LIBS"],
++          [AC_SEARCH_LIBS(EVP_MD_CTX_copy, crypto,
++              [AC_DEFINE(USE_OPENSSL)
++	       enable_openssl=yes],
++              [err_msg="$err_msg$nl- Failed to find EVP_MD_CTX_copy function in openssl crypto lib.";
++	       no_lib="$no_lib openssl"])])
+     else
+         AC_MSG_RESULT(no)
+ 	err_msg="$err_msg$nl- Failed to find openssl/md4.h and openssl/md5.h for openssl crypto lib support."
+-- 
+2.35.1
+
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 3fd2ef257e..b9d392c8cb 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -10,7 +10,9 @@ RSYNC_LICENSE = GPL-3.0+ with exceptions
 RSYNC_LICENSE_FILES = COPYING
 RSYNC_CPE_ID_VENDOR = samba
 RSYNC_SELINUX_MODULES = rsync
-RSYNC_DEPENDENCIES = zlib popt
+# We're patching configure.ac
+RSYNC_AUTORECONF = YES
+RSYNC_DEPENDENCIES = host-pkgconf zlib popt
 # We know that our C library is modern enough for C99 vsnprintf(). Since
 # configure can't detect this, we tell configure that vsnprintf() is safe.
 RSYNC_CONF_ENV = rsync_cv_HAVE_C99_VSNPRINTF=yes
@@ -20,9 +22,11 @@ RSYNC_CONF_OPTS = \
 	--disable-roll-simd \
 	--disable-md5-asm
 
-ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-RSYNC_CONF_ENV += LIBS=-latomic
-endif
+# reconfigure must be run after autoreconf
+define RSYNC_RUN_RECONFIGURE
+	cd $(@D) && PATH=$(BR_PATH) make reconfigure
+endef
+RSYNC_POST_CONFIGURE_HOOKS += RSYNC_RUN_RECONFIGURE
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 RSYNC_DEPENDENCIES += acl
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
