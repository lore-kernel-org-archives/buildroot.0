Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8E4C47DD3
	for <buildroot@archiver.kernel.org>; Mon, 22 Jan 2024 19:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CD7260A8A;
	Mon, 22 Jan 2024 19:33:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CD7260A8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cf4jJJlt6IYb; Mon, 22 Jan 2024 19:33:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE1D761028;
	Mon, 22 Jan 2024 19:33:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE1D761028
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 854FF1BF3C5
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 19:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F02F81335
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 19:33:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F02F81335
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2zyduILImrLB for <buildroot@lists.busybox.net>;
 Mon, 22 Jan 2024 19:33:35 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED3EA812F3
 for <buildroot@busybox.net>; Mon, 22 Jan 2024 19:33:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED3EA812F3
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-336c5b5c163so2149229f8f.1
 for <buildroot@busybox.net>; Mon, 22 Jan 2024 11:33:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705952013; x=1706556813;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5SURw8Yrafj84DBXMiUn9PMrPxGcxB7lCdLYXp8yJII=;
 b=Kx4C3a3nynKUP1Xw1rcd7y/wRvGelJCDKbIIKbq6H8mFP+3EOQ6iJfeZeAF63ARZrP
 VdokpWz6IFuCTtU67+EHDWsNN//ojmXHpsEcg71qWNKKCWjhNp3N+B/258mB5v/+5mSD
 QcxszfNZYPkK+o9E8FrWRA2scSiTqUT0kDoXmhimIZDgj6vfEX9al9rnm0wN44HdFC67
 l62H4g3G6p+K0CzeAEw2JX9y0g6D5tkWOxsBOvuFkItXpFPoFaHT4L2WFZfCUe6xhu1H
 GmiZYUc/TgRF3K4f9npWg6mkrYz3xb/swL/WUcS4FFWN+KE0xf7F7t3S0rBUh5ORaON8
 DaUw==
X-Gm-Message-State: AOJu0Yzg1UGf2lfmCMjQyqA34riHJ36IQrkqNdWr+69WMKJJ4pdNXWOv
 7ENN0brj/mZTV+jdll+ETVBPUNVi5f6ln/v7qmHawQoySohS/bAp/DHJl4lF
X-Google-Smtp-Source: AGHT+IFJ5LmBX9zRvgnja1AqpyXwVv/Lv+NO5Jj2rTnmRyCIV9wGxl458IPj2GLw6560qZVJYRAgyA==
X-Received: by 2002:a5d:5309:0:b0:336:7934:9b37 with SMTP id
 e9-20020a5d5309000000b0033679349b37mr2470602wrv.25.1705952012721; 
 Mon, 22 Jan 2024 11:33:32 -0800 (PST)
Received: from xubuntu-23.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 dq15-20020a0560000ccf00b00339336660d4sm4191673wrb.9.2024.01.22.11.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 11:33:32 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 22 Jan 2024 20:33:27 +0100
Message-Id: <20240122193327.7607-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705952013; x=1706556813; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5SURw8Yrafj84DBXMiUn9PMrPxGcxB7lCdLYXp8yJII=;
 b=JVlXUnILvcCJnPiaRP2GrTyZ6bLwog0HrIgpKv4qvu34toC/bEV6G8bJokRDOn4PTD
 oBeTgOwskMByrfNtrqC8qupym4UaFDWp6HV4hNYj1jzJ1bsGELh/KQoSx09tjwul/G9U
 RXWPFMdL8tXFQYCXV8wx0UHSRFtLASM+KOf6wiQjC2Zfjw40G3qyA6frEC971nzvWONq
 DpizRMXxCj3M8+IrQ094wyCokuCuPFqgux07/Q7h0AVLRbfcmgk0dZ74G1K4VQBHN7sQ
 qLtDd3ZuFVM4ZsQpUOWEkO+OoTCC8yBkAPR+S+X1N9pDxymgir8HuJhwqbmMa+Wp/bfn
 qdPQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JVlXUnIL
Subject: [Buildroot] [PATCH] package/htop: bump to version 3.3.0
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
 package/htop/htop.hash | 4 ++--
 package/htop/htop.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/htop/htop.hash b/package/htop/htop.hash
index 12dc864de..3e45e1a21 100644
--- a/package/htop/htop.hash
+++ b/package/htop/htop.hash
@@ -1,5 +1,5 @@
-# From https://github.com/htop-dev/htop/releases/download/3.2.2/htop-3.2.2.tar.xz.sha256
-sha256  bac9e9ab7198256b8802d2e3b327a54804dc2a19b77a5f103645b11c12473dc8  htop-3.2.2.tar.xz
+# From https://github.com/htop-dev/htop/releases/download/3.3.0/htop-3.3.0.tar.xz.sha256
+sha256  a69acf9b42ff592c4861010fce7d8006805f0d6ef0e8ee647a6ee6e59b743d5c  htop-3.3.0.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index aafda5d48..6dbaae379 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTOP_VERSION = 3.2.2
+HTOP_VERSION = 3.3.0
 HTOP_SOURCE = htop-$(HTOP_VERSION).tar.xz
 HTOP_SITE = https://github.com/htop-dev/htop/releases/download/$(HTOP_VERSION)
 HTOP_DEPENDENCIES = ncurses
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
