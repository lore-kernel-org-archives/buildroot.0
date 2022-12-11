Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCBCC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 14:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F9E060BCB;
	Sun, 11 Dec 2022 14:01:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F9E060BCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vjO1llraDyyF; Sun, 11 Dec 2022 14:01:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EB7D60BC8;
	Sun, 11 Dec 2022 14:01:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EB7D60BC8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F21CA1BF2F0
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 14:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDF4881454
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 14:01:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDF4881454
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mbKlFtKnqLlf for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 14:01:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0D2B81453
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 14:01:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0D2B81453
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE1E986413; Sun, 11 Dec 2022 14:01:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 14:49:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eea24067ad8c27918e30ec91d1d5d2cf0ab13946
X-Git-Newrev: 28f31d4694ad212d9b511c53ba35c6443eeef972
X-Patchwork-Hint: ignore
Message-Id: <20221211140143.CE1E986413@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/optee-client: fix util-linux
 dependency
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
