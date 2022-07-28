Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9553DC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 21:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20F19415B9;
	Thu, 28 Jul 2022 21:05:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20F19415B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l4RQ6b0Ty-Fo; Thu, 28 Jul 2022 21:05:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E57B0415A6;
	Thu, 28 Jul 2022 21:05:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E57B0415A6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9CFFF1BF3C2
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 21:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 744444014C
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 21:04:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 744444014C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FnmYRalBY_iO for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 21:04:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BFF5415A4
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 21:04:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BFF5415A4
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 25A108681C; Thu, 28 Jul 2022 20:51:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 23:04:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e2567861a81abb963d9317cf5337b57533ad6b1
X-Git-Newrev: 07aa585aa6517eeb7f805b4d84a9667be4b3e259
X-Patchwork-Hint: ignore
Message-Id: <20220728205103.25A108681C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Makefile: always delete hwdb sources
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=07aa585aa6517eeb7f805b4d84a9667be4b3e259
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In eudev and systemd, we have code that deletes the hwdb sources from
the target - they are not useful since a binary hwdb is created from
them. However, if eudev or systemd is not used, then those sources are
not useful either. It's possible that other packages than eudev or
systemd install hwdb files, which would be left on the system.

Always remove the hwdb files.

Note that we don't expect much space savings from this, but anything may
help. It's certainly more consistent to do it always than just in eudev
and systemd.

We do this both from /usr/lib/udev (usual installation path for systemd)
and in /etc/udev (usual installation path for eudev) because packages
may install in either location.

We keep the comment explaining why it's done in rootfs-pre-cmd instead
of target-finalize - this was only present in eudev.mk.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Makefile                   | 8 ++++++++
 package/eudev/eudev.mk     | 8 --------
 package/systemd/systemd.mk | 5 -----
 3 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/Makefile b/Makefile
index f116ccb5bc..e30e778346 100644
--- a/Makefile
+++ b/Makefile
@@ -807,6 +807,14 @@ endif # merged /usr
 
 	touch $(TARGET_DIR)/usr
 
+# Note: this will run in the filesystem context, so will use a copy
+# of target/, not the real one, so the files are still available on
+# re-builds (foo-rebuild, etc...)
+define ROOTFS_RM_HWDB_DATA
+	rm -rf $(TARGET_DIR)/usr/lib/udev/hwdb.d/ $(TARGET_DIR)/etc/udev/hwdb.d/
+endef
+ROOTFS_PRE_CMD_HOOKS += ROOTFS_RM_HWDB_DATA
+
 .PHONY: target-post-image
 target-post-image: $(TARGETS_ROOTFS) target-finalize staging-finalize
 	@rm -f $(ROOTFS_COMMON_TAR)
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index f050563feb..feb5505289 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -81,13 +81,5 @@ define HOST_EUDEV_BUILD_HWDB
 endef
 HOST_EUDEV_TARGET_FINALIZE_HOOKS += HOST_EUDEV_BUILD_HWDB
 
-# Note: this will run in the filesystem context, so will use a copy
-# of tharget/, not the real one, so the files are still available on
-# re-builds (foo-rebuild, etc...)
-define HOST_EUDEV_RM_HWDB_SRC
-	rm -rf $(TARGET_DIR)/etc/udev/hwdb.d/
-endef
-HOST_EUDEV_ROOTFS_PRE_CMD_HOOKS += HOST_EUDEV_RM_HWDB_SRC
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 19fd525534..1d7452de19 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -732,11 +732,6 @@ endef
 SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_UPDATE_CATALOGS
 endif
 
-define SYSTEMD_RM_HWDB_DATA
-	rm -rf $(TARGET_DIR)/usr/lib/udev/hwdb.d/ $(TARGET_DIR)/etc/udev/hwdb.d/
-endef
-SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_RM_HWDB_DATA
-
 define SYSTEMD_RM_CATALOG_UPDATE_SERVICE
 	rm -rf $(TARGET_DIR)/usr/lib/systemd/catalog \
 		$(TARGET_DIR)/usr/lib/systemd/system/systemd-journal-catalog-update.service \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
