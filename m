Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685BAC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1945282690;
	Mon, 20 Feb 2023 23:02:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1945282690
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I2CPlJ47mEVN; Mon, 20 Feb 2023 23:02:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3499882336;
	Mon, 20 Feb 2023 23:02:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3499882336
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7AE3F1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CC59414EA
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CC59414EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bdWsns2MRTuY for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8128841717
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8128841717
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7ED3E86495; Mon, 20 Feb 2023 20:52:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 17:45:56 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7aeeb632d66dd59e0dbcff8ad6fee724c4e829d3
X-Git-Newrev: fa581bb3e6b45da2b7a0cfb9e5d6f869a7cd9b05
X-Patchwork-Hint: ignore
Message-Id: <20230220205223.7ED3E86495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/i2pd: really install
 configuration files
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

commit: https://git.buildroot.net/buildroot/commit/?id=fa581bb3e6b45da2b7a0cfb9e5d6f869a7cd9b05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

While applying [1] the commit "fffbd2c9f7 i2pd: new package"
unintentionally removed completely the post-install hooks, so
I2PD_INSTALL_CONFIGURATION_FILES is declared but never called.

Fix the install of configuration files by adding the defined symbol to
the post-install hooks.

[1] http://patchwork.ozlabs.org/project/buildroot/patch/20180327212401.5173-1-fontaine.fabrice@gmail.com/

Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/i2pd/i2pd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
index b99212be47..ad268a235c 100644
--- a/package/i2pd/i2pd.mk
+++ b/package/i2pd/i2pd.mk
@@ -44,6 +44,7 @@ define I2PD_INSTALL_CONFIGURATION_FILES
 	mkdir -p $(TARGET_DIR)/var/lib/i2pd
 	cp -a $(@D)/contrib/certificates $(TARGET_DIR)/var/lib/i2pd
 endef
+I2PD_POST_INSTALL_TARGET_HOOKS += I2PD_INSTALL_CONFIGURATION_FILES
 
 define I2PD_USERS
 	i2pd -1 i2pd -1 * /var/lib/i2pd - - I2P Daemon
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
