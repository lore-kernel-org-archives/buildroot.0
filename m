Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B26C3DA5D
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 07:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 951F040470;
	Sun, 21 Jul 2024 07:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ySalHD5ByS8Q; Sun, 21 Jul 2024 07:50:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2397440474
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2397440474;
	Sun, 21 Jul 2024 07:50:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E98331BF868
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 07:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E390740470
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 07:50:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KWXXFGzWmuIj for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 07:50:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 399764024E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 399764024E
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 399764024E
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 07:50:49 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 563363521192; Sun, 21 Jul 2024 09:50:42 +0200 (CEST)
Date: Sun, 21 Jul 2024 09:50:42 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zpy90k5YGhEjoWnO@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1721548242; bh=hDVpU6ot7kvN1TD+3onC6uoS4CxtLoNeuB3pir4MkWM=;
 h=Date:From:To:Subject:From;
 b=OgsYLLVh8g+koQJd4FY2NUUBLDxYGHICAwxabpIP2W9TkYMDetmdAdSWs+4VBrvC2
 dsoiqm0c7ETvQOQvvmiZI2JXu5dPyl7tJ72vH0Pr/3EKRaw1kG/U1wUe/h5cU16gqt
 3YJ66aWJ9mM3Am6IFCIXdYr4OKFc3S8mw9c3+TVOsuFiTYdPXY/cvZ7Vw7TEihtxJc
 /6+vYRfdrGfy0a8D40WYSO6B/YUTkkvbzlc39iIWba+1O2SHNOFuZ1K3Y24LuKGAfk
 bh/9t+nB8txpWFpNh0F21032Vg1SrTSYohxO5NRvOQ7J48007Tl08VXIspS4Qgt5iM
 H+iuhGXllzF8g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=OgsYLLVh
Subject: [Buildroot] [PATCH] package/libucontext: allow uClibc toolchains
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

With commit f761a8c4516d88d70ae6f5d192fdb99cafa761a6 it is
possible to use external libucontext together with uClibc toolchains.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/libucontext/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libucontext/Config.in b/package/libucontext/Config.in
index 84a6e89f23..e9e0077a6d 100644
--- a/package/libucontext/Config.in
+++ b/package/libucontext/Config.in
@@ -22,7 +22,7 @@ config BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS
 	default y if BR2_sh4aeb
 	default y if BR2_i386
 	default y if BR2_x86_64
-	depends on BR2_TOOLCHAIN_USES_MUSL
+	depends on BR2_TOOLCHAIN_USES_MUSL || BR2_TOOLCHAIN_USES_UCLIBC
 
 config BR2_PACKAGE_LIBUCONTEXT
 	bool "libucontext"
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
