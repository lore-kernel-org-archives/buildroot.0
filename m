Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D318FCD11C2
	for <buildroot@archiver.kernel.org>; Fri,  5 Apr 2024 16:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 985CA60BBA;
	Fri,  5 Apr 2024 16:41:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9bnrmSxS9az7; Fri,  5 Apr 2024 16:41:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D1E960F46
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D1E960F46;
	Fri,  5 Apr 2024 16:41:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DFDD31BF346
 for <buildroot@lists.busybox.net>; Fri,  5 Apr 2024 16:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB65341B59
 for <buildroot@lists.busybox.net>; Fri,  5 Apr 2024 16:41:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W-syu1Pi-zr6 for <buildroot@lists.busybox.net>;
 Fri,  5 Apr 2024 16:41:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.141;
 helo=fllv0015.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 84C9441B37
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84C9441B37
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 84C9441B37
 for <buildroot@buildroot.org>; Fri,  5 Apr 2024 16:41:31 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 435GfTd9027920;
 Fri, 5 Apr 2024 11:41:29 -0500
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 435GfTQR013180
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 5 Apr 2024 11:41:29 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 5
 Apr 2024 11:41:29 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 5 Apr 2024 11:41:28 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 435GfSut038737;
 Fri, 5 Apr 2024 11:41:28 -0500
To: Buildroot Mailing List <buildroot@buildroot.org>
Date: Fri, 5 Apr 2024 11:41:01 -0500
Message-ID: <20240405164102.42353-1-bb@ti.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1712335289;
 bh=JimrHpenjQdJ9wNhZt7z5dC/TM0bJ4hL8klsOkULja8=;
 h=From:To:CC:Subject:Date;
 b=m+C3JWzNjxnuxN3N7sIDM6/bOPLkocXd8Tv5cUX3G0Zm0Xs88aaYbbv9v4rNp3ubL
 V2XDhF0mBJLJS+LbaqFOz9OXhrmAFce7YBY4XLpOaH5wg3WBTNeP737HrJNydc46ah
 RFDZpQUtfc5TCQ2d9Bu0+cKLYptelWNkfWrnf8u8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=m+C3JWzN
Subject: [Buildroot] [PATCH] package/arm-gnu-toolcahin: bump version to
 13.2-rel1
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
Cc: Bryan Brattlof <bb@ti.com>, Suniel Mahesh <sunil@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The arm-gnu-toolchain is used by TI's K3 generation of devices to
compile the first stage bootloader (tiboot3.bin) which will run on the
32bit R5 MCU.

The 10.3-2021.10 version of this toolchain is no longer publicized as
being downloadable (and it's fairly old) on ARM's website. Let's upgrade
to the latest version of the toolchain ARM (13.2-rel1)

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 package/arm-gnu-toolchain/arm-gnu-toolchain.hash | 4 ++--
 package/arm-gnu-toolchain/arm-gnu-toolchain.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/arm-gnu-toolchain/arm-gnu-toolchain.hash b/package/arm-gnu-toolchain/arm-gnu-toolchain.hash
index dec23f7ba534d..0800fa2168970 100644
--- a/package/arm-gnu-toolchain/arm-gnu-toolchain.hash
+++ b/package/arm-gnu-toolchain/arm-gnu-toolchain.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256  97dbb4f019ad1650b732faffcc881689cedc14e2b7ee863d390e0a41ef16c9a3  gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2
+# taken from https://developer.arm.com/-/media/Files/downloads/gnu/13.2.rel1/binrel/arm-gnu-toolchain-13.2.rel1-x86_64-arm-none-eabi.tar.xz.sha256asc
+sha256  6cd1bbc1d9ae57312bcd169ae283153a9572bd6a8e4eeae2fedfbc33b115fdbb  arm-gnu-toolchain-13.2.rel1-x86_64-arm-none-eabi.tar.xz
diff --git a/package/arm-gnu-toolchain/arm-gnu-toolchain.mk b/package/arm-gnu-toolchain/arm-gnu-toolchain.mk
index 87e12874ea416..03bb4dc5dae3e 100644
--- a/package/arm-gnu-toolchain/arm-gnu-toolchain.mk
+++ b/package/arm-gnu-toolchain/arm-gnu-toolchain.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-ARM_GNU_TOOLCHAIN_VERSION = 10.3-2021.10
-ARM_GNU_TOOLCHAIN_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-rm/$(ARM_GNU_TOOLCHAIN_VERSION)
-ARM_GNU_TOOLCHAIN_SOURCE = gcc-arm-none-eabi-$(ARM_GNU_TOOLCHAIN_VERSION)-x86_64-linux.tar.bz2
+ARM_GNU_TOOLCHAIN_VERSION = 13.2.rel1
+ARM_GNU_TOOLCHAIN_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/$(ARM_GNU_TOOLCHAIN_VERSION)/binrel
+ARM_GNU_TOOLCHAIN_SOURCE = arm-gnu-toolchain-$(ARM_GNU_TOOLCHAIN_VERSION)-x86_64-arm-none-eabi.tar.xz
 ARM_GNU_TOOLCHAIN_LICENSE = GPL-3.0+
 
 HOST_ARM_GNU_TOOLCHAIN_INSTALL_DIR = $(HOST_DIR)/opt/gcc-arm-none-eabi

base-commit: 1a015540278ba742b5a77e90e80e2f858af14f04
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
