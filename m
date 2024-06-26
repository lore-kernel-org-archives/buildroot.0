Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E884C3064D
	for <buildroot@archiver.kernel.org>; Wed, 26 Jun 2024 15:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFAED60C06;
	Wed, 26 Jun 2024 15:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U8wpijICaYnR; Wed, 26 Jun 2024 15:45:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4E4260C0E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4E4260C0E;
	Wed, 26 Jun 2024 15:45:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 168441BF3F2
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 15:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0466781376
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 15:45:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gMsYTbIZiO6L for <buildroot@lists.busybox.net>;
 Wed, 26 Jun 2024 15:45:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4EDB18136E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EDB18136E
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4EDB18136E
 for <buildroot@buildroot.org>; Wed, 26 Jun 2024 15:45:46 +0000 (UTC)
Received: from pps.filterd (m0346907.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 45QEkOTk002468; Wed, 26 Jun 2024 15:45:44 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 4003k6h6jj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jun 2024 15:45:44 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph004rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 45QFjgED006998
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jun 2024 15:45:42 GMT
Received: from crulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45QFjf1l016130
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 26 Jun 2024 15:45:42 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by crulimr02.rockwellcollins.com (Postfix) with ESMTP id B0AF33003AB9;
 Wed, 26 Jun 2024 10:45:41 -0500 (CDT)
Date: Wed, 26 Jun 2024 15:45:35 +0000
MIME-Version: 1.0
Message-Id: <20240626-versal-xsa-support-prebuilt-v2-1-724b00c4596d@collins.com>
X-B4-Tracking: v=1; b=H4sIAJ43fGYC/33NQQ6CMBCF4auQrh1DCxR15T0Mi1IGmaRS0oEGQ
 7i7lcSty/9N8s0mGAMhi1u2iYCRmPyYQp0yYQczPhGoSy1UrspcKwkRAxsHKxvgZZp8mGEK2C7
 kZrjaymBXtagvtUhCOvS0HvqjST0Qzz68j2dRftefW/11owQJvS5NbYqrNkV5t945Gvls/Us0+
 75/AJHdImDIAAAA
To: buildroot@buildroot.org
X-Mailer: b4 0.14.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_07,2024-06-25_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_07,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0
 suspectscore=0 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2406260115
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2406260115
X-Proofpoint-ORIG-GUID: wEXt7IW2XR2MFKoBEdZlJ93BYUR2BQj8
X-Proofpoint-GUID: wEXt7IW2XR2MFKoBEdZlJ93BYUR2BQj8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_07,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 mlxscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 spamscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2406180000 definitions=main-2406260115
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=Ak23madHrGNvgqfv1oWRKMd8pNieDehbVEjA6tD0SO8=;
 b=MXLYmGYr/Su1uGqsZK0TWqmEJXa7JddgqJS1nYR6tb9TbWWHruAHESd2J97N+t1t+Ep3
 JZPuVXzzPIu2t064s0Ua2PPRNG7qYelMpf5XIrGbM61UCijzwL9wk+soc0Opt72hUhMF
 vsc1Lv+GVgjfsYbKvvY1ZGplJTGfRBQoa/gH572kRdn8Ypo+Vx4mb/W3ljZTmjDPGCny
 fNH/wQ1Ax1WUJZ8lD/Snxzsa5VNmJaxgpHcGogpIeR9BHvK/QcBGkc8F497xAf5vRBRG
 n/UYtLyb4eieVa89NxvPMBaQ9HLIT7aFXHRIG89fyvVi1uMDVBFoiAS/aFR0Q1U2zIm0 UQ== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=MXLYmGYr
Subject: [Buildroot] [PATCH v2] boot/xilinx-prebuilt: support custom boards
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
index eb78ed10cd..d672d081bd 100644
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
 # different boards, but htere is only one, and it has to be named
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
 define XILINX_PREBUILT_INSTALL_VERSAL
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
base-commit: 4f1b7d0ef00af527f6a5c1fcfd18ce204a7d78e8
change-id: 20240621-versal-xsa-support-prebuilt-9c5aed5be687

Best regards,
-- 
Brandon Maier <brandon.maier@collins.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
