Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51419C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 22:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0473D40469;
	Sun, 13 Feb 2022 22:57:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xIrmXtwgAJ4q; Sun, 13 Feb 2022 22:57:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA0CA4046A;
	Sun, 13 Feb 2022 22:57:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 868BD1BF834
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 22:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFC8C40424
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 22:53:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Oz89HU5IuIl for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 22:53:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb150.aruba.it (smtpweb150.aruba.it [62.149.158.150])
 by smtp2.osuosl.org (Postfix) with ESMTP id D45AE403FD
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 22:53:58 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JNkdniVFUXmFAJNkjnv80l; Sun, 13 Feb 2022 23:53:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644792837; bh=i9HPmpX18WPd9yVDSNqzuS/sWJam5Mlp6UVoubfZQrw=;
 h=From:To:Subject:Date:MIME-Version;
 b=YITqI4E+FrrBnJhI6haD2qOh7pTSZG/0apDRzUrg760QEWV64xd2Sf+fEqw44YZ0r
 l2aXbrv4gVWF5vZPFpAJerpWGssPyZXF4cs1AC3T+ez/vfn0drx9WJGnMIZQvcytOb
 PPXKJP60skmZFgRIywjAOIFq2KJIgCRazY09tK5Qdbia5Y3bW80ppT2BURbYP359tE
 esOoPvaOZw3YaCx61dbHinCQGlu56L7Ggv9s+Gk7mLvli0pBpHiXAg3sfiquG6ZXQ6
 1cGg7Xev8i6yXj2BcyUWrSdLri0fnIvPXYbesS0vnTMYe5LkqmbKBiVsnTs5dgB0zA
 fehX2cz+BDyNA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 23:53:44 +0100
Message-Id: <20220213225350.3466696-11-giulio.benetti@benettiengineering.com>
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
Subject: [Buildroot] [PATCH v2 10/16] board/qemu/aarch64-sbsa/genimage:
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
 board/qemu/aarch64-sbsa/genimage.cfg | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/board/qemu/aarch64-sbsa/genimage.cfg b/board/qemu/aarch64-sbsa/genimage.cfg
index bdf8a89d75..8308b58789 100644
--- a/board/qemu/aarch64-sbsa/genimage.cfg
+++ b/board/qemu/aarch64-sbsa/genimage.cfg
@@ -19,13 +19,12 @@ image disk.img {
 
 	partition boot {
 		image = "efi-part.vfat"
-		partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
+		partition-type-uuid = U
 		offset = 32K
 		bootable = true
 	}
 
 	partition root {
-		partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
 		image = "rootfs.ext2"
 	}
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
