Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A84FF8861
	for <buildroot@archiver.kernel.org>; Mon, 27 Apr 2026 11:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A10C84F53;
	Mon, 27 Apr 2026 11:00:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CqvMRLZMSXSV; Mon, 27 Apr 2026 11:00:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3506884F73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777287631;
	bh=c7v/BAWdaOEL2fYHkc/QS6nhmDs5SsaBmzp+jdgLUFs=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=ntS0v3gTewZhHO1wExVWhQxMtoyty0NimsSzVAnVeabF7QkWe3m7BUyVHclW5Qu5K
	 H7WLdnTh/nA1yqtinB2FN3VRwOrIDyX5jr8T1r4A46JJ5eWWrijwy6EuHHPdl1+PAe
	 UMur/nntkAXXNyEthvqkdY/s5ZJyK//YN8uYSZjo3Z7BC8adCArCci5ltnrbBG8TR8
	 g7WRySnmrlSSV06SNHPS/Cm6C517Xew2FbyaaXJ25Sts96BzkbfiGNONIKrOzN3o4J
	 dhS1Q36WcLsqIzvY5OVm2/6Qu5yOEC9LKGGuegX66YDMQpLsIVC8FO0pWpMA+Wi2YU
	 GZEfROGl9oYqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3506884F73;
	Mon, 27 Apr 2026 11:00:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 828961B8
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 11:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68A3D84F72
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 11:00:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 30caiNLpf9uT for <buildroot@buildroot.org>;
 Mon, 27 Apr 2026 11:00:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9C09E84F58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C09E84F58
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C09E84F58
 for <buildroot@busybox.net>; Mon, 27 Apr 2026 11:00:29 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ba7a1cc0380so1637722166b.2
 for <buildroot@busybox.net>; Mon, 27 Apr 2026 04:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777287628; x=1777892428;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=frUcQeNpxVUCgpwVLgrcGFJRydi19Vcq9WuM8pEMIZg=;
 b=CZI2qkWR3ahinEKvLE1a0g9JlyqOS2zA0iadYDgJzlm6iwFPqi0Q699IpDYbBUdVqq
 YTWpSwYDz9meyzoB/8q+LypYrOR/qzZH4h7JQaAWVVmKuPj9qLUxqEcg91yQeqoFt9vC
 KSrlSBG/J9GV4Xdh/REg25xM4NJIo0MBzfhrjLDaaUllI0je7GOh42eAC9HYMpGCBf8l
 uPlBdmHdtmrrjj4GDMlWGHBleANjaE1xv6i3i63HRjiuOBi4JjDn4QIHHNEJnQQFd6/w
 f0k07unekgC+CPLeoowzKAXhvmYr1wRLUh/F1d1HQsuwo3EvlHM9nWTMns2ZLJ+8PwXq
 IpVQ==
X-Gm-Message-State: AOJu0YzX14gvndLKW8RRSda0VDKc61p3xvpK2LI43xt05ZZjpv+3Sls1
 NWE4n32J8eL6WHpN4Y8D7MF1JfMFC40ibpaQbTPyd2RSKIm6vVEKGadrHK20IahTgKeLcVqjAbD
 rRclNHp8r7bw=
X-Gm-Gg: AeBDieuemqqNAzbukUAFJ8h4HAl4MP8dltygPtPrN94KgWzNa0lidRbgtBQPOc4pLmj
 r+uzb9bwa0/GzIvrT4WV3VaCNNHHZ4pdxPaCw2pWZsY3Vd1S9V/R/42Wm2s0SKlGBqhR6cRT3jo
 MaGO35ugaTqPFENvl+A88gaWxs2K8ue2NIKR3FEDzT00W2Ctsz9DM/dGVrb48lniwPV7OGo+yF4
 sdyt+9eJMKjlekacPM2Nwrdm/HCbtf1dUAgRdvaaB5ChLqv0zLfOILXD/p+I8LFGaSt3j1wvM2l
 70hNM9+s/YEunRhWl/ZDyI9TEBIvn91iXz4QOS13ReXz0+DZDvJi6qq5OIDh6P3UF3+LWUA48ic
 kf7lAEjHti9BMhUUF6NcPk3VrhgEoyB9g4vrCcwGUEWBw6iWdHtUfKuNDFFiYrZMqgDlRNzrBf9
 eJP+sm3uju7ZoCcnsFa+tYYdofHJvNzbHCByjBA2Nstjo7s4rKK9zrGUgyJ/iz
X-Received: by 2002:a17:907:c30a:b0:ba0:d58b:6045 with SMTP id
 a640c23a62f3a-ba41a91d579mr2151909066b.27.1777287625727; 
 Mon, 27 Apr 2026 04:00:25 -0700 (PDT)
Received: from vm-2404.. (222.186.66.37.rev.sfr.net. [37.66.186.222])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ba45553e9e4sm1121505966b.60.2026.04.27.04.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2026 04:00:25 -0700 (PDT)
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad@gadz.org>
Date: Mon, 27 Apr 2026 13:00:22 +0200
Message-ID: <20260427110022.71260-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1777287628; x=1777892428; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=frUcQeNpxVUCgpwVLgrcGFJRydi19Vcq9WuM8pEMIZg=;
 b=KbiyV2KF8dSvkzShKcwsrrPiMzgLca0iO8R5Mt6ZNwKq9ihnfCqj2pReXE5YoEcldl
 +YbiBQHe2tFw40anPHD1j5V1ETBBCupRO5ecAJxIBxvvkK7A3Bh2ZuTPkszLpQ9uoUBF
 vSzIegn8etjGyhUdgACX0PCLbdRlPcVsGC828gIPjC3o5AIWPC4SLXK6CWVp1gGfvvIn
 NRfFrKCXcVSKGLC4ljYwfbFQm2A7mPtsoqoN5APfXMU7eNLl4+cO37DTU8DaEkdunsHh
 b9O0pwWWPjcndA3hEVdONpD8HPLDnA/WAOKxXM1tyvwm/CwAt01J2+xpmyElm63NrfII
 nLRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=KbiyV2KF
Subject: [Buildroot] [PATCH] package/mstpd: bump to version 0.2.0
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/mstpd/mstpd.hash | 2 +-
 package/mstpd/mstpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mstpd/mstpd.hash b/package/mstpd/mstpd.hash
index 7c6c482ef..021a4743a 100644
--- a/package/mstpd/mstpd.hash
+++ b/package/mstpd/mstpd.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  6b4a0a721147373f0b22e8f47c0f13942b78afc55348299fe7b056b75adc98f4  mstpd-0.1.1.tar.gz
+sha256  37cbc03ab14763a2d477d2230508ab98c2acec43fa869b985c264d44e125c386  mstpd-0.2.0.tar.gz
 sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  LICENSE
 sha256  69e0a7ba32b016703dea402deae57348f14d028ff4dd9188b2acad607e484588  hmac_md5.c
diff --git a/package/mstpd/mstpd.mk b/package/mstpd/mstpd.mk
index 79f361ee6..aa7428363 100644
--- a/package/mstpd/mstpd.mk
+++ b/package/mstpd/mstpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MSTPD_VERSION = 0.1.1
+MSTPD_VERSION = 0.2.0
 MSTPD_SITE = $(call github,mstpd,mstpd,$(MSTPD_VERSION))
 MSTPD_AUTORECONF = YES
 MSTPD_LICENSE = GPL-2.0, RSA Data Security (md5)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
