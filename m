Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3456C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 20:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC49781A65;
	Sun,  6 Feb 2022 20:13:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZKHAHyxQZqrd; Sun,  6 Feb 2022 20:13:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBD4D81A29;
	Sun,  6 Feb 2022 20:13:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0AEAE1BF360
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 20:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07CB0814B6
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 20:12:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cDQFY7_2_Naw for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 20:12:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04135.aruba.it (smtpcmd04135.aruba.it [62.149.158.135])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43930813F4
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 20:12:41 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GnmvnnlBAkz4hGnn2nXOAo; Sun, 06 Feb 2022 21:05:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644177940; bh=Ka2E7iceWWFj5ahwj0uyVS2eJoxyIaMG4fSO79JuL/A=;
 h=From:To:Subject:Date:MIME-Version;
 b=h+c7iESatJOobdWK9rHy2zetGXrtHMMDSiwVHWNX1SQmiz+3xuM1bHm6WBnXam+bM
 E7qppOQAmVSdw+6K8QyNTKCiZjC5tILC/WfJGgmlFYrtlkrGkb4PccVy6ypAtrwAr8
 J8e3oicTJfcxCv6SK3ngkzsdFWUQbr3pN7hymtfzmtRFh/D3QO6Gza5f/EiUXZN5nA
 bZj81QlVNVJ4mdDR0RTpb89rKqQWHiuGA8mS3VJfuQJ0h6OlLD0MZFmkUaDdwnTAT+
 wzXvkIFxlzBigF5gGamUkyg4jBNcBU/U4w6k6h7Jyyviku2Zr/Ewb89qg5KiF7oebJ
 PMQIAZ1KldWAA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 21:05:29 +0100
Message-Id: <20220206200532.2758493-14-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220206200532.2758493-1-giulio.benetti@benettiengineering.com>
References: <20220206200532.2758493-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfIeqW4tLXAqn9HKE4MjvjL31/djGkOuMuJM+dVr7eEKFgdDCHWx15Ouf0qsck2ZjPvGXnMUx3BIoOQFSpUDv4Q8CT2D7EvzZwZ4KHPO7J+AH0jwNs8Io
 w+Avs9PKQwtVL1Wsp73SWoPQ1JjUWkblksO0Fcwq8Uxvx435ay+VIuB28crj+CzIy20o2+Ir7w67EAzalufCboX7d51kLv+XArnQ9yO92oVe70SzzCXLfD75
 AMfNT+oETrpucIv0bfMtaPZGw3PBgEEs6/aJuG6W9aVMkmlcCVT77owbpxUtCFwIYqaN+sanGOqLZiOgVqagSMCzheB5+RXIzDaqKl7aqE4XUYyuOIvq29z1
 pT0us37gSyvtJoyEiP8hheHIjjqU9jyGgFto9LUCBaNG5XrPiyDm7D80JYpNmoskhOREbHzc0c6BMwrJkUzAlaV9RetGq1F+o02bPskaCQhd8Est1QCtbOxv
 ZGLHrxSak+5SXLhpIXno58QW9YZB6yIx5vm2gbI6JAKJ8gn8s+ZbmFLw5MgoayPT8cMDvBLd98L/3l7/3WM2XhKSFyelFl86gzXilzsm/n+HJWx6MKe9eZDO
 rKFv8BgrzH0oB2VIzQh2yXEC
Subject: [Buildroot] [PATCH 13/16] board/radxa/rockpi-n8/genimage: convert
 partition-type-uuid to single letter notation
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
 board/radxa/rockpi-n8/genimage.cfg | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/radxa/rockpi-n8/genimage.cfg b/board/radxa/rockpi-n8/genimage.cfg
index 909a646499..3fced4a5d8 100644
--- a/board/radxa/rockpi-n8/genimage.cfg
+++ b/board/radxa/rockpi-n8/genimage.cfg
@@ -26,14 +26,14 @@ image sdcard.img {
 	}
 
 	partition boot {
-		partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
+		partition-type-uuid = F
 		bootable = "true"
 		image = "boot.vfat"
 		offset = 16M
 	}
 
 	partition rootfs {
-		partition-type-uuid = 69dad710-2ce4-4e3c-b16c-21a1d49abed3
+		partition-type-uuid = L
 		image = "rootfs.ext4"
 	}
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
