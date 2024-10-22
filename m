Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6437ED1CDD5
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 10:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A995E80B78;
	Tue, 22 Oct 2024 10:29:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MPMB71x88c_n; Tue, 22 Oct 2024 10:29:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07ABF80E7E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07ABF80E7E;
	Tue, 22 Oct 2024 10:29:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BEB2963
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 10:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E952400DD
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 10:29:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hPvBTCnldwS2 for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 10:29:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.154.123;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=018f217b1=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AD4A4400E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD4A4400E7
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AD4A4400E7
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 10:29:27 +0000 (UTC)
X-CSE-ConnectionGUID: c+qRROuNRZ2d3z6tLWfXNg==
X-CSE-MsgGUID: Z7vJQBh9RYK2F6H9cfTDwQ==
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="200750577"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Oct 2024 03:22:21 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 22 Oct 2024 03:21:53 -0700
Received: from jamie-dev.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 22 Oct 2024 03:21:52 -0700
To: <buildroot@buildroot.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Conor Dooley
 <Conor.Dooley@microchip.com>, Valentina Fernandez Alanis
 <Valentina.FernandezAlanis@microchip.com>, Jamie Gibbons
 <jamie.gibbons@microchip.com>
Date: Tue, 22 Oct 2024 11:24:24 +0100
Message-ID: <20241022102426.220196-2-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022102426.220196-1-jamie.gibbons@microchip.com>
References: <20241022102426.220196-1-jamie.gibbons@microchip.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1729592967; x=1761128967;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FwdOqCwCckqz0v6unrejDLket7Br2CcZNztvbA+sIeQ=;
 b=ODCGb6T4uZAn/XkUwF3z9jZZ6+kKsCKfEPBAtgq2Wr3+5ZtHc8QWgaX3
 RDZCI5Sy0VJkkJr5U3WKDF83/6RmR0z4Dr+OLzJfGOymXitFZoNPCmzqI
 lKdJ5z83BNBu2pxeYO9lCE+0brd4lnLvXG40RwfWdzTLhvcamRCHPBbqQ
 cUL1fLdLanHQ2BftScl5udH5Ox2WlMW5ctF4gtNhT+a5uxEIbEtcbFV9M
 PpUBVldAMj1ORlRki/VnQmpx2665VsXy5xYe3ZUC07ITZ56NLCyrdfLRu
 amr6KD4vw1c32IV6br1zdD5lDvTO987MXWsvNknoVBuzgD/XJf1O2uxgL
 Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=ODCGb6T4
Subject: [Buildroot] [PATCH 1/3] board/beagleboard/beaglev_fire: fix update
 gateware feature
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
From: Jamie Gibbons via buildroot <buildroot@buildroot.org>
Reply-To: Jamie Gibbons <jamie.gibbons@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Following the addition of the firmware upload API in linux v6.6, using
debugfs for firmware updating has been removed. Update the
update-gateware script to use the firmware upload API with sysfs and
enable applying the overlays during boot.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
---
 board/beagleboard/beaglev_fire/boot.cmd       |  1 +
 .../usr/share/microchip/update-gateware.sh    | 41 ++++++++++++++-----
 2 files changed, 31 insertions(+), 11 deletions(-)
 mode change 100644 => 100755 board/beagleboard/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh

diff --git a/board/beagleboard/beaglev_fire/boot.cmd b/board/beagleboard/beaglev_fire/boot.cmd
index 05f4858bac..1402458d8b 100644
--- a/board/beagleboard/beaglev_fire/boot.cmd
+++ b/board/beagleboard/beaglev_fire/boot.cmd
@@ -12,4 +12,5 @@ bootm loados ${scriptaddr};
 bootm ramdisk;
 bootm prep;
 fdt set /soc/ethernet@20110000 mac-address ${beaglevfire_mac_addr0};
+run design_overlays;
 bootm go;
diff --git a/board/beagleboard/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh b/board/beagleboard/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh
old mode 100644
new mode 100755
index f455037b60..ce55394343
--- a/board/beagleboard/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh
+++ b/board/beagleboard/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh
@@ -13,20 +13,39 @@ fi
 cp "$1"/mpfs_dtbo.spi /lib/firmware/mpfs_dtbo.spi
 cp "$1"/mpfs_bitstream.spi /lib/firmware/mpfs_bitstream.spi
 
-mount -t debugfs none /sys/kernel/debug
-
 # Trash existing device tree overlay in case the rest of the process fails:
-flash_erase /dev/mtd0 0 1024
+flash_erase /dev/mtd0 0 16
+
+# Get device tree overlay size
+dtbo_size=$(stat -c %s /lib/firmware/mpfs_dtbo.spi)
 
-# # Write device tree overlay
-dd if=/lib/firmware/mpfs_dtbo.spi of=/dev/mtd0 seek=1024
+# Write device tree overlay
+dd if=/lib/firmware/mpfs_dtbo.spi of=/dev/mtd0 bs=1 seek=$((0x400)) count="$dtbo_size" status=progress
 
 # Fake the presence of a golden image for now.
-dd if=/dev/zero of=/dev/mtd0 count=4 bs=1
+dd if=/dev/zero of=/dev/mtd0 count=1 bs=4
 
 # Initiate FPGA update.
-echo 1 > /sys/kernel/debug/fpga/microchip_exec_update
-
-# Reboot Linux for the gateware update to take effect.
-# FPGA reprogramming takes places between Linux shut-down and HSS restarting the board.
-reboot
+echo 1 > /sys/class/firmware/mpfs-auto-update/loading
+
+# Write the firmware image to the data sysfs file
+cat /lib/firmware/mpfs_bitstream.spi > /sys/class/firmware/mpfs-auto-update/data
+
+# Signal completion
+echo 0 > /sys/class/firmware/mpfs-auto-update/loading
+
+while [ "$(cat /sys/class/firmware/mpfs-auto-update/status)" != "idle" ]; do
+    # Do nothing, just keep checking
+    sleep 1
+done
+
+# When the status is 'idle' and no error has occured, reboot the system for
+# the gateware update to take effect. FPGA reprogramming takes places between
+# Linux shut-down and HSS restarting the board.
+if [ "$(cat /sys/class/firmware/mpfs-auto-update/error)" = "" ]; then
+    echo "FPGA update ready. Rebooting."
+    reboot
+else
+    echo "FPGA update failed with status: $(cat /sys/class/firmware/mpfs-auto-update/error)"
+    exit 1
+fi
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
