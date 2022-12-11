Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9714CC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4155C41D9D;
	Mon, 20 Feb 2023 21:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4155C41D9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T8Jamdq8cTRL; Mon, 20 Feb 2023 21:03:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E480842A12;
	Mon, 20 Feb 2023 21:03:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E480842A12
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DF4CA1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B839B822E9
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B839B822E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TbFf-n5TTalx for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFA01822E2
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFA01822E2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E05A286494; Mon, 20 Feb 2023 20:52:06 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 14:49:49 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: eea24067ad8c27918e30ec91d1d5d2cf0ab13946
X-Git-Newrev: 28f31d4694ad212d9b511c53ba35c6443eeef972
X-Patchwork-Hint: ignore
Message-Id: <20230220205206.E05A286494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/optee-client: fix
 util-linux dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=28f31d4694ad212d9b511c53ba35c6443eeef972
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

When applying 917a961d9c77 (package/optee-client: bump to version
3.19.0), a last-minute change was made in Config.in to change the
dependency to util-linux instead of util-linux-libs, but the
counterpart to that change in the .mk was omitted.

Fix that now.

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/optee-client/optee-client.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
index 3e0c9269b8..311ca191b0 100644
--- a/package/optee-client/optee-client.mk
+++ b/package/optee-client/optee-client.mk
@@ -27,7 +27,7 @@ OPTEE_CLIENT_CONF_OPTS += -DCFG_TEE_SUPP_PLUGINS=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPTEE_CLIENT_TEEACL),y)
-OPTEE_CLIENT_EXT_DEPENDENCIES += host-pkgconf util-linux-libs
+OPTEE_CLIENT_EXT_DEPENDENCIES += host-pkgconf util-linux
 OPTEE_CLIENT_CONF_OPTS += -DWITH_TEEACL=ON
 else
 OPTEE_CLIENT_CONF_OPTS += -DWITH_TEEACL=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
