Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635F5C77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 21:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EADF340642;
	Sun,  7 May 2023 21:11:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EADF340642
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SYanCmdZhgVP; Sun,  7 May 2023 21:11:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 276894059C;
	Sun,  7 May 2023 21:11:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 276894059C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 95FB01BF2C4
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E42760F47
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:11:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E42760F47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LX0FLNPocbUQ for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 21:11:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB7BA60A92
 for <buildroot@buildroot.org>; Sun,  7 May 2023 21:11:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB7BA60A92
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 930FE86070; Sun,  7 May 2023 21:11:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 23:09:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d06dca38bb0373a13736a349f7795713458a2188
X-Git-Newrev: 0a5d8d5f85506e0fe0633e192defab2ce32cb1c0
X-Patchwork-Hint: ignore
Message-Id: <20230507211108.930FE86070@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: use positive logic to define
 initramfs fixups
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

commit: https://git.buildroot.net/buildroot/commit/?id=0a5d8d5f85506e0fe0633e192defab2ce32cb1c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit d06dca38bb03 (linux: cleanup kconfig fixup processing) introduced
the conditional LINUX_KCONFIG_FIXUP_CMDS_ROOTFS_CPIO, using a negative
logic condition.

Switch that to use positive logic.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 8027274c32..7c941fa339 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -370,7 +370,7 @@ endif
 # built, we create a fake cpio file. It'll be
 # replaced later by the real cpio archive, and the kernel will be
 # rebuilt using the linux-rebuild-with-initramfs target.
-ifneq ($(BR2_TARGET_ROOTFS_INITRAMFS),)
+ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
 define LINUX_KCONFIG_FIXUP_CMDS_ROOTFS_CPIO
 	@mkdir -p $(BINARIES_DIR)
 	$(Q)touch $(BINARIES_DIR)/rootfs.cpio
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
