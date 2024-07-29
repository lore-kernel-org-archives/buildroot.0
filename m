Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15598C3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 18:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE53C60888;
	Mon, 29 Jul 2024 18:38:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BEpsh3hDUb8i; Mon, 29 Jul 2024 18:38:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22D116060B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22D116060B;
	Mon, 29 Jul 2024 18:38:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 339791BF42C
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 18:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D6D78115A
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 18:38:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gy5t1Aa2BF_p for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 18:38:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EE53981159
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE53981159
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE53981159
 for <buildroot@busybox.net>; Mon, 29 Jul 2024 18:38:28 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-52efaae7edfso4248681e87.2
 for <buildroot@busybox.net>; Mon, 29 Jul 2024 11:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722278307; x=1722883107;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+5syTy44M1Es3Wrndo8rNemAtAJZzoSCMw47h4Z4d/M=;
 b=KPH2JPKqGkvQTLF00hCUkWQpjED/8WbMOH/MSapqQ4Me+KA0JU3B+Qw3ZzHVghw4dZ
 ZEnu+AXcS9E6tyCKz01ide+dlFY7q9D1U5ki/2S6H3zS2mKa0cg7w0QWS5K2evqHiTyn
 rTzmFNKlrMsPL9z9PDyF+YK/PX7s9/6nEVuZpV4ucGEQIz2wPsCgEZLpel7HAnr1nWho
 qbsKqna8OMcDxJGKw/QsoSWkHoTmrqdhBrbB4GUG0/R6nqimXbX4cntwsGnrNCrB5+0T
 KPrHGQe8lxy0mk+HNrw7+rCtkPIqeSZoEShPIq/JwiiuoFrNkyGwFduLTaOuzpJuPQO+
 Z4bA==
X-Gm-Message-State: AOJu0Yzu9ReRcKjHXwAMPvO0pEGusNuK2lTQdLUguq9nIHnIrE+abnko
 znkCE+v58tZRpchKfaSNprv58zgtVFRWDnWof8Y7E7eR1kcVmw7C5DLvaviHdQebsKaRijqWqIu
 ZfQ==
X-Google-Smtp-Source: AGHT+IEl0iTf49wBKLy4cD/x6O1wA/3X0mKQ7M0iVXrIyrjpf0WOHjAZgc1b3W24ejDI/lFewNsMOw==
X-Received: by 2002:a05:6512:2351:b0:52e:9d2c:1c56 with SMTP id
 2adb3069b0e04-5309b280da0mr6837126e87.35.1722278306298; 
 Mon, 29 Jul 2024 11:38:26 -0700 (PDT)
Received: from vm-2404.. (203.34.66.37.rev.sfr.net. [37.66.34.203])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acadb9c8esm543202966b.215.2024.07.29.11.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 11:38:25 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 29 Jul 2024 20:38:15 +0200
Message-ID: <20240729183816.1654269-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1722278307; x=1722883107; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+5syTy44M1Es3Wrndo8rNemAtAJZzoSCMw47h4Z4d/M=;
 b=UNtRCdMVdTyZaAH9Y1u6WDgBOzm8+mPHPkx4CeXiolv06Vuls9qpTT2JLvE0GlmlSj
 UxUpE1g8hcx2uekgA2pYlzULy/wRvZDeFAuteUG6t9Xtj48ysIQfKtCOkuIKukmLFD1m
 y1YwIKCkMQjsWbVFvH1DXbT3xKveFGG4BhqxMbqv8P9GxsKFJ6iIOivm9pvfWEHS0cue
 ddj5CiFfTUqg7zxP8xQRVfig+TSKolG/rUMVWVt/biRsjQKe8HuVxLuxSwUfLbsapFOd
 0DbidHNfAWIAyMf/tAW1SOIt9CF5sc1xigaFMCjdATl3l40/2izAxPriOlMUqTDHnfwg
 R4dA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=UNtRCdMV
Subject: [Buildroot] [PATCH] package/lynx: bump to version 2.9.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

remove upstreamed patch

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lynx/lynx.hash | 3 +--
 package/lynx/lynx.mk   | 6 +-----
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/lynx/lynx.hash b/package/lynx/lynx.hash
index 62e2555a9..d9a0fc421 100644
--- a/package/lynx/lynx.hash
+++ b/package/lynx/lynx.hash
@@ -1,4 +1,3 @@
 # Locally calculated:
-sha256  387f193d7792f9cfada14c60b0e5c0bff18f227d9257a39483e14fa1aaf79595  lynx2.8.9rel.1.tar.bz2
-sha256  b2207e757dbbefc34a20a32b1b4a216b4a4316e1dc812bceca4ac6294871119a  90_CVE-2021-38165.patch
+sha256  7374b89936d991669e101f4e97f2c9592036e1e8cdaa7bafc259a77ab6fb07ce  lynx2.9.2.tar.bz2
 sha256  8406a30ff3134ec23cf752d1ceda92ddaabbe41b4f2dc07ea3cfa139de12d6d6  COPYING
diff --git a/package/lynx/lynx.mk b/package/lynx/lynx.mk
index 831732926..4f23b6891 100644
--- a/package/lynx/lynx.mk
+++ b/package/lynx/lynx.mk
@@ -4,13 +4,9 @@
 #
 ################################################################################
 
-LYNX_VERSION = 2.8.9rel.1
+LYNX_VERSION = 2.9.2
 LYNX_SOURCE = lynx$(LYNX_VERSION).tar.bz2
 LYNX_SITE = https://invisible-mirror.net/archives/lynx/tarballs
-LYNX_PATCH = \
-	https://salsa.debian.org/lynx-team/lynx/-/raw/debian/2.9.0dev.6-3_deb11u1/debian/patches/90_CVE-2021-38165.patch
-# 90_CVE-2021-38165.patch
-LYNX_IGNORE_CVES += CVE-2021-38165
 LYNX_LICENSE = GPL-2.0
 LYNX_LICENSE_FILES = COPYING
 LYNX_CPE_ID_VALID = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
