Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B7DC433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 20:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13DCD817FD;
	Sun,  6 Feb 2022 20:06:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZqF5rTSjfG-5; Sun,  6 Feb 2022 20:06:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A7B881765;
	Sun,  6 Feb 2022 20:06:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D5D11BF97D
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 20:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CBE381765
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 20:05:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Njp4BinENyU for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 20:05:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51BFA814B6
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 20:05:38 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GnmvnnlBAkz4hGnmznXO8K; Sun, 06 Feb 2022 21:05:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644177937; bh=gHIUo1754gp57078fD1WMQqoRzZzlb+yfw4PykmaRyM=;
 h=From:To:Subject:Date:MIME-Version;
 b=F/GjhUlo/eQXZxqo4SzZOVCJNKv5dTTv6RZoYm//+g0HjVKsc3Giq/lWjE5NzKoT1
 cW6Qk+zCKQ3+gdSXkB3C3Q6MMOeFD3H7/7FWinbLK8DCYy8XWvhKSfJbX3ze2ugaWo
 Icel/aqLX3cba0QjAsxUAPABhVUJfIQnE1Y799aMAG7PGl2aby9qsy/bYmiG0jUDjM
 r+Tn+lteUC5wPa4Y5hPPSVZPN/qI3+zjemrpYtayk5VsvF9wc6EXi56JKjB89zS4lu
 b94Xek0TnMFnmQJlfqw5iEeDZ2ylyJxYhvl33LUWzE+YoobXnKDBLgWb3ZwTkx6SkQ
 O41okLxkFrCvw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 21:05:21 +0100
Message-Id: <20220206200532.2758493-6-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220206200532.2758493-1-giulio.benetti@benettiengineering.com>
References: <20220206200532.2758493-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfLus2h4/E9eyxbTajqMR6sXhHA6YCjiDtfIUo9dLeAEPET2mPnJrcr/4Frn7QVKZXDffSmkOVsLOo9PXipMC08as4TSU9aRtDsrgwIab1vBDuHZlGRDs
 NLKOn4lqS5YB7HNCSAPaTaI1KyQxgId8CDEEFf/fP2z9WPIciGl1MvUTBHIo0L6VH7044x49ef1iD3jWAbCfCIvBECsink4pqFAfZ6ey9x5Png1YPCwOQZLF
 vxQnkP91meBkvWESVx0dPnVSVCRiMj7Bfcvef7D+SwWBTLLGML8ClAbd947cJP/rxdNSWLFlWlHMJaKoEdR9rf6faigJds5QI3Om+KUqwjs1jTNTtQdolqQG
 AJAvaja3Jn4Ug3I38qdRBAPhgB7ObM4QPC7t48i06FZSKv8sBvq14zgH3eJmwSK8sDl9PuBWyDySkFZwI1zI3okxKuRG9HQH7DeY/1emEXxSCrBGHEY+0KE6
 0Qafmjq++Xffs68FAN52ZTUB/eEUjqgMQl/v/Nkpe42FmpByPBkvMjjGd2wq1U0wm9iKSPGApSAzyI5UoA9a66a+iOYR7ajhVUKIB9VHiOt1BBrrQAkHnrpa
 2vE0TRcPdr3z/NIPxfuN+eqi
Subject: [Buildroot] [PATCH 05/16] board/orangepi/orangepi-pc-plus/genimage:
 keep partition-type-uuid without "" for consistency
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 Gerome Burlats <gerome.burlats@smile.fr>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/orangepi/orangepi-pc-plus/genimage.cfg | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/orangepi/orangepi-pc-plus/genimage.cfg b/board/orangepi/orangepi-pc-plus/genimage.cfg
index 3812d785d5..d94239e9a2 100644
--- a/board/orangepi/orangepi-pc-plus/genimage.cfg
+++ b/board/orangepi/orangepi-pc-plus/genimage.cfg
@@ -28,7 +28,7 @@ image sdcard.img {
 	}
 
 	partition boot {
-		partition-type-uuid  = "F"
+		partition-type-uuid = F
 		bootable = "true"
 		image = "boot.vfat"
 	}
@@ -36,7 +36,7 @@ image sdcard.img {
 	# 'rootfs' will be used as the partition label, used
 	# with root=PARTLABEL=rootfs kernel command line
 	partition rootfs {
-		partition-type-uuid = "L"
+		partition-type-uuid = L
 		image = "rootfs.ext4"
 		size = 512M
 	}
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
