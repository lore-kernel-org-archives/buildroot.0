Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF7AC43458
	for <buildroot@archiver.kernel.org>; Mon, 29 Jun 2026 07:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 473516070B;
	Mon, 29 Jun 2026 07:14:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1tuA6A0STRPD; Mon, 29 Jun 2026 07:14:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B853860A7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782717289;
	bh=vXwihRXb9Kmf8pvqQpZjLj5VOBf1q+67NytNkhQbN/s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=dEt2qu0Kb8NP+scTIqwhVvUj0cFBeJrVEfVh8xVw/3AAx0CIeOiuXzxbOs+NwbD6Q
	 dOk8CYatVZ6dQ4fpC531KyWooAcCyT5ifqVjFtwh/ttWimFXTwvQ1WJFCtkO9W9llA
	 dtsgA+MRsuHk77UQBlOwm75J4PlqsiJs61w9yVKBwzIhf6Z7npqPwjzd8buJKNN+DX
	 /OAHfnQFaZFMdhywMJaQZs46t8n1aMj2RmXMvBZLLPMZ7WuwykVMuhwdXqhx7KBKuI
	 ZzAI62k/EW94tSM0fS5dVFAdZ384m5+j2aPEWuhR9dEebWxzhvg8hy93bWxUu77G/v
	 RK9byxNY8JZ4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B853860A7D;
	Mon, 29 Jun 2026 07:14:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DCB922D3
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 07:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2C0C4042B
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 07:14:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y87vXUCo_pnw for <buildroot@buildroot.org>;
 Mon, 29 Jun 2026 07:14:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 163344012E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 163344012E
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 163344012E
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 07:14:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 666911814BE; Mon, 29 Jun 2026 09:14:41 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon, 29 Jun 2026 09:14:18 +0200
Message-ID: <20260629071429.4131207-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1782717283; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=ot6wABYK9aiud0IP97SUKGj9j43CK9/8XWJmgcd86fA=;
 b=tD/fzCMxWUoXKz94vw24ymBil94jC0heKJqs9cTLJML5hB1CQdGInO3V5QAFqmb4gdA1dW
 JsqtICGgT7oeYEW0ca9p/gIzrkfUBX+XJPfw5aduFGrtlc2UPPL8b0PNUce4mZz/L0LFQ5
 knBtX2tzPoCDGjkZpc0pgyJQuDjTvFM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=tD/fzCMx
Subject: [Buildroot] [PATCH] package/fmt: bump to version 12.2.0
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
Cc: Semyon Kolganov <semenak94@mail.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

changelog:
https://github.com/fmtlib/fmt/releases/tag/12.2.0

LICENSE hash changed due to split-out of exceptions:
https://github.com/fmtlib/fmt/commit/91d1aced0a846161135310249664506b4a56e196

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/fmt/fmt.hash | 4 ++--
 package/fmt/fmt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fmt/fmt.hash b/package/fmt/fmt.hash
index 76bdd3171b..094a755aac 100644
--- a/package/fmt/fmt.hash
+++ b/package/fmt/fmt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  695fd197fa5aff8fc67b5f2bbc110490a875cdf7a41686ac8512fb480fa8ada7  fmt-12.1.0.zip
-sha256  07580f2a3b35709ce703d523f447b242f6dfec7582a8c0df102c7fa2849375f8  LICENSE
+sha256  a2f4a8d51178f954e4c339007f77edd76ba0cb2e36f87a48e5a5403d9be5878f  fmt-12.2.0.zip
+sha256  a65fcc5a1095fc33cc37e4fff69366e49d7e92f613558a2b95ed1b70e33758b4  LICENSE
diff --git a/package/fmt/fmt.mk b/package/fmt/fmt.mk
index 7d11cfddc3..b1d25e077b 100644
--- a/package/fmt/fmt.mk
+++ b/package/fmt/fmt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMT_VERSION = 12.1.0
+FMT_VERSION = 12.2.0
 FMT_SITE = https://github.com/fmtlib/fmt/releases/download/$(FMT_VERSION)
 FMT_SOURCE = fmt-$(FMT_VERSION).zip
 FMT_LICENSE = MIT with exception
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
