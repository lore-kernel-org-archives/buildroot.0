Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E87B1C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 936F383963;
	Mon, 20 Feb 2023 23:27:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 936F383963
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f0gGGOsCYTce; Mon, 20 Feb 2023 23:27:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8D5583926;
	Mon, 20 Feb 2023 23:27:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8D5583926
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0EB421BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD06F41753
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD06F41753
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sDicv_YEPooq for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEB1A4174C
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEB1A4174C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EBCAE828C8; Mon, 20 Feb 2023 20:52:36 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 18 Jan 2023 22:03:33 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 94b66fb49cd57d0863245fbe0a3dc0833e76aad0
X-Git-Newrev: e7797603d260b498c864d089b107d01679edf0a6
X-Patchwork-Hint: ignore
Message-Id: <20230220205236.EBCAE828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/proftpd: sftpd does
 not build with libressl
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

commit: https://git.buildroot.net/buildroot/commit/?id=e7797603d260b498c864d089b107d01679edf0a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

sftp doesn't build with libressl >= 3.5.0 resulting in the following
build failure since commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

mac.c: In function 'init_mac':
mac.c:189:3: warning: implicit declaration of function 'HMAC_CTX_init'; did you mean 'HMAC_CTX_new'? [-Wimplicit-function-declaration]
  189 |   HMAC_CTX_init(hmac_ctx);
      |   ^~~~~~~~~~~~~
      |   HMAC_CTX_new
mac.c: In function 'set_mac_key':
mac.c:435:14: error: storage size of 'ctx' isn't known
  435 |   EVP_MD_CTX ctx;
      |              ^~~

So force use of openssl for sftpd, as no feedback was received on
https://github.com/proftpd/proftpd/pull/1481

Fixes:
 - http://autobuild.buildroot.org/results/a16ccd7cc78eb63de06a6d738fccc6b947da13e7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/proftpd/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
index 83094028a0..aed1958b8d 100644
--- a/package/proftpd/Config.in
+++ b/package/proftpd/Config.in
@@ -29,7 +29,8 @@ config BR2_PACKAGE_PROFTPD_MOD_REDIS
 config BR2_PACKAGE_PROFTPD_MOD_SFTP
 	bool "mod_sftp support"
 	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160
 	help
 	  Compile ProFTPD with mod_sftp support
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
