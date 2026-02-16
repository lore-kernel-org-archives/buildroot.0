Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 530C8E63F3A
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 08:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AB2F40BE3;
	Mon, 16 Feb 2026 08:38:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W1CZVjUuBJ_J; Mon, 16 Feb 2026 08:37:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BD2640BC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771231078;
	bh=lkDnW6GYPo+du4+FsEy7NjnCNrfRqtIgC1drBt+wHVQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=L1fzESsH78toDqY1LH47/vmwmJSFqwa0uvddgmZ6u90FHmnUxFvf5nqr5Zl0GWA2J
	 AgCxZ1pRjFFTn16kp9N5e3cDkvTQrRDb8Qay144RZ7bP0/9ID2K9IIWfsUEcyyLHqO
	 IFJRsmVv+NgavP/sfSeBZO2teFq8UKC6C9ZiD6e0C/KP4XiMGY1YeSiH17KxHE6sRo
	 EAulntX/R8z4xWbBHPA04aqu8tkCmE4CyP0jbh1mg0QRJxHWMunMG1WS9Ow2hEsS6e
	 iGgS7C54AKY3IH/sEI2HFtwgLffLHFd1ChgrZPJnAN5QG6yder3yVr5pA5hl0Upp9t
	 yDS13SfqpJhoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BD2640BC6;
	Mon, 16 Feb 2026 08:37:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6683A1EB
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 08:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54FC440308
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 08:37:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hoWsT4GfsZ0T for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 08:37:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B5FC14027C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5FC14027C
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B5FC14027C
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 08:37:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BB9FD1814B9; Mon, 16 Feb 2026 09:37:52 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 16 Feb 2026 09:37:14 +0100
Message-ID: <20260216083733.4184105-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1771231072; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=jw2cnfQRKMm0oqkOUnlrK1+Odur+8n34kqDXMI12eMA=;
 b=ur+38ku5jIzhCa0n1LkFyPWQDDyJcdORvZM7BFhDizXuIbARyv3qxb+3uUEFY6VhEoTORw
 j0CFHMEzk7A6uG+BbRl75P9ct4gNrC4juTFFjND1QSit6jXMWE6GzJ7Y4O6r+ZZGk4fesg
 vbeaQiOfb+jEfTyDfj1psfByhB9QVpY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=ur+38ku5
Subject: [Buildroot] [PATCH] package/catch2: bump to version 3.13.0
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

changelog:
https://github.com/catchorg/Catch2/releases/tag/v3.13.0

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/catch2/catch2.hash | 2 +-
 package/catch2/catch2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/catch2/catch2.hash b/package/catch2/catch2.hash
index 1cf29821c9..c45cd0e3c5 100644
--- a/package/catch2/catch2.hash
+++ b/package/catch2/catch2.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e077079f214afc99fee940d91c14cf1a8c1d378212226bb9f50efff75fe07b23  catch2-3.12.0.tar.gz
+sha256  650795f6501af514f806e78c554729847b98db6935e69076f36bb03ed2e985ef  catch2-3.13.0.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE.txt
diff --git a/package/catch2/catch2.mk b/package/catch2/catch2.mk
index d3da027d2b..fb0edbc9bc 100644
--- a/package/catch2/catch2.mk
+++ b/package/catch2/catch2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CATCH2_VERSION = 3.12.0
+CATCH2_VERSION = 3.13.0
 CATCH2_SITE = $(call github,catchorg,Catch2,v$(CATCH2_VERSION))
 CATCH2_INSTALL_STAGING = YES
 CATCH2_INSTALL_TARGET = NO
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
