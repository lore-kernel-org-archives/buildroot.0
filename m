Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4F0C79FBA
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 19:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3061980844;
	Mon,  5 Jan 2026 19:41:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s2XW2R1daV-x; Mon,  5 Jan 2026 19:41:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64F93808A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767642089;
	bh=oMu1tjosCacDN2cWancqzHIuLm74vL2E+mrWMcQ4OJg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YvKMunh4l7zvSxHjxQPKZcF/fWJVM5TUvpspYU1UPDaIZeoXfg3NgZ+tu/k+do+R0
	 FkHUR9oY4x+IeS0U0Z6Qor7a/T7l9W8qXQ5xrQBrhnXH4GT4LzJMIu7oznEZBOUZ3r
	 YrkyNl7eB868ZKloeUoUpCmxxWDa076zjh5Ac5SXHquq7pLCjxDJfbS59QIXddlb8s
	 ZPhYqCIM6GfbWWKKTkfLuox2/4SoG7TF4cClyxcLE/bp7k5HHLZqf54b+nUMisvHHA
	 aZ2MD4RFzfQVCcEsD8h5VzyX2MjC8HxFMbqIn8HiI52/giGWZqyjDqW3lKEm/e7ral
	 xN6ixW9Xp3w+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64F93808A2;
	Mon,  5 Jan 2026 19:41:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CFDEFE7
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 19:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6EE8808A2
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 19:41:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bMhWH0hUiAgC for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 19:41:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4F27D80844
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F27D80844
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F27D80844
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 19:41:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BACA9A4C374B
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 20:40:56 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41588)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vcqRk-0000000057p-1oQl
 for buildroot@buildroot.org; Mon, 05 Jan 2026 19:40:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  5 Jan 2026 20:40:56 +0100
Message-ID: <20260105194056.2156773-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260105194056.2156773-1-bernd@kuhls.net>
References: <20260105194056.2156773-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767642056;
 bh=JNj9b5ZjUU/2aIRz10y6MJV4rfsY0vySC3efY7ZGNY4=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=hkfzlQvAtIGg0mAgWMbcuMFML2WK1wpLulcP88YAIpwZM0h5xsx3qyr0cGN9RqphO
 eCmSXWceBCZDDaf6BbGlaXW0LlCvR2QgvOEI2OLBAUBhc0UY/Yw8d+o2EA8MNz1N6E
 qe0YzlOtYH9KawWPoNQINYsSfB6mH+ytegQTBDDwIty2cRVdL905lAcwh6eKEyC6KK
 MfOsYBpcOGbBTL+vBH2J+TOXSJaQ5iFZi2SOIRvHRTd1JyEbGBUs5Gwju/6qCI+0mI
 DBOwS3YH5WT9EaJLACbzWnSD5WaQ50cUXsw/6t/qio18bnAJNMqo/oSE4HDsGQoXdl
 P3b7Vf/Wwt65Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=hkfzlQvA
Subject: [Buildroot] [PATCH 3/3] package/dc3dd: needs MMU
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

savewd.c:75:27: error: implicit declaration of function 'fork' [-Wimplicit-function-declaration]
   75 |           wd->val.child = fork ();

Fixes:
https://autobuild.buildroot.net/results/40a/40a90638f90260ca2cb51bac03b0f8fb23a6ccc4/

The build error occured already in January 2025:
https://autobuild.buildroot.net/results/9f3/9f3fefe5578dc41272e460146b566ac20f6cde75/
so a backport to the LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/dc3dd/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dc3dd/Config.in b/package/dc3dd/Config.in
index bd181b7065..b4b7dfd691 100644
--- a/package/dc3dd/Config.in
+++ b/package/dc3dd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DC3DD
 	bool "dc3dd"
+	depends on BR2_USE_MMU # fork()
 	depends on !BR2_RISCV_32
 	depends on !BR2_arc
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -13,6 +14,7 @@ config BR2_PACKAGE_DC3DD
 	  https://sourceforge.net/projects/dc3dd/
 
 comment "dc3dd needs a glibc or uClibc toolchain w/ threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_RISCV_32
 	depends on !BR2_arc
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
