Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEDEC433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 20:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20DB7831B0;
	Wed, 16 Feb 2022 20:48:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vFkrHz0yls_H; Wed, 16 Feb 2022 20:48:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B87CC83145;
	Wed, 16 Feb 2022 20:48:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A156E1BF425
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 20:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D5F860B6A
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 20:48:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xG1bFHZvS0Fk for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 20:48:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8EA460B4B
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 20:48:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 38BA9835CD; Wed, 16 Feb 2022 20:40:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 21:28:09 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 6306bed7f5bffd16ca3627671ae3ddf1d850e3e3
X-Git-Newrev: 749175affa7916e523f524c39b20aa6314e05afe
X-Patchwork-Hint: ignore
Message-Id: <20220216204039.38BA9835CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/rtl8723bu: fix
 firmware install path
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

commit: https://git.buildroot.net/buildroot/commit/?id=749175affa7916e523f524c39b20aa6314e05afe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

The rtl8723b_fw.bin file installed by this package is not actually used
by this driver at all. It is used by the btrtl Bluetooth driver in the
mainline kernel. The mainline btrtl driver looks for the file in
/lib/firmware/rtl_bt rather than /lib/firmware/rtlwifi. This driver's
Makefile has an install target that confirms the correct destination
firmware directory. It was like that since the very first version that
was added to Buildroot.

Signed-off-by: Doug Brown <doug@schmorgal.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 657d9731cf52dd7e9a2564ba68ce19e675c1eaee)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtl8723bu/rtl8723bu.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
index e490bddf09..838bbedb74 100644
--- a/package/rtl8723bu/rtl8723bu.mk
+++ b/package/rtl8723bu/rtl8723bu.mk
@@ -13,7 +13,7 @@ RTL8723BU_MODULE_MAKE_OPTS = \
 	KSRC=$(LINUX_DIR)
 
 define RTL8723BU_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 644 $(@D)/rtl8723b_fw.bin $(TARGET_DIR)/lib/firmware/rtlwifi/rtl8723b_fw.bin
+	$(INSTALL) -D -m 644 $(@D)/rtl8723b_fw.bin $(TARGET_DIR)/lib/firmware/rtl_bt/rtl8723b_fw.bin
 endef
 
 $(eval $(kernel-module))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
