Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C50C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 20:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BD2B40AA8;
	Fri, 22 Jul 2022 20:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BD2B40AA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OJpyHHcJWXd5; Fri, 22 Jul 2022 20:23:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60EEC40AA2;
	Fri, 22 Jul 2022 20:23:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60EEC40AA2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E53E1BF3DE
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 20:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29DF240AA8
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 20:22:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29DF240AA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id crvEEo6lZQJ7 for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 20:22:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BAEC40AA1
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4BAEC40AA1
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 20:22:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 59D21240002;
 Fri, 22 Jul 2022 20:22:05 +0000 (UTC)
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Buildroot List <buildroot@buildroot.org>
Date: Fri, 22 Jul 2022 22:21:49 +0200
Message-Id: <20220722202151.76235-8-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220722202151.76235-1-thomas.petazzoni@bootlin.com>
References: <20220722202151.76235-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658521325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FjCyn8BMfveNfr6oFgDi2nUKofNwURKLOG6/XMxSSQ4=;
 b=BriS2Nkt6jnUvSCmFqxaTfAJBggTEL4ybfYFwWDeSC85bC2cPlrieplzYuFMFzOhy6ZUXp
 i2IHerOdxBbjBe9YChcv+Ugy+VMDzYzbtOYlzpMWPy/aYgujiUiHZSd4s3gozHI5mh4D41
 GnFkWgEw/9vqTbeC4Zfuip5V/0MIC00m3/GFSQb1PGKl4YxYrooTbjKjDz1uLPvGmu8ox3
 Ch/UDET8xUmvv//iWGX9d+Bi8GQiouG0NbcF6YJHzC6S8lyGyeAXAVAIZXZFQImxdrGexR
 /oOTiFG3TKy+lXSe4nzSJ0Rl/xw5VhYDq2aOIsHspDPDMcWrlx477/BjnEMLaA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BriS2Nkt
Subject: [Buildroot] [PATCH 7/8] board/sifive/hifive-unleashed/genimage*:
 convert partition-type-uuid values to lower-case
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Alistair Francis <alistair@alistair23.me>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This allows to match the recently written rules for
partition-type-uuid values.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/sifive/hifive-unleashed/genimage_sdcard.cfg  | 6 +++---
 board/sifive/hifive-unleashed/genimage_spi-nor.cfg | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/sifive/hifive-unleashed/genimage_sdcard.cfg b/board/sifive/hifive-unleashed/genimage_sdcard.cfg
index e66f221d73..079ac5ed26 100644
--- a/board/sifive/hifive-unleashed/genimage_sdcard.cfg
+++ b/board/sifive/hifive-unleashed/genimage_sdcard.cfg
@@ -6,18 +6,18 @@ image sdcard.img {
 	partition u-boot-spl {
 		image = "u-boot-spl.bin"
 		offset = 17K
-		partition-type-uuid = 5B193300-FC78-40CD-8002-E86C45580B47
+		partition-type-uuid = 5b193300-fc78-40cd-8002-e86c45580b47
 	}
 
 	partition u-boot {
 		image = "u-boot.itb"
 		offset = 1041K
-		partition-type-uuid = 2E54B353-1271-4842-806F-E436D6AF6985
+		partition-type-uuid = 2e54b353-1271-4842-806f-e436d6af6985
 	}
 
 	partition rootfs {
 		image = "rootfs.ext4"
-		partition-type-uuid = 0FC63DAF-8483-4772-8E79-3D69D8477DE4
+		partition-type-uuid = 0fc63daf-8483-4772-8e79-3d69d8477de4
 		bootable = true
 	}
 }
diff --git a/board/sifive/hifive-unleashed/genimage_spi-nor.cfg b/board/sifive/hifive-unleashed/genimage_spi-nor.cfg
index 903e675a90..14b7bb1e1c 100644
--- a/board/sifive/hifive-unleashed/genimage_spi-nor.cfg
+++ b/board/sifive/hifive-unleashed/genimage_spi-nor.cfg
@@ -8,12 +8,12 @@ image spi-nor.img {
 	partition u-boot-spl {
 		image = "u-boot-spl.bin"
 		offset = 20K
-		partition-type-uuid = 5B193300-FC78-40CD-8002-E86C45580B47
+		partition-type-uuid = 5b193300-fc78-40cd-8002-e86c45580b47
 	}
 
 	partition u-boot {
 		image = "u-boot.itb"
 		offset = 1044K
-		partition-type-uuid = 2E54B353-1271-4842-806F-E436D6AF6985
+		partition-type-uuid = 2e54b353-1271-4842-806f-e436d6af6985
 	}
 }
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
