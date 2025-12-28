Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9C9D3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 07:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0519D6083E;
	Sun, 28 Dec 2025 07:48:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eeo_72tn0Qeh; Sun, 28 Dec 2025 07:48:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E801160843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766908122;
	bh=ZRPt3AeTd4zpbew5uI4XP60N3KJfQFed30r+WeCIg9c=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pyObK2sQ8mQ3jkFJGGpIH5oHuvZVJn4RmCjG4bu8UXEuLOm6/p9YSMbwv4o6G6rln
	 u7CBOw4VqaBiUMBYe8OLi7KFNoiQq1xXmZMvCtYkcyzugHOcjD5FpMP8XqSqEwMl2v
	 jXeojYZVI6USMrgThw2lwTtAOEAwX+6RSxEsl/41cnMSYzf0XFKPBmBz9qyZGnRsyj
	 FlWTBojvOTGbbfEOf5ORndlwYbZLpqU4hqFhUX8Zjj3m1fZJWr6blr/IS8/v+d53tX
	 ofdBeUEvzw59dMKgO8IFPsz+yy25bFyYDaBTxXjs4H3zfMRXLH1cP5Iah3Wn8KDekE
	 VP4qFL9EFN1xg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E801160843;
	Sun, 28 Dec 2025 07:48:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 39482D8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3764F40701
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:48:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hiF6foI6MkAh for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 07:48:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C96E6406FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C96E6406FD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C96E6406FD
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:48:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 97F32A4C21E4;
 Sun, 28 Dec 2025 08:48:24 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35324)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vZlVn-000000004ex-45GQ;
 Sun, 28 Dec 2025 07:48:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>
Date: Sun, 28 Dec 2025 08:47:56 +0100
Message-ID: <20251228074822.3370464-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251228074822.3370464-1-bernd@kuhls.net>
References: <20251228074822.3370464-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766908104;
 bh=8CTf67xoK54CWnuf3l6FQvADZB56ofWAQOp7w+RgHvI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=pQh6f3Z2q3iZAduT48A5cp1i28FZJvkR1BseQO1seqgURuxdpje7uQjmFyiY1yxvT
 SlpBsw+cKQIAARLjGJMG6ACmgMrmV0KsjqLCqC4yGzjxJwPvp9JwPP9Lr4ofaSCN8a
 hIbuAlk8zJKa4ohHACcxhiidhDbkXddlqw7Ii+1Hhd9e36670mCjDoPs5fpJmEq0HB
 YAarxyiYBjZlR7h+wJHn8+eMZOjqFQdy8AQJs7F+Nxhzhn7Qr9rXpRldjsdo+v0ThK
 iAFkmq1H41xMuvEFggHZMtEyVJB4ruO2hsVUf+oi8jW5a4fMvOdCLmz1U0BgqgTxzE
 gm2Yi4wTI599w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=pQh6f3Z2
Subject: [Buildroot] [PATCH v6 01/26] package/libnids: remove package
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

Analysis of https://github.com/MITRECND/libnids:
"This repository was archived by the owner on May 20, 2025."
last commit: Dec 2020
last bug report: Jul 2024
last patch sent upstream: Jan 2024

The package is broken with gcc 15.x and no other package depends on it.

Fixes:
https://autobuild.buildroot.net/results/f22/f22c8954894ab9ca57df07571726140c5bf3499a/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>
---
 .checkpackageignore                           |  1 -
 Config.in.legacy                              |  6 +++
 DEVELOPERS                                    |  1 -
 package/Config.in                             |  1 -
 .../libnids/0001-libpcap-use-pkg-config.patch | 48 -------------------
 package/libnids/Config.in                     | 14 ------
 package/libnids/libnids.hash                  |  3 --
 package/libnids/libnids.mk                    | 43 -----------------
 8 files changed, 6 insertions(+), 111 deletions(-)
 delete mode 100644 package/libnids/0001-libpcap-use-pkg-config.patch
 delete mode 100644 package/libnids/Config.in
 delete mode 100644 package/libnids/libnids.hash
 delete mode 100644 package/libnids/libnids.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index cae06b629c..126397d734 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -577,7 +577,6 @@ package/libmpeg2/0003-fix-arm-detection.patch lib_patch.Upstream
 package/libmpeg2/0004-fix-sparc.patch lib_patch.Upstream
 package/libnetfilter_conntrack/0001-conntrack-fix-build-with-kernel-5-15-and-musl.patch lib_patch.Upstream
 package/libnfc/0001-autotools-make-example-build-optional.patch lib_patch.Upstream
-package/libnids/0001-libpcap-use-pkg-config.patch lib_patch.Upstream
 package/libnss/0001-Bug-1801182-Allow-overriding-OS_ARCH-OS_TEST-and-OS_.patch lib_patch.Upstream
 package/libodb-mysql/0001-fix-syntax-issue-while-checking-ldflags.patch lib_patch.Upstream
 package/libodb-mysql/0002-mariadb-FTBFS-fix.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index e10fd95f8d..409430fea9 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_LIBNIDS
+	bool "libnids has been removed"
+	select BR2_LEGACY
+	help
+	  libnids is unmaintained and has been removed
+
 config BR2_PACKAGE_OPENCV3_WITH_FFMPEG
 	bool "opencv3 ffmpeg support removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 228311beeb..c6108087f5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1374,7 +1374,6 @@ N:	Guillaume Chaye <guillaume.chaye@zeetim.com>
 F:	package/sane-airscan/
 
 N:	Guillaume William Brs <guillaume.bressaix@gmail.com>
-F:	package/libnids/
 F:	package/libxcrypt/
 F:	package/liquid-dsp/
 F:	package/mbw/
