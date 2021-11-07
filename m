Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A9DC433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:41:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFD25617E5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AFD25617E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7623481CE1;
	Sun,  7 Nov 2021 02:41:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fh1T2cdpCnlD; Sun,  7 Nov 2021 02:41:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0FB281C38;
	Sun,  7 Nov 2021 02:41:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 897CB1BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7939B60666
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:41:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i5l1IQJM-if4 for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:41:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp3.osuosl.org (Postfix) with ESMTP id 872AD60620
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:41:00 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY78mquozrIRljY79mR6DC; Sun, 07 Nov 2021 03:40:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636252859; bh=/OK0JDSLuxeMIUZ7fFvPdkq7ZrsTDaaclDopxaFbrJY=;
 h=From:To:Subject:Date:MIME-Version;
 b=isLQ6f7KCSnJyrNpEBLcSNVy4/EzP/q8r1/N/KKRZ2U0qWAhRmnqsvPOcxK1vdAif
 8pCZmMS6i9Qbp3stb/VmmykqRcnJlv8/6FchhFhou36i/SqToM45mxlijSJRhRdefB
 i6o+x/wheIorlFCyBuhnuIij5n7aQkrNYEujdjeRh33nmbrHQ+bTyHLi+x4pxOYPss
 EOTnsDFxyCgj1J16qcTBjvm1sx/9ZpjM/2w7LWy/M6u3XsD7lDUK+WCRyFe7ffONHb
 xConDNZuUK+TLUB7h/1Dhx5fpZ7+r+becpFKJt4hlfR0pFvlrK2DDx07dgxCaltDXb
 /XeJ+6g9A2Npw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:40:57 +0100
Message-Id: <20211107024057.3060964-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfHRQM5TJyttl43ikebpn4Yo3dJtKjupRFsOp6CbvQb1JKD+oxjVShV036jURMbXtfEfB9nrp1cMQSm6/mS445TmNpPz6Z28dp/hDtMAiz+BoFF0Lfqrm
 PI3rVnM45IGZUocCI4y+nJk/ENnHnrHIYaBMviJb7vHL8c1sKTGakIDA4bDbGcQZ7qTZELMbZRveNnrq2Ia25h51rQMYQ/9cLhZYv2RheMoFLdOwsArAAnkr
 ZV7JEQjc3GrfryClkQtpOLl5+gn5DzqMYL3Frv5FLXc=
Subject: [Buildroot] [PATCH 046/102] board/linksprite/pcduino/genimage.cfg:
 beautify file
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/linksprite/pcduino/genimage.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/linksprite/pcduino/genimage.cfg b/board/linksprite/pcduino/genimage.cfg
index 9cbc383d44..db33322118 100644
--- a/board/linksprite/pcduino/genimage.cfg
+++ b/board/linksprite/pcduino/genimage.cfg
@@ -10,6 +10,7 @@ image boot.vfat {
 			"boot.scr"
 		}
 	}
+
 	size = 16M
 }
 
@@ -24,8 +25,8 @@ image sdcard.img {
 	partition u-boot {
 		in-partition-table = "no"
 		image = "u-boot-sunxi-with-spl.bin"
-		offset = 8192
-		size = 1040384 # 1MB - 8192
+		offset = 8K
+		size = 1016K # 1MB - 8KB
 	}
 
 	partition boot {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
