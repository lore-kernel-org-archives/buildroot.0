Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F5D7C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:47:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 234EA61884
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:47:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 234EA61884
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE25B60620;
	Sun,  7 Nov 2021 02:47:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z1EFeErIEVQC; Sun,  7 Nov 2021 02:47:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33ED06072D;
	Sun,  7 Nov 2021 02:47:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 280CE1BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 170FA4022F
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:43:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8QDyWLifo4Zr for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:43:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2487F400DB
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:43:41 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljY9lmR7Hj; Sun, 07 Nov 2021 03:43:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253021; bh=G+1tjA7TgeOzurwmZY2gZUHjyLZBB0F9UJcmsQN5++Q=;
 h=From:To:Subject:Date:MIME-Version;
 b=lCUEGfHVZgKt86fT6EP1iqx09T0x8ILN5N2E8Qtm3EJcubQT7EuNSN1dzn/U8sAut
 AI+/n8UlmW6yKvmfQArsLUBPEx+duCujX8rFKCsb6v4AATIUi7JJD54+vpTq5pCTn5
 wwsE5KgiEd52wBDELBG8bHHv3wgExBtcYqCtO2ruUzy3C46KMsul0tTtHE5EKh3ww8
 i2pRjgJOPwRf6oyOnUweEppFWQN8vFI/3YUwNsF8GEOuyD1vIsQzbohw/51Hv5Vbpg
 aUUEq7wA5SYoys5YWMvsNN/P/zcl5Yeh288uLCu5qQ0oVyKH/7qAN2fXajZcsYDYRt
 emcHl7XloTbuQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:43:00 +0100
Message-Id: <20211107024330.3061378-13-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfAhZmrgajndCYP8aj2W+mEamPV94TeQXfMvHPrHOGq/h0c9suGwkNr06/mWLaO2z5YUD493E1a6SKtQhyfqNElOAaM6srmVNnkU7Xb6lyTlvh+OS70nK
 OvYRAUcy5U1+10MhcBGjuexVTyKi07jwxFsNuWYi7v8Qblc4rLMoU4CiXIhQCYUk79MNXEL211oa/QagNM8ja2q0YMjP6+gs6Or/qyoMD2tWti3QVborjO95
 TfxsQa8WC9hYY/lFr476WI46t4jgQg4JDEyjYjiHzgY=
Subject: [Buildroot] [PATCH 072/102] board/pc/genimage-efi.cfg: beautify file
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
 board/pc/genimage-efi.cfg | 49 ++++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 24 deletions(-)

diff --git a/board/pc/genimage-efi.cfg b/board/pc/genimage-efi.cfg
index 34befb7d69..9cf701b798 100644
--- a/board/pc/genimage-efi.cfg
+++ b/board/pc/genimage-efi.cfg
@@ -1,31 +1,32 @@
 image efi-part.vfat {
-  vfat {
-    file EFI {
-      image = "efi-part/EFI"
-    }
-    file bzImage {
-      image = "bzImage"
-    }
-  }
-  # 16MB - 32KB
-  size = 16744448
+	vfat {
+		file EFI {
+			image = "efi-part/EFI"
+		}
+
+		file bzImage {
+			image = "bzImage"
+		}
+	}
+
+	size = 16352K # 16MB - 32KB
 }
 
 image disk.img {
-  hdimage {
-    gpt = true
-  }
+	hdimage {
+		gpt = true
+	}
 
-  partition boot {
-    image = "efi-part.vfat"
-    partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
-    offset = 32768
-    bootable = true
-  }
+	partition boot {
+		image = "efi-part.vfat"
+		partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
+		offset = 32K
+		bootable = true
+	}
 
-  partition root {
-    partition-type-uuid = 44479540-f297-41b2-9af7-d131d5f0458a
-    partition-uuid = UUID_TMP
-    image = "rootfs.ext2"
-  }
+	partition root {
+		partition-type-uuid = 44479540-f297-41b2-9af7-d131d5f0458a
+		partition-uuid = UUID_TMP
+		image = "rootfs.ext2"
+	}
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
