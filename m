Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83163EB64D9
	for <buildroot@archiver.kernel.org>; Fri, 16 Jun 2023 00:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B50DC4150F;
	Fri, 16 Jun 2023 00:24:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B50DC4150F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rosRq4UAB1WH; Fri, 16 Jun 2023 00:24:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A90B415F5;
	Fri, 16 Jun 2023 00:24:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A90B415F5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B94711BF286
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 00:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A8C24191E
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 00:24:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A8C24191E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lyJlS98e8RMF for <buildroot@lists.busybox.net>;
 Fri, 16 Jun 2023 00:24:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AD73415F5
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7AD73415F5
 for <buildroot@buildroot.org>; Fri, 16 Jun 2023 00:24:14 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35G0OD3l039835
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 19:24:13 -0500
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35G0ODGH002456
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 19:24:13 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Jun 2023 19:24:13 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Jun 2023 19:24:13 -0500
Received: from dasso.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35G0OCSJ015831;
 Thu, 15 Jun 2023 19:24:13 -0500
To: <buildroot@buildroot.org>
Date: Thu, 15 Jun 2023 19:23:59 -0500
Message-ID: <20230616002359.4139814-11-dannenberg@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230616002359.4139814-1-dannenberg@ti.com>
References: <20230616002359.4139814-1-dannenberg@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1686875053;
 bh=pqPaP5kth/U7Nc+OTTMYUErYy7F6ASejNKzVyoS0GtM=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=ZCP07vSm0FlQg5lLQqSINVZu0tmEbXbmNWbdg8jUFb9tohluIeYCba3AwlI+DeKVl
 FzGH2zRqU9f2pbChLb4F5eoRJgahOT+90CjYtGjsZocw3ejb1y+M6oxo37BeMO/YCP
 ywI6al/0Z4pdZ8ll0HEZs+PwPu7kH4itwIqNktlo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=ZCP07vSm
Subject: [Buildroot] [PATCH v8 10/10] configs/am62x_sk_defconfig: enable IMG
 Rogue graphics driver
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
From: Andreas Dannenberg via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Dannenberg <dannenberg@ti.com>
Cc: Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable the IMG Rogue graphics driver for use on SK-AM62 by enabling the
ti-rogue-um package containing the usermode libraries, which in turn
will enable the ti-rogue-km package with the Kernel driver. Furthermore
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV is enabled for automatic Kernel
module loading to allow loading the graphics driver (and others) during
startup.

With this configuration a simple graphics test can be performed on the
target platform by running 'rgx_triangle_test -pxfmt argb8888' from the
commandline, showing rotating triangles on an HDMI-connected monitor.

Based on this basic graphics enablement, the Buildroot-included Weston
and Chocolate Doom packages can now be enabled and run successfully.
However since extending/adding features is heavily use-case dependent
this task is left to follow-on commits or user-derived custom configs
for now.

Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
---
 configs/am62x_sk_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/am62x_sk_defconfig b/configs/am62x_sk_defconfig
index 033101b735..588b934300 100644
--- a/configs/am62x_sk_defconfig
+++ b/configs/am62x_sk_defconfig
@@ -1,5 +1,6 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ti/am62x_sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
@@ -12,6 +13,7 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX=y
+BR2_PACKAGE_TI_ROGUE_UM=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
