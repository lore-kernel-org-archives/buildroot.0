Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FBFC4707B
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 21:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03D836FBEA;
	Tue,  9 Jan 2024 21:28:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03D836FBEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RVqtCdLA9D86; Tue,  9 Jan 2024 21:28:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26AA86FBED;
	Tue,  9 Jan 2024 21:28:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26AA86FBED
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 50C0F1BF31D
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 21:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3774683ACD
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 21:18:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3774683ACD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ABIDBXqBGOUj for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 21:18:07 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF405848FD
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 21:18:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF405848FD
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40e461c1f5bso28331305e9.3
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 13:18:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704835084; x=1705439884;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4KaHDK4onEvVCXmSooij+9iSDI6e/cOXl3629/ME0qE=;
 b=tG0G8BLSckNEefqjybqDU8o8VcqOvj3nlcQMBjVIfEylFtIL1mWMMavtzlnL6r3DUI
 R/vUIzxjuQO7nlpbXgqeAdwx844sAVwsPpDIz2G2z18bgM8kkYhEvOpWfbbiYHA+6pol
 wlsCFZFzvYxo0gi0pEMFgByF09hv0O8az5r6F1uPpz0nhb794TY2f93DBC2XrHrDFAAk
 GNfz3C7bgA0dkSCzWa7UivZq/q9wa6odCxYW+nslny2Wh8LI57yNh2agL1DIO9aULJbC
 s9VagznnX0jj2Tg3r8DFXPr3U1N3y/s5xogV+5rHe9MZxKP1QkRhGRH1ozW/wjaguD66
 l0Bg==
X-Gm-Message-State: AOJu0YyfmiSQdQ670IR7SnR502R26Pqkdi8NFHcKtuL1gOVC/EnrJtHY
 TOWVhXS1zNOH8L5/uguRitWhcRqTVVY=
X-Google-Smtp-Source: AGHT+IH3t4CSmI507IzVnqvcrlU+AP14ME9krMAECWlWDGUGFyiPwsqCCVqlC74COfH/k3AqDFQluQ==
X-Received: by 2002:a05:600c:518d:b0:40e:438e:ef03 with SMTP id
 fa13-20020a05600c518d00b0040e438eef03mr2386175wmb.152.1704835083821; 
 Tue, 09 Jan 2024 13:18:03 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 n33-20020a05600c3ba100b0040e398f8cafsm4857122wms.31.2024.01.09.13.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 13:18:03 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 22:18:01 +0100
Message-ID: <20240109211801.565524-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704835084; x=1705439884; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4KaHDK4onEvVCXmSooij+9iSDI6e/cOXl3629/ME0qE=;
 b=NyX4A5LeKzKsxPvOf/dP9Z8s7OrAdE2SaPfl0s7j7/OquzEwYWUhZI3VJN1vXFR4qZ
 7zzWJcwO68efDd6HpryVfKiHUFe9VNJw0fD6OaYHQ4hcdUIhAWE9LvSTvbcodoSEaNc0
 AQpI/7hhWAmY1hGiuklLt7B4vLeQGUeU9apvVD+YGMsLX54NOm/ShbVxhAEgtxKjZNYw
 RZKdKFUSmnkLSTLQYpXz1Wd1oEbz2tWYPOLLNz3rUZ7nUjXYeZjHx8CrTXb6SFfXs1NV
 iSVTnzU1r5V0iGr0gfijRTkSo8FihwTBINLbTeHWGwUOA3J1rdiRK1AUjbY3EPdiEOSm
 WJHQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NyX4A5Le
Subject: [Buildroot] [PATCH 1/1] package/ngrep: fix build with libnet
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
Cc: Wade Berrier <wberrier@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use pkg-config to find libnet and avoid the following build failure
raised since commit 100ba8351c088fd764effdcaba848cfd92de79dd if
libnet-config is found on the host:

/home/autobuild/autobuild/instance-4/output-1/host/bin/mips64el-buildroot-linux-gnu-gcc -s -o ngrep ngrep.o  tcpkill.o   -lpcap -lnet   -lpcre -L/usr/lib -lnet
mips64el-buildroot-linux-gnu-gcc: ERROR: unsafe header/library path used in cross-compilation: '-L/usr/lib'

While at it, format Upstream tag of other patches

Fixes:
 - http://autobuild.buildroot.org/results/05c916162b9c1027cf53f1699a1f5653151098ed

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  3 --
 ...nfigure-in-when-testing-for-use_pcre.patch |  3 +-
 ...heck-for-libnet_init-in-configure-in.patch |  3 +-
 package/ngrep/0003-fix-disable-tcpkill.patch  |  2 +-
 ...ure.in-use-pkg-config-to-find-libnet.patch | 38 +++++++++++++++++++
 package/ngrep/ngrep.mk                        |  2 +-
 6 files changed, 42 insertions(+), 9 deletions(-)
 create mode 100644 package/ngrep/0004-configure.in-use-pkg-config-to-find-libnet.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 5ea1787126..e2a1b536a1 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -905,9 +905,6 @@ package/nginx/0008-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch Up
 package/nginx/0009-auto-os-linux-fix-build-with-libxcrypt.patch Upstream
 package/nginx/0010-Allow-forcing-of-endianness-for-cross-compilation.patch Upstream
 package/nginx/S50nginx Indent Variables
