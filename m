Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEC4C3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 19:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2434D80BB1;
	Fri, 26 Jul 2024 19:20:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YpBMnsYTKP_r; Fri, 26 Jul 2024 19:20:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C99380C02
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C99380C02;
	Fri, 26 Jul 2024 19:20:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 42F211BF348
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 19:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DAEB607AA
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 19:20:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IUTwg6MCM-SH for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 19:20:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F294D6076F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F294D6076F
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F294D6076F
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 19:20:25 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2eeb1051360so17212861fa.0
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 12:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722021623; x=1722626423;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bFin3AjLHWTCMslBMFNWU/oKDzisccCr5Co3on8Rgaw=;
 b=DSxyxne4/bkKUbHFFVBRkdkJuZSzp6GsM+C36bJsM0TkbBVa4ReAJfTMzLcinM2OsZ
 n7UkNlVU25CcvOQAYbxr0HMokcS+ZYBRP/oerB2wmoBcMPKBCaFwbLdj911H+0mO2R6E
 FwKoBnxI7Gb1d1WKZ1KYsZ8+WRpI6i5iwBNCAj5niFIv0zPXTBBBT5MeMst7p2r9hCHp
 5/gjiHeV6VGE0nJ+z1DoiURjJt/68tm/5OxtVZhK5GWaYr8JVc14dfeVpRx92IVvOMZR
 7ei6R+EKfzjQ/mY4/cVnSXJyi/wK5kP//aBeqn0q8pnGL3BlYN+IJP+iiDko7VHGKu0d
 y61w==
X-Gm-Message-State: AOJu0Yxr+tfchbAESTxs5Gdip5PJm3C+4/7nzuTSjeiX4Shn0eQcKlWx
 iGq6qlL9rFOa9RT1RRIx+9AeoXtdWbapYfG7FkqvlKx4sh905k8TQsRAag==
X-Google-Smtp-Source: AGHT+IEiaH1QJgw8nemICEQn2D1F6vedZldS2yqDFJRGcJA6qCi68F3PnxBNHmy1y1cI9MSCf/SVRA==
X-Received: by 2002:a05:651c:4ca:b0:2ef:18b7:4408 with SMTP id
 38308e7fff4ca-2f12edf742amr4992581fa.5.1722021622618; 
 Fri, 26 Jul 2024 12:20:22 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f935946dsm133477215e9.4.2024.07.26.12.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 12:20:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Jul 2024 21:18:45 +0200
Message-ID: <20240726191845.9492-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722021623; x=1722626423; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bFin3AjLHWTCMslBMFNWU/oKDzisccCr5Co3on8Rgaw=;
 b=ZsfqCBYvYbowwNqsXhH7TVxJMw5xHvoii/A+igF1rKNjY1dspaawZOCKVTqzT9WOy2
 ehhlVat1GPMmpkGBJtmIDyul4RoBaOKhdLT/Yrw9gX5gZadXL5VPI1GxaONZfinvPxDJ
 8UeXlvLJAzEvRmiQhRBJDbifGo11Pve0JBVinH90uKnJIqrHmL4oh46gCDqsz/X2k1bb
 Pp5y4mxz5vGaduMayjxTZd6B2im7GsmYi0FLSdhyOlEBv336PJFn2JGYZpuuRSuWByuF
 4Eo/lyBzvJ3Aw3oBxoe7nVwhnHWdrvD619j7EG2Iw6VWr5Qo2KlxraOpyO/TTpyLM3Rl
 /NCw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZsfqCBYv
Subject: [Buildroot] [PATCH 1/1] package/softhsm2: select
 BR2_PACKAGE_LIBOPENSSL_ENGINES
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

softhsm2 unconditionally calls the (deprecated) ENGINE_* logic in
libopenssl resulting in a build failure when
!BR2_PACKAGE_LIBOPENSSL_ENGINES since commit
623d3bbe43e9193aa8e3395367d01af59071b859:

OSSLCryptoFactory.cpp: In constructor 'OSSLCryptoFactory::OSSLCryptoFactory()':
OSSLCryptoFactory.cpp:146:9: error: 'ENGINE_load_rdrand' was not declared in this scope
  146 |         ENGINE_load_rdrand();
      |         ^~~~~~~~~~~~~~~~~~

Fixes: 623d3bbe43e9193aa8e3395367d01af59071b859
 - http://autobuild.buildroot.org/results/9d0047755d19f1f27a42a758277de8d7a3366832

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/softhsm2/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/softhsm2/Config.in b/package/softhsm2/Config.in
index 78fccc9512..ab409a2c96 100644
--- a/package/softhsm2/Config.in
+++ b/package/softhsm2/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_SOFTHSM2
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES
 	help
 	  SoftHSM is an implementation of a cryptographic store
 	  accessible through a PKCS#11 interface. You can use it
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
