Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1537C64ED6
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 15:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6394460AE3;
	Mon, 27 Feb 2023 15:24:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6394460AE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id McgBSMa_40Wi; Mon, 27 Feb 2023 15:24:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C38B6100D;
	Mon, 27 Feb 2023 15:24:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C38B6100D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A3D1B1BF31B
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 15:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DA8C41755
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 15:24:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DA8C41755
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CG4ad16zwF01 for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 15:24:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F8DA41601
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 15:24:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F8DA41601
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6AC3E86C09; Mon, 27 Feb 2023 15:24:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 Feb 2023 16:22:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 99d9dc1ad87796be17c4cdc9a1ac72d1b31c111b
X-Git-Newrev: ad4982d18e66ec909b0c906768d233fd8d4a1be0
X-Patchwork-Hint: ignore
Message-Id: <20230227152416.6AC3E86C09@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: add
 boot-wrapper-aarch64 handling
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

commit: https://git.buildroot.net/buildroot/commit/?id=ad4982d18e66ec909b0c906768d233fd8d4a1be0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since the addition of the package
in commit 7689b72e00fd4d8c017880004e83a1c79144ab7b:

configure: error: Could not find DTB file: /home/autobuild/autobuild/instance-9/output-1/build/linux-6.1.9/arch/arm64/boot/dts/.dtb

Fixes:
 - http://autobuild.buildroot.org/results/44287ccc8cc9767704642919e6d928d1f57b436d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/genrandconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 6ec398851a..2b0baedf31 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -492,6 +492,10 @@ def fixup_config(sysinfo, configfile):
         configlines.remove('BR2_TARGET_BAREBOX_USE_DEFCONFIG=y\n')
         configlines.remove('BR2_TARGET_BAREBOX_BOARD_DEFCONFIG=""\n')
 
+    if 'BR2_TARGET_BOOT_WRAPPER_AARCH64=y\n' in configlines and \
+       'BR2_TARGET_BOOT_WRAPPER_AARCH64_DTS=""\n' in configlines:
+        return False
+
     if 'BR2_TARGET_LPC32XXCDL=y\n' in configlines and \
        'BR2_TARGET_LPC32XXCDL_BOARDNAME=""\n' in configlines:
         return False
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
