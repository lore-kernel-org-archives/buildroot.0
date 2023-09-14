Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDDBEEAA56
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 16:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B5B461202;
	Thu, 14 Sep 2023 16:50:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B5B461202
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pwIQz7-zCtV8; Thu, 14 Sep 2023 16:50:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9974B611EB;
	Thu, 14 Sep 2023 16:50:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9974B611EB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E97571BF283
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 16:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2A4E839A4
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 16:50:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2A4E839A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SmN4WU6waDnq for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 16:50:55 +0000 (UTC)
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BA4948399E
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 16:50:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA4948399E
X-Virus-Scanned: by amavisd-new using ClamAV (13)
Received: from localhost (95.143.241.142.ultranet.net.pl [95.143.241.142])
 by server220076.nazwa.pl (Postfix) with ESMTP id 06D1A1BE2D4;
 Thu, 14 Sep 2023 18:50:51 +0200 (CEST)
From: Wojciech Nizinski <wojciech.nizinski@grinn-global.com>
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 18:50:46 +0200
Message-Id: <20230914165046.3687491-1-wojciech.nizinski@grinn-global.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] board/freescale/common/imx:
 imx8-bootloader-prepare: enable error checking
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
Cc: Wojciech Nizinski <wojciech.nizinski@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Run script with 'errexit' bash option to detect any errors from
subcommands.

It will fix situation where 'ddr_fw.bin' was missing but successfull
build created broken boot image. Post image script report this by:

cat: /home/user/buildroot/output/images/ddr_fw.bin: No such file or
directory

and build finish with success.

Signed-off-by: Wojciech Nizinski <wojciech.nizinski@grinn-global.com>
---
 board/freescale/common/imx/imx8-bootloader-prepare.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/freescale/common/imx/imx8-bootloader-prepare.sh b/board/freescale/common/imx/imx8-bootloader-prepare.sh
index 7ebf15b6ff..8d44e588c5 100755
--- a/board/freescale/common/imx/imx8-bootloader-prepare.sh
+++ b/board/freescale/common/imx/imx8-bootloader-prepare.sh
@@ -73,4 +73,5 @@ main ()
 	exit $?
 }
 
+set -o errexit
 main $@
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
