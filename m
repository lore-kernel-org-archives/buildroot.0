Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C059C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 15:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 552A9409C3;
	Sun, 27 Mar 2022 15:48:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z6v9BmkLmlh4; Sun, 27 Mar 2022 15:48:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D3A2409B4;
	Sun, 27 Mar 2022 15:48:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7B0F91BF3B9
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CA984098B
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:46:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DKZ-cvQTP6ZX for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:46:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE41C409B2
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 15:46:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5C7CE85D66; Sun, 27 Mar 2022 15:37:12 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 17:33:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8974c6fa26f626021aa170678989c57fa81e8faf
X-Git-Newrev: 945f8a788f8b30983aa6b2ce7275551a8a60efc8
X-Patchwork-Hint: ignore
Message-Id: <20220327153712.5C7CE85D66@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/optee-os: fix version choice
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
Content-Type: multipart/mixed; boundary="===============8526465224215649001=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8526465224215649001==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=945f8a788f8b30983aa6b2ce7275551a8a60efc8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit c5d441b7f2ee (boot/optee-os: bump to version 3.16.0) forgot to
propagate the rustc arch dependency from the new version, to the default
clause of the choice.

This leaves only the custom git tree as a posible source for building
OP-TEE OS in case the host can't have a rustc compiler.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Clément Léger <clement.leger@bootlin.com>
Cc: Etienne Carriere <etienne.carriere@linaro.org>
Acked-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/optee-os/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index 18e1efee55..30b6f62434 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -13,7 +13,7 @@ if BR2_TARGET_OPTEE_OS
 
 choice
 	prompt "OP-TEE OS version"
-	default BR2_TARGET_OPTEE_OS_LATEST
+	default BR2_TARGET_OPTEE_OS_LATEST if BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	help
 	  Select the version of OP-TEE OS you want to use
 

--===============8526465224215649001==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8526465224215649001==--
