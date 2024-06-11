Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECEEC27C65
	for <buildroot@archiver.kernel.org>; Tue, 11 Jun 2024 18:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B43E60B18;
	Tue, 11 Jun 2024 18:01:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q8J6nFaxPXp8; Tue, 11 Jun 2024 18:01:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5DB860B21
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5DB860B21;
	Tue, 11 Jun 2024 18:01:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 743A31BF312
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C60381F65
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:00:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9-JZKNpWhx-M for <buildroot@lists.busybox.net>;
 Tue, 11 Jun 2024 18:00:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com;
 envelope-from=cdimich2188@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4685B81F88
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4685B81F88
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4685B81F88
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 18:00:46 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-704313fa830so2380975b3a.3
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 11:00:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718128845; x=1718733645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fm4yAPVAa5D0uYo63p2O/xYalZLnHQOg8fZW2dbo5/k=;
 b=ikLY929kSZ3+J6r0jk5Vir37l0P1T2xsbtemoFRNWX1fTYfNorQCTiondIEZEhZfTD
 HvRVx37zkJnK/PS9SPaLjFbCBF6H6Zw4CZLF3iTGQlfsW3r98xY5ZcxMyvsGeNh57qnR
 sZLFyz24+yQOLsi6pKGmA4kNQYsT2qrW6ia6m5Ksm2CG85edztOiJqoahhYIJjcL598w
 +qaSRfdydM+ehWox8xI1QCyggbNq2tOaGoDMQD3LYlau+rWm+RQCrqyxw/n7ZmKVOrln
 GvIZhgDubwmM63sHXi3UyIeQXz9qVyKMUmA4grrK4YQBbxktzQFbE2nIPuVgX68z0QSz
 JH6g==
X-Gm-Message-State: AOJu0Yz4EB4kuN4Lqp/zTN/VDJnSGo5ncy1P2nn/2X4GM3bUe+ilOTSq
 qOuZT1pet7M2eUy2Q5c1sutKP702+Rtu89Fq61fmiT95lvjsmQqNIASgYHFk
X-Google-Smtp-Source: AGHT+IGpun4gjkT1lyRVuPtXQx0FkRaO1cjVCUy+kTG0YdfwKlWith8s+tqd956opdJCrFrFdtR2qg==
X-Received: by 2002:a05:6a00:cd3:b0:704:35a3:f838 with SMTP id
 d2e1a72fcca58-70435a4af66mr8498953b3a.24.1718128845366; 
 Tue, 11 Jun 2024 11:00:45 -0700 (PDT)
Received: from chris-jammy.lan ([136.52.56.126])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7041cff68d0sm6670410b3a.185.2024.06.11.11.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 11:00:45 -0700 (PDT)
From: Chris Dimich <cdimich2188@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jun 2024 11:00:00 -0700
Message-ID: <20240611180007.2127244-6-cdimich2188@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611180007.2127244-1-cdimich2188@gmail.com>
References: <20240611180007.2127244-1-cdimich2188@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718128845; x=1718733645; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fm4yAPVAa5D0uYo63p2O/xYalZLnHQOg8fZW2dbo5/k=;
 b=DjIC238N0Ar1bWSbDHBKjfbTdslFGINeroXZ1vseVIYMkunt+BJbF5ueH8GQIFIdkv
 kkc89w5F9If3/4XzKqUaze6eKYXdT8x8FrYXtmgEDQUpwflcnTtmZ2H3kEk5Gk3K3Ceu
 cRB4Q5sdUd59Dy3GmCS2CuD1PV+IJUBoe6d9M6KXGhp+0LHMjDuvlL9FrzyE2jbzgo4F
 llN41R1uxwLv5n8o1S8S6nANHonYnbz7DQTeXHg5sLbj3MSqH44YmASJNKMN1cQ2v4ro
 ZFa/Dmx8Vr94Wt6n4ulHbow9cTkffds08TxByFecbUCZDGghW/r0ixG0cAVQYz0UlxR9
 gmiQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DjIC238N
Subject: [Buildroot] [PATCH 05/12] package/freescale-imx/imx-seco: bump to
 version 5.9.2
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
Cc: Chris Dimich <cdimich2188@gmail.com>, Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- To match NXP 6.1.55-2.2.0 release.
- EULA/COPYING: update to LA_OPT_NXP_Software_License v49.

Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
---
 package/freescale-imx/imx-seco/imx-seco.hash | 6 +++---
 package/freescale-imx/imx-seco/imx-seco.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/imx-seco/imx-seco.hash b/package/freescale-imx/imx-seco/imx-seco.hash
index e02e30886f..40963a81be 100644
--- a/package/freescale-imx/imx-seco/imx-seco.hash
+++ b/package/freescale-imx/imx-seco/imx-seco.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  c3bd761f457e939035b01a0ab36e79064a2a1bc6c3cdb3cd847f7f38df0964df  imx-seco-5.9.0.bin
-sha256  654f0c4ce6d08f9a6d74e29c58206742cb7469a6a7c25413028a9bdbe647aa13  EULA
-sha256  5bd7aab9dc380a6f9577443b2e90bd5ca73d9528175fad04b6d17da43a05a48e  COPYING
+sha256  81601f73d1b2c1d051760e6f6174e084256a1a10ed21a5c616c139e630c4e709  imx-seco-5.9.2.bin
+sha256  b158adaac5e2d1c7fa6e739ff168ab498957e3303070f1c0b0e66d9a8f02a354  EULA
+sha256  de37a0bcbf1717b910c1a53ea6eab853c404e61e8143bb6c081d39f532571e54  COPYING
diff --git a/package/freescale-imx/imx-seco/imx-seco.mk b/package/freescale-imx/imx-seco/imx-seco.mk
index 3788f1e404..4261602a8c 100644
--- a/package/freescale-imx/imx-seco/imx-seco.mk
+++ b/package/freescale-imx/imx-seco/imx-seco.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_SECO_VERSION = 5.9.0
+IMX_SECO_VERSION = 5.9.2
 IMX_SECO_SITE = $(FREESCALE_IMX_SITE)
 IMX_SECO_SOURCE = imx-seco-$(IMX_SECO_VERSION).bin
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
