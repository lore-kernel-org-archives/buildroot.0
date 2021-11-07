Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD42C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:42:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38B7461242
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:42:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 38B7461242
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C2DF4015B;
	Sun,  7 Nov 2021 02:42:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zVi9Vbehoi5p; Sun,  7 Nov 2021 02:42:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B36640106;
	Sun,  7 Nov 2021 02:42:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2A48F1BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A2DA60620
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:42:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yXhuMKY2UtUc for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:42:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53A77605F5
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:42:53 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY8ymuoy4Ff01jY8ymqU54; Sun, 07 Nov 2021 03:42:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636252973; bh=HQjpOq/K8KNG3KOuf8k9HkiI+nfy7YBuamwpiue1syc=;
 h=From:To:Subject:Date:MIME-Version;
 b=LlUWhrrt8Ca7RYxkLC/XoKAxAHpyDwvm/S7UiKxXFjsykdokx+Kh0KNhIpxuH+I5L
 h0d/QL7faI0vwh1xF1dS3o7sEy0kCnspcfwk4X1GaC5ibi8fGiXavZO4RwD0eZNBcE
 xKN9NiO0ae1LX5WOC/TyvN6HK8mW+Os/sJ3duA6368d5IZ57EDwUPgU2oC4t/Dt3l+
 2MpXiMxgFks9Si5gMAlQ5Ea+TtVOmB1Gr3Gv92ZH2q4ztrP4DWIaiZ3Hnfi//U59gH
 KzLTrXXmALpeabomoda8qJsHK20vPKuNq2D2XD+IL/XnLBXm4Qy6GVPwcyQPVrG2Af
 yQ+RYkyEGVsyA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:42:42 +0100
Message-Id: <20211107024250.3061287-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfM+agURgG+R6v1a9j8BWMmJCJFBbi0XPmkhgqrTnVzWrE9LnipmSQPsSoHl5+plVlnRN92Nia+DtyKenNuRtVrg2nOLmPO06OxnQelSGOk4hvNCkyU/j
 YhIwO0ucJYlZksktb3ntAMSBUz0g7pJwuVIqwKKdrdHDjTQoLeEUv63IvRu8ufsSnKGE42Nj2VoacAVwAlhDW6WtadSl6k3vOVFCrA9eiHxJgFuNWJTdNQcg
 xUrykiRsgE5Vy/XXHuGzI8N4hW0OevJr0pm4jjzSNnw=
Subject: [Buildroot] [PATCH 051/102]
 board/olimex/a13_olinuxino/genimage.cfg: beautify file
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
 board/olimex/a13_olinuxino/genimage.cfg | 32 ++++++++++++-------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/board/olimex/a13_olinuxino/genimage.cfg b/board/olimex/a13_olinuxino/genimage.cfg
index 6f6b0b0bab..4eb14eb520 100644
--- a/board/olimex/a13_olinuxino/genimage.cfg
+++ b/board/olimex/a13_olinuxino/genimage.cfg
@@ -1,12 +1,13 @@
 image boot.vfat {
-        vfat {
-                files = {
-                        "zImage",
-                        "sun5i-a13-olinuxino.dtb",
-                        "boot.scr"
-                }
-        }
-        size = 64M
+	vfat {
+		files = {
+			"zImage",
+			"sun5i-a13-olinuxino.dtb",
+			"boot.scr"
+		}
+	}
+
+	size = 64M
 }
 
 image sdcard.img {
@@ -16,16 +17,15 @@ image sdcard.img {
 	partition u-boot {
 		in-partition-table = "no"
 		image = "u-boot-sunxi-with-spl.bin"
-		offset = 8192
-		size = 1040384 # 1MB - 8192
+		offset = 8K
+		size = 1016K # 1MB - 8KB
 	}
 
-        partition boot {
-                partition-type = 0xC
-                bootable = "true"
-                image = "boot.vfat"
-        }
-
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
 
 	partition rootfs {
 		partition-type = 0x83
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
