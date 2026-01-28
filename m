Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850CBD25B48
	for <buildroot@archiver.kernel.org>; Wed, 28 Jan 2026 11:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AFD04077F;
	Wed, 28 Jan 2026 11:38:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WCVOBw7ojfx8; Wed, 28 Jan 2026 11:38:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26B7A40759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769600287;
	bh=DSxQ+8cc28Xwarli5ZmOHmcipN0LYoteI+fKFNNpyvQ=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=J+jCEE3xGCrF4QpRpL4Q+VxUloyPy9JRDc2SdRv+P499znFHweZhXNmO0j+WqYN/b
	 3K4wKLYf4jMuBAFdkGCjasairdmrdsZkCik7bqmlgXI4YCDYu6jLKidH/xXPw/1fd1
	 gAkeQWnfY2qFRguu9oVlD8OhdVzRHLAQGH1JfrTMSr4riwazHp5kVYmE01qJZIZ/fD
	 Yu1vYIutKnNZvT8YuiHMvKjE97H7kRxAWyz50UFmJ+7BFltrfk4fA1754DWKqyLkhy
	 69MYS2fwYTy+UCf8rQhFiKv58oh4AJS9/yQb4do2EOub8cqBB5FHTPVsWYifcEkey7
	 AJizXuBRsMJcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26B7A40759;
	Wed, 28 Jan 2026 11:38:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C2C741AD
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 11:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD21840759
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 11:38:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z0WgTQ-iKrWz for <buildroot@buildroot.org>;
 Wed, 28 Jan 2026 11:38:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 703B7406EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 703B7406EC
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 703B7406EC
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 11:38:03 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 6F06919F742;
 Wed, 28 Jan 2026 12:38:00 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Wed, 28 Jan 2026 12:37:49 +0100
Message-ID: <20260128113749.455310-1-ju.o@free.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769600281;
 bh=vCQ5u/RKRp57mIFwGn4n5oAVbH0e/jyPNdfoiH2ybME=;
 h=From:To:Cc:Subject:Date:From;
 b=oYOY4Ne8fdMDNBFMRA4YEY2qUE10Y1wssc1jP4hOyoKeGVt5aFRYSx45xdsSlUdMS
 ukAouQZyw175AVljiztCC52XXEQNCLdfhPdMXWOhVigePAEZqPPSL1pMiVSw/Ga0T9
 n3B1RZBVznd0tumtrSSKlSWZJGOlGrpMDNiIy/dRkT/qSY+bPl/jzdLYXxD6sKO8qb
 qw1us8BkMTd3Q4AWr4E7vZA8j3J/ked4mfBzslCybG7x9MYT8GcJSxDFeBCbm2CUrN
 6wxLecoR2RCMh8AA6CTjvfEWo+pnq3ok0yV3fT3J1PXTmU2eGuwwZe9aVqnCvWYFNy
 jaUlLT4+epDUA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=oYOY4Ne8
Subject: [Buildroot] [PATCH 1/1] package/gnupg2: security bump to version
 2.5.17
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

For release announce, see:
https://lists.gnupg.org/pipermail/gnupg-announce/2026q1/000501.html

gnupg2 version from 2.5.13 to 2.5.16 (inclusive) are affected by
the following issue:

A crafted CMS (S/MIME) EnvelopedData message carrying an oversized
wrapped session key can cause a stack buffer overflow in gpg-agent
during the PKDECRYPT--kem=CMS handling.  This can easily be used for a
DoS but, worse, the memory corruption can very likley also be used to
mount a remote code execution attack.  The bug was introduced while
changing an internal API to the FIPS required KEM API.

Fixes:
https://dev.gnupg.org/T8044

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/12896044438
---
 package/gnupg2/gnupg2.hash | 4 ++--
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index feafbb328b..07eb84a8ee 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  3acefeef08c82a4d4a8ba36f95c2986fb925d359  gnupg-2.5.16.tar.bz2
-sha256  05144040fedb828ced2a6bafa2c4a0479ee4cceacf3b6d68ccc75b175ac13b7e  gnupg-2.5.16.tar.bz2
+sha1  ee0bc59eadf258b6d92131911b5dca6cabc89419  gnupg-2.5.17.tar.bz2
+sha256  2c1fbe20e2958fd8fb53cf37d7c38e84a900edc0d561a1c4af4bc3a10888685d  gnupg-2.5.17.tar.bz2
 # Locally calculated
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index fafc383ec8..dd2fd0b0f0 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.5.16
+GNUPG2_VERSION = 2.5.17
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
