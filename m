Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AB2CDB46A
	for <buildroot@archiver.kernel.org>; Wed, 11 Oct 2023 17:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD1C181801;
	Wed, 11 Oct 2023 17:00:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD1C181801
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JUuIZj3TY1cN; Wed, 11 Oct 2023 17:00:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1223A817ED;
	Wed, 11 Oct 2023 17:00:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1223A817ED
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 46BFA1BF420
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 17:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 200CC40280
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 17:00:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 200CC40280
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yuWt2-_vbB_Z for <buildroot@lists.busybox.net>;
 Wed, 11 Oct 2023 17:00:44 +0000 (UTC)
X-Greylist: delayed 2153 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 11 Oct 2023 17:00:42 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0094A4016C
Received: from linux1801mail.webawere.nl (linux1801mail.webawere.nl
 [185.158.164.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0094A4016C
 for <buildroot@buildroot.org>; Wed, 11 Oct 2023 17:00:42 +0000 (UTC)
Received: from [185.47.134.76] (helo=bram-MS-7D25.bybram.com)
 by linux1801.webawere.nl with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96.1-7-g79877b70e)
 (envelope-from <dev@bybram.com>) id 1qqc1T-003HAD-1A;
 Wed, 11 Oct 2023 18:25:23 +0200
From: Bram Oosterhuis <dev@bybram.com>
To: buildroot@buildroot.org
Date: Wed, 11 Oct 2023 18:24:30 +0200
Message-Id: <20231011162430.3484150-2-dev@bybram.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011162430.3484150-1-dev@bybram.com>
References: <20231011162430.3484150-1-dev@bybram.com>
MIME-Version: 1.0
X-Authenticated-Id: dev@bybram.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=bybram.com; 
 s=x; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VZslvWxuhBv/4O3qu0dDoiMaBz8pNRj93+ZwMXuzAlE=; b=CLLCAxReNiRi/PxIPtWq0PyEQP
 PqVjpkAa0zeAnXD+Uqmp2zlujYZu7CRa714SLHvDgzGrjfi5Jpz7DI0nGbq2gf3iXfhqCY3ZAz5HZ
 NJ0hDStkOG48YC20N6eWV6n2r3/4AW12dttk4mRkaR7mgWkkKvpKByuPb+wVOQzPOgJ32gCLisTih
 T6XKMTbXe7mnKoOlhhsQtsBXS0+4mQTxDaFCX0CsTH32Plv/3WfxjlGtf2E+/R/tePdw6f+r8PWHw
 GTwozKLTAf+ZE7cZe11XCWRi9suyeDDNvtWod++jOHVjxxxoA1GAKjnD4blMRyR03/M5+2ryvhdkv
 fpvlmN9A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bybram.com header.i=@bybram.com
 header.a=rsa-sha256 header.s=x header.b=CLLCAxRe
Subject: [Buildroot] [PATCH 2/2] package/rpi-firmware: bump version to
 a3b20e7
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
Cc: Bram Oosterhuis <dev@bybram.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Version a3b20e7 will match the with kernel 6.1.55-v7

Signed-off-by: Bram Oosterhuis <dev@bybram.com>
---
 package/rpi-firmware/rpi-firmware.hash | 2 +-
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index ec13115f3b..25de5cfb83 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  33aea2cb9c3be94c3dd6a96fbb3443eee5af1dc5fc9140e1fadc50832983064e  rpi-firmware-3f20b832b27cd730deb6419b570f31a98167eef6.tar.gz
+sha256  4c39f37f772a0bdcbd11aa882b9069eb09077f3f25d5811d817ca808a49a940a  rpi-firmware-a3b20e7dd41aa174ae50b872c8c9c66beafd63e2.tar.gz
 sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b  boot/LICENCE.broadcom
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 53d6d8ca06..429bbb036e 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 3f20b832b27cd730deb6419b570f31a98167eef6
+RPI_FIRMWARE_VERSION = a3b20e7dd41aa174ae50b872c8c9c66beafd63e2
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
