Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52DDCC0015E
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 20:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F07DC40477;
	Sat, 12 Aug 2023 20:06:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F07DC40477
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1894Id9qef2A; Sat, 12 Aug 2023 20:06:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7EF3840297;
	Sat, 12 Aug 2023 20:06:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7EF3840297
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CBD031BF4E4
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 20:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A486481D02
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 20:06:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A486481D02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mxLel7QYuiL6 for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 20:06:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8DE581CE9
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 20:06:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8DE581CE9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B536C854A9; Sat, 12 Aug 2023 20:06:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Aug 2023 22:06:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0a5bb69982f759e64251e61dd29ec28ee3771fd4
X-Git-Newrev: 283e6859f15473cc1d0b2eb336e1db6f4335b61b
X-Patchwork-Hint: ignore
Message-Id: <20230812200643.B536C854A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: add ubi handling
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

commit: https://git.buildroot.net/buildroot/commit/?id=283e6859f15473cc1d0b2eb336e1db6f4335b61b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a custom case to make sure that a random configuration with an empty
configuration file for ubi doesn't fail.

ubinize: error!: no sections found the ini-file "/home/buildroot/autobuild/instance-2/output-1/build/ubinize.cfg"

Fixes:
 - http://autobuild.buildroot.org/results/f678c17cc4df06fb2737467e769cd8f72a3ea420

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index b6154db344..52edad06d8 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -526,6 +526,12 @@ def fixup_config(sysinfo, configfile):
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
