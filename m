Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B43C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 22:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B4D182211;
	Sat,  4 Nov 2023 22:02:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B4D182211
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DRG5O1AbsqBE; Sat,  4 Nov 2023 22:02:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EDE582148;
	Sat,  4 Nov 2023 22:02:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EDE582148
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 66FF81BF5A7
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 22:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FF1C60D64
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 22:02:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FF1C60D64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KZEbn2dgBXdC for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 22:02:00 +0000 (UTC)
Received: from linux1801mail.webawere.nl (linux1801mail.webawere.nl
 [185.158.164.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B07A60C17
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 22:02:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B07A60C17
Received: from [185.47.134.76] (helo=bram-MS-7D25.bybram.com)
 by linux1801.webawere.nl with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96.2-12-g29d01ae2a)
 (envelope-from <dev@bybram.com>) id 1qzOiM-00DTJS-1A;
 Sat, 04 Nov 2023 23:01:58 +0100
From: Bram Oosterhuis <dev@bybram.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 23:01:52 +0100
Message-Id: <20231104220152.3252635-2-dev@bybram.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231104220152.3252635-1-dev@bybram.com>
References: <20231104220152.3252635-1-dev@bybram.com>
MIME-Version: 1.0
X-Authenticated-Id: dev@bybram.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=bybram.com; 
 s=x; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TScpRVQo6LBYPsqwqKwnK4ZY0tAaB12SYgqZKVJ5PJI=; b=uVd3FSoyDjnJlxD3HPQB4Cii6D
 zn1kC0Pg0L0atDIUIL7/IHp+kk3cXh0qGLok7GBiy2iiWQ+u2E/zZl7s25aTk+8f7qmyG/AajKhdY
 vKeTTKntaNCcBz5Nt3D5HaE02Zb+6IPtMqnihxAIgbioo2rr2JqDFcnUhXnxHFBuY/4HPYcxvqYKA
 d20nnasYe0deQwr7HaFTcnbKMPVa8OTdQ7NcyFjFBFuFowuPheTDc2N346SDsk0fzc4hcUzFYdFu0
 21rayTGwcEsntGASckFCCTfqXiVGlnCo8cx8C6c2DsvjuXCJvjImfngIJuch2D9VNUIl5fUbAAcqU
 /EfuR/mw==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bybram.com header.i=@bybram.com
 header.a=rsa-sha256 header.s=x header.b=uVd3FSoy
Subject: [Buildroot] [PATCH 2/2] package/rpi-firmware: bump version to
 83dafbc
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
Cc: Bram Oosterhuis <dev@bybram.com>, Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Version 83dafbc will match the with kernel 6.1.61

Signed-off-by: Bram Oosterhuis <dev@bybram.com>
---
 package/rpi-firmware/rpi-firmware.hash | 2 +-
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index ec13115f3b..33e05a2f4a 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  33aea2cb9c3be94c3dd6a96fbb3443eee5af1dc5fc9140e1fadc50832983064e  rpi-firmware-3f20b832b27cd730deb6419b570f31a98167eef6.tar.gz
+sha256  dd43e77ca1a8969cdb7f05dd72a57f90862071d5a93bdd6aea8246aba85689cf  rpi-firmware-83dafbc92c0e63f76ca2ecdd42462d56489d1c77.tar.gz
 sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b  boot/LICENCE.broadcom
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 53d6d8ca06..37e010d1de 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 3f20b832b27cd730deb6419b570f31a98167eef6
+RPI_FIRMWARE_VERSION = 83dafbc92c0e63f76ca2ecdd42462d56489d1c77
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
