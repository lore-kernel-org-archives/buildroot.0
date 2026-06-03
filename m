Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A79CD6E4A
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 07:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CED7642405;
	Wed,  3 Jun 2026 07:32:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2cYH2EFqWrOt; Wed,  3 Jun 2026 07:32:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42D64423F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780471976;
	bh=qO8wvsTSCPR9oNswNxU0J9tHwfJS+IDVzOlngblAYAI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=dJdU2WoaiG14n8+XKvBZUMOPIayS7Mg9L0K2h3W5BtWhje1RATR/XrvEpO/+AmHNR
	 S5BgNKwLpTRL5R2hmY+IBm1EKfFvRz0VPw5pqOp8xitxouR5uDU2UWBjtxzzvxSrWF
	 Fgq/cK3Hc33U+p9BRypAbazyDRxUbYbkPg6uKThRgQU8BNusiGZ57hClmmg3DqNKgi
	 XGqwDpE2t0tz1Wli8dOj2JZ57MIYkVInxMO7Pj8hPwjqjqLivjVZJ33/G+0FUojmht
	 qsEMqQFSLDqM1Y8uzSppNik14QApQE8D/CsuiZugrS3JGdcafk2J/fqh3hnNpqnnfr
	 1gc3G/tLJOEdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42D64423F9;
	Wed,  3 Jun 2026 07:32:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B08C3353
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 07:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE2454087B
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 07:32:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nt-kTUKjfnTx for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 07:32:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3C17B40820
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C17B40820
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C17B40820
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 07:32:52 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -848736996; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Jun 2026 07:32:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1wUg5p-0000000CFJx-1Tkz;
 Wed, 03 Jun 2026 09:32:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  3 Jun 2026 09:32:42 +0200
Message-ID: <20260603073245.2918813-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=ivopYdtpOZ2SzuipZrUms1alkn7/QLA0w/4xt7bl43xZMr7Go9/thlKBjuqX2vNDEyFp2INeJJDo4tgUNXmIOOU/0INDLDDZx6LnP7gsCxRngeFkSpiq7Nx3wrmSGGE/54SYlOnYk4QfkuPpCbByKI/YasaX1xRU1O/y+RWKM2eiAZCyUY0/tgCSCKK9sIuT4pnN6IriJ5e24H4/ijRGwMlUJD+n6c5T97SjtZmLEDhj4CaUmFzbIEAmAGVYcnLLgEfKRwb9HQtGeSLEJ2brUgXkBLBh1hczvPO/73Wmosl4k6V+8o5zJQ90nyGHjBrUMvv/ii/ivOgyykMHfcug5g==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=rhc8fqJZZQ+/2zOj8/oEngwHxxD95P/H4lgEAwcvsFM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=ivopYdtp
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 1/2] package/docker-engine: security bump to
 version 28.3.3
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
Cc: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issue:

- CVE-2025-54388: Firewalld reload makes published container ports
  accessible from remote hosts

  https://github.com/moby/moby/security/advisories/GHSA-x4rx-4gw3-53p4

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 5d7bc51a6a..7f305b6880 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e4828e32e474cef1b78f40278211648300071399c7498252dfe0b96e789b8a31  docker-engine-28.3.2-go2.tar.gz
+sha256  3727c8963ab4bcff12291e99e4d4a6b9a29ace5236fd245717bbff648f15f8cd  docker-engine-28.3.3-go2.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 5fe225fbbc..2df260e1e5 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 28.3.2
+DOCKER_ENGINE_VERSION = 28.3.3
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
