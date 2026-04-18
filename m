Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9812CF99C99
	for <buildroot@archiver.kernel.org>; Sat, 18 Apr 2026 21:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0048F813E9;
	Sat, 18 Apr 2026 21:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Z3b7LYdBExW; Sat, 18 Apr 2026 21:55:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BFA3813C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776549354;
	bh=OQFIEPgMwqjKIHXtvGf3qUv5eN0a7M2UK3yyG2EDoW8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LHYcXdFkH1IZ8TFVyfSRNYFTsu5LS8jCfm3oAE98DpxH4f1e4q7g8oLYo8CGxH5Ob
	 YYG1qPCeSmwo7lfrMN3VV9+LH5ismR3bzp2MGpsDOoTnoDSIMfbGqP1iPGnU538vgj
	 9wbSrFYMOBMowmaBrrGcL6/C1n4gfFumvwbv+vVZGHE7SdUqtBSNYr6ZjNVpqdHIGN
	 pUhRRe+h86pr3sHLKdI2goGke2Lf4sdSAIgJO9mq9c7zQR8+jOg0ezG9u3ensCvZ/J
	 RrKqrfIseLSgy16JtkZqyxZccx8OsvbOdHknZ2cq4zeE+33SRSreqxQCb/iU+8Qnjh
	 EGthPsNvdHWtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BFA3813C5;
	Sat, 18 Apr 2026 21:55:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A73B35B
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 21:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BB8740B96
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 21:55:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rubFoYothQoI for <buildroot@buildroot.org>;
 Sat, 18 Apr 2026 21:55:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 35CE840B93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35CE840B93
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35CE840B93
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 21:55:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc94.dip0.t-ipconnect.de [79.214.204.148])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 51AF6A4C377A;
 Sat, 18 Apr 2026 23:55:37 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47536)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wEDdY-000000005tT-4Bi6;
 Sat, 18 Apr 2026 21:55:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 18 Apr 2026 23:55:35 +0200
Message-ID: <20260418215536.55054-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260418215536.55054-1-bernd@kuhls.net>
References: <20260418215536.55054-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776549337;
 bh=MJPFH20y7z0xPcTuZNHA+A4vt77LL66zrMwOZmrnou8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=lgI5h2iInwhXWzVL2aME2U6Gu97VfOAJBQmqHwJwxw1uBrLEczHFsrkO6eocecF2i
 /wf8ZnMbywcmfpNAMJlRoah2X7+h3kaBHDrCfWYBaQxqxtHEoYnREFpGZQWIubnDWB
 8Yj3tseKaTMxixEtG9hQnQ5yTLdRmj9MVY5rFdHgW1ncGsvUsqb+lgDHLaQuMubGHd
 X3PVfrmk7GRGlLGjBuZeISOEm3gEgP2yvVtRoWNjrIWccWmYQxnzuYmx+fzhgKvmcE
 nxoZY//LNImqbvRoZ0g7g4ine9d9Cs985JA88bLluyGK6yfe4EwQCcJ5b/daAHRYyu
 6VtuK5U5nr8/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=lgI5h2iI
Subject: [Buildroot] [PATCH 2/3] package/jemalloc: needs MMU
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

src/pages.c:79:33: error: 'MADV_DONTNEED' undeclared (first use in this
 function)
   79 |         if (madvise(addr, size, MADV_DONTNEED) == 0) {

The oldest build error found in the autobuilder logs dates back to 2024:
https://autobuild.buildroot.net/results/adf/adf52f767c92ab1db7b817094a3929f3cf918e82/
so a backport to LTS branches should be considered.

Fixes:
https://autobuild.buildroot.net/results/d6a/d6a9f7ff9d29eee9d9280364f872ffaa1544f192/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/jemalloc/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/jemalloc/Config.in b/package/jemalloc/Config.in
index a128b8b376..ace3dccd1e 100644
--- a/package/jemalloc/Config.in
+++ b/package/jemalloc/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_JEMALLOC
 	bool "jemalloc"
 	depends on BR2_PACKAGE_JEMALLOC_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # madvise()
 	help
 	  This library providing a malloc(3) implementation that
 	  emphasizes fragmentation avoidance and scalable concurrency
@@ -25,4 +26,5 @@ config BR2_PACKAGE_JEMALLOC
 
 comment "jemalloc needs a toolchain w/ threads"
 	depends on BR2_PACKAGE_JEMALLOC_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
