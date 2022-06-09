Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1F0C433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 19:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C63B441D15;
	Thu,  9 Jun 2022 19:24:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vkYIv2EIeGAH; Thu,  9 Jun 2022 19:24:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0C0841D11;
	Thu,  9 Jun 2022 19:24:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EA2B71BF2EC
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 19:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D96528316F
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 19:24:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yz8ubz0Cmfpc for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 19:24:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 839E483104
 for <buildroot@busybox.net>; Thu,  9 Jun 2022 19:24:07 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id AEA1244042B;
 Thu,  9 Jun 2022 22:23:50 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1654802630;
 bh=46xfglkTSnR1xOU2WXQO8g0twOFk+BZe9rGpYQw2wLI=;
 h=From:To:Cc:Subject:Date:From;
 b=SdBj2HxOxBHPsPODjM66e69d5TI2jLTK3HBdcGpWHYJHBv2IRqfCBprvAvuAvVAgb
 vFN1UoEVMxPbt0LtLmp3fa2qfu+FG96ud1Z4bWH+xQ1EFcfZSY37ZD7I6V6JQuIuyQ
 +xV2Qvx5Ly6Lv5OjTiYUaYi/m6vOvBsnQYuxjWtSp9OqxgkTJ8rWsuGzY+mlV8X/aG
 hSvZSWzys0z4FRbKurnKZxPVzv8+sB7ZzmdX6bBOehtSOkr1XhOF5a/dMlO/o0dpbX
 XvRFOaJ/V45ppBxtHQuKOmnDA5dYtq/I/6yGafQANgJ2lIEydEAvnDExzLkN8sfvpx
 441TBPdPkYh4g==
To: buildroot@busybox.net
Date: Thu,  9 Jun 2022 22:21:56 +0300
Message-Id: <d88aa72dcbbcbf5988e643e3ecd0a49e1a455d94.1654802516.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH] package/uacme: requires TLS support in
 libcurl
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
Cc: Nicola Di Lieto <nicola.dilieto@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

uacme configure script fails when libcurl does not support TLS. This
means that BR2_PACKAGE_LIBCURL_TLS_NONE is incompatible with uacme. But
there is no way to change the choice to something other than
BR2_PACKAGE_LIBCURL_TLS_NONE. So instead make uacme depend on libcurl
and !BR2_PACKAGE_LIBCURL_TLS_NONE.

As a result we can no longer select BR2_PACKAGE_OPENSSL since it causes
recursive dependency. The existence of encryption library is implied
when !BR2_PACKAGE_LIBCURL_TLS_NONE. So we can drop that 'select'
entirely.

Fixes:
http://autobuild.buildroot.net/results/4e16f1d958ac3d30e26e7f17bdffc47834b0e2bd/
http://autobuild.buildroot.net/results/4e16f1d958ac3d30e26e7f17bdffc47834b0e2bd/
http://autobuild.buildroot.net/results/25280409b32282b4dd40b1e88127051439380f3d/

Cc: Nicola Di Lieto <nicola.dilieto@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/uacme/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/uacme/Config.in b/package/uacme/Config.in
index d69343611557..4b20cbcdfe4b 100644
--- a/package/uacme/Config.in
+++ b/package/uacme/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_UACME
 	bool "uacme"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_GNUTLS || BR2_PACKAGE_MBEDTLS)
-	select BR2_PACKAGE_LIBCURL
+	depends on BR2_PACKAGE_LIBCURL && !BR2_PACKAGE_LIBCURL_TLS_NONE
 	help
 	  uacme is a client for the ACMEv2 protocol described in
 	  RFC8555, written in plain C with minimal dependencies
@@ -14,6 +13,10 @@ config BR2_PACKAGE_UACME
 
 	  https://github.com/ndilieto/uacme
 
+comment "uacme needs libcurl with TLS support"
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_LIBCURL || BR2_PACKAGE_LIBCURL_TLS_NONE
+
 if BR2_PACKAGE_UACME
 
 config BR2_PACKAGE_UACME_UALPN
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
