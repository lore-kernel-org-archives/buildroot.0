Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A1DC04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 11:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AC5E424F6;
	Sat, 11 May 2024 11:57:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fTz36Xj-_R0a; Sat, 11 May 2024 11:57:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F5C3424FD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F5C3424FD;
	Sat, 11 May 2024 11:57:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4E2471BF5A5
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 11:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B8DA6081B
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 11:57:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AFit3HEGjFhx for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 11:57:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 84337607AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84337607AE
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 84337607AE
 for <buildroot@buildroot.org>; Sat, 11 May 2024 11:57:51 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 3F8213521162; Sat, 11 May 2024 13:57:49 +0200 (CEST)
Date: Sat, 11 May 2024 13:57:49 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zj9dPZkbkZn7lBqX@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1715428669; bh=aQvQevIACNcBIz5IUvQN+EFEyt+Nfmm1tHUb93f8qzA=;
 h=Date:From:To:Cc:Subject:From;
 b=cvbWa21FwijOpxkiURcZkrjHFFAD2oJTrLiFP2H5KRTUAPSqRnWzTAEY4RxEJou2+
 nOmpKb381xLQyxTlUOlcPCKFNvQxCqfXuezbAtjzA57pPAIvRdZRhhVkV0MltxajRj
 nibGZ9qc1+K0vEczz2MDi6l8wxKD6vBDQ7K2VENQ570yonQh/2V4/8YRlIOFHf44zb
 Z/eVpqy+NSEIkGQmKqWNs7EkubdabuOq0Yqfe9nhgtWiKuBBq1kcRSn8pjqhbSz1T3
 Na31f1eLhLtMDx8ZH6Hw+QcFOZf0s0fGifzHBrZl0kl1cvyrMEUapn9p04/FTnstEL
 9wDCcFoglGllg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=cvbWa21F
Subject: [Buildroot] [PATCH 2/3] package/gcc: switch to 13.x as default
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/gcc/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index bc1f1c3f89..a635b6d5ad 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -5,7 +5,7 @@ choice
 	default BR2_GCC_VERSION_ARC if BR2_GCC_VERSION_4_8_ARC # legacy
 	default BR2_GCC_VERSION_ARC if BR2_arc
 	default BR2_GCC_VERSION_POWERPC_SPE if BR2_POWERPC_CPU_HAS_SPE
-	default BR2_GCC_VERSION_12_X
+	default BR2_GCC_VERSION_13_X
 	help
 	  Select the version of gcc you wish to use.
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
