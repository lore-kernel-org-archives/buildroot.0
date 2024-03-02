Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51B6C54798
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 11:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 897DF8384B;
	Sat,  2 Mar 2024 11:17:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3-GwoBqsoxfZ; Sat,  2 Mar 2024 11:17:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99767838C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99767838C0;
	Sat,  2 Mar 2024 11:17:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C3041BF5B3
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 11:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28F12838C0
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 11:17:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MpcyTcPWHjVB for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 11:17:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 311EF8384B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 311EF8384B
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 311EF8384B
 for <buildroot@busybox.net>; Sat,  2 Mar 2024 11:17:03 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5133bd7eb47so379351e87.3
 for <buildroot@busybox.net>; Sat, 02 Mar 2024 03:17:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709378221; x=1709983021;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vTgJPRgQqaa334O0LIGin5Z4B2VMvT9tRmA1Zu8JIgM=;
 b=aIXD/hc8sSvK0SrZK61Fj8AU6qV/hM53Ry8U8rafEiiJCKW/gcwf+C2ML1Ah38RQzm
 aEj4f/Yk1L/tvHxD1zw6CnR6uDWR/SpEFoSnCPKHwIXar4sKuvEofCiCnw/MKo5tvQzV
 17aR7UES3WLSOzCphhtR6JfeykdjEKVNIuLhJCfJt7G9xw67XJCORrQoaHgqt2IkDy1T
 6odvErZHaTsI9KiqVWXiq8NdQdIPohg36ktJNT2BWCR+dBkz8sqpMFHtdDNpB7nVwMYv
 K0IYed/BQ9Ws2EpAp2R82qoi+mHEZshZhUv6k9Z1WLgiAOOM8LvOJE9+jYTLEa55AuRE
 X8Sw==
X-Gm-Message-State: AOJu0YxJgFl+/kjtVE//wUsa/mhGbKq1AoAcK/0dyVCtqKlumywQojeZ
 PmtS4p1NJVCmkMzOy68nfW821g2qDegf0UHMW4Sf4I7gW+8BlDhhbWEMooAf
X-Google-Smtp-Source: AGHT+IERjHw9vyfls5m2AP3klx1hcZTntG3+8duHbpp2QnrOu/Aa9QRAJ2KAZffgnAlKYSvfpdMc/A==
X-Received: by 2002:ac2:5e65:0:b0:513:2bdf:2719 with SMTP id
 a5-20020ac25e65000000b005132bdf2719mr2532533lfr.7.1709378220413; 
 Sat, 02 Mar 2024 03:17:00 -0800 (PST)
Received: from xubuntu-23.. ([37.66.33.127]) by smtp.gmail.com with ESMTPSA id
 l15-20020adfa38f000000b0033e03d37685sm7074081wrb.55.2024.03.02.03.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Mar 2024 03:17:00 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat,  2 Mar 2024 12:16:55 +0100
Message-Id: <20240302111655.126267-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709378221; x=1709983021; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vTgJPRgQqaa334O0LIGin5Z4B2VMvT9tRmA1Zu8JIgM=;
 b=ay0eF3uTspIt4Hc5RyQhBkM43EPssmrq94uq7fhfGdCGduxYdTkvD319AFfaNH2YnC
 Q2Lh1noG2s8CnHcm59PPl9jhEmo2H8x/+hPv5D32ULnKGNL2hYYYHETNElTSx+B8mNV7
 ho72gd1BrRg8g7zdUUvA2u+SZyLQgY/nnilEWx0KulUAaIcHuJYCtuzJC8rhwzlyRxL0
 E0sTr9TvZAaxrz1sD2zbh0fFleRswC4E1O/W1DEfixBD6i2uKzeP44DWHoak8sRRZLv0
 SzsoMzhWCLrTBabj7krwWJaYuwfNJ1LgUJAiSKVPZiXHiS7DKv+Xkd9xq9k9LLRQG++z
 QcRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ay0eF3uT
Subject: [Buildroot] [PATCH] package/quickjs: bump to version 2024-01-13
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/quickjs/quickjs.hash | 2 +-
 package/quickjs/quickjs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/quickjs/quickjs.hash b/package/quickjs/quickjs.hash
index 916fb6e3a..30613b982 100644
--- a/package/quickjs/quickjs.hash
+++ b/package/quickjs/quickjs.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e8afe386f875d0e52310ea91aa48e2b0e04182e821f19147794e3e272f4c8d8c  quickjs-2023-12-09.tar.xz
+sha256  3c4bf8f895bfa54beb486c8d1218112771ecfc5ac3be1036851ef41568212e03  quickjs-2024-01-13.tar.xz
 sha256  f41baf09eef895d468d18c23055d74f711e4b8b2641cef279b5d71285c07bfe8  LICENSE
diff --git a/package/quickjs/quickjs.mk b/package/quickjs/quickjs.mk
index 186397f9a..e745923b8 100644
--- a/package/quickjs/quickjs.mk
+++ b/package/quickjs/quickjs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUICKJS_VERSION = 2023-12-09
+QUICKJS_VERSION = 2024-01-13
 QUICKJS_SOURCE = quickjs-$(QUICKJS_VERSION).tar.xz
 QUICKJS_SITE = https://bellard.org/quickjs
 QUICKJS_LICENSE = MIT
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
