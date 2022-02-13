Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD690C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 22:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 822154043A;
	Sun, 13 Feb 2022 22:57:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4jH110hyXPUk; Sun, 13 Feb 2022 22:57:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA59D403EC;
	Sun, 13 Feb 2022 22:57:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B4DE1BF834
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 22:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 735014040D
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 22:54:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Aa0F0dxPn-V for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 22:53:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb150.aruba.it (smtpweb150.aruba.it [62.149.158.150])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C4DA400F3
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 22:53:59 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JNkdniVFUXmFAJNkknv81j; Sun, 13 Feb 2022 23:53:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644792839; bh=2xg4cIw4r80b5mRtK3nODlKeHkeXg/Ae6Zx6TKavYtQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=Sx7GNevU72O2pkrWTizV5lSXPw6gjh01SRUQWkreSsz0XXJ9NOmpj1hXYSj1FmngX
 xdTIKlOeNdstHJJWtSlxFqsYbCWoTJuwjzoSBniPhHxlxqOd9L95N4xE6nxiFXBjO9
 kBhxU0xAMuiI0eshtyd8ptUk7tpOHxiRmVosI+6jH9GiWkXhP6HC2AQB7fukX0WhsN
 wmiUoHgkqRWEPoHKeooUT9dFi4fMy44ueMXgIRmCyCv53Jmqs2ji0KXXvyBE+LYNj4
 U5KszCkYat48TP6T3JgxSnve1vPyO6n28QT4eRZV8LUiGFhVK29BBzgNajOvTEt1ao
 7NZjfa1CADPLg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 23:53:47 +0100
Message-Id: <20220213225350.3466696-14-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220213225350.3466696-1-giulio.benetti@benettiengineering.com>
References: <49133c66-0a53-7607-1c52-5e1ad9e8fc7b@benettiengineering.com>
 <20220213225350.3466696-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfGfw2X25ponAN8OATEdxEgV0gcrAHhshqNz0uLJz53bNy26xcqr5uV3VBhE1KTOgKsk53pa+WVF06qDwRUVdkfahveuBjTou9ztKTbyk32RPbXzbCkrr
 K9Hh92qEJenLxQc6ADNgP07YgnGeOsmysJd6o463TwwgnBtCzOa1rtIPCDkPwrRk4FbrQXXU5BjycuWJKPjMg0IJvvu+Dcgjpw9z9iQyEcvz5VL4HbdAsP9q
 5Bzk2pDQytnQOMKx9o48/Aa4r9Mg6iW0zgWIKlqAgdDYFFsvCIVSZpXKfkqKTRsGTBP6zaBHiB+NE+xrnTP8J53S+I6QvLLIzT67giAsimBUhVP3uvdtG6HG
 2ZCQfX38UB37F57xRDAGAvmsSkkQup+lRkrzfCJrzuIeKqEfzaQvNeGeek+98qayuplic+jZdxD//7mrGp9O2mFj/ipilGwu+//Fu+dTaTmoO1uFqQZ7ep2i
 a1vUZK9IWuxDzwCqPYWQ9sFdGOpeX/lVi8u5oCUB8xqsTNSST+g8VROzVhPQjhxHV02fTJeTDiy4s+Dh39NXrQi+GoO6dDRniMiL04MiR0HzYYig0Win8jfA
 wuJZSwkUJBoSnOj1gKykrkQYITPD/8alsFjZierPkvTiBrAkF9BUPE7IlMwTIcs7AVir5GW06Htn5mjOcYw38w/G
Subject: [Buildroot] [PATCH v2 13/16] board/radxa/rockpi-n8/genimage:
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
