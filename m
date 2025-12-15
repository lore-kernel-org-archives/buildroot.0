Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5304DD5B172
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 11:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C1F14098B;
	Mon, 15 Dec 2025 11:43:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8JRv4HH0_0Y0; Mon, 15 Dec 2025 11:43:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C19A409BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765799008;
	bh=YHETC8J5jRTPmdReXHehyWynQAFCaJVZDBXbVYhJOR0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PZjEKTEEG/mC9+rzzuPCoXjtRHnVwOIXrCxFu8JqIUrOLRpDiw0hXf5HFaAuxvFMv
	 YrfRR+prboqNaiAQVHZKm6Z4mw0kfy4Z7Uqrb04vG3mlqterznNlRo51h6X9i+qYPq
	 A2jxObobnhhexOOy5YnAUWX9LzUET8veUGhHdJxM8m+uX79S/TuRompkVtXyWlYKnY
	 jDzZVxd+IBxH8119aogOpgAaXgQhhuoIAiFYgUAEeeo16EWnU3FEudpzOEBphvdgcE
	 YHX7gYFpVpWmefkWjtdtC/OjsD13+g9QomVte0qtrBj8Nh5SD+3NZASke7tnRFP6f4
	 asBEZG43Fk6MQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C19A409BD;
	Mon, 15 Dec 2025 11:43:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B2268117
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 11:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A42AA605E6
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 11:43:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b7Uo0zkMIEn7 for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 11:43:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B5375605C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5375605C9
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B5375605C9
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 11:43:23 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-42fbbc3df8fso1087979f8f.2
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 03:43:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765799002; x=1766403802;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ftrK19k2XccrZHIZhgqoBx6twigqHsA4b39SDzrTwDM=;
 b=jgpXRBXZXhclSJ0HOvAeWSQcOr7FlhJMdpnK2T3REH2v9gZ2sYdstVKDcD2uOjECrS
 xSZE8Of1Pt1n+K54ORr1vGVo2ttLaNqGPOgLfKwdiOs7RSK1IRJzyQr1PST3WjQRHrwt
 TwnIOuJapxbG7p+AT5nkm0acixBTQJheTFNeYLRIoS4QsVb21DzNQRpPZEGSFnbbFCJs
 9gC0xToPqAKPPSgdftW+/3Hy3E3Y33RR0nZeTBCYdnyiMLSHbtMABaSqog8DXL/EFeWH
 5G2/1Ne2lWBtmzibH+genXRaoWLBhIx+f55GY6CBQrz7VO3Q7je4YBdcaem6JiTSnaMR
 wX1A==
X-Gm-Message-State: AOJu0YxirUdHRGS6tFHAcpPi1tpKQNevpHKys2WNoHA38R3HcTflQP3O
 i9fi2k4rWMITYK1uxNvOYjBTzx7e98+TqW7bYYPOytBkkesOrGMZcjh870G06Q==
X-Gm-Gg: AY/fxX6qsmsj1tXlCZyKz7kbTQ5pBPaSK1qcy7MEjTc54Tjw15XL3ITPSxO+pOTFXyh
 +Q44bGKHZy35s9VSUbKg1Hfhlyk3WsQBURBvro+snNGm0km7rOMTo8m5AaudwmOgDh64Iei+abF
 ruUW7yk2jseuIDxR6BB25lNvbIpb7P3Q2dgd4keHpatQb06G6fYj0Kb9VOceRC9FiNDJU/sDXMK
 YIesdoWUT2H99SCXwSOQJ7UD7uGVAb8cgGwsJTnPiRdfMLfi1CskVrfxkcUJNO35nFW8b/wkcVK
 XLTs7Popmq4spSAUZb+fPGNWwnr5LxvR0L0+CeJ8fVJY7D53ODGzXJ8Wss8/iZ+bVsLmmg+HLJm
 +K+UFpZXaoU7mnmV7Wh2R/i+CjRIcrN2vsbz1h6HwZWBW7d6VtRA0yQYIARWfYRh409H1ySR0za
 Yhero=
X-Google-Smtp-Source: AGHT+IE/HJ5OjAObG6S5Ebs622uJ65cr/TLyrnX169D0Pv+6SLcR0knGxXrZx7/seiXej9Av/jTKKg==
X-Received: by 2002:a05:6000:2389:b0:430:fd9f:e705 with SMTP id
 ffacd0b85a97d-430fd9fe864mr2716021f8f.27.1765799001663; 
 Mon, 15 Dec 2025 03:43:21 -0800 (PST)
