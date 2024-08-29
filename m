Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A33C83F2D
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 16:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1068840C0;
	Thu, 29 Aug 2024 16:17:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NpMKGuBqHr05; Thu, 29 Aug 2024 16:17:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B1A981ECF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B1A981ECF;
	Thu, 29 Aug 2024 16:17:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 33EFC1BF84C
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 16:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB77C61161
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 16:17:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Ud4JSvpQRuS for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 16:17:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D174B61162
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D174B61162
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 16:17:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE84B842D8; Thu, 29 Aug 2024 16:17:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 18:16:13 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 55a126c8292eec04126bc5df8b6023d9682d7eac
X-Git-Newrev: 3688161940abec23677499f79ff44d8f54465879
X-Patchwork-Hint: ignore
Message-Id: <20240829161701.CE84B842D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/apr-util:
 requires DES in openssl
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3688161940abec23677499f79ff44d8f54465879
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

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
(cherry picked from commit 8bb67c230b9d32d91bc85e5563f3453cb50d7a38)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
