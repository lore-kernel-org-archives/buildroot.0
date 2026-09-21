Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF9AC982E1
	for <buildroot@archiver.kernel.org>; Mon, 21 Sep 2026 06:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E88A240DA3;
	Mon, 21 Sep 2026 06:18:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cIrt67kTc4yZ; Mon, 21 Sep 2026 06:18:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 04E8D40DA4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789971499;
	b=di2J99gKEvjt+DAPZzcpMWTwBGIybY/zcQ7Cywl1tajKejrQEElO91As9kQxGEJDRLBU
	 4ABg8lQxdagWM5HewNfe6850vmf+sGWYySDBK6nNnRi3lD3x12QpSU6/3ZaRRnJKOqGD3
	 gGUgHsLiG/OyWJNRpB9E9Dk+/zZuUiLzowGS49mQV1tHqkMr5yRtfM5NWN9hGYpSO1JJe
	 TXA4aleItw5pVlzrdwEGUxVwRXGDXGJHWG6SzqPQRfFWaSrt5iG5Ta8SyGBMNKvPGxpHp
	 PfWVuCmB+5vsH8tWShAhxzGiiMSz8aHDLx5uh4YQSd98bRTdsa5L3JuGNBo5ycGjvZQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789971499;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:Received:Received:
	 Received:Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:
	 X-Amp-Result:From:To:CC:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Originating-IP:X-ClientProxiedBy:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Y3EC8B8nIe+KpwSNEF/gbVgbVCNt+zLEo8eTWfxylF0=;
	b=ALxXXXxscT+djfzm9lSqkbYAZJYjvq2vxrX3r3PhEH+z/k4OVeWrvmlrI/xpDD+t71NG
	 1RYgZD4XwGuRTKRt8w0Nn7rQiDmXihjYyNnSGzOy/+KsjeV2k3tHswjupIfs9uePJxcUv
	 Dh0MDKoXkZHieLQ5GGXV+S3qHokBOJJYXPftAnS6GnLRHrBR2Zy2RH4zkAP0ZtEculOK0
	 8U46zDRijRkIHaqMvpAYeyET2XoB/tkyuxf7ZAGi1q4q/brXXpKf3HEWelTfQUNWGT8Mv
	 HiBlDEks28+uzy7eWvOzJGfre+uz119txJmTkgSomdCIR24uF2OHZNJf2zc0DtcnKpw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789971499;
	bh=Y3EC8B8nIe+KpwSNEF/gbVgbVCNt+zLEo8eTWfxylF0=;
	h=From:To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OhtaKRChVscOReb8xSDpe38mIYNRRU+9RSsqQi+o9mTOpbaa1J3n+EF2/FkmQi3Br
	 b2CcR21AdMAP5G0yb4DnGJVx6uJUfVLO9r2xcSYfDkiGlMA8oENUuFbvPLZfSGqS0n
	 f4i1s3fe7LQVDMEjZCyFw4s21GP0oUfSsJaOlp/YdLefwHV6v928IOy5pZ5mo7IRgV
	 k6h5chXC2ZReKK69jbIqbMzsgs2OX8dM9mLudw5xXj+Df541qHUxLQdwiU44oGcqKf
	 61xSLqfYGQijsxqzkS3Ni5zzDic6lYnEZtck5NGJl+cTZcNBLvCT/6sJHSxxdn5eYC
	 AHnW0RvUfMVow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04E8D40DA4;
	Mon, 21 Sep 2026 06:18:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 58F26392
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 06:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DF4580D35
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 06:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sPC95XsJZSvB for <buildroot@buildroot.org>;
 Mon, 21 Sep 2026 06:18:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2DBDB80D05
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=80.12.126.236
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789971496;
 b=LwgmbtjTIpfbMe/ChZt+0M58/gJV7MPN7zkXc8921GDX0377t94Ot/F0Ipcf4ypfGlpf
 n/+ffTo2nmx0CfXrHQDDPhnx+8N+qhctKzAS2B13/BIc7lWv9zOpi9gMkBw0I1nSshBuI
 wN7AvxhzD5Xfs364FXc6FE1956mJzDHlLdSLSo7ebBiGVx0NWOwiRmAbPrHuz/8qRKh64
 woVMCHLMu22cvP9Ok5eCeJdX/NTD9djsKTo1aSUwnpPchpI9ugG8Ug4wllrfTbrV9Dm+a
 YEKLyHqD95c09mQl2npfFQion9xBAiQSaO3Qau3HU8jY1Vc5UYiXgbFop+dBgh1R50w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789971496;
 h=Received-SPF:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
 Received:Received:Received:Received:X-CSE-ConnectionGUID:
 X-CSE-MsgGUID:X-IronPort-AV:X-Amp-Result:From:To:CC:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:
 Content-Transfer-Encoding;
 bh=G/z+hoaLdeaQim15nnlX8Rxvdb+VL5d46Wh4vLbljHs=;
 b=OUH/QwHlgFdX1uBd9F5QHLxC6Ra2YGw5g6mFTkbVdGm3rNWHR1x0R8Sd2FgSi67sih9O
 4XOMQIOgOswYLVqMQht6T62SZWM+SiOnGOkld2bJpD3CqZQQ+8KJG4fA7ftYGfi30z1i6
 BZi1vPaVcTOeEdzrpOUe4DEAYmDgMbfBybldsBdf3efJadA6aHWS0Fmx/bnEaT97AEkF7
 LsbGNNPvCB83BqOj6+xofpGUBg4xFpmTsqL3vKJqLTxZZjugRzRkpQjmV9sZ1c3ojsogW
 EUNon0PFDVWSZsqFmObJPJ5X1Ivvbu4f+c96SUqw8w/Fd5EY3onXzhNg12Cm/vclmvg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=orange.com; 
 dkim=pass header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b="d/DBrcG1"; 
 arc=none smtp.remote-ip=80.12.126.236
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.236;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=orange.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=d/DBrcG1
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2DBDB80D05
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 06:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1789971496; x=1821507496;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G/z+hoaLdeaQim15nnlX8Rxvdb+VL5d46Wh4vLbljHs=;
 b=d/DBrcG1MD1Wwyz5VbUa317tmd+vdFtZgGc8ydM35zprbNzhKP/vvGeh
 VtRAUL+hs816szh97ErfyTxoJqCIsjz2HcSQo7tpA6YyK4nkQ1+V7VMTy
 htP2b6bvoDa5F+qxZ0UT7z/V4NQL0XRusOGgcFjTAPIXEnAkTapKZmw8D
 Pqh+DAVhls3w5pDgYqOSLhKOTHH5T2aL4SQv3Afb5+2uvNCImIlsHAMdR
 ED44DYJSBlfOsI0hyL1Dvqnihvdwv8HYpWPszLz4xNVdj4TggO+/nlgIH
 vbFnniDzVXKpv4nALTCGP+HtE4RDGupXRS6y5zuvNHHK9BC2smF7K77QZ A==;