Received: from freepad.. ([2a01:e0a:6f:bdf0:a136:2350:a5d3:b428])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42ff626b591sm16349117f8f.15.2025.12.15.03.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 03:43:21 -0800 (PST)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: ju.o@free.fr,
	vjardin@free.fr,
	Maxime Leroy <maxime@leroys.fr>
Date: Mon, 15 Dec 2025 12:43:00 +0100
Message-ID: <20251215114302.32596-6-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251204134742.406507-1-maxime@leroys.fr>
References: <20251204134742.406507-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765799002; x=1766403802; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ftrK19k2XccrZHIZhgqoBx6twigqHsA4b39SDzrTwDM=;
 b=lMWg7buXCdS4D5+8odQidvL+ba91Cd0OUKanGuFV4fMvt1jtI4YsroUqJ2NkgAs/Ic
 nTpb5qs6eLWsb3HHrTHLZarh3ZQ+nnMNgJLRD+gpTHyHZb1WWQTAQ0L5TMwaz6cIfA8b
 eBTiEZGGpOpbWR3pyKnrKcvc0ILXKyq0/YU6atTASW7ETmEJruCk/vzUd9igq+Wrk8MM
 /ZBTbEPntGcSG9dJ02SH3xZAavt21XGeSX3jPuKHoP79NDqYBpB+xYvbUjc77Q5sdUL5
 bMySfpiqeEjbbYwD2j20z/KeLZQncmoYlillxNwyKmi+LF4MscQyf5zgZHCSbjFfOVJV
 P12g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lMWg7buX
Subject: [Buildroot] [PATCH v2 5/7] package/grout: bump to 0.14.2 version
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

See the release note of the new versions:
https://github.com/DPDK/grout/releases/tag/v0.14.0
https://github.com/DPDK/grout/releases/tag/v0.14.1
https://github.com/DPDK/grout/releases/tag/v0.14.2

Since v0.14.0, Grout uses the libmnl [1], the dependency are updated in
consequence. Grout also requires VRF support in the kernel, as it creates
a VRF on the Linux side to allow TCP/UDP termination by Linux
applications in different L3 domains. [2]

[1] https://github.com/DPDK/grout/commit/2eb97af1e8
[2] https://github.com/DPDK/grout/commit/391f9fa032
Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 package/grout/Config.in  | 1 +
 package/grout/grout.hash | 2 +-
 package/grout/grout.mk   | 5 ++++-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/grout/Config.in b/package/grout/Config.in
index 7e6e34e07f..1cfec41d7a 100644
--- a/package/grout/Config.in
+++ b/package/grout/Config.in
@@ -13,6 +13,7 @@ config BR2_PACKAGE_GROUT
 	select BR2_PACKAGE_LIBEVENT
 	select BR2_PACKAGE_NUMACTL
 	select BR2_PACKAGE_LIBECOLI
+	select BR2_PACKAGE_LIBMNL
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
 	help
diff --git a/package/grout/grout.hash b/package/grout/grout.hash
index 248c375710..8c4a84cfe6 100644
--- a/package/grout/grout.hash
+++ b/package/grout/grout.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  6d1ba4fda3fec6cbc5d4f4d48fe2435fabd36b27540a439a01a44361f6998971  grout-0.13.0.tar.gz
+sha256  9b8ccf87c4d003dde276f904616f8ca61e4618cbedfd2d6e02fd39781713757c  grout-0.14.2.tar.gz
 sha256  1e412aae8da58b718c78b3d7a52eb547004384d4347e4746a22ca6af7522930c  licenses/BSD-3-clause.txt
diff --git a/package/grout/grout.mk b/package/grout/grout.mk
index 07ea585a01..7b0fbac4cf 100644
--- a/package/grout/grout.mk
+++ b/package/grout/grout.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GROUT_VERSION = 0.13.0
+GROUT_VERSION = 0.14.2
 GROUT_SITE = $(call github,DPDK,grout,v$(GROUT_VERSION))
 GROUT_LICENSE = BSD-3-Clause
 GROUT_LICENSE_FILES = licenses/BSD-3-clause.txt
@@ -16,12 +16,15 @@ GROUT_DEPENDENCIES = \
 	host-pkgconf \
 	dpdk \
 	libevent \
+	libmnl \
 	numactl \
 	libecoli \
 	util-linux
 
 define GROUT_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_TUN)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_L3_MASTER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_VRF)
 endef
 
 $(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
