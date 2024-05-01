Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62245C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 15:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31EA540829;
	Wed,  1 May 2024 15:27:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iXFm4bso1Mog; Wed,  1 May 2024 15:27:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 946314082E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 946314082E;
	Wed,  1 May 2024 15:27:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 52FD21BF983
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 15:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 457D440677
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 15:27:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SgnS6wnpHTO5 for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 15:27:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.248;
 helo=lelv0143.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0677240493
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0677240493
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0677240493
 for <buildroot@buildroot.org>; Wed,  1 May 2024 15:27:40 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 441FRdFY112280;
 Wed, 1 May 2024 10:27:39 -0500
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 441FRdPL052910
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 1 May 2024 10:27:39 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 1
 May 2024 10:27:39 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 1 May 2024 10:27:39 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 441FRdx8097751;
 Wed, 1 May 2024 10:27:39 -0500
Date: Wed, 1 May 2024 10:27:27 -0500
MIME-Version: 1.0
Message-ID: <20240430-optee-update-v1-4-6f73c4903ec3@ti.com>
References: <20240430-optee-update-v1-0-6f73c4903ec3@ti.com>
In-Reply-To: <20240430-optee-update-v1-0-6f73c4903ec3@ti.com>
To: Bryan Brattlof <bb@ti.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1989; i=bb@ti.com;
 h=from:subject:message-id; bh=Tf8UEv6x+WLocRqeeDjPAla1stxveCQ0WB4iZBDqeYU=;
 b=owNCWmg5MUFZJlNZOJRebwAAZv/////ffydnurXed13D//qnzuW+f4fsvv/B19l733fw//awA
 RtWaQ9QABoGgGjQGg0aAGjINAAaAyaNMQyGgGjQNAA0aADTQM0gyMNRsoPJ6ocgNNGQGjRiBoGg
 0wQwTTQ0yGRoaABmkGgBoBiBkYQABtQAG0mj1GhoYgyJ6TR5QaPUaaDQAA0AAGgAMjQMQ0APUAA
 DIAZDTT9UA0DIAANDRoNtKGjSNwYom02SyNuoqTCc3fmkFkOMJ3gUvS+tfFhBVcfPCA8OoSpM7S
 qOu1tWqnuY+EJFPnCBqAYFesgEvTIQoXR7ini+BHKF7VPjzFTYrRHzgWhXvZp0e3S8PIDR+cufw
 2z31BZ2wH+h1dyvBxA8jp0h7ahUdeCcgZcqLmycYQyunOmMJGhS0VwHAM+OHihkQRz6O5vSnY2l
 myYxdvw8px+1HUSA1Msbsa1/uH2M+tBDhH5Wyr/oSEFUlKAocT+WXNGUqHwWfDC9L/3Yw2GMl1k
 mjWJfQ28NOsrqHAEzNB5wOoAB+9QRg+n4gTqWTkNMMRkD6CwWrR55n7cF2r8ogfbEzd1uN0LwnA
 g7P9ciBFnJ2YuhH6pW/zUZ4aTx/7k4KUMWgZEthEB39bOKYJEtuKcCWlVo6QduoCwnjCEVUNEEV
 wLb/F3JFOFCQOJRebw=
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1714577259;
 bh=w7rVeoKayR87v5q1al1rODxA5hVPnsCOWcgOlJ5L4dI=;
 h=From:Date:Subject:References:In-Reply-To:To:CC;
 b=eKicYl9j5ZTWAxX/AGwmxvVKFmK0KljvrOYg2EceYW7sJtrgQnmJ2I2pK8IQpv0s8
 LnrsREs7euZTI2jLD4DSoVt8YwvflwjUeM3TvtYSyRuP0dLNKgHLEjZmah24pxRw7i
 vEjWN1IVsXuDvEthEcSBLVMf1BzewfMNmaeo6GZE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=eKicYl9j
Subject: [Buildroot] [PATCH 04/11] boot/ti-k3-boot-firmware: bump to latest
 version
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 Andreas Dannenberg <dannenberg@ti.com>,
 Bryan Brattlof via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Bryan Brattlof via buildroot <buildroot@buildroot.org>

The 09.02.00.009 release of ti-linux-firmware has the latest updates to
TI's TIFS, DM and DMSC firmware needed for the K3 generation of
processors. Update to pull in these latest updates.

Reviewed-by: Heiko Thiery <heiko.thiery@gmail.com>
Tested-by: Andreas Dannenberg <dannenberg@ti.com>
Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash | 2 +-
 boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk   | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
index 95131180ef400..2398d02da258a 100644
--- a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
+++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  ab20ffbe7bba7e94be246b3417d33a914b3f07c16c47ef5a7f7602349a666a61  LICENSE.ti
-sha256  6032a258ce731d987576115f5de44c677a6b0cf8bddcd61a9a2852928bdfff92  ti-linux-firmware-08.06.00.006.tar.xz
+sha256  ae888a0a22f8c5b8fe841236d6e40bb2f821d9a4161dab6924fd989e1467ef0e  ti-linux-firmware-09.02.00.009.tar.xz
diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
index 1f8ade207c13a..9332732ad4a32 100644
--- a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
+++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# The hash 340194800a581baf976360386dfc7b5acab8d948 defined in the
-# Makefile of ti-k3-image-gen corresponds to the tag 08.06.00.006.
-TI_K3_BOOT_FIRMWARE_VERSION = 08.06.00.006
+TI_K3_BOOT_FIRMWARE_VERSION = 09.02.00.009
 TI_K3_BOOT_FIRMWARE_SITE = https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/snapshot
 TI_K3_BOOT_FIRMWARE_SOURCE = ti-linux-firmware-$(TI_K3_BOOT_FIRMWARE_VERSION).tar.xz
 TI_K3_BOOT_FIRMWARE_INSTALL_IMAGES = YES

-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
