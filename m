Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88AC6C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 19:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B76160A92;
	Thu, 28 Jul 2022 19:05:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B76160A92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kKVvN4eK1hWO; Thu, 28 Jul 2022 19:05:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBC8A60AE0;
	Thu, 28 Jul 2022 19:05:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBC8A60AE0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 385CC1C1190
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 19:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13E974168D
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 19:04:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13E974168D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yjhoQKm1fv8z for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 19:04:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D35F409A4
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 19:04:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D35F409A4
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 457B586512; Thu, 28 Jul 2022 18:50:30 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 21:03:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 153225252046a697fc3ba1c662db617194a66b36
X-Git-Newrev: 8a1e8cd3e1ffc48d10969bcceffc7c8086119f9a
X-Patchwork-Hint: ignore
Message-Id: <20220728185030.457B586512@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: always delete hwdb
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

commit: https://git.buildroot.net/buildroot/commit/?id=8a1e8cd3e1ffc48d10969bcceffc7c8086119f9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Up to now, the source files of the hwdb was only cleaned if systemd-hwdb
was used. However, those files should only be used by the hwdb anyway --
otherwise we shouldn't clean them even when the hwdb is enabled.
Therefore, remove them even if hwdb is disabled.

hwdb files can be put in two places: /usr/lib/udev, or /etc/udev. The
former is where systemd-compliant packages would install them, but the
latter is where they were originally placed. In systemd-land, /etc
should only contain local information, so ideally it should be empty in
the rootfs.

The reality, however, is that many packages still install files in /etc.
Thus, there are probably also packages that install hwdb files in
/etc/udev.

Therefore, clean the hwdb files both in /etc/udev and in /usr/lib/udev.

Probably, we should do this cleaning even when systemd is not selected,
since non-systemd packages may install files there which are not
relevant without systemd-hwdb (or eudev). However, that's a bigger
change which needs a separate patch (and a bit more consideration).

While we're at it, get rid of the HOST_EUDEV_SYSCONFDIR variable. This
is a leftover from when udev was still extracted from the systemd
package (i.e. before eudev became a separate package).

Signed-off-by: Norbert Lange <nolange79@gmail.com>
[Arnout: split in two separate commits]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/systemd/systemd.mk | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 45140cb042..624de68584 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -310,10 +310,6 @@ define SYSTEMD_BUILD_HWDB
 	$(HOST_DIR)/bin/systemd-hwdb update --root $(TARGET_DIR) --strict --usr
 endef
 SYSTEMD_TARGET_FINALIZE_HOOKS += SYSTEMD_BUILD_HWDB
-define SYSTEMD_RM_HWDB_SRV
-	rm -rf $(TARGET_DIR)/$(HOST_EUDEV_SYSCONFDIR)/udev/hwdb.d/
-endef
-SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_RM_HWDB_SRV
 else
 SYSTEMD_CONF_OPTS += -Dhwdb=false
 endif
@@ -730,6 +726,11 @@ endef
 SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_UPDATE_CATALOGS
 endif
 
+define SYSTEMD_RM_HWDB_DATA
+	rm -rf $(TARGET_DIR)/usr/lib/udev/hwdb.d/ $(TARGET_DIR)/etc/udev/hwdb.d/
+endef
+SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_RM_HWDB_DATA
+
 define SYSTEMD_RM_CATALOG_UPDATE_SERVICE
 	rm -rf $(TARGET_DIR)/usr/lib/systemd/catalog \
 		$(TARGET_DIR)/usr/lib/systemd/system/systemd-journal-catalog-update.service \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
