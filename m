Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A796C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 20:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B0058499C;
	Fri, 22 Jul 2022 20:23:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B0058499C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xJSDJWEMppeq; Fri, 22 Jul 2022 20:23:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CBC18498D;
	Fri, 22 Jul 2022 20:23:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CBC18498D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 035011BF3DE
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 20:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFD4040AA8
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 20:22:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFD4040AA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eAEsu1S79Zgt for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 20:22:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E04140A8A
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E04140A8A
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 20:22:05 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 66476240003;
 Fri, 22 Jul 2022 20:22:03 +0000 (UTC)
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Buildroot List <buildroot@buildroot.org>
Date: Fri, 22 Jul 2022 22:21:48 +0200
Message-Id: <20220722202151.76235-7-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220722202151.76235-1-thomas.petazzoni@bootlin.com>
References: <20220722202151.76235-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658521324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EmHI3SYbEo0F5XUhWwLkz1dO1D8N2DGnJnKlFpIF9C0=;
 b=fSj90wv3YHZc3ZHEQ7HxdwmeXKDdqiEgD5ltPkjnkt8bCoT5AoRwo/h7bBb25Qq9yq4ZlU
 oo1pzi6Co48pOBiceYxKqXqAF8eK4BJhpHxdtEKiK8rzwDcplNfzQtYudsa+dujisMEgH4
 Cttkbt5TJyZDixZBqQA/2BOma71q7q5b2DpufXL+STcbvyDU7oRpUuUTByJTzroJwO5m2R
 1zTdnCCLMNW219+QnNHDzKFlGv3Cv+mCMb7llPaSB2tklPjJpebCSRqmCEo7d4OcxTCqT+
 lf/iO5IF/5L48CC7MMw3S+NEJfn3CFuxBpVCiGwwsQtuG5NU2xbWM22sjFVTmw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fSj90wv3
Subject: [Buildroot] [PATCH 6/8] board/*/genimage.cfg: use
 partition-type-uuid U where relevant
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit changes to use partition-type-uuid = U instead of
c12a7328-f81f-11d2-ba4b-00a0c93ec93b where relevant for the EFI System
Partition.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/aarch64-efi/genimage-efi.cfg   | 2 +-
 board/pc/genimage-efi.cfg            | 2 +-
 board/qemu/aarch64-sbsa/genimage.cfg | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/aarch64-efi/genimage-efi.cfg b/board/aarch64-efi/genimage-efi.cfg
index 87e85816bc..158deab87d 100644
--- a/board/aarch64-efi/genimage-efi.cfg
+++ b/board/aarch64-efi/genimage-efi.cfg
@@ -18,7 +18,7 @@ image disk.img {
 
 	partition boot {
 		image = "efi-part.vfat"
-		partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
+		partition-type-uuid = U
 		offset = 32K
 		bootable = true
 	}
diff --git a/board/pc/genimage-efi.cfg b/board/pc/genimage-efi.cfg
index 035a077a78..c231e1b9b2 100644
--- a/board/pc/genimage-efi.cfg
+++ b/board/pc/genimage-efi.cfg
@@ -19,7 +19,7 @@ image disk.img {
 
 	partition boot {
 		image = "efi-part.vfat"
-		partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
+		partition-type-uuid = U
 		offset = 32K
 		bootable = true
 	}
diff --git a/board/qemu/aarch64-sbsa/genimage.cfg b/board/qemu/aarch64-sbsa/genimage.cfg
index bdf8a89d75..e7ac7f2ee1 100644
--- a/board/qemu/aarch64-sbsa/genimage.cfg
+++ b/board/qemu/aarch64-sbsa/genimage.cfg
@@ -19,7 +19,7 @@ image disk.img {
 
 	partition boot {
 		image = "efi-part.vfat"
-		partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
+		partition-type-uuid = U
 		offset = 32K
 		bootable = true
 	}
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
