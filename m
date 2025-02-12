Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A2FC021A1
	for <buildroot@archiver.kernel.org>; Wed, 12 Feb 2025 09:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5818861024;
	Wed, 12 Feb 2025 09:26:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JQmlsNurE_kF; Wed, 12 Feb 2025 09:26:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F72361042
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F72361042;
	Wed, 12 Feb 2025 09:26:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A9778194
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 09:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9644640134
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 09:26:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id if68XmZX3-nz for <buildroot@buildroot.org>;
 Wed, 12 Feb 2025 09:26:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.153.233;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=131dbbb23=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4655240096
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4655240096
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4655240096
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 09:26:16 +0000 (UTC)
X-CSE-ConnectionGUID: th+SQfK3R+OfGp09Yw7kyg==
X-CSE-MsgGUID: 0KC+BZHzSUi2fu950LQPIw==
X-IronPort-AV: E=Sophos;i="6.13,279,1732604400"; d="scan'208";a="37584600"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Feb 2025 02:19:10 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 12 Feb 2025 02:18:20 -0700
Received: from jamie-dev.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 12 Feb 2025 02:18:18 -0700
To: <buildroot@buildroot.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Conor Dooley <Conor.Dooley@microchip.com>,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>, "Jamie
 Gibbons" <jamie.gibbons@microchip.com>, Conor Dooley
 <conor.dooley@microchip.com>
Date: Wed, 12 Feb 2025 09:21:21 +0000
Message-ID: <20250212092121.11699-4-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250212092121.11699-1-jamie.gibbons@microchip.com>
References: <20250212092121.11699-1-jamie.gibbons@microchip.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1739352377; x=1770888377;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kBGVf31aqOAcCYzSPmbszuIJUhtLcvsGFgJkByIryd0=;
 b=A97DXQcxbOicMrAcMmOV+1fCf3GVw3gl5uLoPfkbtphV3ThXIfI00yIO
 tgSQfOzSAxLyzuTnjQp1XRaXGzDSToP4w0WyX7qi7uIFaKFbJs6m8E/Lo
 my9/928qO1upIvs2AuB3gRTAPLZXAwDEC/DTgOkPR1/B4Pi9lPE5CoPow
 qExMWiv3aMxsk+gbXdYhN5mkkc+LyG8nlJsQmy9I1HnKtVRKmuSZU6dFE
 Tx43X81tIF1xzXUrR7JNaOWvc2R/4f30lSSyltkEAuc/5NLpngBoIVHMf
 VioCzH33S5V3GKdRVA10pvOEF6X1hDyiL4hFpZT0i7FuVQJuRHK9NK1zB
 w==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=A97DXQcx
Subject: [Buildroot] [PATCH v3 3/3] board/beagleboard/beaglev_fire: cleanup
 gatewate update
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

Update the README following the update gateware fix and optimise the
script, making it easier for the user to use.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
---
 board/beagleboard/beaglev_fire/README.txt     | 15 ++++--------
 .../usr/share/microchip/update-gateware.sh    | 24 ++++++++++++-------
 2 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/board/beagleboard/beaglev_fire/README.txt b/board/beagleboard/beaglev_fire/README.txt
index c9a824b67f..18b6e761ea 100644
--- a/board/beagleboard/beaglev_fire/README.txt
+++ b/board/beagleboard/beaglev_fire/README.txt
@@ -108,12 +108,12 @@ https://docs.beagleboard.org/latest/boards/beaglev/fire/demos-and-tutorials/gate
   Unzip the downloaded artifacts.zip file.
 
   Go to the custom FPGA design directory:
-    'cd artifacts/bitstreams/my_custom_fpga_design'
+    'cd artifacts/bitstreams/my_custom_fpga_design/LinuxProgramming/'
 
   On your Linux host development computer, copy the bitstream to BeagleV-Fire
   board, replacing </path/to/your/> with the path to your BeagleV-Fire root file
   system.
-    'cp -r ./LinuxProgramming /path/to/your/buildroot/board/beagleboard/beaglev_fire/rootfs-overlay/etc/'
+    'cp ./* /path/to/your/buildroot/board/beagleboard/beaglev_fire/rootfs-overlay/lib/firmware/'
 
   To apply these changes to your image, make sure to re-build it with:
     `make`
@@ -121,14 +121,7 @@ https://docs.beagleboard.org/latest/boards/beaglev/fire/demos-and-tutorials/gate
   Then, re-flash your image - to ensure you have the necessary firmware files - by
   following the above section "Flashing the image to your eMMC".
 
-  On BeagleV-Fire,
-    1. Make your update gateware script executable
-      'chmod +x /usr/share/microchip/update-gateware.sh'
-    2. Create a firmware directory
-      'mkdir /lib/firmware'
-    3. Change to the directory of your gateware script
-      `cd /usr/share/microchip/`
-    3. initiate the reprogramming of the FPGA with your gateware bitstream:
-      './update-gateware.sh /etc/LinuxProgramming/'
+  On BeagleV-Fire initiate the reprogramming of the FPGA with your gateware bitstream:
+    `/usr/share/microchip/update-gateware.sh`
 
   Wait for a couple of minutes for the BeagleV-Fire to reprogram itself.
diff --git a/board/beagleboard/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh b/board/beagleboard/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh
index 249c5bd260..7e05d4b7eb 100755
--- a/board/beagleboard/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh
+++ b/board/beagleboard/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh
@@ -1,17 +1,25 @@
 #!/bin/sh
 
-if [ ! -e "$1"/mpfs_bitstream.spi ]; then
+if [ $# -eq 0 ]; then
+    echo "No gateware location provided. Checking default location."
+    if [ ! -e /lib/firmware/mpfs_bitstream.spi ]; then
         echo "No gateware file found."
         exit 1
+    fi
+else
+    echo "Gateware location provided: $1"
+    if [ ! -e "$1"/mpfs_bitstream.spi ]; then
+        echo "No gateware file found."
+        exit 1
+    else
+        if [ ! -d /lib/firmware ]; then
+            mkdir /lib/firmware
+        fi
+        cp "$1"/mpfs_dtbo.spi /lib/firmware/mpfs_dtbo.spi
+        cp "$1"/mpfs_bitstream.spi /lib/firmware/mpfs_bitstream.spi
+    fi
 fi
 
-if [ ! -d /lib/firmware ]
-then
-    mkdir /lib/firmware
-fi
-
-cp "$1"/mpfs_dtbo.spi /lib/firmware/mpfs_dtbo.spi
-cp "$1"/mpfs_bitstream.spi /lib/firmware/mpfs_bitstream.spi
 
 # Trash existing device tree overlay in case the rest of the process fails:
 flash_erase /dev/mtd0 0 16
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
