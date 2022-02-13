Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3852CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 22:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF11B40332;
	Sun, 13 Feb 2022 22:56:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oZaWeyZw4dl9; Sun, 13 Feb 2022 22:56:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24D2D402E9;
	Sun, 13 Feb 2022 22:56:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 35E241BF834
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 22:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3116840424
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 22:53:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jxlG9o75KZpr for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 22:53:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb150.aruba.it (smtpweb150.aruba.it [62.149.158.150])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36E5B400F3
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 22:53:57 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JNkdniVFUXmFAJNkinv80R; Sun, 13 Feb 2022 23:53:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644792837; bh=9hPOq1v8aMzosF/ZjqTnNgY0VrWkifJzGfNDIjRdN4k=;
 h=From:To:Subject:Date:MIME-Version;
 b=cZ3tn9XQQGb177ZA1HYQAt4CVk5QVuPjn6A5Q0FGCkvje9UZgWc40IemWvLhZRj0h
 xjKAOGTTfQ3UlXAkKuoilAl4Zu2COydm/HJQ/pT9gXVf05W/iZyCy0SYl3ot5qZAFC
 layDemtA2+L6sxcmLAB3nxEOZ3rqUF6SKLJf6UKS9a6cRQqjyToZ9UBkXmYwgjLlx3
 WOg7BwbMtv+2rODGvuz19RTR3saYeui5C6x+q6FLMjWJIRoqkYaUtXaW3Gc9f6U1de
 Hf0lUIuHkH48ekuh2O6S7+Re2wVNJcMNfGS4e6exYbH5Hlk0rGoZf6tAEXlot+y9be
 6OoJVVohvBRqw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 23:53:43 +0100
Message-Id: <20220213225350.3466696-10-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220213225350.3466696-1-giulio.benetti@benettiengineering.com>
References: <49133c66-0a53-7607-1c52-5e1ad9e8fc7b@benettiengineering.com>
 <20220213225350.3466696-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfPrK/8z0e3X+l/ddQJ4kjA1R5FpczTYsLm2hr+KiHf1iYUwgIA0as0hLfN/be5cD75Q0i/BEwdZqV1+6oM3WjbDbgBDARBhXeP3EgUXFzp+vPK5xEiof
 HJau7D0cF/J4/LRgiVGlcYnsY9UrJb5q2qQtr++24gvkGCcMd4pnsNL/LKkQBc97NEUTEq3bXpIuqr1IkcNvUxsbkDACBw+Zfo3uEUCQaS63G6cR4dIF4sqJ
 H3JfT1vYgvkeXPdKhpNnDkfoJ/bKqSNKTEe9IJODj+n2kzWBAMFaJayVhYpsrVe8TTsnAxWf25Xvg5sbdpA31Nh3RRTmBjvJhkPxvJ7cxHJar3AtMXuE2dSP
 iRBY8S7rdEBjg1W1YftH4BLag/Mw9MZpsYldK51m86PTJmqRVLHRohaw+F6XeVY1m9LMf0AZyG2dnAibey8UF6qflQxrwzgZvXH6MufxOydh+N2D1m78pNw3
 oFRu+YUNcOPI+cFKnY1/s3SwiErDWSQVMnAK1drwITGRtbyIYNEO7xY/yF5dLk2vBPiv2+4piKLOJotCSyXYxVOgNyAviehyP/HAjzj68Adg4CQFvrSJsKdS
 mxtsh056FAHIPdTFMwaa/VaxIpYRFnNhvhXamlkQ6CAb/AXQzQT2PxXWlCOUWoYhKy3LirFCe7wMSvL7JQz33aTJ
Subject: [Buildroot] [PATCH v2 09/16] board/pine64/rockpro64/genimage:
 convert partition-type-uuid to single letter notation
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Gerome Burlats <gerome.burlats@smile.fr>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Note that rootfs doesn't need partition-type-uuid = L since L(rootfs) is
the default value. So let's remove it.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/pine64/rockpro64/genimage.cfg | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/board/pine64/rockpro64/genimage.cfg b/board/pine64/rockpro64/genimage.cfg
index d3926f2df6..978a77de95 100644
--- a/board/pine64/rockpro64/genimage.cfg
+++ b/board/pine64/rockpro64/genimage.cfg
@@ -26,14 +26,13 @@ image sdcard.img {
 	}
 
 	partition boot {
-		partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
+		partition-type-uuid = F
 		bootable = "true"
 		image = "boot.vfat"
 		offset = 16M
 	}
 
 	partition rootfs {
-		partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
 		image = "rootfs.ext4"
 	}
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
