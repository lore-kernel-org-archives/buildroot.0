Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A878AC3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 19:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BD66400BA;
	Sat, 13 Jul 2024 19:55:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lurcAAFWcwXt; Sat, 13 Jul 2024 19:55:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE0C640498
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE0C640498;
	Sat, 13 Jul 2024 19:55:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B49921BF3F6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0DD14072B
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:55:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y4sUooXoS10Y for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 19:55:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0F97F40720
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F97F40720
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F97F40720
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 19:55:50 +0000 (UTC)
Received: from pps.filterd (m0346901.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 46DAQ7fi021055; Sat, 13 Jul 2024 19:55:48 GMT
Received: from xusxph008rp050.rtx.com (xusxph008rp050.rtx.com [128.13.124.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40bj6euet2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 13 Jul 2024 19:55:47 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph008rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 46DJtkYT011520
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 13 Jul 2024 19:55:46 GMT
Received: from dtulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46DJtjMJ023669
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 13 Jul 2024 19:55:46 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by dtulimr02.rockwellcollins.com (Postfix) with ESMTP id 5A1A7302650A;
 Sat, 13 Jul 2024 14:55:45 -0500 (CDT)
Date: Sat, 13 Jul 2024 19:55:43 +0000
MIME-Version: 1.0
Message-Id: <20240713-versal-xsa-support-prebuilt-v4-1-1d0ba023ed89@collins.com>
X-B4-Tracking: v=1; b=H4sIAL7bkmYC/33P3QqCMBTA8VeJXbfYl1O76j2ii7kdc2BONh2G+
 O5NISoCL//nwO9wZhTAWwjofJiRh2iDdV0KcTwg3ajuDtia1IgRJohkFEfwQbV4CgqHse+dH3D
 voRptO+BSZwpMVoEscpSEtKjttOnXW+rGhsH553Ys0nX6drNdN1JMcS2FyhUvpeLiol3b2i6ct
 HugVY7sW5P7GktazkRFiBZZKc2/xj9aTvZ/jjxp3HAoOS0MLeivtizLCw4AbIlkAQAA
To: buildroot@buildroot.org
X-Mailer: b4 0.14.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_16,2024-07-11_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_16,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407130152
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407130151
X-Proofpoint-GUID: SLGAcGEOK0FiJ70w92eTG91paOxW8GEw
X-Proofpoint-ORIG-GUID: SLGAcGEOK0FiJ70w92eTG91paOxW8GEw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_16,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 adultscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2406180000 definitions=main-2407130151
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=VYgxvFP7H+uo0ugWo3csPLt3gtfbgo/i1Ae6hGjxAHY=;
 b=NsVskRrtna/xJZY1K/an8apOQo4NYdgBl1Iw41cbeFc5HxvTACT3kmAorU0wiELKHsEJ
 22s+8wcPNrHJZb2bD2bsSs8AIoXTgbPgBe1b/iCwSrpR5ciFbHgJlzE0LSuNBUvigvgH
 m9kmFYeCu+EX7rbYkLthNDbvCj6mZgFiCgf6UUqdMK9+VkUBGWzzEFkgThMa9nIf9rUK
 Q/tOe24DuzKWxDhjgEFqUz411TBeD+XWyQMekjVBCXv2EnnI6EMyaJotbXP2HDs6RGHR
 H1rb6jDVlhzcBao0B3L8LJ+kBWFi6wgq6P4TIXLvcwrQyuk6EInhmCKgZA46MFNonkwv Pg== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=NsVskRrt
Subject: [Buildroot] [PATCH v4] boot/xilinx-prebuilt: support custom boards
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
Cc: Romain Naour <romain.naour@smile.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
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
Changes in v4:
- Add a note about how xilinx-prebuilt and XSA name psm_fw.elf
  differently [Romain]
- Link to v3: https://lore.kernel.org/r/20240701-versal-xsa-support-prebuilt-v3-1-3d3e9318d181@collins.com

Changes in v3:
- Rebase on upstream changes to boot/xilinx-prebuilt
- Link to v2: https://lore.kernel.org/r/20240626-versal-xsa-support-prebuilt-v2-1-724b00c4596d@collins.com

Changes in v2:
- Fix help text to say XSA is created by Vivado [Neal]
- Link to v1: https://lore.kernel.org/r/20240625-versal-xsa-support-prebuilt-v1-1-f64a7a396a34@collins.com
---
 boot/xilinx-prebuilt/Config.in          | 24 ++++++++++++++++++++++
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 36 +++++++++++++++++++++++++++------
 2 files changed, 54 insertions(+), 6 deletions(-)

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
index d09f4b13e2..d26f39c482 100644
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
 
@@ -17,15 +28,28 @@ XILINX_PREBUILT_BOARD = $(call qstrip,$(BR2_TARGET_XILINX_PREBUILT_BOARD))
 XILINX_PREBUILT_BOARD_DIR = $(@D)/$(XILINX_PREBUILT_BOARD)-$(XILINX_PREBUILT_FAMILY)
 
 ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL),y)
-# We need the *.pdi glob, because the file has different names for the
-# different boards, but there is only one, and it has to be named
-# vpl_gen_fixed.pdi when installed.
+# The generated XSA and the xilinx-prebuilt repos store the firmware files at
+# different directories and with different filenames. We need the *.pdi glob,
+# because the file has different names for the different boards, but there is
+# only one, and it has to be named vpl_gen_fixed.pdi when installed. We drop
+# the underscore from psm_fw.elf as the xilinx-prebuilt named the file
+# differently.
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
