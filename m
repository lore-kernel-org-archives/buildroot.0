Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F8CC433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Jul 2022 05:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EB2B4251F;
	Thu, 14 Jul 2022 05:49:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EB2B4251F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gUm4nqcGHF5g; Thu, 14 Jul 2022 05:49:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B802A424E3;
	Thu, 14 Jul 2022 05:49:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B802A424E3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E8261BF395
 for <buildroot@lists.busybox.net>; Thu, 14 Jul 2022 05:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0339E84719
 for <buildroot@lists.busybox.net>; Thu, 14 Jul 2022 05:49:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0339E84719
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YA8VqXuSF106 for <buildroot@lists.busybox.net>;
 Thu, 14 Jul 2022 05:49:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 479D384718
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 479D384718
 for <buildroot@busybox.net>; Thu, 14 Jul 2022 05:49:16 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id BBFF14409F0;
 Thu, 14 Jul 2022 08:48:53 +0300 (IDT)
To: buildroot@busybox.net
Date: Thu, 14 Jul 2022 08:49:05 +0300
Message-Id: <55f81de26c9b74283245f427bc7dd7ff4db09c06.1657777745.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1657777733;
 bh=bMzd1Nu5RwIjVsrmUEjfBdHgV1sduKHs6xV8Z6wdQPg=;
 h=From:To:Cc:Subject:Date:From;
 b=Hxn/sy/1D/5DQ7Ue6tjWWp3PFFml5/G37s0l3/dP9DfBzr1I5JWb5DeNnb8tTppMF
 5UWw7l2A2Yqg8k/ertICiFHDNsYGbkazBwA2wpn/r/wtqxV++3mrAAeUrdFWfMPvRp
 nNj3ozvTWB3AdFGx7l3tzUTZbzU82McDy0TbfS5/RvX+/zmt1Nvx/b2mWaB47IOD/+
 QKhsMxcl0WkySdTXf42VgmartTHcr/YSXf4ZQb3gBR47b298OE4pYFPvC8asGaBaZB
 G1RRth1/M1fsYKxDiG+JTwoyr2H5NFmSZhMtTYJPc09fo2+8raKiN51GtvEFU2u3By
 5c2Z6LaIAmvkw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=Hxn/sy/1
Subject: [Buildroot] [RFC PATCH v2] package/uacme: requires TLS support in
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
recursive dependency. Use 'depend on' instead, and add a comment to
explain this uncommon choice.

Fixes:
http://autobuild.buildroot.net/results/4e16f1d958ac3d30e26e7f17bdffc47834b0e2bd/
http://autobuild.buildroot.net/results/4e16f1d958ac3d30e26e7f17bdffc47834b0e2bd/
http://autobuild.buildroot.net/results/25280409b32282b4dd40b1e88127051439380f3d/

Cc: Nicola Di Lieto <nicola.dilieto@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2:
  Add dependency on crypto back end for uacme itself (Nicola Di Lieto)
---
 package/uacme/Config.in | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/uacme/Config.in b/package/uacme/Config.in
index 58b7c534e73d..815ab5da7d61 100644
--- a/package/uacme/Config.in
+++ b/package/uacme/Config.in
@@ -1,8 +1,9 @@
 config BR2_PACKAGE_UACME
 	bool "uacme"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_GNUTLS || BR2_PACKAGE_MBEDTLS)
-	select BR2_PACKAGE_LIBCURL
+	# We can not use select here as it causes recursive dependency
+	depends on BR2_PACKAGE_OPENSSL || BR2_PACKAGE_GNUTLS || BR2_PACKAGE_MBEDTLS
+	depends on BR2_PACKAGE_LIBCURL && !BR2_PACKAGE_LIBCURL_TLS_NONE
 	help
 	  uacme is a client for the ACMEv2 protocol described in
 	  RFC8555, written in plain C with minimal dependencies
@@ -14,6 +15,13 @@ config BR2_PACKAGE_UACME
 
 	  https://github.com/ndilieto/uacme
 
+comment "uacme needs one of openssl, gnutls or mbedtls"
+	depends on !BR2_PACKAGE_OPENSSL && !BR2_PACKAGE_GNUTLS && !BR2_PACKAGE_MBEDTLS
+
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
