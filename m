Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85541CE7A8C
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 20:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E6076080A;
	Sun, 24 Sep 2023 20:08:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E6076080A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CqR6f-UN8xGj; Sun, 24 Sep 2023 20:08:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9378D60EAB;
	Sun, 24 Sep 2023 20:08:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9378D60EAB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 27AB31BF313
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 20:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3A7C4161A
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 20:08:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3A7C4161A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZoGs05n_FYQn for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 20:08:51 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7EB5841600
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 20:08:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EB5841600
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4050bd2e33aso54259985e9.2
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 13:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695586129; x=1696190929;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qEa0j4HTpKICb5zjuVLfQ1LcaM6enSaQ0Fkvz0N75wI=;
 b=t2xuD6lAw3H+CPktV33Adh03Jo6QNnvA64njHwwnB2XnYRM2GfjyI9EBZOxGD9Fnmf
 jDu1lLETxbRbA8SGAQTsLEE+zPj8/Cu+84BxbKx7pAlAbMPTS/0R1rs0pdlmhHHc2+gh
 JqBqsphMMWLA46h6hHJSDWoy3zgvfhx3WM8PY2kQ/HZ4uk5tEcgLtjrUJXF4Afi/8hSS
 /26SEXsTUOw7K468ti9qykpEysPJn+lGVctEDBS+s26ktwZBlGKHC9uJGjUAN27wcMCc
 uzs9V8HivVtwLRRSFHWxWu6Y46HnTFSQnUZv+MgGYXezcaMfiEXnxosP20QDaFvUpfRw
 5Pog==
X-Gm-Message-State: AOJu0Yy3g2+LKXUICFijkOZhd93KxwVrdq/TnxORUdkvapwyTbkAi/hH
 aUopOdUJvkVUAWAKkeyKUbq8QAfEyYQ=
X-Google-Smtp-Source: AGHT+IEDxxSv/grlQ/jK7B4HY5K/QGUmihhCLWZRxTMGK/v/VBGkLvJk+4yoCW8ERA5wRHvBfSalSA==
X-Received: by 2002:a5d:4d4c:0:b0:31f:97e2:a924 with SMTP id
 a12-20020a5d4d4c000000b0031f97e2a924mr3932011wru.14.1695586128689; 
 Sun, 24 Sep 2023 13:08:48 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 n11-20020a5d4c4b000000b0031fbbe347ebsm9914530wrt.22.2023.09.24.13.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 13:08:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 22:08:45 +0200
Message-Id: <20230924200845.1518915-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695586129; x=1696190929; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qEa0j4HTpKICb5zjuVLfQ1LcaM6enSaQ0Fkvz0N75wI=;
 b=SLasueWP7axH3Jk3fCaxsyxwbqGD58dLt9LHaRELjlF0opYQl/m1UTYX03TVlXxLP2
 cWHmXGGrvRJ9gwJdml8s1MF6N89MJcxYYDmqDG0YopNA84jXCQz6b2jMP8dw2JuPn17d
 5IJHXDfCXKAcKaeRNNDv5OE3or9NRfZgwrMn+CELOm6K5MuWtRnYSuJuLxaeslvMWmX9
 bG2tQMKkKMPdoGYoL7Wz+XdU56oaABVAw5btQDiBVWAApV4hEkH5HyjKiuL7q5R0XnLI
 DJ+8MBo4eDIwsQPcxwDw3UHWyCN0/Bb+QMwuoHeIRJj8qMEVlKT8GPmvKS9CzA9trHWv
 cWQQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SLasueWP
