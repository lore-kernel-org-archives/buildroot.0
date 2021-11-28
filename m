Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61944C433EF
	for <buildroot@archiver.kernel.org>; Sun, 28 Nov 2021 13:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D2AB41C4D;
	Sun, 28 Nov 2021 13:36:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BtQdq2zoNWcl; Sun, 28 Nov 2021 13:36:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BAC341C5D;
	Sun, 28 Nov 2021 13:36:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C43751BF958
 for <buildroot@lists.busybox.net>; Sun, 28 Nov 2021 13:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF89840106
 for <buildroot@lists.busybox.net>; Sun, 28 Nov 2021 13:36:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vsAsapbWITra for <buildroot@lists.busybox.net>;
 Sun, 28 Nov 2021 13:36:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0036E40019
 for <buildroot@buildroot.org>; Sun, 28 Nov 2021 13:36:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 774C18FF7D; Sun, 28 Nov 2021 13:31:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 Nov 2021 14:34:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 17f2bfaebd67d28ef10837f985a617094b6b7dd8
X-Git-Newrev: 046cde5a27ed39526b90013d53bd1296ed4cced8
X-Patchwork-Hint: ignore
Message-Id: <20211128133126.774C18FF7D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/poco: requires DES support in
 openssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=046cde5a27ed39526b90013d53bd1296ed4cced8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since commit
a83d41867c8d69a77d5cd0a665aa216af5340359:

src/EVPPKey.cpp:161:52: error: 'EVP_des_ede3_cbc' was not declared in this scope; did you mean 'SN_des_ede3_cbc'?
  161 |      rc = PEM_write_bio_PrivateKey(bio, _pEVPPKey, EVP_des_ede3_cbc(),
      |                                                    ^~~~~~~~~~~~~~~~
      |                                                    SN_des_ede3_cbc

Fixes:
 - http://autobuild.buildroot.org/results/eddcba8e74c23ea041f2d95de57196107f5af8a3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/poco/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/poco/Config.in b/package/poco/Config.in
index 24514a3714..dd87ee36bb 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -45,6 +45,7 @@ config BR2_PACKAGE_POCO_NET
 config BR2_PACKAGE_POCO_CRYPTO
 	bool "crypto"
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 
 config BR2_PACKAGE_POCO_NETSSL_OPENSSL
 	bool "netssl_openssl"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
