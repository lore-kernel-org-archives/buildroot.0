Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509E7C77B7C
	for <buildroot@archiver.kernel.org>; Fri, 12 May 2023 15:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E431642CB2;
	Fri, 12 May 2023 15:24:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E431642CB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QEQd8RcQgqFh; Fri, 12 May 2023 15:24:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A36BD42C8C;
	Fri, 12 May 2023 15:24:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A36BD42C8C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 45DFC1BF2CB
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 15:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DF738208A
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 15:23:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DF738208A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w-_3e5ghQgaX for <buildroot@lists.busybox.net>;
 Fri, 12 May 2023 15:23:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D21B820AF
 for <buildroot@buildroot.org>; Fri, 12 May 2023 15:23:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D21B820AF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DD2186406; Fri, 12 May 2023 15:23:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 12 May 2023 17:23:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a157ea5fa6bba5fb8f1ce87fa041e4e77822c16c
X-Git-Newrev: 142e574d5f57fd44a9bd5cc9fc39cfcff5b3da6a
X-Patchwork-Hint: ignore
Message-Id: <20230512152354.1DD2186406@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux/linux.mk: fix commit
 d06dca38bb0373a13736a349f7795713458a2188 - remove extra bracket
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

commit: https://git.buildroot.net/buildroot/commit/?id=142e574d5f57fd44a9bd5cc9fc39cfcff5b3da6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit d06dca38bb0373a13736a349f7795713458a2188 (linux: cleanup
kconfig fixup processing) moved the initramfs setup out of an
enclosing statement but kept the closing bracket.

Remove the extra bracket to fix a syntax error in sed processing.

Fixes:
  >>> linux 6.4-rc1 Updating kernel config with fixups
  /bin/bash: -c: line 1: syntax error near unexpected token `)'
  /bin/bash: -c: line 1: `/usr/bin/sed -i -e '/^\(# \)\?CONFIG_INITRAMFS_ROOT_GID\>/d' /home/data/buildroot.experimental/build/linux-6.4-rc1//.config && echo 'CONFIG_INITRAMFS_ROOT_GID=0' >> /home/data/buildroot.experimental/build/linux-6.4-rc1//.config)'

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7c941fa339..cc36b5251d 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -376,7 +376,7 @@ define LINUX_KCONFIG_FIXUP_CMDS_ROOTFS_CPIO
 	$(Q)touch $(BINARIES_DIR)/rootfs.cpio
 	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,"$${BR_BINARIES_DIR}/rootfs.cpio")
 	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_UID,0)
-	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_GID,0))
+	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_GID,0)
 endef
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
