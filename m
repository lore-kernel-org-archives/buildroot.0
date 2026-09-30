Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DAD4CA5FD2
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9E7640D01;
	Thu,  1 Oct 2026 14:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qHs6F8HhDZ-U; Thu,  1 Oct 2026 14:22:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A283E40CE5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864574;
	b=eRySQMBAinfvqmLE5GhZFj0SOIAhQLlCEuVGWgR/7Qt/QQR/D9Bid9BhdYVF9lXSrwBU
	 oKH5Y4jBPEKTwg8yKBXGwX5QuLIFi/Q0MkVfulTyMYRKhMptsBT5LW4HXxen+CdyTeUe9
	 aLw71qldIytZdBkgRhWpkqMUqmVIm0+a0xpC7TNvoS7r+hjfQfTGqy/jAwdTDCyPpbvLM
	 QWcNALYBbEdkKPF6oO3KkIYykCT4skFs9V8UaCYdUoOVAbsrcp8H/UQlEdi8PxA2DANZf
	 8IATfgqrRqZrHl0ze04Oh9yG4naAh8cGZGutLPtllNbvPM2oGlVI4fQOspPFUTiPpxA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864574;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=EeMSFNqunQfTOSHIIVwA5RctFvqCc8S/3c43G6o95Jc=;
	b=P5vqjIpnyp6Wf9Z1k26GHzdnCtg3fjyfFkaFPblUXQTilui0epP/NkvvEwXREWWFErtN
	 Oxv1PogudHu8pVL73POatG5Irs8DZ6oLg20g3vCTXmjM+ZDE+b/BhwBLFoJmBOqlI8/oW
	 BYtnoa5F6bBB/KYhTjCGDPDTuTgsvWB7cIykVal5wuHMC/nNMnvyiu1TXLrLNEK0Qnqln
	 2pbDLHLu/tcCCUmnm8MPcXm4p7Mfp0R6jUU/Gu+r6hpBWra2wYgLsJ80A5/Sp7rtmxGWE
	 TRoN1c5pZCPzWqVE0bcffq61W10Tmn9s+fPtMTtGymx2SloEqRdUifv1ayzBJ3sCa0g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864574;
	bh=EeMSFNqunQfTOSHIIVwA5RctFvqCc8S/3c43G6o95Jc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sFLCovRNmSL+rll+p22RHzREVAqeXxBSCz2WzBNxyPf52TZoMN7RyVQxIZgH7omc/
	 8vXpScKvc8ZdeYp09slg4PDCKONO7jOmijgMnSCKcuLbszy6cuv573X6M7SUZFlGbe
	 eWjR5GNaIgyL+CTLlbQwJ5nuez58uxalqAchAdcIJ/fSxTBLOM/oAhkswh3c4URCc9
	 4+4f7iO2yAKYUXvK256LRKSqPtGtCJJQRZkLXr35iY4SUv93LShVCRRtcyBb/UD1hP
	 sMrG8MzJNZXG5UzLgqttWHsRqiIU1w/wLe2+4ixqTds+7JH0iSlS4qLwRKDKQlKFXj
	 YtA5qpudxFgxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A283E40CE5;
	Thu,  1 Oct 2026 14:22:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BC6D0D22
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB5194052A
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q7krlzbxGVwX for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:22:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 9357B40512
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864560;
 b=Fm227f2Dtt2WivlkwKZDkCgPfXRo1KthYghiArpwNoZ+biHuDLQLM9a95mWqd8Z+DF/O
 g4PlwDb3dnIXI+bmEv17aGKH0Rsi41gb8ZozUGEqPfdOIUT84v84TvxI7UjxIdXjqxJl3
 alIfDTJehyXXoE8DvBHmo1nbWM8Sqvf2/xOw6R2vIfVD+wG0pmTZyObZGmuH8PWqOPnBG
 lB2YQZTavK7iWiEK/rCxkKoYv8TiatMM1mLAcri7vxyIltaB2NZYt251+hjZg9f5IIj7b
 n4IUrAE0ICdeNgd2prFlOuFcIg4W1hB/heXdDIqMbE+Gs2VePtn3cRtbQDsKj6Y6cfQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864560;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=QP7ScwzkWrpJF1ZDaIGcszdzPujnsrVAcAEJwIcSPOs=;
 b=EZ2V9rbHpQfBhAQGJsSCdCvEz59XalKGmS52QJ1w1iCJYE5NEEXLOA6bYemq35jAn9jj
 SMWbyY7RG8rT86frIjUtrB8nW8FKgMJpolT3P+A2KEYyFLhxEja1V40ueNutwEq/MMoLh
 V1R+layrt3kCLt/FPJaGlG11ZbITCbaqVfiPtZK+lvH3gV3n0gncKKetuvKkSevNmt5nU
 BXehMKBCcRbgsoFM3zYLUosoQXpSdWfezloZjSDsEIqAPBFYahI49WXb5Gp97fDOlE4Yv
 kWHe300A+SzZdUWWYaZKyZs2uPNALhkbxyEzaBAniQwWJm7bpqeN9wM5wNFd+juBH0w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9357B40512
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D945198461; Thu,  1 Oct 2026 14:21:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 16:07:59 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: da5160950c994eaa8a2a6cb61d8b3f71fa41c58a
X-Git-Newrev: e7305127cb8b860ddf228a97a644e2fc6bf51526
X-Patchwork-Hint: ignore
Message-Id: <20261001142126.D945198461@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/expat: security
 bump version to 2.8.5
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3147070024168492643=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3147070024168492643==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e7305127cb8b860ddf228a97a644e2fc6bf51526
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/libexpat/libexpat/blob/R_2_8_5/expat/Changes
https://blog.hartwork.org/posts/expat-2-8-5-released/

Fixes CVE-2026-93990.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 67380a32f78ca09b4e302a92307de585b9ee18d7)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/expat/expat.hash | 4 ++--
 package/expat/expat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index d8b4eef2f9..262ad4bf0d 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,4 +1,4 @@
-# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_4
-sha256  656ae1cc8da3b4ea513bb4e254f33e6243938084c0ec6239da873376b09985a7  expat-2.8.4.tar.xz
+# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_5
+sha256  1e727b8933ec51a77a9a9d9afcf8e688bce45d907c13e36ab7393fe36e703182  expat-2.8.5.tar.xz
 # Locally calculated
 sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 1e5b738463..be4180992f 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.8.4
+EXPAT_VERSION = 2.8.5
 EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES

--===============3147070024168492643==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3147070024168492643==--
