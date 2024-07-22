Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C579C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 08:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABD3940256;
	Mon, 22 Jul 2024 08:05:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sfyQtcNrpnw5; Mon, 22 Jul 2024 08:05:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80DB540281
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80DB540281;
	Mon, 22 Jul 2024 08:05:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC7C91BF291
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 08:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B583980899
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 08:05:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yzWbzmLSCB6W for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 08:05:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA22980896
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA22980896
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 08:05:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D4EF686FC1; Mon, 22 Jul 2024 08:05:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 09:39:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d4c1ab5305e85230af9704e3579ea69aad84a00a
X-Git-Newrev: 8bb67c230b9d32d91bc85e5563f3453cb50d7a38
X-Patchwork-Hint: ignore
Message-Id: <20240722080536.D4EF686FC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apr-util: requires DES in openssl
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8bb67c230b9d32d91bc85e5563f3453cb50d7a38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable DES in openssl to avoid the following build failure raised since
commit a83d41867c8d69a77d5cd0a665aa216af5340359:

crypto/apr_crypto_openssl.c: In function 'crypto_cipher_mechanism':
crypto/apr_crypto_openssl.c:385:27: error: implicit declaration of function 'EVP_des_ede3_cbc'; did you mean 'NID_des_ede3_cbc'? [-Wimplicit-function-declaration]
  385 |             key->cipher = EVP_des_ede3_cbc();
      |                           ^~~~~~~~~~~~~~~~
      |                           NID_des_ede3_cbc

Fixes: a83d41867c8d69a77d5cd0a665aa216af5340359
 - http://autobuild.buildroot.org/results/4b1088a705f8564f85e629316f5cfc92953f0047

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/apr-util/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/apr-util/Config.in b/package/apr-util/Config.in
index f7c119db48..06b6c2684c 100644
--- a/package/apr-util/Config.in
+++ b/package/apr-util/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_APR_UTIL
 	depends on BR2_USE_MMU # apr
 	select BR2_PACKAGE_APR
 	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
 	help
 	  The utility library for the apache runtime project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
