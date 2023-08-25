Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28EBC3DA6F
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 16:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F384614C0;
	Fri, 25 Aug 2023 16:56:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F384614C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I_zzhWMQgLqJ; Fri, 25 Aug 2023 16:56:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8CFA61495;
	Fri, 25 Aug 2023 16:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8CFA61495
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AA9DA1BF35E
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 16:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 917BB61495
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 16:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 917BB61495
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SJcyHdV-zKrl for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 16:56:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF88761338
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 16:56:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF88761338
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE0CD8636F; Fri, 25 Aug 2023 16:56:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 25 Aug 2023 18:54:45 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 851a7195a55bf88a6b3cc6c06e6190c9288cdd8e
X-Git-Newrev: ef926a0a44e49da84f619846f66028e7653e5c52
X-Patchwork-Hint: ignore
Message-Id: <20230825165627.BE0CD8636F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] utils/genrandconfig:
 increase default target ubifs image size
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef926a0a44e49da84f619846f66028e7653e5c52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

The new value is calculated based on:
ROOTFS_SIZE = 5G (see commit 3c98eb26db6501a373cc405c80505ba72fde9e96)
BR2_TARGET_ROOTFS_UBIFS_LEBSIZE = 0x1f800

5G / 0x1f800 = 41610

Fixes:
http://autobuild.buildroot.net/results/f72/f72918d63510b170e5da01bfa9c247cf9dcf507f/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9b31b643825e5ffa0e5849b622de4925b5b73cb9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/genrandconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 0938260c1b..60922e871c 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -525,6 +525,11 @@ def fixup_config(sysinfo, configfile):
         configlines.remove('BR2_TARGET_ROOTFS_F2FS_SIZE="100M"\n')
         configlines.append('BR2_TARGET_ROOTFS_F2FS_SIZE="%s"\n' % ROOTFS_SIZE)
 
+    if 'BR2_TARGET_ROOTFS_UBIFS=y\n' in configlines and \
+       'BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=2048\n' in configlines:
+        configlines.remove('BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=2048\n')
+        configlines.append('BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=41610\n')
+
     if 'BR2_TARGET_S500_BOOTLOADER=y\n' in configlines and \
        'BR2_TARGET_S500_BOOTLOADER_BOARD=""\n' in configlines:
         configlines.remove('BR2_TARGET_S500_BOOTLOADER=y\n')
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
