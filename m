Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C2CCD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 21:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94CC44189D;
	Wed,  3 Apr 2024 21:08:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uAR8u2Rxn6Ht; Wed,  3 Apr 2024 21:08:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52255418A0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52255418A0;
	Wed,  3 Apr 2024 21:08:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A9B6F1BF3D4
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 21:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9755340543
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 21:07:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X8GOL5vG5CUI for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 21:07:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE8FF4042B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE8FF4042B
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 21:07:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A1FAC848E5; Wed,  3 Apr 2024 21:07:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Apr 2024 23:07:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 02e30af0d059aabb694daa54cbad4cae900af29a
X-Git-Newrev: 4a1bcbe17e83c78de31a4cdf9161c1342d1021ae
X-Patchwork-Hint: ignore
Message-Id: <20240403210758.A1FAC848E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 board/freescale/common/imx/imx8-bootloader-prepare.sh: enable error
 checking
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a1bcbe17e83c78de31a4cdf9161c1342d1021ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Run script with 'errexit' bash option to detect any errors from
subcommands.

It will fix situation where 'ddr_fw.bin' was missing but successfull
build created broken boot image. Post image script report this by:

cat: /home/user/buildroot/output/images/ddr_fw.bin: No such file or directory

and build finish with success.

Signed-off-by: Wojciech Nizinski <wojciech.nizinski@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/freescale/common/imx/imx8-bootloader-prepare.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/freescale/common/imx/imx8-bootloader-prepare.sh b/board/freescale/common/imx/imx8-bootloader-prepare.sh
index 7ebf15b6ff..a9ee154e9c 100755
--- a/board/freescale/common/imx/imx8-bootloader-prepare.sh
+++ b/board/freescale/common/imx/imx8-bootloader-prepare.sh
@@ -73,4 +73,5 @@ main ()
 	exit $?
 }
 
+set -e
 main $@
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
