Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B2DCA0ECD
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 16:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A91B341156;
	Mon, 11 Aug 2025 16:11:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NJ9txWAYOcB0; Mon, 11 Aug 2025 16:11:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78A26413F0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78A26413F0;
	Mon, 11 Aug 2025 16:11:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A9BDA138
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9014341197
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:11:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nc-lux3IVbFe for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 16:11:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 072B140E7F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 072B140E7F
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 072B140E7F
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:11:15 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-459e794b331so27535435e9.3
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:11:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754928674; x=1755533474;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bpil6r0sehplsCjPHPxNxScy4A7WKgfAHNxXGzWDKdc=;
 b=HBDNk/f/+DlAKbmTFIuj2InFXwP9/R9yhkBab09Cyyggv+Boisn46SCL7d3hWOkmVo
 i00X8uMX+sYeTVumFhgBXpfa2CyMmKhKM9qiUWvc8PPvusMHXDxBSxXre/ToCH34osgf
 EoqxyIGELLKrHVGcg+kIeXbCGqb8o4p6EwXw6IevKd7ovjcrdJOQ1H9H4GvhPi5uA2Zo
 itzq+YRzd3oQuh4IA5cJQcpx2VDKlESu6j9iL5xCvL8W+v/S6Al6+PVnJPrbt5WnXx2g
 UqNa1eEU6d2ZuGuxFRgolgii2u6eanHXp/B/V7UMtepP3U5QIsTE+C/WzgEKRDiFkWJj
 0lpg==
X-Gm-Message-State: AOJu0YyJJG+MGuI/72nPbkyvYrTf3iDPilXDroGNoDguYBlyPA/3RTKU
 VSMfzOA3qlBHNqoOu5NnheuL45K2UR2TsULVUFO2tNO/IXophJSydBIh1vLtAw==
X-Gm-Gg: ASbGncu0Cxm44TDEKvU5WdTYHuVMN+o8R9KSe4ZwznpkLRFXvOjkk0SxWRM1LvgJgBW
 iF2h2IsoMePHWicznLv2fA+y1Hgldz/lVL0wtGtPybKS3EZtLgvrcAZ6PEAZfjQ0fV6hEg4aGXU
 a//qbTc8rZLffW+ctpW5/lZ8fie/+/5g8iscniNXFDrKpky4YYdiQj3PnAKxyNbhlldApevAi57
 vg5Xl6ZEnNuh8clJc9FuldW1BW3eY3Xdf+GNSLrW883ryXUyDBggk/7t0pEsfvhOHqkiu8sxN36
 Ig3BTU5qL5Z/YpF3rdl/K6CObY04G8oozVd0oJF56HzitMT0EIcq+wrvr2A0xD14o4pRY6Mam2X
 bUYi1H5M6Vcr6V0JZP0MUO2TmAg==
X-Google-Smtp-Source: AGHT+IGBhpXGuTKUREGdE+Dd3fwD8o48ootWr/jGJwSlMbpXo6JmCUXU7Qw/r0wyV/2HhICroDcG8A==
X-Received: by 2002:a05:600c:35c1:b0:450:d30e:ff96 with SMTP id
 5b1f17b1804b1-459fc0de784mr88603395e9.0.1754928673982; 
 Mon, 11 Aug 2025 09:11:13 -0700 (PDT)
Received: from freepad.. ([2a01:e0a:6f:bdf0:eb5b:f3f3:bf7b:bb92])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5868fd7sm279484855e9.18.2025.08.11.09.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 09:11:13 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Vadim Kochan <vadim4j@gmail.com>, ju.o@free.fr,
 Maxime Leroy <maxime@leroys.fr>