Subject: [Buildroot] [PATCH 1/1] package/sg3_utils: bump to version 1.48
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patches (already in version) and so drop autoreconf
- Update hash of BSD_LICENSE (update in year:
  https://github.com/hreinecke/sg3_utils/commit/551657bfbf3b571a7b8ca6e489a407cb22eab387)

https://github.com/hreinecke/sg3_utils/blob/v1.48/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  2 -
 .../0001-src-sg_dd.c-fix-musl-build.patch     | 39 -------------------
 ...002-configure.ac-fix-uclibc-ng-build.patch | 36 -----------------
 package/sg3_utils/sg3_utils.hash              |  4 +-
 package/sg3_utils/sg3_utils.mk                |  4 +-
 5 files changed, 3 insertions(+), 82 deletions(-)
 delete mode 100644 package/sg3_utils/0001-src-sg_dd.c-fix-musl-build.patch
 delete mode 100644 package/sg3_utils/0002-configure.ac-fix-uclibc-ng-build.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index d34944ba2a..6c62eb22aa 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1298,8 +1298,6 @@ package/ser2net/S50ser2net Indent Shellcheck Variables
 package/setools/0001-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch Upstream
 package/setserial/0001-build-system-fix.patch Upstream
 package/setserial/0002-tiocghayesesp-build-fix.patch Upstream
-package/sg3_utils/0001-src-sg_dd.c-fix-musl-build.patch Upstream
-package/sg3_utils/0002-configure.ac-fix-uclibc-ng-build.patch Upstream
 package/shadowsocks-libev/0001-configure.ac-use-pkg-config-to-find-netfilter_conntr.patch Upstream
 package/shadowsocks-libev/0002-fix-maybe-uninitialized-errors.patch Upstream
 package/shadowsocks-libev/0003-lib-Makefile.am-remove-static-from-LDFLAGS.patch Upstream
diff --git a/package/sg3_utils/0001-src-sg_dd.c-fix-musl-build.patch b/package/sg3_utils/0001-src-sg_dd.c-fix-musl-build.patch
deleted file mode 100644
index 50a81a78a4..0000000000
--- a/package/sg3_utils/0001-src-sg_dd.c-fix-musl-build.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From c93ad13ecd8ddfbb8bb3e4d5d5ad7f3f2c633db6 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 14 Nov 2021 12:37:16 +0100
-Subject: [PATCH] src/sg_dd.c: fix musl build
-
-Fix the following build failure on musl raised since version 1.47 and
-https://github.com/doug-gilbert/sg3_utils/commit/f0195003bb0c66ba55084b2f7e0fe982f08c5675:
-
-sg_dd.c: In function 'main':
-sg_dd.c:2402:17: error: unknown type name 'uint'; did you mean 'int'?
- 2402 |                 uint off;
-      |                 ^~~~
-      |                 int
-
-Fixes:
- - http://autobuild.buildroot.org/results/9ead59ffefefe2a4e3b94a153b3d23231736d882
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/doug-gilbert/sg3_utils/pull/7]
----
- src/sg_dd.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/sg_dd.c b/src/sg_dd.c
-index 9d05c93..35e2423 100644
---- a/src/sg_dd.c
-+++ b/src/sg_dd.c
-@@ -2399,7 +2399,7 @@ main(int argc, char * argv[])
-             res = blocks * blk_sz;
-             if (iflag.zero && iflag.ff && (blk_sz >= 4)) {
-                 uint32_t pos = (uint32_t)skip;
--                uint off;
-+                uint32_t off;
- 
-                 for (k = 0, off = 0; k < blocks; ++k, off += blk_sz, ++pos) {
-                     for (j = 0; j < (blk_sz - 3); j += 4)
--- 
-2.33.0
-
diff --git a/package/sg3_utils/0002-configure.ac-fix-uclibc-ng-build.patch b/package/sg3_utils/0002-configure.ac-fix-uclibc-ng-build.patch
deleted file mode 100644
index 4c475ee1ff..0000000000
--- a/package/sg3_utils/0002-configure.ac-fix-uclibc-ng-build.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 1e95d5b8c507a49f6d15d2795dc46d82b4d1ded0 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 16 Nov 2021 08:41:48 +0100
-Subject: [PATCH] configure.ac: fix uclibc-ng build
-
-Fix the following build failure with uclibc-ng raised because SG_IO is
-not defined:
-
-/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: sg_dd.o: in function `sg_read_low.constprop.0':
-sg_dd.c:(.text+0xc6c): undefined reference to `sg_chk_n_print3'
-
-Fixes:
- - http://autobuild.buildroot.org/results/38a0dfc70a21ce574368b7a485deb231f778b3e7
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/doug-gilbert/sg3_utils/pull/8]
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 0a65d94..23378ad 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -107,7 +107,7 @@ case "${host}" in
- 		AC_DEFINE_UNQUOTED(HAVE_NVME, 1, [Found NVMe])
- 		check_for_getrandom
-                 CFLAGS="$CFLAGS -D__USE_MINGW_ANSI_STDIO";;
--        *-*-linux-gnu* | *-*-linux*)
-+        *-*-linux-gnu* | *-*-linux* | *-*-uclinux-gnu* | *-*-uclinux*)
-                 AC_DEFINE_UNQUOTED(SG_LIB_LINUX, 1, [sg3_utils on linux])
- 		check_for_linux_sg_v4_hdr
- 		check_for_getrandom
--- 
-2.33.0
-
diff --git a/package/sg3_utils/sg3_utils.hash b/package/sg3_utils/sg3_utils.hash
index ff2ef55180..0a06595a31 100644
--- a/package/sg3_utils/sg3_utils.hash
+++ b/package/sg3_utils/sg3_utils.hash
@@ -1,6 +1,6 @@
 # Locally calculated from download (no sig, hash)
-sha256  ddb0cab85fedd8b0db020f3e3f02f6967a055616bf16ea9d5c7408cde41472b2  sg3_utils-1.47.tar.xz
+sha256  d6b9a41690d540e58d1e99c26ac8db37336c849ef6a03f96ea48ca2fe334dbfa  sg3_utils-1.48.tar.xz
 
 # Hash for license files
 sha256  d212debdb0a5d7754c977f6dc53bb6c88b4ace7ab784ddbccd06bb970adb1a37  COPYING
-sha256  8ddd1d82f2be2f5cbd5b5c3b5c2ee94a90d2ca7112958448da74dd78384fd96a  BSD_LICENSE
+sha256  6b1a1de0b3394002973daaa407b93a1d2c13efd8dd1a32095d6872c36f09ba66  BSD_LICENSE
diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
index b291bd69d9..3d85a59a57 100644
--- a/package/sg3_utils/sg3_utils.mk
+++ b/package/sg3_utils/sg3_utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SG3_UTILS_VERSION = 1.47
+SG3_UTILS_VERSION = 1.48
 SG3_UTILS_SOURCE = sg3_utils-$(SG3_UTILS_VERSION).tar.xz
 SG3_UTILS_SITE = http://sg.danny.cz/sg/p
 SG3_UTILS_LICENSE = BSD-2-Clause (library)
@@ -13,8 +13,6 @@ ifeq ($(BR2_PACKAGE_SG3_UTILS_PROGS),y)
 SG3_UTILS_LICENSE += , GPL-2.0+ (programs), BSD-2-Clause (programs)
 endif
 SG3_UTILS_LICENSE_FILES = COPYING BSD_LICENSE
-# We're patching configure.ac
-SG3_UTILS_AUTORECONF = YES
 
 # install the libsgutils2 library
 SG3_UTILS_INSTALL_STAGING = YES
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
