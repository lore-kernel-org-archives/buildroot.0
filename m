Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B499EC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 21:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D8D4826B4;
	Thu, 28 Jul 2022 21:04:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D8D4826B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EB43eJuDvehC; Thu, 28 Jul 2022 21:04:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DD5182662;
	Thu, 28 Jul 2022 21:04:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DD5182662
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 739081BF3C2
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 21:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CD9A415A6
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 21:04:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CD9A415A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9UjwkVzG2WcP for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 21:04:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42A6A4014C
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 21:04:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42A6A4014C
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 199278681A; Thu, 28 Jul 2022 20:51:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 23:04:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b9014e762c9810d09b49c4132d9306fc333ebd6
X-Git-Newrev: 4e2567861a81abb963d9317cf5337b57533ad6b1
X-Patchwork-Hint: ignore
Message-Id: <20220728205103.199278681A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/eudev: remove HOST_EUDEV_SYSCONFDIR
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e2567861a81abb963d9317cf5337b57533ad6b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The HOST_EUDEV_SYSCONFDIR is a leftover from before eudev, when udev was
still built from systemd sources. Now that we have a separate file for
eudev and systemd, there's no need any more to have a condition there.
In addition, its usage in systemd.mk has been removed.

Remove the HOST_EUDEV_SYSCONFDIR variable and instead use /etc directly
in eudev.mk.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/eudev/eudev.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 705370689d..f050563feb 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -57,13 +57,12 @@ endef
 
 HOST_EUDEV_DEPENDENCIES = host-gperf host-pkgconf
 
-HOST_EUDEV_SYSCONFDIR = $(if $(BR2_PACKAGE_SYSTEMD),/usr/lib,/etc)
 HOST_EUDEV_CONF_OPTS = \
 	--prefix=/usr \
 	--sbindir=/sbin \
 	--libexecdir=/lib \
 	--with-rootlibdir=/lib \
-	--sysconfdir=$(HOST_EUDEV_SYSCONFDIR) \
+	--sysconfdir=/etc \
 	--disable-blkid \
 	--disable-introspection \
 	--disable-kmod \
@@ -86,7 +85,7 @@ HOST_EUDEV_TARGET_FINALIZE_HOOKS += HOST_EUDEV_BUILD_HWDB
 # of tharget/, not the real one, so the files are still available on
 # re-builds (foo-rebuild, etc...)
 define HOST_EUDEV_RM_HWDB_SRC
-	rm -rf $(TARGET_DIR)/$(HOST_EUDEV_SYSCONFDIR)/udev/hwdb.d/
+	rm -rf $(TARGET_DIR)/etc/udev/hwdb.d/
 endef
 HOST_EUDEV_ROOTFS_PRE_CMD_HOOKS += HOST_EUDEV_RM_HWDB_SRC
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
