Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A3EEE3F09
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 18:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2366821E6;
	Tue, 12 Sep 2023 18:30:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2366821E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hLhCRJ-2ZCBI; Tue, 12 Sep 2023 18:30:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA9B982254;
	Tue, 12 Sep 2023 18:30:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA9B982254
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4C3741BF964
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 18:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 334154056D
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 18:30:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 334154056D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FsLz5Z7e_nVp for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 18:30:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60B304042B
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 18:30:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60B304042B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4FD2B867F1; Tue, 12 Sep 2023 18:30:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 12 Sep 2023 20:00:24 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 84bfb47d93707f7f0936ac507ed5846721d28612
X-Git-Newrev: 58e865f06fd50606e067c6454dac8438d0169bb3
X-Patchwork-Hint: ignore
Message-Id: <20230912183042.4FD2B867F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] utils/genrandconfig: add
 ubi handling
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

commit: https://git.buildroot.net/buildroot/commit/?id=58e865f06fd50606e067c6454dac8438d0169bb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Add a custom case to make sure that a random configuration with an empty
configuration file for ubi doesn't fail.

ubinize: error!: no sections found the ini-file "/home/buildroot/autobuild/instance-2/output-1/build/ubinize.cfg"

Fixes:
 - http://autobuild.buildroot.org/results/f678c17cc4df06fb2737467e769cd8f72a3ea420

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 283e6859f15473cc1d0b2eb336e1db6f4335b61b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/genrandconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 60922e871c..846cf1aa9f 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -530,6 +530,12 @@ def fixup_config(sysinfo, configfile):
         configlines.remove('BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=2048\n')
         configlines.append('BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=41610\n')
 
+    if 'BR2_TARGET_ROOTFS_UBI=y\n' in configlines and \
+       'BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG=y\n' in configlines and \
+       'BR2_TARGET_ROOTFS_UBI_CUSTOM_CONFIG_FILE=""\n' in configlines:
+        configlines.remove('BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG=y\n')
+        configlines.remove('BR2_TARGET_ROOTFS_UBI_CUSTOM_CONFIG_FILE=""\n')
+
     if 'BR2_TARGET_S500_BOOTLOADER=y\n' in configlines and \
        'BR2_TARGET_S500_BOOTLOADER_BOARD=""\n' in configlines:
         configlines.remove('BR2_TARGET_S500_BOOTLOADER=y\n')
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
