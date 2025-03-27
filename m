Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064C8C36011
	for <buildroot@archiver.kernel.org>; Thu, 27 Mar 2025 18:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 750CA4F02C;
	Thu, 27 Mar 2025 18:29:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TmsBj4rSQQiC; Thu, 27 Mar 2025 18:29:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F13F4F02E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F13F4F02E;
	Thu, 27 Mar 2025 18:29:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BB7D19A
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 18:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D90684FBA
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 18:29:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9_Xt1XUXDzYt for <buildroot@buildroot.org>;
 Thu, 27 Mar 2025 18:29:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 40AC284FB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40AC284FB3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 40AC284FB3
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 18:29:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6caaa.dip0.t-ipconnect.de [79.214.202.170])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5E916A4C027A;
 Thu, 27 Mar 2025 19:29:41 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38364)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1txrz3-000000007lb-00TR;
 Thu, 27 Mar 2025 18:29:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 27 Mar 2025 19:29:40 +0100
Message-Id: <20250327182940.944174-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1743100181;
 bh=XDqTTxEOmO7K1/1UPBrtz7qa39xYm+XrWR/epm+X1wA=;
 h=From:To:Cc:Subject:Date:From;
 b=P8c9vgPO0gfs5lsx7VgosabM0bJGiulPqAB1WAL+5XfkigxBdc6SOBMl/mlCflu69
 0YgEWzOOdhmCqfDC0KDI8t9WZ1zwMak/tYrKDmP/MM3sxhuNxnKLPIJg/XofzPCH9M
 TdSQy90dqkGafk/XiR0Z+go6MsJXBzS4XxM93L6hv+j2HFHYyWlCosEPW2ht/l4bHq
 ofFgow9u8Xw9VjYX//IhL0/EocTpx5IzTwQDwDiywoiMVBp5M8W1SPIkIRAAmMiOcm
 z6QyV5QpzFwkcgFmA0RpRhu2JTww4zS7lQMJhzUvuRhY06+zyTCXPlxM1Hvu/FBmFO
 tR5nWfd7L1heA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=P8c9vgPO
Subject: [Buildroot] [PATCH] package/exim: security bump version to 4.98.2
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

Fixes CVE-2025-30232:
https://lists.exim.org/lurker/message/20250326.140105.6b97555b.en.html
https://exim.org/static/doc/security/CVE-2025-30232.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/exim/exim.hash | 4 ++--
 package/exim/exim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index eba73e267f..0dd5ac47ae 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,6 +1,6 @@
 # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
-sha256  d858b75ad2cc6bf71c9071ba26a55b3ea9add26607bd832df3cb54f82221c2ce  exim-4.98.1.tar.xz
+sha256  88b8e8a67c1db6cc0b1d148161aa36e662f4ca2fef25d5b6f3694d490e42dcae  exim-4.98.2.tar.xz
 # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
-sha512  8f80999a41ed40e86ee16eea5cfd765e2f164ea149f40eeb410fd02fcf35c23317dc69540efe336e9e0fae930b1cc6771e0180dd70f1314531cdb139740c744e  exim-4.98.1.tar.xz
+sha512  aaa4cfc8aee90818c6d1c2fd0cf64b82668d1a343f462f678b38b2b79e10a467240f2e81786eec7705eec3598d23686a74437c50b68502f29ff67788393c812a  exim-4.98.2.tar.xz
 # Locally calculated
 sha256  49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 5135d02574..9ecae0d038 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.98.1
+EXIM_VERSION = 4.98.2
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
 EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
