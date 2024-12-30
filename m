Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9548E77188
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 10:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F060407D7;
	Mon, 30 Dec 2024 10:36:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k7GPU-jF3hNn; Mon, 30 Dec 2024 10:36:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FAC7407CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FAC7407CA;
	Mon, 30 Dec 2024 10:36:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DCFD2F11
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 10:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEC068148D
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 10:36:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tt_FDXEycCPb for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 10:36:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C6A4081521
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6A4081521
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C6A4081521
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 10:36:07 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5d8c1950da7so2995312a12.3
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 02:36:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735554965; x=1736159765;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QwS/4ghX/4JNoeE0Q2IyFSWj4mtkgSp1aIEd9QarE4U=;
 b=LwrMHO3NQmkclW/vrPjARhIoxZi90bBlX2Ji31dD0OdDBG66+q9tUV5eud8W75ETGC
 Nl040u2ZVl/zOrVYcMvroWn/st78voitV+4Pi2QzibDFR2EAF0RQrOIe2OgOVzoB4EOX
 aI79qDHZen6LvsPSNU+iinApEU89k46qUAJo67v7pFrBDdzotiajGzf/4u5XZEdAOESR
 kdDAuRzKpLPFMeF84J0LnGSwjEzszZdyz/HeFduW6cg9l4s6Bv2u4xTWUjAPZyY3X3+6
 iIhYCEj4JWRhNwhCMeQn6ft0n/bu2w7ArRxKBabyrHIrUru/BXCd1H7uHF+3Jmy5YYAT
 wcsA==
X-Gm-Message-State: AOJu0Yzd0Xxc/woMryXhiIl4H4mNv2ByeMLlT6TVGmbwvp1oyAonzF+u
 iJ0A2BTXo9YFva3H/VhpSt1QJ80QAjrmnd0y0LZ+Yq5b+pe4yHsLKDf6gw==
X-Gm-Gg: ASbGncvAFDN0+2uYW7OPoRN+Uz/TJS12jqcC8KeSxTcrA4+oA5ume2GZSvj5uf5YA2a
 i5DAxFAXlqPQpC4Ia+nLt9xeDtKbP5MNlrLX73ACtVpI2wXWznRc850Q0Q+6MTu+vpx9ec+lU1x
 dK+MQQeaZWR2bTyxBBT9Z0mJedwY5+o5SoYyViB94M03CJmIb0y80adpOrdSlJ82OtTL3ZMS5Oi
 RNxzH6Sxzc9rU0TLQZ/pm6Hla4RLowwwxuJZDQXCXzRZoWAniyhiFZhaAuHccJFK4/23Ie+
X-Google-Smtp-Source: AGHT+IGLcFjUptkWh1Npxo3XGKig0aWHo7XRLQuCofs36UTDT7P1dP+zGqxWOIG9wnQ0DsOyS+xEPA==
X-Received: by 2002:a17:907:971e:b0:aa6:b63a:4521 with SMTP id
 a640c23a62f3a-aac2ad87883mr2939187166b.15.1735554965145; 
 Mon, 30 Dec 2024 02:36:05 -0800 (PST)
