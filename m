Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE66AC6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 07:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6111F80BD3;
	Wed, 15 Mar 2023 07:16:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6111F80BD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LAoBwQnn3MNV; Wed, 15 Mar 2023 07:16:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9517380C2A;
	Wed, 15 Mar 2023 07:16:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9517380C2A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4465E1BF962
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 07:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DFF860BC7
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 07:16:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DFF860BC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W_B2RCbsKBkQ for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 07:16:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D58B60B9F
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 07:16:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D58B60B9F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B21F873BC; Wed, 15 Mar 2023 07:16:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Mar 2023 08:09:35 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: c320582d40a668420c8340506291fa3496bcc93e
X-Git-Newrev: df21c1c972680a2bf4361f5c33ed591f340714e2
X-Patchwork-Hint: ignore
Message-Id: <20230315071625.2B21F873BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/qemu: check if
 qemu-system is enabled when creating symlink
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

commit: https://git.buildroot.net/buildroot/commit/?id=df21c1c972680a2bf4361f5c33ed591f340714e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Commit c6b9cd9a11fe7fec6bfec2ddbd42c2851dba0011 added a symlink to qemu-system
as a post install hook. However, it does not check if qemu-system is actually
enabled with BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE.

Add the check to make sure we only create the symlink if that is enabled.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f67c896fecade666e44a734b34cbf7b0d08903c0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/qemu.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index a991d49993..43e8e7321f 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -405,10 +405,12 @@ define HOST_QEMU_INSTALL_CMDS
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
