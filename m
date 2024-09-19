Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80532CE8D46
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 04:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5656A849D0;
	Thu, 19 Sep 2024 04:00:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l3i6LL9HXJ2C; Thu, 19 Sep 2024 04:00:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25A9F849DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25A9F849DC;
	Thu, 19 Sep 2024 04:00:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8050B1BF215
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 03:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5940B4278D
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 03:59:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W9vG4cCrdZEh for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 03:59:52 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@helium.openadk.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7E8D74278E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E8D74278E
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E8D74278E
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 03:59:51 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 80434353746E; Thu, 19 Sep 2024 05:53:37 +0200 (CEST)
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 05:53:06 +0200
Message-Id: <20240919035308.2622723-8-wbx@openadk.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240919035308.2622723-1-wbx@openadk.org>
References: <20240919035308.2622723-1-wbx@openadk.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1726718017; bh=M2gHRvudwm48cPmQhqYPs2Ahn2cQNIOw3A0PJNVg/I8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FIRNL9i0G6DdsYGu1LBukVISKE3ko8uEESbGSKtmVbMsXrTLjXeG5eHQUdJamkVTA
 IiqoHR0flHoyQs8YP5dyOqpORh8ZCl8/2CMZhrwOORWh5NMfb/OYLaRsWBTapo95DU
 +2KBXUgG1E2BEn84hTWgMezLxETCqRRTOkcaLgwRiT0Na7XCBmUG1CmZhStFGY6ZUW
 Fsg/MamNOr4Xa0MJkcZjwTgKevH+unS51tFptbYhPi0BR4Vo+y/i93o8ccj88MnM8X
 g+xuORDlge7gZPfA61qA5f1eQJ/+0trzmwW3GegWI+RPy1yeD70ScY8N+99WVGVZOI
 HtnoTSUsqLRsA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=FIRNL9i0
Subject: [Buildroot] [PATCH 7/9] package/uclibc: enable NPTL on no-MMU ARM
 w/ FDPIC
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
Cc: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Ben Wolsieffer <ben.wolsieffer@hefring.com>

NPTL is supported on no-MMU ARM systems if FDPIC binaries are used.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/uclibc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 73ddd5ef58..4c360809c3 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -78,7 +78,7 @@ choice
 
 config BR2_PTHREADS_NATIVE
 	bool "Native POSIX Threading (NPTL)"
-	depends on BR2_USE_MMU
+	depends on BR2_USE_MMU || ((BR2_arm || BR2_armeb) && BR2_BINFMT_FDPIC)
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
