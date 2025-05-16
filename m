Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71031C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 14:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36BBB406FE;
	Fri, 16 May 2025 14:34:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N_hcmYTTjE_l; Fri, 16 May 2025 14:34:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 733714090D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 733714090D;
	Fri, 16 May 2025 14:34:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CF581AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E597612BB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:34:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nV5U_x2_-9A1 for <buildroot@buildroot.org>;
 Fri, 16 May 2025 14:34:06 +0000 (UTC)
X-Greylist: delayed 327 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 16 May 2025 14:34:06 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3704A6123A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3704A6123A
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=92.121.34.21;
 helo=inva021.nxp.com; envelope-from=juanpablo.monterocastro@nxp.com;
 receiver=<UNKNOWN> 
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3704A6123A
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:34:06 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E33ED20059D;
 Fri, 16 May 2025 16:28:37 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D726F20053A;
 Fri, 16 May 2025 16:28:37 +0200 (CEST)
Received: from lsv051113.swis.nl-cdc01.nxp.com
 (lsv051113.swis.nl-cdc01.nxp.com [10.168.3.63])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 32C6920315;
 Fri, 16 May 2025 16:28:37 +0200 (CEST)
From: Juan Pablo Montero Castro <juanpablo.monterocastro@nxp.com>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 16:28:27 +0200
Message-Id: <20250516142827.3211350-1-juanpablo.monterocastro@nxp.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=nxp.com
Subject: [Buildroot] [PATCH 1/1] fix imx9 bootloader preparation script
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
Cc: Juan Pablo MONTERO CASTRO <juanpablo.monterocastro@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Juan Pablo MONTERO CASTRO <juanpablo.monterocastro@nxp.com>

This commit replaces A35 with A55 in imx9 bootloader preparation script.
i.MX9 families have CortexA55, see link below:
https://www.nxp.com/products/processors-and-microcontrollers/arm-processors/i-mx-applications-processors/i-mx-9-processors:IMX9-PROCESSORS

Signed-off-by: Juan Pablo MONTERO CASTRO <juanpablo.monterocastro@nxp.com>
---
 .../freescale/common/imx/imx9-bootloader-prepare.sh  | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/freescale/common/imx/imx9-bootloader-prepare.sh b/board/freescale/common/imx/imx9-bootloader-prepare.sh
index 8ab5a241b0..2db887a785 100755
--- a/board/freescale/common/imx/imx9-bootloader-prepare.sh
+++ b/board/freescale/common/imx/imx9-bootloader-prepare.sh
@@ -18,19 +18,19 @@ main ()
 
 	if grep -Eq "^BR2_TARGET_OPTEE_OS=y$" "${BR2_CONFIG}"; then
 		"${HOST_DIR}/bin/mkimage_imx8" -soc IMX9 -c \
-			-ap "${BINARIES_DIR}/bl31.bin" a35 ${ATF_LOAD_ADDR} \
-			-ap "${BINARIES_DIR}/u-boot-hash.bin" a35 0x80200000 \
-			-ap "${BINARIES_DIR}/tee.bin" a35 0x96000000 \
+			-ap "${BINARIES_DIR}/bl31.bin" a55 ${ATF_LOAD_ADDR} \
+			-ap "${BINARIES_DIR}/u-boot-hash.bin" a55 0x80200000 \
+			-ap "${BINARIES_DIR}/tee.bin" a55 0x96000000 \
 			-out "${BINARIES_DIR}/u-boot-atf-container.img"
 	else
 		"${HOST_DIR}/bin/mkimage_imx8" -soc IMX9 -c \
-			-ap "${BINARIES_DIR}/bl31.bin" a35 ${ATF_LOAD_ADDR} \
-			-ap "${BINARIES_DIR}/u-boot-hash.bin" a35 0x80200000 \
+			-ap "${BINARIES_DIR}/bl31.bin" a55 ${ATF_LOAD_ADDR} \
+			-ap "${BINARIES_DIR}/u-boot-hash.bin" a55 0x80200000 \
 			-out "${BINARIES_DIR}/u-boot-atf-container.img"
 	fi
 
 	"${HOST_DIR}/bin/mkimage_imx8" -soc IMX9 -append "${BINARIES_DIR}/ahab-container.img" -c \
-		-ap "${BINARIES_DIR}/u-boot-spl-ddr.bin" a35 ${SPL_LOAD_ADDR} \
+		-ap "${BINARIES_DIR}/u-boot-spl-ddr.bin" a55 ${SPL_LOAD_ADDR} \
 		-out "${BINARIES_DIR}/imx9-boot-sd.bin"
 
 	flashbin_size="$(wc -c "${BINARIES_DIR}/imx9-boot-sd.bin" | awk '{print $1}')"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
