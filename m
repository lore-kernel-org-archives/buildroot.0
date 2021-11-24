Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D17C433FE
	for <buildroot@archiver.kernel.org>; Wed, 24 Nov 2021 13:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6818060C30;
	Wed, 24 Nov 2021 13:23:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HWsmwd3bdRxK; Wed, 24 Nov 2021 13:23:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFB2F6069A;
	Wed, 24 Nov 2021 13:23:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 287B51BF414
 for <buildroot@lists.busybox.net>; Wed, 24 Nov 2021 13:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1891580C84
 for <buildroot@lists.busybox.net>; Wed, 24 Nov 2021 13:23:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=microchip.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1UX0Iwp8NkqA for <buildroot@lists.busybox.net>;
 Wed, 24 Nov 2021 13:23:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB2BC80C7E
 for <buildroot@buildroot.org>; Wed, 24 Nov 2021 13:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1637760220; x=1669296220;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ktWZ/Ey3WM3wrRlWiAWSjJ+YLBFtzlLBUhvHWssu95s=;
 b=1imD6ZdqIJqVO4G5SUkDifXsls8Zrztyu9fVVn2HZExuWQh0xVpdTSma
 Pw2WQWhL1MZWm7HlBiSugOhyV8IMXTbCeJN3UwWv0leATGY85I3vviemU
 xf8u0veJdvewmjgaEhB18g2gKXrQti3x8GBA8jubvxlfAAqQBSLjIhxGp
 yRKTHdzSgfnA5toAGaC2A0Ioa31W532oLGiZ3Kdno+6Z5EP1o+js8D1GW
 ToSBA5W7tFuMHlqKHStj/mIi0xLgvw4DT28bAwTrPZFcY2AMN6oalse14
 B814NDwAP8fMghta8ZR5y9jCeda4X3STTsGqW8ODDkdjep6YOBBMWnKFf A==;
IronPort-SDR: 3J6iC5fGQ/5MtQoBlpOIZypRnSehBs7wD++AU0Gr56QNek+/OFNqa5+bfAyoUKnecESrAsX3tY
 Yy2CTzhlojxfUMZjFs7mocO6vZWrdwXtdNzbnGrNHQ7skLTtFo2b7ecKazFQlSOUZarYbyeS3P
 CdMsk5vk3631e8qAaPeF/oXKx6g221rze5jnzGMIonetK6jOoKZS6FiUn0bkNZQ8VNoJNf+c4M
 xrz0S1pRjdFudACukO65eEbarBeGwNBY0ANDZ+jeGMY+AsXoCrUj/50aaxZwGHEcUq83G4Ucv0
 PMQXnBcFzPxkQw08Ux4aZMGH
X-IronPort-AV: E=Sophos;i="5.87,260,1631602800"; d="scan'208";a="144422282"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 24 Nov 2021 06:23:40 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 24 Nov 2021 06:23:38 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 24 Nov 2021 06:23:24 -0700
To: <buildroot@buildroot.org>
Date: Wed, 24 Nov 2021 15:23:11 +0200
Message-ID: <20211124132311.636558-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/fswebcam: bump to release 20200725
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
From: Eugen Hristev via buildroot <buildroot@buildroot.org>
Reply-To: Eugen Hristev <eugen.hristev@microchip.com>
Cc: Eugen Hristev <eugen.hristev@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump to latest release.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 package/fswebcam/fswebcam.hash | 2 +-
 package/fswebcam/fswebcam.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fswebcam/fswebcam.hash b/package/fswebcam/fswebcam.hash
index bac1626785..6ecb0d9794 100644
--- a/package/fswebcam/fswebcam.hash
+++ b/package/fswebcam/fswebcam.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5702771cee6e3fa0f2bbbb72ecf3e5a253ff458c1f648f7e7c0d477e39f0ec80  fswebcam-e9f8094b6a3d1a49f99b2abec4e6ab4df33e2e33.tar.gz
+sha256  d5439b2bf49bb634100d7e42ed9854f84bfd355c1d40bc3d4d81593eeadd8aee  fswebcam-20200725.tar.gz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/fswebcam/fswebcam.mk b/package/fswebcam/fswebcam.mk
index 3a5b8c9eef..12e7860e7b 100644
--- a/package/fswebcam/fswebcam.mk
+++ b/package/fswebcam/fswebcam.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FSWEBCAM_VERSION = e9f8094b6a3d1a49f99b2abec4e6ab4df33e2e33
+FSWEBCAM_VERSION = 20200725
 FSWEBCAM_SITE = $(call github,fsphil,fswebcam,$(FSWEBCAM_VERSION))
 FSWEBCAM_LICENSE = GPL-2.0
 FSWEBCAM_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
