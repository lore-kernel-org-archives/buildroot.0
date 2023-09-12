Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A90EE3F00
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 18:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B652E8221A;
	Tue, 12 Sep 2023 18:30:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B652E8221A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Or5A0Hy19tOh; Tue, 12 Sep 2023 18:30:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7874821FD;
	Tue, 12 Sep 2023 18:30:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7874821FD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C159C1BF2A5
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 18:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2212A415C2
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 18:29:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2212A415C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I2xVdjiF9xHy for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 18:29:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD62F414B8
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 18:29:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD62F414B8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB93486708; Tue, 12 Sep 2023 18:29:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 12 Sep 2023 20:00:20 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: ca84d11e2fe2bd8888d5e1020af4e957730d4098
X-Git-Newrev: be80331cf569588deec55103788371426cfe58cd
X-Patchwork-Hint: ignore
Message-Id: <20230912182931.AB93486708@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] utils/genrandconfig: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=be80331cf569588deec55103788371426cfe58cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

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
