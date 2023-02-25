Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E6BC64EC7
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 09:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DB2040641;
	Sat, 25 Feb 2023 09:40:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DB2040641
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KMVYYGWWAByD; Sat, 25 Feb 2023 09:40:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC6EC4090E;
	Sat, 25 Feb 2023 09:40:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC6EC4090E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D9411BF5DF
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03C3B41634
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:39:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03C3B41634
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dQ0hQsd7kvZd for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 09:39:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0451B41635
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 09:39:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0451B41635
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E275A8691D; Sat, 25 Feb 2023 09:39:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 25 Feb 2023 10:39:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 723ecc92979183a08a28176c6bf65c5555a88263
X-Git-Newrev: 02b6af266340638d154257bf2634ccc13d47ec69
X-Patchwork-Hint: ignore
Message-Id: <20230225093924.E275A8691D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: add ti-k3-r5-loader
 handling
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

commit: https://git.buildroot.net/buildroot/commit/?id=02b6af266340638d154257bf2634ccc13d47ec69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since the addition of the package
in commit 0189bcb47c7733c36fcbcb88fbf26f57958db576:

make[2]: *** No rule to make target '_defconfig'.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/d7449b2b2f2349af672bfeee832b89a223a7d9cc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index b3576f8a51..ea8548d42c 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -519,6 +519,11 @@ def fixup_config(sysinfo, configfile):
         configlines.remove('BR2_TARGET_S500_BOOTLOADER=y\n')
         configlines.remove('BR2_TARGET_S500_BOOTLOADER_BOARD=""\n')
 
+    if 'BR2_TARGET_TI_K3_R5_LOADER=y\n' in configlines and \
+       'BR2_TARGET_TI_K3_R5_LOADER_USE_DEFCONFIG=y\n' in configlines and \
+       'BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG=""\n' in configlines:
+        return False
+
     if 'BR2_TARGET_UBOOT=y\n' in configlines and \
        'BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y\n' in configlines and \
        'BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG=y\n' in configlines and \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