Received: from hthiery.fritz.box ([2a02:810b:5a04:dd00:18f9:775f:be73:a0e3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e89617bsm1437781766b.76.2024.12.30.02.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 02:36:04 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Heiko Thiery <heiko.thiery@gmail.com>, Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Dec 2024 11:35:35 +0100
Message-Id: <20241230103534.671602-4-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241230103534.671602-1-heiko.thiery@gmail.com>
References: <20241230103534.671602-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735554965; x=1736159765; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QwS/4ghX/4JNoeE0Q2IyFSWj4mtkgSp1aIEd9QarE4U=;
 b=gvNz6m7pgrczoq2+uA5A+ia/eEm6RBUce53ax5gk+jmVi4EzVgy6EjuYSk4z58g6hP
 V3prSS4ATO//E8zca1IeoK2PB5xZDlWnyhaJeUGpbCfdXbWW20fJG44izYdy4kiRYKZf
 ozXMPrBdnP6TLtysioiXr33Oq2Co6Rl+LG+LN5ccmM02RLyVYT93iwwhIL9Ef8DQ8E2i
 94gNyZoliTiC++38RHdhc/PvYfmqYT+YleGnfcwzrJSgEv6QnElRTJNdrFQDjrNdWAsp
 z63QqAXD740zXJzECx8ONQDffCpIDvCFKicB0dXeXEBLAZveug+kO4LVln9Q0eMpkSiX
 aIfQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gvNz6m7p
Subject: [Buildroot] [PATCH v2 3/6] package/sysrepo: bump to version 2.11.7
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

Add new config options to enable/disable binary tools/daemon. By default
this options are enabled.

Also some sysv init script shellcheck warnings are fixed.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/sysrepo/Config.in          | 21 +++++++++++++++++++++
 package/sysrepo/S51sysrepo-plugind |  3 ++-
 package/sysrepo/sysrepo.hash       |  2 +-
 package/sysrepo/sysrepo.mk         |  5 ++++-
 4 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/package/sysrepo/Config.in b/package/sysrepo/Config.in
index b1535bed9f..ff75575952 100644
--- a/package/sysrepo/Config.in
+++ b/package/sysrepo/Config.in
@@ -16,6 +16,27 @@ config BR2_PACKAGE_SYSREPO
 
 if BR2_PACKAGE_SYSREPO
 
+config BR2_PACKAGE_SYSREPO_SYSREPOCFG
+	bool "enable sysrepocfg"
+	default y
+	help
+	  Enable sysrepocfg.
+	  Build binary tool sysrepocfg
+
+config BR2_PACKAGE_SYSREPO_SYSREPOCTL
+	bool "enable sysrepoctl"
+	default y
+	help
+	  Enable sysrepoctl.
+	  Build binary tool sysrepoctl
+
+config BR2_PACKAGE_SYSREPO_PLUGIND
+	bool "enable sysrepo-plugind"
+	default y
+	help
+	  Enable sysrepo-plugind.
+	  Build binary daemon sysrepo-plugind
+
 config BR2_PACKAGE_SYSREPO_EXAMPLES
 	bool "enable examples"
 	help
diff --git a/package/sysrepo/S51sysrepo-plugind b/package/sysrepo/S51sysrepo-plugind
index 60ea3ba7a9..4bee6c1705 100644
--- a/package/sysrepo/S51sysrepo-plugind
+++ b/package/sysrepo/S51sysrepo-plugind
@@ -10,6 +10,7 @@ SYSREPO_PLUGIND_ARGS=""
 
 start() {
 	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
 	start-stop-daemon -S -q -x "$EXECUTABLE" \
 		-- $SYSREPO_PLUGIND_ARGS
 	status=$?
@@ -45,7 +46,7 @@ reload() {
 }
 
 case "$1" in
-    start|stop|restart|reload)
+	start|stop|restart|reload)
 		"$1";;
 	*)
 		echo "Usage: $0 {start|stop|restart|reload}"
diff --git a/package/sysrepo/sysrepo.hash b/package/sysrepo/sysrepo.hash
index 056f70787d..93c336e1a9 100644
--- a/package/sysrepo/sysrepo.hash
+++ b/package/sysrepo/sysrepo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  467efed8d0f62c26a0d200602b911096eb2d67858e620937ab68f96b316fa9b7  sysrepo-2.2.150.tar.gz
+sha256  45a98a71827dd1428e2c6b7dedea47558cdfbc491042bbdbc0c52e607ab8266e  sysrepo-2.11.7.tar.gz
 sha256  88f1b7e5c64d2c113e07105aa9c0fb80639b40287565be1c2afd0949df83d826  LICENSE
diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
index 7f2570bd7d..c215be0159 100644
--- a/package/sysrepo/sysrepo.mk
+++ b/package/sysrepo/sysrepo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSREPO_VERSION = 2.2.150
+SYSREPO_VERSION = 2.11.7
 SYSREPO_SITE = $(call github,sysrepo,sysrepo,v$(SYSREPO_VERSION))
 SYSREPO_INSTALL_STAGING = YES
 SYSREPO_LICENSE = BSD-3-Clause
@@ -18,6 +18,9 @@ endif
 
 SYSREPO_CONF_OPTS = \
 	-DBUILD_EXAMPLES=$(if $(BR2_PACKAGE_SYSREPO_EXAMPLES),ON,OFF) \
+	-DENABLE_SYSREPOCFG=$(if $(BR2_PACKAGE_SYSREPO_SYSREPOCFG),ON,OFF) \
+	-DENABLE_SYSREPOCTL=$(if $(BR2_PACKAGE_SYSREPO_SYSREPOCTL),ON,OFF) \
+	-DENABLE_SYSREPO_PLUGIND=$(if $(BR2_PACKAGE_SYSREPO_PLUGIND),ON,OFF) \
 	-DENABLE_TESTS=OFF \
 	-DENABLE_VALGRIND_TESTS=OFF \
 	-DREPO_PATH=/etc/sysrepo
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
