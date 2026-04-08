Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC99DFD5F8F
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 07:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A4CF40FC6;
	Wed,  8 Apr 2026 07:32:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1HQYf12Zlql0; Wed,  8 Apr 2026 07:32:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E4AC40F6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775633531;
	bh=NK3nXRyw4obXgJImkzjM3BiEMzWQXjEIw/xL0pKr8sk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YgjkckLqZ8Ts3L27Qw9GyTpjkNXAt4aKC0+L0QEi3U1YCDl+7f1mKH/SFjAzSzLJC
	 qzjWzgLUThSjeJEX/nlTaEs7D4HNE/c/Pe/yTAKTi3YM1RnFwqzYl6FfVP17K7C7e2
	 L7YooxEfDjkZ1PBmMI8Y34s199Lwder9iPBbG78WzNeFmMvTstIe28r2c6EvTRYk3R
	 VBjtQ50HXxADA3ih5SrPPFzPtLdsMeC8stDz/f0JGs/IqlIGydr6Z43oqqSS1dBz6F
	 sMPHl7mZGdlczpbX33HpzNJdk53uqlGkTig7kFBmRztQZ49fZV0w7aVm/1sqmwcgYl
	 OwYsX6RN7lnlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E4AC40F6A;
	Wed,  8 Apr 2026 07:32:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 34BCB237
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 07:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26EB840F6A
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 07:32:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fwYQPVGB7fud for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 07:32:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BE74040F66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE74040F66
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE74040F66
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 07:32:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 55E881814BF; Wed,  8 Apr 2026 09:32:04 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed,  8 Apr 2026 09:31:36 +0200
Message-ID: <20260408073140.3998441-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1775633525; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=ijdPh/QvdgDMMHQe5Khua3FApDEEon9KBvH4C6huNbk=;
 b=G4uYNMKm9Re1VWNGGKu+YKiOxxItql7eJLzvyYjIwUJAjQSWSKTkmZVndacmxZrykeN237
 KhwOqqDfQRV1Nt9ho9VTyn33SJLZtE6p1WA0+fUdbfF1nKkxXRbtSJYyDvRE7W23ajHPmL
 ddpyWPQopAmxjWhPopZeordFjXC61Ww=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=G4uYNMKm
Subject: [Buildroot] [PATCH] package/catch2: bump to version 3.14.0
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/catchorg/Catch2/releases/tag/v3.14.0

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/catch2/catch2.hash | 2 +-
 package/catch2/catch2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/catch2/catch2.hash b/package/catch2/catch2.hash
index c45cd0e3c5..b8fc434ffa 100644
--- a/package/catch2/catch2.hash
+++ b/package/catch2/catch2.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  650795f6501af514f806e78c554729847b98db6935e69076f36bb03ed2e985ef  catch2-3.13.0.tar.gz
+sha256  ba2a939efead3c833c499cf487e185762f419a71d30158cd1b43c6079c586490  catch2-3.14.0.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE.txt
diff --git a/package/catch2/catch2.mk b/package/catch2/catch2.mk
index fb0edbc9bc..58c64af55e 100644
--- a/package/catch2/catch2.mk
+++ b/package/catch2/catch2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CATCH2_VERSION = 3.13.0
+CATCH2_VERSION = 3.14.0
 CATCH2_SITE = $(call github,catchorg,Catch2,v$(CATCH2_VERSION))
 CATCH2_INSTALL_STAGING = YES
 CATCH2_INSTALL_TARGET = NO
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