diff --git a/package/Config.in b/package/Config.in
index 499c59a52e..c2f6b97d98 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2073,7 +2073,6 @@ menu "Networking"
 	source "package/libnfnetlink/Config.in"
 	source "package/libnftnl/Config.in"
 	source "package/libnice/Config.in"
-	source "package/libnids/Config.in"
 	source "package/libnl/Config.in"
 	source "package/libnpupnp/Config.in"
 	source "package/liboping/Config.in"
diff --git a/package/libnids/0001-libpcap-use-pkg-config.patch b/package/libnids/0001-libpcap-use-pkg-config.patch
deleted file mode 100644
index 8f8df478d1..0000000000
--- a/package/libnids/0001-libpcap-use-pkg-config.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-configure.in: use pkg-config for libpcap detection
-
-The detection of libpcap was based in ${prefix}, which doesn't make
-sense in a cross-compilation context and can cause host leakage into
-the target build.
-
-So instead, let's use pkg-config to detect libpcap, since it is anyway
-already use in this configure.in to detect libglib.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-
-Index: b/configure.in
-===================================================================
---- a/configure.in
-+++ b/configure.in
-@@ -75,25 +75,13 @@
-      fi
-      ;;
-   esac ],
--[ if test -f ${prefix}/include/pcap.h; then
--     PCAP_CFLAGS="-I${prefix}/include"
--     PCAPLIB="-L${exec_prefix}/lib -lpcap"
--  elif test -f /usr/include/pcap/pcap.h; then
--     PCAP_CFLAGS="-I/usr/include/pcap"
--     PCAPLIB="-lpcap"
--  else
--	TMP=$LIBS
--	LIBS="-lpcap $LIBS"
--	AC_TRY_LINK([#include <pcap.h>], pcap_open_offline("",""),
--	LIBPCAP_FOUND=1,LIBPCAP_FOUND=0)
--	LIBS=$TMP
--	if test $LIBPCAP_FOUND = 1 ; then
--		PCAPLIB="-lpcap"
--	else
--		AC_ERROR(libpcap not found)
--	fi
--  fi
--  AC_MSG_RESULT(yes) ]
-+[
-+    PKG_PROG_PKG_CONFIG
-+    PKG_CHECK_MODULES(LIBPCAP, libpcap)
-+    AC_MSG_RESULT(yes)
-+    PCAP_CFLAGS=${LIBPCAP_CFLAGS}
-+    PCAPLIB=${LIBPCAP_LIBS}
-+]
- )
- AC_SUBST(PCAP_CFLAGS)
- AC_SUBST(PCAPLIB)
diff --git a/package/libnids/Config.in b/package/libnids/Config.in
deleted file mode 100644
index 30528f4d07..0000000000
--- a/package/libnids/Config.in
+++ /dev/null
@@ -1,14 +0,0 @@
-config BR2_PACKAGE_LIBNIDS
-	bool "libnids"
-	select BR2_PACKAGE_LIBPCAP
-	help
-	  Libnids is an implementation of an E-component of Network
-	  Intrusion Detection System.
-
-	  libnids watches all local network traffic, and provides
-	  convenient information on them to perform further analysis.
-
-	  Libnids offers IP defragmentation, TCP stream assembly, TCP
-	  port scan detection.
-
-	  http://libnids.sourceforge.net/
diff --git a/package/libnids/libnids.hash b/package/libnids/libnids.hash
deleted file mode 100644
index e51dbf151c..0000000000
--- a/package/libnids/libnids.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  3f3e9f99a83cd37bc74af83d415c5e3a7505f5b190dfaf456b0849e0054f6733  libnids-1.26.tar.gz
-sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/libnids/libnids.mk b/package/libnids/libnids.mk
deleted file mode 100644
index 712630bac8..0000000000
--- a/package/libnids/libnids.mk
+++ /dev/null
@@ -1,43 +0,0 @@
-################################################################################
-#
-# libnids
-#
-################################################################################
-
-LIBNIDS_VERSION = 1.26
-LIBNIDS_SITE = $(call github,MITRECND,libnids,$(LIBNIDS_VERSION))
-LIBNIDS_LICENSE = GPL-2.0
-LIBNIDS_LICENSE_FILES = COPYING
-LIBNIDS_CPE_ID_VALID = YES
-LIBNIDS_INSTALL_STAGING = YES
-LIBNIDS_DEPENDENCIES = host-pkgconf libpcap
-LIBNIDS_AUTORECONF = YES
-
-# disable libnet if not available
-# Tests in configure.in expect --with-libnet=$build_dir
-# not an installation patch like in our context.
-# We use with-libnet=yes to skip the unusual paths tests.
-# But 'LNETLIB' gets left out, so we need to define it ourselves.
-ifeq ($(BR2_PACKAGE_LIBNET),y)
-LIBNIDS_DEPENDENCIES += libnet
-LIBNIDS_CONF_OPTS += --enable-libnet --with-libnet=yes LNETLIB=-lnet
-else
-LIBNIDS_CONF_OPTS += --disable-libnet
-endif
-
-# disable libglib2 if not available
-# The test in configure.in is flawed: passing --enable-libglib would also
-# disable it. Only when neither is passed will the autodetection test be
-# executed.
-ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
-LIBNIDS_DEPENDENCIES += libglib2
-else
-LIBNIDS_CONF_OPTS += --disable-libglib
-endif
-
-# hand-written Makefile.in, not using automake, needs a custom
-# variable for the installation path.
-LIBNIDS_INSTALL_STAGING_OPTS = install_prefix=$(STAGING_DIR) install
-LIBNIDS_INSTALL_TARGET_OPTS = install_prefix=$(TARGET_DIR) install
-
-$(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
