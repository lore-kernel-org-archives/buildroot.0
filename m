Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09116C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 20:24:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE47061360
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 20:24:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BE47061360
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9133740253;
	Sun,  7 Nov 2021 20:24:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r57MGxANhGEa; Sun,  7 Nov 2021 20:24:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91A6E4024F;
	Sun,  7 Nov 2021 20:24:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6ECF01BF28A
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 20:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BCE26071A
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 20:24:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XvQEsHLcK23l for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 20:24:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69F0E605D6
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 20:24:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 919DE8B4B0; Sun,  7 Nov 2021 20:20:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Nov 2021 21:20:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4b312914f93ab7722553bd2ea79c27b47d20826
X-Git-Newrev: d5850f263d9be318f52f20732bb6d48790b1e3ee
X-Patchwork-Hint: ignore
Message-Id: <20211107202017.919DE8B4B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/softhsm2: requires DES support in
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

commit: https://git.buildroot.net/buildroot/commit/?id=d5850f263d9be318f52f20732bb6d48790b1e3ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since the addition of the package
in commit 53873b6daecd2a97740833cae7c5b4cdb185a6b2:

OSSLDES.cpp: In member function 'virtual const EVP_CIPHER* OSSLDES::getCipher() const':
OSSLDES.cpp:81:12: error: 'EVP_des_cbc' was not declared in this scope; did you mean 'EVP_sm4_cbc'?
   81 |     return EVP_des_cbc();
      |            ^~~~~~~~~~~
      |            EVP_sm4_cbc

Fixes:
 - http://autobuild.buildroot.org/results/27d471c4ad1cdd5f2332b949f71cba86723d349f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/softhsm2/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/softhsm2/Config.in b/package/softhsm2/Config.in
index 5d84997c07..58f3e3086e 100644
--- a/package/softhsm2/Config.in
+++ b/package/softhsm2/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_SOFTHSM2
 	depends on !BR2_STATIC_LIBS # dlopen()
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES
 	help
 	  SoftHSM is an implementation of a cryptographic store
 	  accessible through a PKCS#11 interface. You can use it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
