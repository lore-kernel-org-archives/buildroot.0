Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2830AF46C47
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 15:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C38D780845;
	Mon,  6 Apr 2026 15:10:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AYAJ48d1z935; Mon,  6 Apr 2026 15:10:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D15498084B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775488242;
	bh=9afn9Hfu/EbHSjOA6yg32mWud93T89mXy2c0kdiiGBw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=L+LLZfft7lN/ieR2R8xpRdU7QVGoPxsipBDHz9nhWkUlG92AA+Bi5fh+jqD+wei1v
	 kWGXxJd7qGpoJaqGjr+bHvPnQNANERbnDSb7EZZu2vNkmgOxAsBROnmI0ndBxTOKxl
	 4fgYNnv5HSmbXQVAwDDiAyVY3X+zIYbW3VBvsNgsjR/3NYAoS4z4TL6mUmJBugA4O8
	 VWkvA0sy8kHQj641uvh7/ZRnzm/oCvY5A6Lft1gpc88sAx3+RVkeoohZtzp8TibDMW
	 lMPqnPHrd+YZWLyqE17VpAeHKhtCxNBmW1wt+vH4bWH/HYaxINpPuON+HmviVsUwwH
	 iloAwMHeRgJOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D15498084B;
	Mon,  6 Apr 2026 15:10:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 929452EF
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 15:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FE3A40809
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 15:10:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d-J_z7ajcC_M for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 15:10:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9FC2240730
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FC2240730
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9FC2240730
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 15:10:39 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id E62845FFAA;
 Mon,  6 Apr 2026 17:10:34 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Mon,  6 Apr 2026 17:10:29 +0200
Message-ID: <20260406151029.251720-1-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775488236;
 bh=1ug1HUE5Pu6aZm5Oh5SOrs+lDX1PGAamfY7AKfiOumY=;
 h=From:To:Cc:Subject:Date:From;
 b=t4lHITefwnKfyPz95jKIbHUne07igLuFuZoPMpZtWnfyk2+PebQXHePmlLg9JO5VA
 yQzIHYBbaq8vZ12NFuNgJvBr6RTLHtECSSlQ4p9oC2zIT06xMDqIVBVSBwWciAxogv
 DOkc+IDfiuhLPqO/Q7YK2k8di7SbUSieHX0Q1zFX2Zqjx5dCRZuwOknBv0UTDkkSGN
 /cZIZ5GtYoiPDPvUak8wBpb2XMfqLcdHAxi1e34f54jNMWNxXmEz9v89iHRdivU+a6
 rsV2TEiED9vpVUB/pUb7Oxz8/1B/5ZEZ7wuPSSIWPCoo5RAQCpQFz39XjbwC/uhxt1
 569J6Cc4KdDbw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=t4lHITef
Subject: [Buildroot] [PATCH 1/1] package/gnupg2: bump to version 2.5.18
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release notes, see:
https://dev.gnupg.org/T7999

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gnupg2/gnupg2.hash | 4 ++--
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index 07eb84a8ee..d607e9bb86 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  ee0bc59eadf258b6d92131911b5dca6cabc89419  gnupg-2.5.17.tar.bz2
-sha256  2c1fbe20e2958fd8fb53cf37d7c38e84a900edc0d561a1c4af4bc3a10888685d  gnupg-2.5.17.tar.bz2
+sha1  91c523b172763621c69c0a213bc01b67b37d2298  gnupg-2.5.18.tar.bz2
+sha256  0dbd64e0322fe1a4813360d46539d5f8daf4a8fa235cf5fce464e8b0214a7e4f  gnupg-2.5.18.tar.bz2
 # Locally calculated
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index dd2fd0b0f0..1f7ff43e07 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.5.17
+GNUPG2_VERSION = 2.5.18
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
