Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C0ED59D6F
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 16:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33C9A403AD;
	Fri, 12 Dec 2025 16:21:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3_YpYmemOzFi; Fri, 12 Dec 2025 16:21:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58D96403C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765556481;
	bh=X+HCiyMY2KWlLfod8CG4rn2LuJyYbC5us8XNtCBIUHg=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=B6/S5tFztHnAx76YWt9HndK3uWgZYV7jXAvGKaLYjIX/PLsnqjXExDBhZDLQjHUQX
	 7VOSQmacIqcDy5UoxGsLhTkm+yipX4GAvPWC29RQvv5Xi6Eg2JR2dZuQxQAkG3k0DR
	 vx0JAmXnsvfSLLq+Qu/5/CrOe8FRJBU+rb5BKzatJLNaGnItBfxWuHdqWcXP+JUSrI
	 lpxif7SrbJ3VXxADm5acs0289es39obs2/Q6+0RmSTwF07g/OI8O7hxgnYOazWnvbs
	 Y1+Zbk7R1vMIgNLjI1HKdpZhQOC57x9mUH0UeHEuVN5s/sRr4T/VaylVt2Uh9AqKMP
	 E8yjJ5TFc4Gqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58D96403C8;
	Fri, 12 Dec 2025 16:21:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C51AE2C6
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 16:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B69C660B11
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 16:21:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8L0vmnjUwCId for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 16:21:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9D90560AFB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D90560AFB
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D90560AFB
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 16:21:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id C63A0C19361;
 Fri, 12 Dec 2025 16:20:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E1B21606DF;
 Fri, 12 Dec 2025 16:21:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8599E103C8DFF; Fri, 12 Dec 2025 17:21:15 +0100 (CET)
To: buildroot@buildroot.org
Date: Fri, 12 Dec 2025 16:20:51 +0000
Message-ID: <20251212162053.883682-3-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212162053.883682-1-kory.maincent@bootlin.com>
References: <20251212162053.883682-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765556476; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=GesuZfdgvMdh/1hkGGtgHLJ5oNUkIt1Ln0MYkv1pa6g=;
 b=x1VFcvmZnZR0ZoRW4TQOVp9wu6EARofs89W43yZnov/N7yZPK5pc/45iYAEsMn5KNjvIX+
 QtSYsi8DM6DRAL4NeU8GnInnHiFBH70SChHUi6yN/JC6iZmURDcFlSZ4DxjbHLGyWR3HZN
 GAvT3zsXPN0uQeYL7thQRWUV9buDIUdItwXe358OUTShb822MicHEWUMRJiiDTWWGLRSHN
 zLmshsZ4ukmfwN5lPoxYHwmUTzKBUwbgYo3sql1qwY6ydB0HJvCe8A60R25EZbOScVT606
 G6vEH0KNAAXWlybORho9Yb9pdQKcO4A5NRvfVil8AjaJrRjomtabkNH047vdKQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=x1VFcvmZ
Subject: [Buildroot] [PATCH v2 2/2] board/beaglebone: Add BeagleBone Green
 Eco support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Cc: "Kory Maincent \(TI.com\)" <kory.maincent@bootlin.com>,
 Bryan Brattlof <bb@ti.com>, Bajjuri Praneeth <praneeth@ti.com>,
 Lothar Felten <lothar.felten@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>

Add the am335x-bonegreen-eco device tree to enable support for the
BeagleBone Green Eco variant. This ensures the device tree is built
from the Linux kernel sources and included in the boot partition.

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 board/beagleboard/beaglebone/genimage.cfg | 1 +
 board/beagleboard/beaglebone/readme.txt   | 1 +
 configs/beaglebone_defconfig              | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/board/beagleboard/beaglebone/genimage.cfg b/board/beagleboard/beaglebone/genimage.cfg
index 4b026fda84..095e6e200b 100644
--- a/board/beagleboard/beaglebone/genimage.cfg
+++ b/board/beagleboard/beaglebone/genimage.cfg
@@ -12,6 +12,7 @@ image boot.vfat {
 			"am335x-bonegreen.dtb",
 			"am335x-boneblack-wireless.dtb",
 			"am335x-bonegreen-wireless.dtb",
+			"am335x-bonegreen-eco.dtb",
 			"extlinux"
 		}
 	}
diff --git a/board/beagleboard/beaglebone/readme.txt b/board/beagleboard/beaglebone/readme.txt
index a11377eaee..f896e1285a 100644
--- a/board/beagleboard/beaglebone/readme.txt
+++ b/board/beagleboard/beaglebone/readme.txt
@@ -31,6 +31,7 @@ output/images/
 +-- am335x-boneblack-wireless.dtb
 +-- am335x-boneblue.dtb
 +-- am335x-bonegreen.dtb
++-- am335x-bonegreen-eco.dtb
 +-- am335x-bonegreen-wireless.dtb
 +-- am335x-bone.dtb
 +-- am335x-evm.dtb
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index e0fc8968ba..b3a3951733 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -14,7 +14,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/ti/common/am335x/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am335x-evm ti/omap/am335x-bone ti/omap/am335x-boneblack ti/omap/am335x-bonegreen ti/omap/am335x-evmsk ti/omap/am335x-boneblue ti/omap/am335x-boneblack-wireless ti/omap/am335x-bonegreen-wireless"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am335x-evm ti/omap/am335x-bone ti/omap/am335x-boneblack ti/omap/am335x-bonegreen ti/omap/am335x-evmsk ti/omap/am335x-boneblue ti/omap/am335x-boneblack-wireless ti/omap/am335x-bonegreen-wireless ti/omap/am335x-bonegreen-eco"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
 BR2_PACKAGE_XZ=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
