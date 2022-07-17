Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D936EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 19:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C93883F69;
	Sun, 17 Jul 2022 19:16:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C93883F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4_g5FvwETfvG; Sun, 17 Jul 2022 19:16:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED07683103;
	Sun, 17 Jul 2022 19:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED07683103
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F3831BF3A7
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 19:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 061D483F20
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 19:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 061D483F20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fV8U2OWqtdof for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 19:16:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A74D383F11
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A74D383F11
 for <buildroot@busybox.net>; Sun, 17 Jul 2022 19:16:07 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 9EE8044004B;
 Sun, 17 Jul 2022 22:15:40 +0300 (IDT)
To: buildroot@busybox.net
Date: Sun, 17 Jul 2022 22:15:48 +0300
Message-Id: <a18cb02f314d0b8d69c7de564970028d2c671d71.1658085348.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1658085340;
 bh=bL7thtB/IR6OoKb/3+FCc4EARpxDjM2hRCvu+Tv6csU=;
 h=From:To:Cc:Subject:Date:From;
 b=Nf235mktPP0OMCol+7dqAE7zGJqryGWOdWwkaQjSZyM88qz8KsEALGvJEFYR21Qst
 YMiyGdJFGGGh11yQLh5mUaOLi1pWeUM1uPlUvnllDhgqSnML5Nxu+ApK7GB86hD/vc
 SGHzvwHCEE+89/mfaj+iQmd9CGhChwg6VYnSoSg+yxwLr9/RETl8ZfXJfuf1CwKbP3
 9/f+aw9n9AHt8su1jBu2xqVI+5oc04Zy2O4lijmbTlNkjzqxwKdGgciKJp411/73Ac
 A+RzIPSIFcxbbddL8ySv42jJy6PnOfHAg12iaPy+AT7D9cefUJW8HO8bJwPhknD/c3
 Jt4FTk27sZWvg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=Nf235mkt
Subject: [Buildroot] [PATCH v3] package/uacme: requires TLS support in
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
v3:
  Move comments up to fix suboption indentation (Yann)

  Add missing MMU comment dependency (Yann)

v2:
  Add dependency on crypto back end for uacme itself (Nicola Di Lieto)
---
 package/uacme/Config.in | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/uacme/Config.in b/package/uacme/Config.in
index 58b7c534e73d..e27d41160716 100644
--- a/package/uacme/Config.in
+++ b/package/uacme/Config.in
@@ -1,8 +1,17 @@
+comment "uacme needs one of openssl, gnutls or mbedtls"
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_OPENSSL && !BR2_PACKAGE_GNUTLS && !BR2_PACKAGE_MBEDTLS
+
+comment "uacme needs libcurl with TLS support"
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_LIBCURL || BR2_PACKAGE_LIBCURL_TLS_NONE
+
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
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
