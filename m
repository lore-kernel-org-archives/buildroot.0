Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A03C0015E
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 21:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D01E740993;
	Fri, 14 Jul 2023 21:27:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D01E740993
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zFhGNLfLMB0W; Fri, 14 Jul 2023 21:27:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CFBF405C4;
	Fri, 14 Jul 2023 21:27:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CFBF405C4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5EF3A1BF97F
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 21:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4415F400D1
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 21:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4415F400D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mySkp9KzuvQ5 for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 21:26:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 813D340327
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 21:26:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 813D340327
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E131870E9; Fri, 14 Jul 2023 21:26:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 14 Jul 2023 23:26:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2fd06a0e57278891cd29f3497a5d23692716e253
X-Git-Newrev: 9b31b643825e5ffa0e5849b622de4925b5b73cb9
X-Patchwork-Hint: ignore
Message-Id: <20230714212619.6E131870E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: increase default
 target ubifs image size
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

commit: https://git.buildroot.net/buildroot/commit/?id=9b31b643825e5ffa0e5849b622de4925b5b73cb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The new value is calculated based on:
ROOTFS_SIZE = 5G (see commit 3c98eb26db6501a373cc405c80505ba72fde9e96)
BR2_TARGET_ROOTFS_UBIFS_LEBSIZE = 0x1f800

5G / 0x1f800 = 41610

Fixes:
http://autobuild.buildroot.net/results/f72/f72918d63510b170e5da01bfa9c247cf9dcf507f/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
