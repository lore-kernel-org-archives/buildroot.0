Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91FEC636CC
	for <buildroot@archiver.kernel.org>; Mon, 13 Feb 2023 18:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8535F40A14;
	Mon, 13 Feb 2023 18:20:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8535F40A14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M7ZKjJNDca7Q; Mon, 13 Feb 2023 18:20:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C124240A30;
	Mon, 13 Feb 2023 18:20:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C124240A30
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5BDB91BF289
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 18:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36D7C409FC
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 18:20:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36D7C409FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xzp3h0pRfo06 for <buildroot@lists.busybox.net>;
 Mon, 13 Feb 2023 18:20:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70719409ED
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 70719409ED
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 18:20:27 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id dr8so33972570ejc.12
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 10:20:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zAxdQNCQUUvqjwHuSYBsbQFXcnFQPEjUIveU70MdVVo=;
 b=Q9uPGF1kM1nHB5PwahR4fcyHLz6MAbEQ7NQ0AFB90aRyGEp+6MfVAlYmcR5JkNIvp7
 GSTmPLGaULRGvCNjTr8RcI4/+s2OwfFUTpC86LuG41gqgbDbYdjXBN5UHKX585HXkpgc
 4b0FnNbPRrHJReUBjrEB8++UPl2S0D/rtnuTgPdHBnWTE07fB2zn4TkmuD80BpSBgJM7
 HEOcNBJU/jW5d+B1WPRP2aQ+2B/2rg+eQAGmDLUvvUR2gL5l3R9LBBXa+mRNM9ZYVCTn
 PRgVA08iCwiwfmHrpUQVhVC6N3uL+/a7r8I0NlzodlxgIn54XDnMLn1Vm98FZfnisdd1
 +75w==
X-Gm-Message-State: AO0yUKXMoGwHIodzKVJSj95LQWdjNpT1h0d1ZX0OSSCJBBwJgdB/WgLO
 AjmRaC6AG+0o0KG7vjKjd9dvCcIgsGWnWA==
X-Google-Smtp-Source: AK7set+H1Ds5h96awyJcoMMLM3E58yG1uKbMMkVuv3LrrpeAhLhPiFFCiXYETY6b3SpPoCfUOCBrVg==
X-Received: by 2002:a17:907:31c1:b0:8b1:238b:a29f with SMTP id
 xf1-20020a17090731c100b008b1238ba29fmr1920504ejb.10.1676312425216; 
 Mon, 13 Feb 2023 10:20:25 -0800 (PST)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 v24-20020a170906859800b0088c224bf5b5sm7145165ejx.148.2023.02.13.10.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 10:20:24 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Feb 2023 19:19:47 +0100
Message-Id: <20230213181944.10292-3-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230213181944.10292-1-heiko.thiery@gmail.com>
References: <20230213181944.10292-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zAxdQNCQUUvqjwHuSYBsbQFXcnFQPEjUIveU70MdVVo=;
 b=WBMJo65A03ClwAb3myTnBufAon8IPKkSr90RtexVOzvF1LBvIu4p8xhSDzWg5XQ4A9
 Jp9rYeEuAB5ozypTme9sbRqT4utNbJYV5qdq++j5aTs5DKH+LNsgpm/FyLCxRG8tK3he
 ODzDPJRr9XlYjtkOHH6KUXkafEkoDghG9b21BATS3zpxA+sUxcRuUqvzkzRRkHEeYd5Y
 Ocgu7btnWLSx3oTx1x/q+ztSanSoSbQc+My5TSfVe4sxokoePCAqPAGtkuBmcE3N5k2V
 aobHlIfI8Oy6z1URjEpOLHHEX89kPcyEdhhq5cItKYOLf0gDdMnOmANnu/0oX86/QSzd
 CN1w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WBMJo65A
Subject: [Buildroot] [PATCH 3/4] package/sysrepo: bump version to 2.2.36
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
Cc: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/sysrepo/sysrepo.hash | 2 +-
 package/sysrepo/sysrepo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysrepo/sysrepo.hash b/package/sysrepo/sysrepo.hash
index a90d8259bf..6a5e98f41b 100644
--- a/package/sysrepo/sysrepo.hash
+++ b/package/sysrepo/sysrepo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1bc866f13e41ba5e7e4acd52b5c3d42b1a2a1e032775e0a9b094f3265844cd25  sysrepo-2.2.12.tar.gz
+sha256  bebb7901682eb23bf4c73d086d0a45c124ec751a67793a66024f1d4203425730  sysrepo-2.2.36.tar.gz
 sha256  88f1b7e5c64d2c113e07105aa9c0fb80639b40287565be1c2afd0949df83d826  LICENSE
diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
index 9da8c22ca2..6b031ae6f9 100644
--- a/package/sysrepo/sysrepo.mk
+++ b/package/sysrepo/sysrepo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSREPO_VERSION = 2.2.12
+SYSREPO_VERSION = 2.2.36
 SYSREPO_SITE = $(call github,sysrepo,sysrepo,v$(SYSREPO_VERSION))
 SYSREPO_INSTALL_STAGING = YES
 SYSREPO_LICENSE = BSD-3-Clause
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
