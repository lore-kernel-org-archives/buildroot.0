Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A23C2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 16:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E02AC403E7;
	Mon,  1 Jul 2024 16:49:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yV8lR0RCyfcg; Mon,  1 Jul 2024 16:49:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AC2540396
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AC2540396;
	Mon,  1 Jul 2024 16:49:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C94D1BF34F
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 16:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 084574033F
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 16:49:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C3V4nhD2PIkz for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 16:49:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2922C4016F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2922C4016F
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2922C4016F
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 16:49:11 +0000 (UTC)
Received: from pps.filterd (m0346902.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 461FTThA025671; Mon, 1 Jul 2024 16:49:09 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 403y53rtgp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 01 Jul 2024 16:49:08 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 461Gn7Sg004712
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Jul 2024 16:49:08 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 461Gn7vu008069
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 1 Jul 2024 16:49:07 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id 1F5DC3001607;
 Mon,  1 Jul 2024 11:49:07 -0500 (CDT)
Date: Mon, 01 Jul 2024 16:48:43 +0000
MIME-Version: 1.0
Message-Id: <20240701-versal-xsa-support-prebuilt-v3-1-3d3e9318d181@collins.com>
X-B4-Tracking: v=1; b=H4sIAOrdgmYC/33NQQ6DIBCF4asY1p0GEbB21Xs0XSBinYSKASU2x
 rsXTZq0G5f/m+SbhQTj0QRyzRbiTcSArk9RnDKiO9U/DWCTmjDKOJUsh2h8UBbmoCBMw+D8CIM
 39YR2hEoLZRpRG3kpSRLSocV51++P1B2G0fn3/izm2/p1xaEbc8ihlVyVqqikKvhNO2uxD2ftX
 mSTI/vV5LHGklYyXlOquahk86+t6/oBoK/SfxYBAAA=
To: buildroot@buildroot.org
X-Mailer: b4 0.14.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_16,2024-07-01_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_16,2024-07-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407010126
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 mlxscore=0
 spamscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407010126
X-Proofpoint-GUID: MXZgq4YeWSYiB4Lf_V3XC0rV0ogNVUCA
X-Proofpoint-ORIG-GUID: MXZgq4YeWSYiB4Lf_V3XC0rV0ogNVUCA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_16,2024-07-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 mlxlogscore=999 phishscore=0 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407010126
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=/BbSV+dgMigOmeMqDJhAHHY2MGWAP+GCZnmC94oF5is=;
 b=oHECoSZ3V1YV4jZ3evKUdoGyBIpkOY5fdDcZ0TjQkUMwdhB3NDSTwNCXmq/D5fHagwAJ
 ZsAftVpPOpp55JIUdR5XCrMp/93LWAPAdnFVbjW9dztlV8NeWvE/W/pxx68DgApJKE0I
 kzA7iJ80pz+VRxQJ8u6TukFfOlkic9AST+StB9LnOzuTgQEcsl+XGhJv4B1WVw+PsRni
 poY824KhCJ4yB/BZHV+nwHH+L5vHVKV/vI0Frrd8IahqJvPiUWGmOfkVIMK0VUK+Pc/Q
 VGzH159ws20oKNg8ROJN2bVm70RTw5+ZIc0geVteG5soiuFxUDFBmzHNxVr3YhZ8UiEl 1Q== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=oHECoSZ3
Subject: [Buildroot] [PATCH v3] boot/xilinx-prebuilt: support custom boards
 using XSA
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
From: Brandon Maier via buildroot <buildroot@buildroot.org>
Reply-To: Brandon Maier <brandon.maier@collins.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Brandon Maier <brandon.maier@collins.com>, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The xilinx-prebuilt package only supports development boards that Xilinx
has published firmware for. Custom designs based on the Xilinx platform
must generate their own firmware using the AMD Vivado Design Suite.

Vivado produces an XSA file, which is a Zip file containing all the
firmware needed by xilinx-prebuilt. We extend xilinx-prebuilt to
download custom XSA files and extract their contents.

Reviewed-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
Changes in v3:
- Rebase on upstream changes to boot/xilinx-prebuilt
- Link to v2: https://lore.kernel.org/r/20240626-versal-xsa-support-prebuilt-v2-1-724b00c4596d@collins.com

Changes in v2:
- Fix help text to say XSA is created by Vivado [Neal]
- Link to v1: https://lore.kernel.org/r/20240625-versal-xsa-support-prebuilt-v1-1-f64a7a396a34@collins.com
---
 boot/xilinx-prebuilt/Config.in          | 24 ++++++++++++++++++++++++
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 27 ++++++++++++++++++++++++---
 2 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
index d3df1c06e7..94ef3dd111 100644
--- a/boot/xilinx-prebuilt/Config.in
+++ b/boot/xilinx-prebuilt/Config.in
@@ -31,6 +31,30 @@ config BR2_TARGET_XILINX_PREBUILT_VERSAL
 
 endchoice
 
+config BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
+	bool "download a prebuilt Versal XSA"
+	depends on BR2_TARGET_XILINX_PREBUILT_VERSAL
+	help
+	  The Xilinx Support Archive (XSA) provides custom Xilinx
+	  firmware files generated by the AMD Vivado Design Suite.
+
+	  https://docs.amd.com/r/en-US/ug1400-vitis-embedded/Creating-a-Hardware-Design-XSA-File
+
+if BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
+
+config BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA_LOCATION
+	string "URL of custom XSA"
+	help
+	  This option allows to specify a URL pointing to an XSA source
+	  file. This URL can use any protocol recognized by Buildroot,
+	  like http://, ftp://, file:// or scp://.
+
+	  When pointing to a local XSA using file://, you may want to
+	  use a make variable like $(TOPDIR) to reference the root of
+	  the Buildroot tree.
+
+endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
+
 config BR2_TARGET_XILINX_PREBUILT_FAMILY
 	string
 	default "zynqmp" if BR2_TARGET_XILINX_PREBUILT_ZYNQMP
diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
index d09f4b13e2..c3000b7e45 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -5,9 +5,20 @@
 ################################################################################
 
 XILINX_PREBUILT_VERSION = $(call qstrip,$(BR2_TARGET_XILINX_PREBUILT_VERSION))
+
+ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA),y)
+XILINX_PREBUILT_FILE = $(call qstrip,$(BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA_LOCATION))
+XILINX_PREBUILT_SITE = $(patsubst %/,%,$(dir $(XILINX_PREBUILT_FILE)))
+XILINX_PREBUILT_SOURCE = $(notdir $(XILINX_PREBUILT_FILE))
+define XILINX_PREBUILT_EXTRACT_CMDS
+	$(UNZIP) $(XILINX_PREBUILT_DL_DIR)/$(XILINX_PREBUILT_SOURCE) -d $(@D)
+endef
+else # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 XILINX_PREBUILT_SITE = $(call github,Xilinx,soc-prebuilt-firmware,$(XILINX_PREBUILT_VERSION))
 XILINX_PREBUILT_LICENSE = MIT
 XILINX_PREBUILT_LICENSE_FILES = LICENSE
+endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
+
 XILINX_PREBUILT_INSTALL_TARGET = NO
 XILINX_PREBUILT_INSTALL_IMAGES = YES
 
@@ -20,12 +31,22 @@ ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL),y)
 # We need the *.pdi glob, because the file has different names for the
 # different boards, but there is only one, and it has to be named
 # vpl_gen_fixed.pdi when installed.
+ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA),y)
+XILINX_PREBUILT_PLM = $(@D)/pdi_files/gen_files/plm.elf
+XILINX_PREBUILT_PSMFW = $(@D)/pdi_files/static_files/psm_fw.elf
+XILINX_PREBUILT_PDI = $(@D)/*.pdi
+else # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
+XILINX_PREBUILT_PLM = $(XILINX_PREBUILT_BOARD_DIR)/plm.elf
+XILINX_PREBUILT_PSMFW = $(XILINX_PREBUILT_BOARD_DIR)/psmfw.elf
+XILINX_PREBUILT_PDI = $(XILINX_PREBUILT_BOARD_DIR)/*.pdi
+endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
+
 define XILINX_PREBUILT_INSTALL
-	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/plm.elf \
+	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_PLM) \
 		$(BINARIES_DIR)/plm.elf
-	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/psmfw.elf \
+	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_PSMFW) \
 		$(BINARIES_DIR)/psmfw.elf
-	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/*.pdi \
+	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_PDI) \
 		$(BINARIES_DIR)/vpl_gen_fixed.pdi
 endef
 else # BR2_TARGET_XILINX_PREBUILT_VERSAL

---
base-commit: 55c8c2328e73725e9ab41c8dc566b09f49f2aad5
change-id: 20240621-versal-xsa-support-prebuilt-9c5aed5be687

Best regards,
-- 
Brandon Maier <brandon.maier@collins.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
