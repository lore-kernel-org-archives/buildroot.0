Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F7E3C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:44:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40E5761881
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:44:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 40E5761881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A978401FF;
	Sun,  7 Nov 2021 02:44:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id opvhYxVETWK5; Sun,  7 Nov 2021 02:44:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65366402B3;
	Sun,  7 Nov 2021 02:44:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BB3C41BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B651E605F5
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:43:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0V0R3C5vCo29 for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:43:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFD5160666
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:42:59 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY8ymuoy4Ff01jY95mqU6R; Sun, 07 Nov 2021 03:42:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636252979; bh=6nelXwgxlXU1sSfv5ypBO/kaPtQCi5QH+7ZYnxLjbfU=;
 h=From:To:Subject:Date:MIME-Version;
 b=V1L5IJJxCKpGDz5iUfyjbTg1517170sTwuWk6tYCO9AMmc/jKkB5mHeLA/RxUBus3
 b0vdfk3XoWiH+UslvnPy7qvieanKq4wctaue5PF/Fpbar8WN+ZrhvjBAtgMU+Cb6jf
 DrfM3uBJDQpmAWvCgZlwA9Gt4FuV4q5RS07k5zddk4ekn4jJ0WPPFzI73BLx1HEO+O
 tJK6Adrnxu4ZAbIgThgkPKOQsadsLQvqW2o8pPt+bAOwfnYx9wcePeHQZYU9sY8Hv8
 bGXpB3/aqYaQ+z1YdyZ1yc/zDCY1F2ocFN41Ut9+Eir7/hc3bRSpFKuTghpYcp2kC+
 AgFsKHI2UOZkg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:42:48 +0100
Message-Id: <20211107024250.3061287-7-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024250.3061287-1-giulio.benetti@benettiengineering.com>
References: <20211107024250.3061287-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfJeyzCjL9fm+H1xku80OsvB9PpvQrIv2vx0wiqzHEJTbYJOkl78vZFiqRQh1zCOWEB/HFahWKtcKwWzLi4oA0jUXJytPdNF57jonm00wqRUarNU9XqHl
 Sh0041VrY1WLaSrf+V4yOqiF84V0cS/xUVPNiHdPI59VH8gwPikoUW8AMlxxt9HgSgEQC/npH2cnxVpk//OLYDUN2a5sOmq0L6HAgy0z0Z4l3QNgep29TatP
 lzvgbUcFBIvZ/8OYwgaZm8PLlzT6qGTZeeZFr/FEv8w=
Subject: [Buildroot] [PATCH 057/102]
 board/orangepi/orangepi-one-plus/genimage.cfg: beautify file
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
 board/orangepi/orangepi-one-plus/genimage.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/orangepi/orangepi-one-plus/genimage.cfg b/board/orangepi/orangepi-one-plus/genimage.cfg
index ebb07e8b26..80b83b0215 100644
--- a/board/orangepi/orangepi-one-plus/genimage.cfg
+++ b/board/orangepi/orangepi-one-plus/genimage.cfg
@@ -6,6 +6,7 @@ image boot.vfat {
 			"extlinux"
 		}
 	}
+
 	size = 64M
 }
 
@@ -16,8 +17,8 @@ image sdcard.img {
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
