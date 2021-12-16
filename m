Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23586C433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 18:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5C9F83F06;
	Thu, 16 Dec 2021 18:25:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HeEfEBkvMTvt; Thu, 16 Dec 2021 18:25:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1269383F08;
	Thu, 16 Dec 2021 18:25:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 983B91C113E
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95D2F417AB
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:24:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 03ZhMfHVzDMd for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 18:24:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F30DB4179E
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 18:24:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 89BD5818E5; Thu, 16 Dec 2021 18:19:16 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 16 Dec 2021 19:08:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5fd174918915bc34995ac28fd9b8a0690b0beb1d
X-Git-Newrev: 9864815c7c04a85d6c5932e5ae05e980c974667d
X-Patchwork-Hint: ignore
Message-Id: <20211216181916.89BD5818E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pppd: always enable DES support in
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

commit: https://git.buildroot.net/buildroot/commit/?id=9864815c7c04a85d6c5932e5ae05e980c974667d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix commit 075b01f2f7b5a9241b4bfe76db8f14af0284060c which forgot to
always enable DES support in openssl resulting in the following build
failure with musl:

pppcrypt.c:65:22: error: 'DES_cblock' undeclared (first use in this function)
   65 |  DES_set_odd_parity((DES_cblock *)des_key);
      |                      ^~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/3a7358de6199bb069bd38139747e2d50f9416fd0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pppd/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/pppd/Config.in b/package/pppd/Config.in
index ca139a50e9..898d95f0ee 100644
--- a/package/pppd/Config.in
+++ b/package/pppd/Config.in
@@ -3,8 +3,7 @@ config BR2_PACKAGE_PPPD
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_OPENSSL if BR2_TOOLCHAIN_USES_GLIBC
-	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL \
-						 && BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	help
 	  An implementation of the Point-to-point protocol.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
