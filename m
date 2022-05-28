Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB86C433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 19:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78F8E610CF;
	Sat, 28 May 2022 19:28:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E4E1-vulAvYt; Sat, 28 May 2022 19:28:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EEB060E49;
	Sat, 28 May 2022 19:28:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E68A1BF963
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 19:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F27EA83DB7
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 19:27:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id psWqUoMPiZrn for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 19:27:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4325D837AC
 for <buildroot@buildroot.org>; Sat, 28 May 2022 19:27:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0A4E285E04; Sat, 28 May 2022 19:16:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 17:43:11 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: dd1942f46a641307c0d6bd69262c7b71c6d9a658
X-Git-Newrev: c98c804b1333a4fbc799e09e8156d39ea5f5b699
X-Patchwork-Hint: ignore
Message-Id: <20220528191613.0A4E285E04@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/rtl8189fs: enable
 required kernel options
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

commit: https://git.buildroot.net/buildroot/commit/?id=c98c804b1333a4fbc799e09e8156d39ea5f5b699
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Enable Linux kernel configuration options required by the driver.
Those are wireless networking and sdio support.

Fixes:
- http://autobuild.buildroot.net/results/ed6e29e44333ccae2728ca3321ff876c3056eada/

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit c9cd65a03f927d2903d627f1c26ee26e52d8b4c8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtl8189fs/rtl8189fs.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index 40b735c21b..0cca0b751d 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -13,5 +13,12 @@ RTL8189FS_MODULE_MAKE_OPTS = \
 	KVER=$(LINUX_VERSION_PROBED) \
 	KSRC=$(LINUX_DIR)
 
+define RTL8189FS_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MAC80211)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MMC)
+endef
+
 $(eval $(kernel-module))
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
