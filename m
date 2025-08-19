Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD20CA0EE6
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 15:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 829CB80F7D;
	Tue, 19 Aug 2025 15:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h0dDWV4AiReq; Tue, 19 Aug 2025 15:08:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96C3180FAD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96C3180FAD;
	Tue, 19 Aug 2025 15:08:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E343DE6
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 15:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18780403DC
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 15:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z0bH9Pv2aY5u for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 15:08:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C02D240C07
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C02D240C07
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C02D240C07
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 15:08:43 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45a1b0b42d5so39094925e9.2
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 08:08:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755616121; x=1756220921;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XyESMAhHTChxYEhiEMnNIbNRVotPAasHS7guBLpAUDs=;
 b=oOCJ3sRX+cs0JdlH5xtjYQgQ9+XNlt+ajL5BWWEWheWVk+DRN3YZedqzszYlIV0a1U
 6ooFw8zALiWxJDYbI37Dc6Di/ck4WThtiDV3jlw0cydxYs5tKeW4oUqkQjv32nocozow
 qS7tuKcacWwUk+IzYidDTD4xt1XNGfaTcHDA6ER5848c5vF3yU9WyRFRrbRxVqRKHIVG
 Oyv9DmizLTjziBEyW3R9oav0z1uICRzN6H3ro5OLugCfGJpPFoZpgNiUyOwTBDbTC295
 xQ+/XP8JJdOpWMjCD6GKPeYGxgRBefC505x4kKQyOGiEIxvSUABa/FheguY+Eo0kpm7h
 qFSQ==
X-Gm-Message-State: AOJu0Yxty3pR6y+MUGa5yvxNhxnMuZe+og2GLNoQCmawImst74zlrvnY
 B2EbubUdaA54Mpsp5UAA3ecGJdipU5EkgXP8rGx+SHxmpws5vFLL89z0HuEKiv7B
X-Gm-Gg: ASbGncuyN3TdLY7LhcKVmEO9fWzxfPGKj6Uf5Z4cigX8cdF8MZg4b4Ckdqsc7x5rRIv
 j6CPur0by5rGwJRbgLzKidTAuBbcU3SncF8jFPZmKOoUXDEgyhU4sXu2yu4N8FKI03xZAZsGtui
 9aNZ2tNKkg8APftzpcIgBuuL7sLoIYms1MTTb2qYfEj7r3+bYiUM18fbwxjD53ZNS/36TAIXHCy
 sb8QWAoVA7BifsIMkiK3n7HyJ4xdQDQgDIoIJ8gupjnmg+bqn2+vcPUNWUZyhhTFxuV80zKPUQF
 leeYauA8O6Zvo7BYe5cEq7LmasuX3Te+GATgd7j8RR5XMelRIwe6DmJel/ltM+qu2hTh1zIUh04
 4QtcwZugaWJqHfMKz0TZEvILTQiyCFG6KiZ2Cdl2fl34Ubw==
X-Google-Smtp-Source: AGHT+IE3XCxSbYjlhHM+9wgnyp6wKcaTL0tUeh2n33cUp84Cy9PqS2m4xc6LZFDVaqknzoiyksEGuw==
X-Received: by 2002:a05:600c:3144:b0:458:bf0a:6061 with SMTP id
 5b1f17b1804b1-45b43e0b211mr25954685e9.24.1755616121273; 
 Tue, 19 Aug 2025 08:08:41 -0700 (PDT)
Received: from localhost.localdomain ([212.22.141.99])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c61a66esm216675995e9.0.2025.08.19.08.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 08:08:40 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 19 Aug 2025 17:08:30 +0200
Message-Id: <20250819150834.1651775-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250819150834.1651775-1-angelo.compagnucci@gmail.com>
References: <20250819150834.1651775-1-angelo.compagnucci@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755616121; x=1756220921; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XyESMAhHTChxYEhiEMnNIbNRVotPAasHS7guBLpAUDs=;
 b=ChLmp8Lbl5NaUcaRTqusnEouYqy4zx+OcogkVQhI51No1GX+zND7g+epdWx/5A9MVj
 Syq+Nh4BwIgdlEcQKuQv65ODlJcn48SE29WS40xzlnNtfWpZUUldGF1yF/crLNSOdHRy
 6jCSOxxaBBK1tq82fdXGOmoq9NqMaL4fJVvJcI1s5xS5UHy5CW0YWatsuoYYCBjPd75H
 sZv2qdmzz9usostNPfBmvqdaTPWrg+Q7VyYQ0f3r0l7m8OL9tCgIW0s1//ALJEudpt55
 uVjd+DmaTZb4yrWBu393cI5BZvr8cC+qqDUyirKZ4IYtD5W5IgEkbc+41pnr0KpSIru+
 SB/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ChLmp8Lb
