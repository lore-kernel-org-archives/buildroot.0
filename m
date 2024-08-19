Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D809FC3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 19:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6480440255;
	Mon, 19 Aug 2024 19:39:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TKPVMkABPsMF; Mon, 19 Aug 2024 19:39:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D1F440259
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D1F440259;
	Mon, 19 Aug 2024 19:39:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B43C1BF355
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 19:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6759380AF6
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 19:39:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uku7auMRpn7e for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 19:39:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5412980AC9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5412980AC9
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5412980AC9
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 19:39:53 +0000 (UTC)
Received: from pps.filterd (m0346903.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JEqZNx032730;
 Mon, 19 Aug 2024 19:39:48 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 412m96q71t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Aug 2024 19:39:47 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
 by xusxph009rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 47JJdXMB008437
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Aug 2024 19:39:46 GMT
Received: from ciulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 47JJdXTd025125
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 19 Aug 2024 19:39:33 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id 4EF141002830;
 Mon, 19 Aug 2024 14:39:33 -0500 (CDT)
Date: Mon, 19 Aug 2024 19:39:29 +0000
MIME-Version: 1.0
Message-Id: <20240819-boot-uboot-clean-for-pmufw-v2-1-055f6b9ad56d@collins.com>
X-B4-Tracking: v=1; b=H4sIAHCfw2YC/42NQQ6CMBBFr0Jm7ZhphcS68h6GBQxTaQItaQE1h
 LtbOYGbn7y/eG+DJNFJgluxQZTVJRd8Bn0qgPvGPwVdlxk06ZKuqsI2hBmXY3mQxqMNEadxsS9
 k4pJUY6xwBVkwRbHufcgfdebepTnEz9Fa1e/9S7sqJLxY6owhw9SWdw7D4Hw6cxih3vf9C5iux
 xfGAAAA
To: buildroot@buildroot.org
X-Mailer: b4 0.14.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=600
 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408190134
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 malwarescore=0
 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=530 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408190134
X-Proofpoint-GUID: n-I2ReTbNCOoQCSV6liZ070CpgZFYVoa
X-Proofpoint-ORIG-GUID: n-I2ReTbNCOoQCSV6liZ070CpgZFYVoa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 spamscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 bulkscore=0 phishscore=0 mlxlogscore=672 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408190134
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=2OWk74m04PCSFtchC09N+YXw4+uVVZmY96gevGIVMuk=;
 b=jp13EZgu6pDS6hR5P0nHhtV5rl6tVlDgbME3k5mb06cXEq7b5snKrRYnmabwtINnhIpw
 n/ca1MeBdjzfxJ5TkKACHxWwnvq2wWPaDK47ZM24L3vpPdSpvKpB2J6d1fj2nogUSXQW
 2BJdSIsoNS+mdUClXRlzUZeLQrKU4LER9vrq3mAfXeaKdyhUue5PziFs82xxh0oEyA9o
 4CchK6U7R08j4fZ/ptWpeLwe/GnPHQy/cAFZm80i3kdE/1FOKJVin7SdiVuexy25uTFW
 H7s9NhWyQJb9AdiDO4GaA1dNfEe0ZAwNYYezfef/dOY7jCXsJiM+2n7n3r43LmZ1x2xY gA== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=jp13EZgu
Subject: [Buildroot] [PATCH v2] boot/uboot: use $(TARGET_OBJCOPY) for ZynqMP
 pmufw.elf
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Converting the pmufw.elf to a binary works with any objcopy, regardless
if it's from the host or cross-compiler. Prefer to use the
$(TARGET_OBJCOPY) as it's always available and reproducible.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Reviewed-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v2:
- Drop patch 1 [Luca]
- Add a comment about using `objcopy` [Luca]
- Link to v1: https://lore.kernel.org/r/20240815-boot-uboot-clean-for-pmufw-v1-0-3f0d9909c0b4@collins.com
---
 boot/uboot/uboot.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index cdb9f435f7..2c04abc896 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -462,8 +462,10 @@ endif #BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
 
 ifeq ($(suffix $(UBOOT_ZYNQMP_PMUFW_PATH)),.elf)
 UBOOT_ZYNQMP_PMUFW_PATH_FINAL = $(basename $(UBOOT_ZYNQMP_PMUFW_PATH)).bin
+# objcopy is arch-agnostic so we can use $(TARGET_OBJCOPY) in lack of a
+# microblaze objcopy
 define UBOOT_ZYNQMP_PMUFW_CONVERT
-	objcopy -O binary -I elf32-little $(UBOOT_ZYNQMP_PMUFW_PATH) $(UBOOT_ZYNQMP_PMUFW_PATH_FINAL)
+	$(TARGET_OBJCOPY) -O binary -I elf32-little $(UBOOT_ZYNQMP_PMUFW_PATH) $(UBOOT_ZYNQMP_PMUFW_PATH_FINAL)
 endef
 UBOOT_PRE_BUILD_HOOKS += UBOOT_ZYNQMP_PMUFW_CONVERT
 else

---
base-commit: 48e7affffa06bbe23a1cd190d0a765956cf179b0
change-id: 20240815-boot-uboot-clean-for-pmufw-c0c401a9fec5

Best regards,
-- 
Brandon Maier <brandon.maier@collins.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
