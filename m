Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1774C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BA594EBC7;
	Mon, 20 Feb 2023 22:37:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BA594EBC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RfKtDxpLil9z; Mon, 20 Feb 2023 22:37:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A1744F1AB;
	Mon, 20 Feb 2023 22:37:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A1744F1AB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0970F1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58AEF416E6
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58AEF416E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UGBqpjyKPjHK for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85F7D416F2
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85F7D416F2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7559186494; Mon, 20 Feb 2023 20:52:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 22 Dec 2022 21:49:13 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 728518fa647f9fdac8bdc6935fe49cd8a5d99ce7
X-Git-Newrev: e02fdfe26b2ad36166379c444e017f832946f30d
X-Patchwork-Hint: ignore
Message-Id: <20230220205214.7559186494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/skeleton-systemd: move
 var factory comment closer to code
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

commit: https://git.buildroot.net/buildroot/commit/?id=e02fdfe26b2ad36166379c444e017f832946f30d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 8cbfbe487ac6 (package/skeleton-systemd: systemd-ify mounting /var
tmpfs with ro rootfs) removed the fstab handling of /var, and left the
macro deal solely about keeping / read-only.

However, the code about how the var factory is handled was left above
the macro, which is now misleading and confusing.

Move the comment closer to the actual rootfs-pre-cmd hook which actually
deals with handling the var factory.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/skeleton-init-systemd/skeleton-init-systemd.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
index 30783dfd26..fb15552f99 100644
--- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
+++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
@@ -23,15 +23,15 @@ endef
 
 else
 
+define SKELETON_INIT_SYSTEMD_ROOT_RO_OR_RW
+	echo "/dev/root / auto ro 0 1" >$(TARGET_DIR)/etc/fstab
+endef
+
 # On a R/O rootfs, /var is a tmpfs filesystem. So, at build time, we
 # redirect /var to the "factory settings" location. Just before the
 # filesystem gets created, the /var symlink will be replaced with
 # a real (but empty) directory, and the "factory files" will be copied
 # back there by the tmpfiles.d mechanism.
-define SKELETON_INIT_SYSTEMD_ROOT_RO_OR_RW
-	echo "/dev/root / auto ro 0 1" >$(TARGET_DIR)/etc/fstab
-endef
-
 ifeq ($(BR2_INIT_SYSTEMD_VAR_FACTORY),y)
 define SKELETON_INIT_SYSTEMD_PRE_ROOTFS_VAR
 	rm -rf $(TARGET_DIR)/usr/share/factory/var
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
