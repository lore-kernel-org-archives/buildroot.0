Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39486EF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03F5861399;
	Fri, 13 Feb 2026 19:35:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id llHa8Bbbaha2; Fri, 13 Feb 2026 19:35:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25FF4613C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011346;
	bh=C37nPDbet7MbeZGh+tQOAZsf+y8uRkG4BTPML4HmXNA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rLgpid1ZPiYuocA4IMLL7WMS4i2G0SDgsf0aLVVZvXE0WnBL2H+sT5Hn16Ew37n6I
	 4yZA1lsftDK7Jy9OZeyqQioAsv/lc55zBpQOo1i0WUQeH2qahTYBceg9Ik/8eSf4L3
	 HIfxPnQEZeuM5I1XFq+riyXmxvmMm8bn3fjWPPgnuZI8njEUklrtotCvPEMhSG60EV
	 f6AkIIUjiDjQgVMml+DE76qrIZxQMMHub57b1bG1ttFNrRBgYlp7c3ZZODE8HScB44
	 2/EhX5Cm0tl1fX42+ufKjXyj2OqtTKquprrGGIIiSimdBJYH8wkjAEc/ljIvX8YC5t
	 6E1ihmrvB5yfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25FF4613C5;
	Fri, 13 Feb 2026 19:35:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 88CB169
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55AE14035F
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8qU0Yc0oeyTr for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 852EF40407
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 852EF40407
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A3E582B68; Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:36:11 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2d7176d71685d9c120ca67ec61b00d3620e15bef
X-Git-Newrev: 7c249707447cd810186f449710325fd503363fcf
X-Patchwork-Hint: ignore
Message-Id: <20260213193527.7A3E582B68@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/dc3dd: needs MMU
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7c249707447cd810186f449710325fd503363fcf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

savewd.c:75:27: error: implicit declaration of function 'fork' [-Wimplicit-function-declaration]
   75 |           wd->val.child = fork ();

Fixes:
https://autobuild.buildroot.net/results/40a/40a90638f90260ca2cb51bac03b0f8fb23a6ccc4/

The build error occurred already in January 2025:
https://autobuild.buildroot.net/results/9f3/9f3fefe5578dc41272e460146b566ac20f6cde75/
so a backport to the LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4df3fa1ab50fb280f011550edc5b178e7a4a0482)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