Subject: [Buildroot] [PATCH 1/5] package/libppd: new package
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

This package contains PPD library for newer versions of cups supporting
more than ~10000 printer models.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  2 ++
 package/libppd/Config.in   |  8 ++++++++
 package/libppd/libppd.hash |  4 ++++
 package/libppd/libppd.mk   | 22 ++++++++++++++++++++++
 5 files changed, 37 insertions(+)
 create mode 100644 package/libppd/Config.in
 create mode 100644 package/libppd/libppd.hash
 create mode 100644 package/libppd/libppd.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3efad36d70..d8f797d2c0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -221,6 +221,7 @@ F:	package/jq/
 F:	package/libapparmor/
 F:	package/libb64/
 F:	package/libdill/
+F:	package/libppd/
 F:	package/mender/
 F:	package/mender-artifact/
 F:	package/mono/
diff --git a/package/Config.in b/package/Config.in
index 137f74ed82..d029780241 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -352,7 +352,9 @@ comment "Graphic libraries"
 	source "package/freerdp/Config.in"
 	source "package/graphicsmagick/Config.in"
 	source "package/imagemagick/Config.in"
+	source "package/libcupsfilters/Config.in"
 	source "package/libglvnd/Config.in"
+	source "package/libppd/Config.in"
 	source "package/mesa3d/Config.in"
 	source "package/mesa3d-headers/Config.in"
 	source "package/ocrad/Config.in"
diff --git a/package/libppd/Config.in b/package/libppd/Config.in
new file mode 100644
index 0000000000..124de4f7f2
--- /dev/null
+++ b/package/libppd/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBPPD
+	bool "libppd"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_LIBCUPSFILTERS
+	help
+	  The Common Unix Printing System
+
+	  ~10000 printer models are supported with PPD-file-based classic CUPS drivers.
diff --git a/package/libppd/libppd.hash b/package/libppd/libppd.hash
new file mode 100644
index 0000000000..3f698c3108
--- /dev/null
+++ b/package/libppd/libppd.hash
@@ -0,0 +1,4 @@
+# Locally calculated:
+sha256  b356aeed1335ef0ca7f799741782a2544e7acee63fb4b047b94e4e0395a9cb62  libppd-2.1.1.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
+sha256  977206f041b9a6f47ac00531e1242c0fab7063da71178f8d868b167b70866b6d  NOTICE
diff --git a/package/libppd/libppd.mk b/package/libppd/libppd.mk
new file mode 100644
index 0000000000..d76ecc3765
--- /dev/null
+++ b/package/libppd/libppd.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# libppd
+#
+################################################################################
+
+LIBPPD_VERSION = 2.1.1
+LIBPPD_SOURCE = libppd-$(LIBPPD_VERSION).tar.gz
+LIBPPD_SITE = https://github.com/OpenPrinting/libppd/releases/download/$(LIBPPD_VERSION)
+LIBPPD_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
+LIBPPD_LICENSE_FILES = LICENSE NOTICE
+LIBPPD_CPE_ID_VENDOR = openprinting
+LIBPPD_SELINUX_MODULES = cups
+LIBPPD_INSTALL_STAGING = YES
+LIBPPD_AUTORECONF = YES
+
+LIBPPD_DEPENDENCIES = cups libcupsfilters
+
+LIBPPD_CONF_OPTS = \
+	--with-cups-config=$(STAGING_DIR)/usr/bin/cups-config
+
+$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