X-CSE-ConnectionGUID: qmvt+/YlSZurcUMXJbw9LA==
X-CSE-MsgGUID: gr1tDwz1Sy689LqFrrRFAg==
Received: from unknown (HELO opfedv3rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 21 Sep 2026 08:18:13 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 08:18:12 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49;
 Mon, 21 Sep 2026 08:18:11 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 21 Sep 2026 08:18:10 +0200
X-CSE-ConnectionGUID: edjErUxiRhqXgVKpOr4t1A==
X-CSE-MsgGUID: IzxxmtbrQoq7K7kFxtDMLQ==
X-IronPort-AV: E=Sophos;i="6.27,114,1787004000"; d="scan'208";a="470425571"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Mon, 21 Sep 2026 08:18:05 +0200
Message-ID: <e08ef449d915444978f2bc784c9fdb7438d11c98.1789971481.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1789971481.git.yann.morin@orange.com>
References: <cover.1789971481.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: ope16normbx505.corporate.adroot.infra.ftgroup
 (10.115.27.25) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
Subject: [Buildroot] [PATCH 3/3] package/skopeo: security bump
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

From: "Yann E. MORIN" <yann.morin@orange.com>

This releases brings in a fix for:
* CVE-2025-11395

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 package/skopeo/skopeo.hash | 2 +-
 package/skopeo/skopeo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/skopeo/skopeo.hash b/package/skopeo/skopeo.hash
index 8a9fb22133..e496eb4410 100644
--- a/package/skopeo/skopeo.hash
+++ b/package/skopeo/skopeo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1eea9364e344c4d6cb398fac53bc387663d19690552003b43c75819e8bb55527  skopeo-1.24.0-go2.tar.gz
+sha256  6a3f342a327ec7684198eb0e15114940b6101506db48d9a96590f5942cb3b335  skopeo-1.24.1-go2.tar.gz
 sha256  716a8b80635c394681e652823e1e42e411ad2d254e1f202403422d74f4b0b106  LICENSE
diff --git a/package/skopeo/skopeo.mk b/package/skopeo/skopeo.mk
index 354998b175..5a22658611 100644
--- a/package/skopeo/skopeo.mk
+++ b/package/skopeo/skopeo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SKOPEO_VERSION = 1.24.0
+SKOPEO_VERSION = 1.24.1
 SKOPEO_SITE = $(call github,containers,skopeo,v$(SKOPEO_VERSION))
 
 SKOPEO_LICENSE = Apache-2.0
-- 
2.43.0

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
