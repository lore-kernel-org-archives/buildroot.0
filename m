Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBA7C87FD2
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 14:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2E85401EC;
	Mon, 11 Aug 2025 14:01:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id duExQq7MHzka; Mon, 11 Aug 2025 14:01:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C792241329
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C792241329;
	Mon, 11 Aug 2025 14:01:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A769C1C5
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 14:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99D9B83B73
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 14:01:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XEwsOAQLV3Bq for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 14:00:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 68D8581544
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68D8581544
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68D8581544
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 14:00:59 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-455fdfb5d04so22064345e9.2
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 07:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754920857; x=1755525657;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NbInkmg33H/BFYRlU2eKvg6lAhIX10MCQklIJoo1B50=;
 b=d+VWpMMI7DTdvOS99MYebsFZY6wqJRGyzggAkxrm941/I20D6H85+3vc37BYSyqbXQ
 BflGsLdNlYYMe5KC5ie23/k0wlmZgCPIrQit7yqwXHE0UBWAWJsBKfmEGvwwD++nXsXB
 S+z8WyLafVgBZvbLNGUVIgvgPniLUtbCvFoEc3GMviem5pvz7Kk0uJAI1NnlPSSNfHw1
 ARU+h2pGpdy0eIxPg019+LpHo8hRafgIVvW+RTK7a9hLzLj2TohpR3xQCCbHdf13Rqs5
 lDzQKUl1mrCP78wr4n5HfYs5ppLxLbGT1tmHnfeIvAfr46wJJVoTSCMvkqSiC2Nqko6h
 bLOg==
X-Gm-Message-State: AOJu0Yw8Zxe/YCiwRQ/wzNyr87wsSjO30LBdZiYIt3WQS7nau8u8BckQ
 6ylqz1Bv1rvH6hNqMBC8YtNC1DDDvul8G088D6bEFSyT53HI5iGHrebSXDPupQ==
X-Gm-Gg: ASbGncskcRJOWt7ggErrGcRfNg1ZsdtklS/YiONhY3nAxcOOIrjeBJNI6MQe4Owlk/g
 QB8o5E9GTENCM5b5JWBa3XZnwuU4WAn8lMwofQMM4yisr5uiVo9/CVsn5quloD4k5u1CHBp4q0N
 q2ZvVhdB1AEOE7H16oQB6BE/dvyP4uQiE/UqwL0thwJ+a27H8+Xz53a+sTRae6zvfJeS/Pfc6k6
 fMjOMWa7Dzva+e4xhoHweKy/lUUchKC7nV3BQbZkk5pCaKEA8iAvs2+I8t9CJwUdeuukCmb8nv0
 j1B6uRvJFadaL19Pa9FEnNyZokwSaS/X9bd9bvez0G9t6oAOBVjsOLNHAaD+c9iF5r4n6fn+01t
 8K6vpowHID0Tx6+qaU0TYNWfs5w==
X-Google-Smtp-Source: AGHT+IHWu47Eaf5EYenOqnpm0PH6Bzyd6UhyM6n9uwLYDJNNRyUN1mBnOqgWgyFNXFanHKBicfQuCA==
X-Received: by 2002:a05:600c:1e87:b0:458:a559:a693 with SMTP id
 5b1f17b1804b1-459f4f056f2mr119090345e9.18.1754920857208; 
 Mon, 11 Aug 2025 07:00:57 -0700 (PDT)
Received: from freepad.. ([2a01:e0a:6f:bdf0:91cb:8ca9:ea79:d987])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459dbba5210sm328560805e9.2.2025.08.11.07.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 07:00:56 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Vadim Kochan <vadim4j@gmail.com>, ju.o@free.fr,
 Maxime Leroy <maxime@leroys.fr>
Date: Mon, 11 Aug 2025 16:00:29 +0200
Message-ID: <20250811140030.1043469-2-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811140030.1043469-1-maxime@leroys.fr>
References: <20250806132109.129355-1-maxime@leroys.fr>
 <20250811140030.1043469-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754920857; x=1755525657; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NbInkmg33H/BFYRlU2eKvg6lAhIX10MCQklIJoo1B50=;
 b=M+OUyNc65niwEWNPH4NAqp8fXIekbZ//NkHpGvHMPX9Z7BG5wDZSUhbxhjZfhO4qM3
 qEsEPA7qh6NA2LGaI/uRIpZ+L6WIBsopXOriTxA9iQZhKgE6LawEBY01/KqCfMKJSofB
 0nq6yB0vTqrZtKx6QQFgVoU9KTqgjJoklARn59xz5a7/hV2wHOrkzMW9mxdyf+2QWEWw
 Fgg1tsUER9bVSV1KWQp5s5UdAMwd3awcEgj4H9s+ufedtI9nxzR9Z66BcBFpxYoa4LeY
 nUlZ+6xi5P5PFtYWwSAPf7HtzAxz+8U4H9mZLSRRZ3ch/H5LFnvjdefipdg6Kp+E19i7
 9hdw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=M+OUyNc6
Subject: [Buildroot] [PATCH v2 1/2] package/frr: bump to version 10.4.1
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

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 ...davg-optional-in-late-timer-warnings.patch | 48 +++++++++++++++++++
 package/frr/Config.in                         | 26 ++++++----
 package/frr/frr.hash                          |  2 +-
 package/frr/frr.mk                            | 11 ++++-
 4 files changed, 75 insertions(+), 12 deletions(-)
 create mode 100644 package/frr/0001-lib-make-getloadavg-optional-in-late-timer-warnings.patch

diff --git a/package/frr/0001-lib-make-getloadavg-optional-in-late-timer-warnings.patch b/package/frr/0001-lib-make-getloadavg-optional-in-late-timer-warnings.patch
new file mode 100644
index 0000000000..9f23dbab7c
--- /dev/null
+++ b/package/frr/0001-lib-make-getloadavg-optional-in-late-timer-warnings.patch
@@ -0,0 +1,48 @@
+From 037ae16694805c25c501fe8bb3890dad9b43bf34 Mon Sep 17 00:00:00 2001
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
index 211eb83419..366e0fca82 100644
--- a/package/frr/Config.in
+++ b/package/frr/Config.in
@@ -1,19 +1,15 @@
 config BR2_PACKAGE_FRR
 	bool "frr"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf-c
+	depends on BR2_TOOLCHAIN_HAS_THREADS # FRR uses pthreads
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
 
@@ -43,11 +39,23 @@ config BR2_PACKAGE_FRR_NHRPD
 	help
 	  Build Next Hop Routing Protocol daemon.
 
+config BR2_PACKAGE_FRR_PROTOBUF
+	bool "Protobuf support (Binary-FPM and MLAG)"
+	default y
+	depends on BR2_HOST_GCC_AT_LEAST_7
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
+	select  BR2_PACKAGE_PROTOBUF_C
+	help
+	  Build FRR with protobuf-based Binary-FPM export and MLAG peer sync.
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
