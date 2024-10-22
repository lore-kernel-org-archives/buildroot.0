Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8564D1CDD3
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 10:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D1E580B4C;
	Tue, 22 Oct 2024 10:29:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OJZsckHuIToj; Tue, 22 Oct 2024 10:29:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C9BC80E95
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C9BC80E95;
	Tue, 22 Oct 2024 10:29:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 09EFA963
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 10:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E00E960643
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 10:29:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id efUf7EN8nYJg for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 10:29:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.154.123;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=018f217b1=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DE99860646
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE99860646
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE99860646
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 10:29:28 +0000 (UTC)
X-CSE-ConnectionGUID: c+qRROuNRZ2d3z6tLWfXNg==
X-CSE-MsgGUID: uMTiC+rTQn2QAIWRxBFMJQ==
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="200750579"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Oct 2024 03:22:21 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 22 Oct 2024 03:21:58 -0700
Received: from jamie-dev.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 22 Oct 2024 03:21:57 -0700
To: <buildroot@buildroot.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Conor Dooley
 <Conor.Dooley@microchip.com>, Valentina Fernandez Alanis
 <Valentina.FernandezAlanis@microchip.com>, Jamie Gibbons
 <jamie.gibbons@microchip.com>
Date: Tue, 22 Oct 2024 11:24:26 +0100
Message-ID: <20241022102426.220196-4-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022102426.220196-1-jamie.gibbons@microchip.com>
References: <20241022102426.220196-1-jamie.gibbons@microchip.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1729592968; x=1761128968;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JIDlLcurC2vw/rJ5loa/GcAMuVNgyE/QLbNeDBLYekc=;
 b=f/0w2rV2scNZ8j7Ruv0V1C98jwXSOPaCcHHH1SXtZn3p+zNTN7cMDXFQ
 u1AY677hN9E0yEHJJvkOgTBT0cZYaZgX261roTWtNkiT6IqQkBAR2/N78
 5iq7yjcYDvRj+OFzPuT1xaVHvVxEUQwb/SZ69pTkCbXiR7798gPtjh21N
 1EpbWncBiDy9KU4PrNtyRXlYgr4TiE5H80zQkP6AdWLoqu5b72xMpy3s2
 wzwdEj+Z3OxRGhAtR03T5sE0na08LagXhj1bU2CoRoNBrFPgP4u21+T/n
 LOD2AS6gnExSm52Y4k0KohPdgl7WGCQ+QS20XKsKvR+UFr/oo1+FqHoVQ
 w==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=f/0w2rV2
Subject: [Buildroot] [PATCH 3/3] board/beagleboard/beaglev_fire: cleanup
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

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
---
 board/beagleboard/beaglev_fire/README.txt     | 13 +++-------
 .../usr/share/microchip/update-gateware.sh    | 24 ++++++++++++-------
 2 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/board/beagleboard/beaglev_fire/README.txt b/board/beagleboard/beaglev_fire/README.txt
index c9a824b67f..6484cca8e1 100644
--- a/board/beagleboard/beaglev_fire/README.txt
+++ b/board/beagleboard/beaglev_fire/README.txt
@@ -113,7 +113,7 @@ https://docs.beagleboard.org/latest/boards/beaglev/fire/demos-and-tutorials/gate
   On your Linux host development computer, copy the bitstream to BeagleV-Fire
   board, replacing </path/to/your/> with the path to your BeagleV-Fire root file
   system.
-    'cp -r ./LinuxProgramming /path/to/your/buildroot/board/beagleboard/beaglev_fire/rootfs-overlay/etc/'
+    'cp -r ./LinuxProgramming /path/to/your/buildroot/board/beagleboard/beaglev_fire/rootfs-overlay/lib/firmware/'
 
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
index ce55394343..b4344bb804 100755
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