Date: Mon, 11 Aug 2025 18:11:06 +0200
Message-ID: <20250811161107.7641-2-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811161107.7641-1-maxime@leroys.fr>
References: <20250811140030.1043469-1-maxime@leroys.fr>
 <20250811161107.7641-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754928674; x=1755533474; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bpil6r0sehplsCjPHPxNxScy4A7WKgfAHNxXGzWDKdc=;
 b=PdDiQlFXckbxAbOUeWie2lqOQiyejgvko55WW8ZVa2znv1jBvvbZi05Vnb8XRU3tdb
 pZeTtieyfkQV39hppnV/1S+P0yd2kBPWEgn82icEzGjWOVTZd/VctLN0gpyHoqPNwYow
 PA2EcVF7k7NrQmyS58B20QHVVMqcQezsv7XrZB/yyKm+0CiHNTAz7m3p9Y8JbPg5nYK8
 Ge+BEs3cVX2paO7k7HCFg8GBbeIOvmdiROkdLlRuwqAoNeR1d7Ze0tcssa1alUmePMVd
 Pk71VWhuui2cHn6VIY0MR3Yzzb0piKxDdBYz161QL7OXXEXnWPRHCSHrUtXYJeGUeDuV
 oS0Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PdDiQlFX
Subject: [Buildroot] [PATCH v3 1/2] package/frr: bump to version 10.4.1
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

Update FRR to the latest stable version (10.4.1 see [1], 10.4.0 see [2]).

As protobuf-c is no longer mandatory (see [3]), a new option
BR2_PACKAGE_FRR_PROTOBUF is added to enable/disable it.

getloadavg function [4] is now used by FRR but older libcs (e.g. uClibc,
dietlibc) lack this function, to fix the compilation, a patch must be
applied on FRR.

[1] https://github.com/FRRouting/frr/commit/88f5c06cbc1c
[2] https://github.com/FRRouting/frr/releases/tag/frr-10.4.0
[3] https://github.com/FRRouting/frr/commit/e51c16a4ca92
[4] https://github.com/FRRouting/frr/commit/ff76fb21d7b3
Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 ...davg-optional-in-late-timer-warnings.patch | 49 +++++++++++++++++++
 package/frr/Config.in                         | 27 ++++++----
 package/frr/frr.hash                          |  2 +-
 package/frr/frr.mk                            | 11 ++++-
 4 files changed, 77 insertions(+), 12 deletions(-)
 create mode 100644 package/frr/0001-lib-make-getloadavg-optional-in-late-timer-warnings.patch

