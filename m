Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10FCC4345F
	for <buildroot@archiver.kernel.org>; Mon, 15 Apr 2024 04:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D2B940025;
	Mon, 15 Apr 2024 04:44:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9YvjQFIP7xUE; Mon, 15 Apr 2024 04:44:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AE0F40289
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AE0F40289;
	Mon, 15 Apr 2024 04:44:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A1C541BF681
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 04:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DC3940699
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 04:44:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gy8GtYMHBRYc for <buildroot@lists.busybox.net>;
 Mon, 15 Apr 2024 04:44:33 +0000 (UTC)
X-Greylist: delayed 485 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 15 Apr 2024 04:44:32 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AFC694069A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFC694069A
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AFC694069A
 for <buildroot@buildroot.org>; Mon, 15 Apr 2024 04:44:32 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 22D993521100; Mon, 15 Apr 2024 06:36:24 +0200 (CEST)
Date: Mon, 15 Apr 2024 06:36:23 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zhyux5YZ5FffsSJg@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1713155784; bh=s8lPso4tgR+bUnfN3D+vQnEu6Bei0WWPDRNCWJQO5uM=;
 h=Date:From:To:Subject:From;
 b=YrGpEPSGeeFHrRIylQ0gKox5QcABdbs+qnJ6FD7fcGVlrrIjkU9jZoDGJunhdrcCf
 46zZyjVm92Z6Ey8gcZxVRdLKFfeCz28qHaKuXd9qmQRydaW/UjHo+d4hxDjexDUvKO
 GRRp8CMLZxvdQsWPIVOnoVQu/pwxSjBL1X1uCgJLUt66OCaDli1bbFP7zZc224354J
 i2U3+oPdVig/rxJfYrrCa1K+LDzbow/k78h9tjZW0Hnsm4EpNfsnkwJhwkw8VnhahY
 Xx9uZyDM53moyM2SWlpe2HZMMWkTsOA1DVxRl6rgJXRK7j3H9k5Lpb17tnbx6EbSJV
 FuoEqKKpIv9YA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=YrGpEPSG
Subject: [Buildroot] [PATCH] package/shadow: enable on uclibc
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Package was disabled with commit
8035ea0a712eaa16d2ac96cd29db0e8726b0f685 because of missing features
in uClibc-ng. In uClibc-ng 1.0.47 the missing feature were added,
so enable shadow again.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/shadow/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/shadow/Config.in b/package/shadow/Config.in
index 987605c7fa..bbbea811ce 100644
--- a/package/shadow/Config.in
+++ b/package/shadow/Config.in
@@ -2,7 +2,6 @@ menuconfig BR2_PACKAGE_SHADOW
 	bool "shadow"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC # reallocarray, explicit_bzero
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Utilities to deal with user accounts.
@@ -57,6 +56,5 @@ config BR2_PACKAGE_SHADOW_YESCRYPT
 
 endif # BR2_PACKAGE_SHADOW
 
-comment "shadow needs a glibc or musl toolchain w/ headers >= 4.14, dynamic library"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 || \
-		BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_UCLIBC
+comment "shadow needs a toolchain w/ headers >= 4.14, dynamic library"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 || BR2_STATIC_LIBS
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
