Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F7FC4332F
	for <buildroot@archiver.kernel.org>; Thu, 22 Dec 2022 20:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C8AF41901;
	Thu, 22 Dec 2022 20:49:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C8AF41901
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZGZxTucd61yY; Thu, 22 Dec 2022 20:49:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42219418A3;
	Thu, 22 Dec 2022 20:49:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42219418A3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9EEA31BF3B0
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 20:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A592606A9
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 20:49:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A592606A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uvIi5yZuhw1z for <buildroot@lists.busybox.net>;
 Thu, 22 Dec 2022 20:49:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FDB7605D5
 for <buildroot@buildroot.org>; Thu, 22 Dec 2022 20:49:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FDB7605D5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 77E1A86D80; Thu, 22 Dec 2022 20:49:25 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 22 Dec 2022 21:49:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 728518fa647f9fdac8bdc6935fe49cd8a5d99ce7
X-Git-Newrev: e02fdfe26b2ad36166379c444e017f832946f30d
X-Patchwork-Hint: ignore
Message-Id: <20221222204925.77E1A86D80@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/skeleton-systemd: move var factory
 comment closer to code
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
