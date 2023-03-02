Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7ADC6FA8E
	for <buildroot@archiver.kernel.org>; Thu,  2 Mar 2023 22:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBDA040359;
	Thu,  2 Mar 2023 22:19:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBDA040359
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K1LzgXNRuo07; Thu,  2 Mar 2023 22:19:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2179140B9A;
	Thu,  2 Mar 2023 22:19:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2179140B9A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DFFA71BF48D
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 22:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6D1241BB1
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 22:18:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6D1241BB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hRzSBpCbRIyk for <buildroot@lists.busybox.net>;
 Thu,  2 Mar 2023 22:18:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C489C41BAF
 for <buildroot@buildroot.org>; Thu,  2 Mar 2023 22:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C489C41BAF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB5F186E75; Thu,  2 Mar 2023 22:18:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 2 Mar 2023 23:18:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 61f1601536f86dc90dcd1efc0eb13f58f4a3dbe5
X-Git-Newrev: f67c896fecade666e44a734b34cbf7b0d08903c0
X-Patchwork-Hint: ignore
Message-Id: <20230302221857.AB5F186E75@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: check if qemu-system is
 enabled when creating symlink
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

commit: https://git.buildroot.net/buildroot/commit/?id=f67c896fecade666e44a734b34cbf7b0d08903c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit c6b9cd9a11fe7fec6bfec2ddbd42c2851dba0011 added a symlink to qemu-system
as a post install hook. However, it does not check if qemu-system is actually
enabled with BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE.

Add the check to make sure we only create the symlink if that is enabled.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/qemu.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 58b4ff10a5..cc8dc42a24 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -488,10 +488,12 @@ define HOST_QEMU_INSTALL_CMDS
 endef
 
 # install symlink to qemu-system
+ifeq ($(BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE),y)
 define HOST_QEMU_POST_INSTALL_SYMLINK
 	ln -sf ./qemu-system-$(HOST_QEMU_ARCH) $(HOST_DIR)/bin/qemu-system
 endef
 HOST_QEMU_POST_INSTALL_HOOKS += HOST_QEMU_POST_INSTALL_SYMLINK
+endif
 
 $(eval $(host-generic-package))
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
