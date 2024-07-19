Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57727C3DA5D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 14:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDC34400B5;
	Fri, 19 Jul 2024 14:50:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LJUo53L6skAd; Fri, 19 Jul 2024 14:50:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A81BD40FCD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A81BD40FCD;
	Fri, 19 Jul 2024 14:50:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 47F031BF335
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 14:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4171B40FCD
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 14:50:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 45lMlqagEC-V for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 14:50:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0C6DB400B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C6DB400B5
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C6DB400B5
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 14:50:32 +0000 (UTC)
Received: from pps.filterd (m0346906.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 46JEbV6v032641; Fri, 19 Jul 2024 14:50:30 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40ft2s04h2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Jul 2024 14:50:30 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.224])
 by xusxph004rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 46JEoSqc016124
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Jul 2024 14:50:28 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46JEoRoj026511
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 19 Jul 2024 14:50:28 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id C37813000499;
 Fri, 19 Jul 2024 09:50:27 -0500 (CDT)
Date: Fri, 19 Jul 2024 14:50:26 +0000
MIME-Version: 1.0
Message-Id: <20240719-boot-uboot-env-select-v2-1-6abcd50db794@collins.com>
X-B4-Tracking: v=1; b=H4sIADF9mmYC/4WNQQrCMBBFr1Jm7UgTqkldeQ/poqYTO1CTksSgl
 Nzd2Au4+fA+/Pc3iBSYIlyaDQJljuxdBXlowMyjexDyVBlkK7tWCY137xO+9iSXMdJCJqG0vW5
 PwqjR9lC3ayDL7917GyrPHJMPn/0mi1/7z5gFCqSzUUqTFt2kr8YvC7t4NP4JQynlC6blyAS8A
 AAA
To: buildroot@buildroot.org
X-Mailer: b4 0.14.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_06,2024-07-18_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_06,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407190113
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407190112
X-Proofpoint-GUID: REXU-pD_0c7-t5rBip_2rdChPTc2Qg8B
X-Proofpoint-ORIG-GUID: REXU-pD_0c7-t5rBip_2rdChPTc2Qg8B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_06,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 bulkscore=0 suspectscore=0 adultscore=0 mlxscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407190113
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=qgqLVfoAXG1K5yundbNEDW/3SDsGnO+oFl1rqRBs3Gw=;
 b=a/sDkM0vQXo47qdxS9KmDYx4YMG7q8DYm7wnUVqZABFQAwRuDSxR4iHdHHpkJWhpbUEV
 OCTPbLW+VTH2z/WmY/P/AQNeSyoum/5DMzN1gCQgks8vzJFa0vWgGmrR7LbFicbegne6
 lhJPe4v6M+qP206PywztMoxoJHz+F+8SRiKOCOrn+y9yDJViTbHfS4Xb2ZHo9PmCfVY3
 3ffTXeMkNSl6eLp5e2kIMY60nRJk7xkYVhCwhjcXldSCCPmqN96ve8uyF3eIyiof7tol
 hlkxcWMqjSghkRBz960GEoRAsiAIY+XVilU8TIEWRWWczvNSIJ0jY7A/fP4cXn2iulLz +w== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=a/sDkM0v
Subject: [Buildroot] [PATCH v2] boot/uboot: fix Kconfig warning for
 DEFAULT_ENV_FILE
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The following warning occurs from commit "boot/uboot: allow taking the
entire default environment from a text file".

  boot/uboot/Config.in:141:warning: config symbol
  'BR2_TARGET_UBOOT_DEFAULT_ENV_FILE' uses select, but is not bool or
  tristate

Add a hidden 'bool' config so we can enable dependencies.

In addition, the DEFAULT_ENV_FILE works by setting Kconfig options,
therefore we also need to depend on
BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
Changes in v2:
- Use a hidden bool [Arnout, Thomas]
- Link to v1: https://lore.kernel.org/r/20240718-boot-uboot-env-select-v1-1-e6c778e814d8@collins.com
---
 boot/uboot/Config.in | 7 ++++++-
 boot/uboot/uboot.mk  | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 57aac06e20..e9689b9f33 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -136,9 +136,14 @@ config BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES
 	  that will be merged to the main U-Boot configuration file.
 endif
 
+config BR2_TARGET_UBOOT_DEFAULT_ENV_FILE_HIDDEN
+	bool
+	default y if BR2_TARGET_UBOOT_DEFAULT_ENV_FILE != ""
+	select BR2_TARGET_UBOOT_NEEDS_XXD
+
 config BR2_TARGET_UBOOT_DEFAULT_ENV_FILE
 	string "Text file with default environment"
-	select BR2_TARGET_UBOOT_NEEDS_XXD
+	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
 	help
 	  Text file containing the variables to be used as the default
 	  environment in U-Boot.
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 6cc87b35d3..80059a1a88 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -391,8 +391,8 @@ UBOOT_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 # time, so use HOSTCC_NOCCACHE.
 UBOOT_KCONFIG_OPTS = $(UBOOT_MAKE_OPTS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTLDFLAGS=""
 
+ifeq ($(BR2_TARGET_UBOOT_DEFAULT_ENV_FILE_HIDDEN),y)
 UBOOT_DEFAULT_ENV_FILE = $(call qstrip,$(BR2_TARGET_UBOOT_DEFAULT_ENV_FILE))
-ifneq ($(UBOOT_DEFAULT_ENV_FILE),)
 define UBOOT_KCONFIG_DEFAULT_ENV_FILE
 	$(call KCONFIG_SET_OPT,CONFIG_USE_DEFAULT_ENV_FILE,y)
 	$(call KCONFIG_SET_OPT,CONFIG_DEFAULT_ENV_FILE,"$(shell readlink -f $(UBOOT_DEFAULT_ENV_FILE))")

---
base-commit: c624eee120b6ee0c81e636bd47abe92452610cf7
change-id: 20240718-boot-uboot-env-select-2f98051c7af9

Best regards,
-- 
Brandon Maier <brandon.maier@collins.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