-package/ngrep/0001-Fix-typo-in-configure-in-when-testing-for-use_pcre.patch Upstream
-package/ngrep/0002-Check-for-libnet_init-in-configure-in.patch Upstream
-package/ngrep/0003-fix-disable-tcpkill.patch Upstream
 package/nilfs-utils/0001-nilfs_cleanerd-link-dynamically.patch Upstream
 package/nmap/0001-libdnet-wrapper-configure.patch Upstream
 package/nodejs/nodejs-src/0001-add-qemu-wrapper-support.patch Upstream
diff --git a/package/ngrep/0001-Fix-typo-in-configure-in-when-testing-for-use_pcre.patch b/package/ngrep/0001-Fix-typo-in-configure-in-when-testing-for-use_pcre.patch
index 69c5c887e8..c7f0dec360 100644
--- a/package/ngrep/0001-Fix-typo-in-configure-in-when-testing-for-use_pcre.patch
+++ b/package/ngrep/0001-Fix-typo-in-configure-in-when-testing-for-use_pcre.patch
@@ -4,8 +4,7 @@ Date: Mon, 1 Jan 2018 18:00:34 +0100
 Subject: [PATCH] Fix typo in configure.in when testing for use_pcre
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/jpr5/ngrep/commit/b8b1e9751e1d074af0dd77c2554c1b25fd8f7abe]
+Upstream: https://github.com/jpr5/ngrep/commit/b8b1e9751e1d074af0dd77c2554c1b25fd8f7abe
 ---
  configure.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/package/ngrep/0002-Check-for-libnet_init-in-configure-in.patch b/package/ngrep/0002-Check-for-libnet_init-in-configure-in.patch
index 22b18ab7ee..7fa2e2f3bc 100644
--- a/package/ngrep/0002-Check-for-libnet_init-in-configure-in.patch
+++ b/package/ngrep/0002-Check-for-libnet_init-in-configure-in.patch
@@ -7,8 +7,7 @@ libnet_init_packet was the old libnet 1.0 function which is now long
 deprecated.
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/jpr5/ngrep/commit/0a51c8bc62c7b49b8d67a360daa6b1957256f4f5]
+Upstream: https://github.com/jpr5/ngrep/commit/0a51c8bc62c7b49b8d67a360daa6b1957256f4f5
 ---
  configure.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/package/ngrep/0003-fix-disable-tcpkill.patch b/package/ngrep/0003-fix-disable-tcpkill.patch
index 1264fd7e3b..894cd95b0f 100644
--- a/package/ngrep/0003-fix-disable-tcpkill.patch
+++ b/package/ngrep/0003-fix-disable-tcpkill.patch
@@ -9,7 +9,7 @@ found on the system.
 To fix this, move AC_CHECK_LIB to found libnet outside AC_ARG_ENABLE
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/jpr5/ngrep/pull/15]
+Upstream: https://github.com/jpr5/ngrep/pull/15
 ---
  configure.in | 6 ++----
  1 file changed, 2 insertions(+), 4 deletions(-)
diff --git a/package/ngrep/0004-configure.in-use-pkg-config-to-find-libnet.patch b/package/ngrep/0004-configure.in-use-pkg-config-to-find-libnet.patch
new file mode 100644
index 0000000000..71550da943
--- /dev/null
+++ b/package/ngrep/0004-configure.in-use-pkg-config-to-find-libnet.patch
@@ -0,0 +1,38 @@
+From 4788988827bf4c0d996d3e1e3b6ac52a23b97941 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 9 Jan 2024 21:15:47 +0100
+Subject: [PATCH] configure.in: use pkg-config to find libnet
+
+libnet-config is deprecated:
+https://github.com/libnet/libnet/commit/1ec4a6e7d1d23811f0a14ecb51e46489a0175727
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: unsent (upstream seems dead, no commit since 5 years
+---
+ configure.in | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 7c3dd43..882ff86 100644
+--- a/configure.in
++++ b/configure.in
+@@ -176,12 +176,14 @@ AC_ARG_ENABLE(tcpkill,
+ [ use_tcpkill="$enableval" ],
+ [ use_tcpkill="no" ])
+ 
++PKG_PROG_PKG_CONFIG
+ if test $use_tcpkill = yes; then
+   AC_CHECK_LIB(net, libnet_init,,echo !!! error: tcpkill feature enabled but no libnet found; exit)
+   USE_TCPKILL="1"
+   EXTRA_OBJS="$EXTRA_OBJS tcpkill.o"
+-  EXTRA_DEFINES="$EXTRA_DEFINES $(libnet-config --defines)"
+-  EXTRA_LIBS="$EXTRA_LIBS $(libnet-config --libs)"
++  PKG_CHECK_MODULES(LIBNET, libnet)
++  EXTRA_DEFINES="$EXTRA_DEFINES $LIBNET_CFLAGS"
++  EXTRA_LIBS="$EXTRA_LIBS $LIBNET_LIBS"
+ else
+   USE_TCPKILL="0"
+ fi
+-- 
+2.43.0
+
diff --git a/package/ngrep/ngrep.mk b/package/ngrep/ngrep.mk
index c4750f7504..dc69a34235 100644
--- a/package/ngrep/ngrep.mk
+++ b/package/ngrep/ngrep.mk
@@ -22,7 +22,7 @@ NGREP_CONF_OPTS = \
 	--disable-dropprivs \
 	--disable-pcap-restart
 
-NGREP_DEPENDENCIES = libpcap pcre
+NGREP_DEPENDENCIES = host-pkgconf libpcap pcre
 
 ifeq ($(BR2_PACKAGE_LIBNET),y)
 NGREP_DEPENDENCIES += libnet
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
