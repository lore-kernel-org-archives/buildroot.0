Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50754CD37AC
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 09:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE05A84354;
	Mon, 11 May 2026 09:33:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tF8zPePiMVxC; Mon, 11 May 2026 09:33:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0189084355
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778491999;
	bh=lelzqk2x+tVHC6zV0xaleNJmC81G19EV2ITBL1ogcXQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YdBf1+sX8fwYW90up/izEfjrc1w/4Dyva1iMzUpGhIHw8fvA4IqFIZkcGogw1C43x
	 9gmpLSyzbCOMS/Wh85sWDufp7yeoS7P+uigRW2S3PjuXOnuQV3PxcHYbSPH0e675Xe
	 SQ8E1TipXCyLdZ5U67rijYqX6SccFQYFp+ZBLjA74B3jP2mT1qRCUdYYNIufP464UT
	 9nJ+tBFA8P/oy8DAdBqX6/snA2DfRZJ45gsmsJNFCq+sPMdRgqORG+oqxvUcr0yBDA
	 I0LSaKsSRbQDHbWuoPOAmUdPasgv1EYhf8Rjlx3+KHTRULHVJub2cPMWKNEmjP31M7
	 ehLa2s/XEhBOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0189084355;
	Mon, 11 May 2026 09:33:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E3EE223
 for <buildroot@buildroot.org>; Mon, 11 May 2026 09:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 374C784355
 for <buildroot@buildroot.org>; Mon, 11 May 2026 09:33:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LDVSCaxEDy_m for <buildroot@buildroot.org>;
 Mon, 11 May 2026 09:33:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8F50084354
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F50084354
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F50084354
 for <buildroot@buildroot.org>; Mon, 11 May 2026 09:33:15 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 329688247; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 11 May 2026 09:33:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1wMN0h-00000009BiB-1nvd;
 Mon, 11 May 2026 11:33:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 May 2026 11:33:08 +0200
Message-ID: <20260511093310.2189957-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=bS1lzFGyJGWHE50Rz6nncnLLrKezu3/uDYxLvb95Fvv4PVnvWWpd7iEeFCrja6iI0OVt6YqxmTWohkVjewf0E5QdQAi4a7Cj51e0/0hsiQF0q8q4l47NbFEn3IuL5GWeW/yh0jR2OO4bT+nf3za1YQeQLsQXcvXxquoYpoyVhGkcuCa2JJLI904ZUw7e7kx/LyuRNN3nOqWPV+cu5CDPaUBQR3Us3tY4qURoWR29jdde6tttHcoMGrbTDwy9m/Kc8pUX89Q5jL5rE1fze7vNWBgrKCBuvIlzmpSNMlTrVlslwTXmKextvbw0RTGqA4u3/6fw6AnU4diLnOEOKeFyRg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=ZX3BtHcD6KDHyfmHhIqwA2peaRtlSDw+YA1APithpNI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=bS1lzFGy
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/dropbear: bump version to 2026.91
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

Fixes:
https://autobuild.buildroot.net/results/6372e58671d3719b127dcb69642420a07f441790/

Bugfix release fixing a build regression introduced in 2026.90 related to
reallocarray.

https://github.com/mkj/dropbear/releases/tag/DROPBEAR_2026.91

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dropbear/dropbear.hash | 2 +-
 package/dropbear/dropbear.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index 81296375a1..31ac153b89 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,5 +1,5 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
-sha256  16be820347723271b0fea6049ffeed6d6680d7429c65406d8af37776393a0250  dropbear-2026.90.tar.bz2
+sha256  defa924475abf6bc1e74abc00173e46bfdc804bd47caafa14f5a4ef0cc76da34  dropbear-2026.91.tar.bz2
 
 # License file, locally computed
 sha256  a99ce657d790b761c132ee7e0de18edb437ae6361e536d991c6a12f36e770445  LICENSE
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index beb635e15e..a7de8432af 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2026.90
+DROPBEAR_VERSION = 2026.91
 DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