diff --git a/package/frr/0001-lib-make-getloadavg-optional-in-late-timer-warnings.patch b/package/frr/0001-lib-make-getloadavg-optional-in-late-timer-warnings.patch
new file mode 100644
index 0000000000..d03f64882e
--- /dev/null
+++ b/package/frr/0001-lib-make-getloadavg-optional-in-late-timer-warnings.patch
@@ -0,0 +1,49 @@
+From d76100a2b9a2ec814ad0a1fb844a395a6dc2f6bd Mon Sep 17 00:00:00 2001
+From: Maxime Leroy <maxime@leroys.fr>
+Date: Mon, 11 Aug 2025 13:44:02 +0200
+Subject: [PATCH] lib: make getloadavg() optional in late timer warnings
+
+Commit ff76fb21d7b3 ("lib: improve late timer warnings") added an
+unconditional getloadavg() call. Older libcs (e.g. uClibc, dietlibc)
+lack this function, breaking the build. Before, no system load was
+shown, so skipping it restores prior behavior.
+
+Fixes: ff76fb21d7b3 ("lib: improve late timer warnings")
+Signed-off-by: Maxime Leroy <maxime@leroys.fr>
+Upstream: https://github.com/FRRouting/frr/pull/19366
+---
+ configure.ac | 1 +
+ lib/event.c  | 4 ++++
+ 2 files changed, 5 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 87eba6784a..b8ef7bb777 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1369,6 +1369,7 @@ dnl ---------------
+ AC_CHECK_FUNCS([ \
+ 	strlcat strlcpy \
+ 	getgrouplist \
++	getloadavg \
+ 	openat \
+ 	unlinkat \
+ 	posix_fallocate \
+diff --git a/lib/event.c b/lib/event.c
+index 1eb41d07ce..22876574fb 100644
+--- a/lib/event.c
++++ b/lib/event.c
+@@ -1924,7 +1924,11 @@ static void event_tardy_warn(struct event *thread, unsigned long since_us)
+ 	double loadavg[3];
+ 	int rv;
+ 
++#ifdef HAVE_GETLOADAVG
+ 	rv = getloadavg(loadavg, array_size(loadavg));
++#else
++	rv = -1;
++#endif
+ 	if (rv < 0)
+ 		bprintfrr(&fb, "not available");
+ 	else {
+-- 
+2.43.0
+
diff --git a/package/frr/Config.in b/package/frr/Config.in
index 211eb83419..feb1aef05a 100644
--- a/package/frr/Config.in
+++ b/package/frr/Config.in
@@ -1,19 +1,15 @@
 config BR2_PACKAGE_FRR
 	bool "frr"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf-c
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pthread
 	depends on !BR2_STATIC_LIBS # libyang
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c, libyang
-	depends on BR2_INSTALL_LIBSTDCPP # protobuf-c
-	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
-	depends on BR2_HOST_GCC_AT_LEAST_7 # protobuf-c
 	select BR2_PACKAGE_BASH
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_LIBYANG
 	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_JSON_C
-	select BR2_PACKAGE_PROTOBUF_C
 	help
 	  The FRRouting Protocol Suite.
 
@@ -43,11 +39,24 @@ config BR2_PACKAGE_FRR_NHRPD
 	help
 	  Build Next Hop Routing Protocol daemon.
 
+config BR2_PACKAGE_FRR_PROTOBUF
+	bool "Protobuf support (Binary-FPM and MLAG)"
+	default y
+	depends on BR2_INSTALL_LIBSTDCPP # protobuf-c
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
+	depends on BR2_HOST_GCC_AT_LEAST_7 # protobuf-c
+	select  BR2_PACKAGE_PROTOBUF_C
+	help
+	  Build FRR with protobuf-based Binary-FPM export and MLAG
+	  peer synchronization.
+
 endif
 
-comment "frr needs a toolchain w/ threads, dynamic library, C++, host gcc >= 7"
-	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
+comment "frr needs a toolchain w/ threads, dynamic library"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_INSTALL_LIBSTDCPP || !BR2_HOST_GCC_AT_LEAST_7
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
+comment "protobuf support for frr needs a toolchain w/ protobuf, C++, host gcc >= 7"
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_HOST_GCC_AT_LEAST_7
diff --git a/package/frr/frr.hash b/package/frr/frr.hash
index 414aaec7dd..12030a0df8 100644
--- a/package/frr/frr.hash
+++ b/package/frr/frr.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  df4bc4f644f93be09f75c0e0e325b2f6a3ee6d1c6db429b6f36874e88a66ee33  frr-10.3.1.tar.gz
+sha256  8e4003eaba168626c5ea7a6735f2c85c87b04214e6f8c8f2715b21f8ae40970b  frr-10.4.1.tar.gz
 sha256  7bf053957d6c38e39a06a112c60ff35b228d3bd03edbe8c9a03508b051128d16  COPYING
 sha256  f9e0c21faf738da586281c0beaad3cd56204c19085a10fe05e4d3d7f8b5863d2  doc/licenses/BSD-2-Clause
 sha256  aca297b8fd3a43e3bb200f1e2e043c0db6c897325f5ff7f23f7530302a6bf713  doc/licenses/BSD-3-Clause
diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index 23a2ca6037..fb7477a211 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FRR_VERSION = 10.3.1
+FRR_VERSION = 10.4.1
 FRR_SITE = $(call github,FRRouting,frr,frr-$(FRR_VERSION))
 FRR_LICENSE = GPL-2.0+
 FRR_LICENSE_FILES = \
@@ -25,7 +25,6 @@ FRR_CPE_ID_PRODUCT = free_range_routing
 FRR_AUTORECONF = YES
 
 FRR_DEPENDENCIES = host-frr readline json-c libyang \
-	protobuf-c \
 	$(if $(BR2_PACKAGE_C_ARES),c-ares) \
 	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt)
 
@@ -89,6 +88,14 @@ else
 FRR_CONF_OPTS += --disable-bfdd
 endif
 
+# Optional protobuf support
+ifeq ($(BR2_PACKAGE_FRR_PROTOBUF),y)
+FRR_DEPENDENCIES += protobuf-c
+FRR_CONF_OPTS += --enable-protobuf
+else
+FRR_CONF_OPTS += --disable-protobuf
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 FRR_CONF_ENV += LIBS=-latomic
 endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
