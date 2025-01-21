Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8691C02185
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 09:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72A1E40B26;
	Tue, 21 Jan 2025 09:09:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4NNDWzsBn9uq; Tue, 21 Jan 2025 09:09:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B69241701
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B69241701;
	Tue, 21 Jan 2025 09:09:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 31C05959
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 09:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98BFB409EC
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 09:09:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V_F8n9UFEgfY for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 09:09:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.154.123;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=1098f6abb=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 28993409F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28993409F3
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 28993409F3
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 09:09:48 +0000 (UTC)
X-CSE-ConnectionGUID: EKfiuyhISJSGu431ctdL0A==
X-CSE-MsgGUID: dptc+BcKQgSzxv0rkHbhSg==
X-IronPort-AV: E=Sophos;i="6.13,221,1732604400"; d="scan'208";a="204253192"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Jan 2025 02:02:38 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 21 Jan 2025 02:02:09 -0700
Received: from jamie-dev.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 21 Jan 2025 02:02:08 -0700
To: <buildroot@buildroot.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Conor Dooley <Conor.Dooley@microchip.com>,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>, "Jamie
 Gibbons" <jamie.gibbons@microchip.com>, Conor Dooley
 <conor.dooley@microchip.com>
Date: Tue, 21 Jan 2025 09:05:11 +0000
Message-ID: <20250121090513.3375533-2-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250121090513.3375533-1-jamie.gibbons@microchip.com>
References: <20250121090513.3375533-1-jamie.gibbons@microchip.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1737450588; x=1768986588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oClXqCyY0wkbN5W8eldl60+NzbxVF2gEKGbbQ2safUw=;
 b=ZkOzr+RbcdnIStVbr0KsD0NV+GBNkNO01rcbvAPYS/Brd1Ybes4dd5jx
 xGXL+1FnaSlAz5h7f4Yf5w6JJ7fkaCDvAnB/Vu3lWu3mB/iYnUH5HD9aB
 6oB9I2MrjqR5ot3OdDUv3aqPQfF2oe7Fl/XXjy1AkzPXzjebstrqdv91a
 VfjMyzZApn3HIfBofUKkvXuZOcg/Sx6UGTOaOI5Q/m7urucLHgScwNjtJ
 gKMTUOPFFv6r/3tvSO1TcO4yIY1038oi8U6LFth7x+jG7YGd+ACuSQ65K
 rEGtnpNSj9R5VvC/Tl+Xmz4Pq+tWCg7k3zvOoO8AE8PdNQgWcOex98mEg
 w==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=ZkOzr+Rb
Subject: [Buildroot] [PATCH v2 1/3] board/beagleboard/beaglev_fire: fix
 update gateware feature
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
The fw_upload interface can detect when there is an overlay file and
will write it correctly. Use this functionality to write the overlay
file and remove dd command related code.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
---
 board/beagleboard/beaglev_fire/boot.cmd       |  1 +
 .../usr/share/microchip/update-gateware.sh    | 51 ++++++++++++++-----
 2 files changed, 40 insertions(+), 12 deletions(-)
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
index f455037b60..249c5bd260
--- a/board/beagleboard/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh
+++ b/board/beagleboard/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh
@@ -13,20 +13,47 @@ fi
 cp "$1"/mpfs_dtbo.spi /lib/firmware/mpfs_dtbo.spi
 cp "$1"/mpfs_bitstream.spi /lib/firmware/mpfs_bitstream.spi
 
-mount -t debugfs none /sys/kernel/debug
-
 # Trash existing device tree overlay in case the rest of the process fails:
-flash_erase /dev/mtd0 0 1024
+flash_erase /dev/mtd0 0 16
 
-# # Write device tree overlay
-dd if=/lib/firmware/mpfs_dtbo.spi of=/dev/mtd0 seek=1024
+# Initiate FPGA update for dtbo
+echo 1 > /sys/class/firmware/mpfs-auto-update/loading
 
-# Fake the presence of a golden image for now.
-dd if=/dev/zero of=/dev/mtd0 count=4 bs=1
+# Write device tree overlay
+cat /lib/firmware/mpfs_dtbo.spi > /sys/class/firmware/mpfs-auto-update/data
+
+# Signal completion for dtbo load
+echo 0 > /sys/class/firmware/mpfs-auto-update/loading
 
-# Initiate FPGA update.
-echo 1 > /sys/kernel/debug/fpga/microchip_exec_update
+while [ "$(cat /sys/class/firmware/mpfs-auto-update/status)" != "idle" ]; do
+    # Do nothing, just keep checking
+    sleep 1
+done
 
-# Reboot Linux for the gateware update to take effect.
-# FPGA reprogramming takes places between Linux shut-down and HSS restarting the board.
-reboot
+# Fake the presence of a golden image for now.
+dd if=/dev/zero of=/dev/mtd0 count=1 bs=4
+
+# Initiate FPGA update for bitstream
+echo 1 > /sys/class/firmware/mpfs-auto-update/loading
+
+# Write the firmware image to the data sysfs file
+cat /lib/firmware/mpfs_bitstream.spi > /sys/class/firmware/mpfs-auto-update/data
+
+# Signal completion for bitstream load
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
