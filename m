Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE400C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:52:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F06E61881
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F06E61881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74E1F81D02;
	Sun,  7 Nov 2021 02:52:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VLjRvTe495Uv; Sun,  7 Nov 2021 02:52:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9B7281DB2;
	Sun,  7 Nov 2021 02:52:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 16F101BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8570C402C6
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:45:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tuSv6eVfkfHR for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:45:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4004402CA
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:45:28 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljYBUmR7v7; Sun, 07 Nov 2021 03:45:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253128; bh=yt9JgNKURr3LJOcCEI/aFd+ToPyqgZxnwvfQpkbPTdw=;
 h=From:To:Subject:Date:MIME-Version;
 b=Ow69KS+AvOoYjfxtGOMdsb41gscqBq1MscV/Cp/tdytB1Y49WsLslOiDZMh5TOe7R
 jY36/KMR6eomGi+QZJwMGTDO8B/zeaYTEPKT9CgwK4Lw+IOp8gW8wqlOQnQgi2K015
 QOODLpDAZweNwHxNqu2m968fj1Ab1bOJEN3q1zjBfuKQpwASDqnPsqjkkAAl6urefM
 qBOdqWBK0CMFdob50kAwXfevLuOKkxcESrhOLy1W/2RvfbiXtXqcJUyXxmbTxW676L
 HdToHwsRlWikkpXphVKqL34hFusmS+QeGinUhH0ibOK0f0rzx15hYpIuBN35TihxSh
 1ZVavBQ6prv2w==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:43:29 +0100
Message-Id: <20211107024330.3061378-42-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfOsZXgiEe+yxkx+BC5QaubbkwP5zvT6yUrB+ILTG4TnE4nhbBSq0gpofu42XhRrdyERCJPn9D/n9Mf/KeDYqM+ys3Q0/RVisZ47EUMh4l9mHFKA0V/xt
 Oa2IWTi8oe13tUf2Q0x0PzgamcW/JI8SLGTGAEvWgSjb2C3BUhwprxo6gc2ndTNLCJm2lUb64EuEXlhXFJOSkTfkqIfih6TlQN6gcmH4nmw3zsY4/FIGhx87
 1dVec/sOxUazZ10765RFl5U2yNhXWernUhzdanetGK8=
Subject: [Buildroot] [PATCH 101/102] board/zynq/genimage.cfg: beautify file
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
 board/zynq/genimage.cfg | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/zynq/genimage.cfg b/board/zynq/genimage.cfg
index 76e61c3a09..67baca795e 100644
--- a/board/zynq/genimage.cfg
+++ b/board/zynq/genimage.cfg
@@ -6,10 +6,12 @@ image boot.vfat {
 			"devicetree.dtb",
 			"uImage"
 		}
+
 		file uramdisk.image.gz {
 			image = "rootfs.cpio.uboot"
 		}
 	}
+
 	size = 32M
 }
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
