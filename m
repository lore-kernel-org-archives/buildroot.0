Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08046C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 06:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94D9940010;
	Mon,  3 Jun 2024 06:22:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XYzlgqXg5BSY; Mon,  3 Jun 2024 06:22:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BC454022E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BC454022E;
	Mon,  3 Jun 2024 06:22:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D867D1BF573
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 06:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1E35842F3
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 06:22:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5JVQLy__q6Fv for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 06:22:51 +0000 (UTC)
X-Greylist: delayed 599 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 03 Jun 2024 06:22:50 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9BC10842F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BC10842F2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9BC10842F2
 for <buildroot@busybox.net>; Mon,  3 Jun 2024 06:22:50 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 7EF9B4402B5;
 Mon,  3 Jun 2024 09:12:42 +0300 (IDT)
To: buildroot@busybox.net
Date: Mon,  3 Jun 2024 09:12:44 +0300
Message-ID: <8b23349045538384cb2bb59279ac324672172124.1717395164.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1717395162;
 bh=E4QoLLBhCkB0p1EKsXYDAkOvLDegqiEpI6NJGIDUXo4=;
 h=From:To:Cc:Subject:Date:From;
 b=YsU58ExOWsKkSjdY8lfU11P0L6V0eV4hjBUw46/Ltcc8ErnjjgqmNCdLIvh+a8KFS
 dqlGUsMRyX3SvIG5AaivMgV15Z8Bn/FshcmABNPUxkWnsiWtbfVdyPbiXhIVx9NgPU
 7gPczhP7wMR+h1OGoYY3sWpaax3bGNaQnxt8VV6/vNMIo8mKs5F8mWGB4sG2UDm5f+
 hODMmGlm/dzoSS7rdM2KWbSUdThRjuU3Ubx4Lq9ZLGCLUtc/MUjBsVr0uJ3UFgGESn
 WSM13ic/JSAJqPBR1DLGql4wmJHdocB0pMF7N4MX73J0MWRaXnWNdyq7919PMhpo6G
 v9+5/jQXN8gGg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=YsU58ExO
Subject: [Buildroot] [PATCH] package/makedumpfile: enable build with musl
 libc
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

makedumpfile libc dependency is coming from elfutils. Commit
bf9583a50276f52 ("package/elfutils: enable on musl") removed elfutils
libc dependency. makedumpfile now builds fine with musl libc. Remove
its libc dependency.

Cc: Alexander Egorenkov <egorenar-dev@posteo.net>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/makedumpfile/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/makedumpfile/Config.in b/package/makedumpfile/Config.in
index 62549f851fc0..325a31d7b6c9 100644
--- a/package/makedumpfile/Config.in
+++ b/package/makedumpfile/Config.in
@@ -8,11 +8,10 @@ config BR2_PACKAGE_MAKEDUMPFILE_ARCH_SUPPORTS
 	default y if BR2_s390x
 	default y if BR2_sparc64
 
-comment "makedumpfile needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads"
+comment "makedumpfile needs a toolchain w/ wchar, dynamic library, threads"
 	depends on BR2_PACKAGE_MAKEDUMPFILE_ARCH_SUPPORTS
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
-		|| !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
+		|| !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_MAKEDUMPFILE
 	bool "makedumpfile"
@@ -20,7 +19,6 @@ config BR2_PACKAGE_MAKEDUMPFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # dlopen
 	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_XZ
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
