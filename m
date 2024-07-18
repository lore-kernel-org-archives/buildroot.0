Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00DBBC3DA63
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 15:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B232A80D74;
	Thu, 18 Jul 2024 15:45:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n-h50s6b9UWp; Thu, 18 Jul 2024 15:45:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B13ED80D93
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B13ED80D93;
	Thu, 18 Jul 2024 15:45:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 019491BF35E
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 15:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0A626075B
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 15:45:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZWheIusLY5MS for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 15:45:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 187DD606D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 187DD606D5
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 187DD606D5
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 15:45:52 +0000 (UTC)
Received: from pps.filterd (m0346905.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 46IFXDfo018908; Thu, 18 Jul 2024 15:45:50 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40ew8q6htf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Jul 2024 15:45:50 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 46IFjm2U001727
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Jul 2024 15:45:48 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46IFjmP5009872
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 18 Jul 2024 15:45:48 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id 2CE493003B53;
 Thu, 18 Jul 2024 10:45:48 -0500 (CDT)
Date: Thu, 18 Jul 2024 15:45:45 +0000
MIME-Version: 1.0
Message-Id: <20240718-boot-uboot-env-select-v1-1-e6c778e814d8@collins.com>
X-B4-Tracking: v=1; b=H4sIAKg4mWYC/x2MQQqAIBAAvxJ7bkGlsPpKdChbayE0tCSI/p54G
 ZjDzAuRAlOEoXohUOLI3mWRdQVmn91GyGt2UEI1QssOF+8vvAvJJYx0kLlQ2b4TrTR6tj3k9gx
 k+Snfcfq+Hz8bumhnAAAA
To: buildroot@buildroot.org
X-Mailer: b4 0.14.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_11,2024-07-18_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_10,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407180101
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407180101
X-Proofpoint-ORIG-GUID: 7HGVpUvY56NdrHjiCDpNYX3Fn-irW6A8
X-Proofpoint-GUID: 7HGVpUvY56NdrHjiCDpNYX3Fn-irW6A8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_11,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0
 phishscore=0 impostorscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2407110000 definitions=main-2407180101
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=GuDnuINCkbpW5Ke5IyE1vSxvF1Qhv72JzenCRL5MfaI=;
 b=YyLIzzp1X7ZQ3AFty6m6LbEMmXbOflgp3JEmP2+mQhrWQY9t2LAr0i4TsyETTqFuPYnQ
 882pr5f3RqbifuGD65P4WRcnFO3Y2U1m5D22Z1pdaSs1RCG5G6YflMHpfhjDnRFMWgtF
 tzo7IGLcLP+/g+YmDrXjD9q2/mmhbk6kBPAZutepz1jEBmREsqWZDQjbVn6iQmxm8Iuv
 vGRstoXrfOfeiGh7h7Ov5jsXf3R44W3bWWuVTnyadmmBWb3bZxXb/xCdRdnyJGeOj9D+
 7o4aQwubFDs0/vTucpgVfGkQYTsjjUBRYri3Zv0QIHtmHVGKER/9u5XPBRETFrAthE8Y DQ== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=YyLIzzp1
Subject: [Buildroot] [PATCH] boot/uboot: fix Kconfig warning for
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
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The following warning occurs from commit "boot/uboot: allow taking the
entire default environment from a text file".

  boot/uboot/Config.in:141:warning: config symbol
  'BR2_TARGET_UBOOT_DEFAULT_ENV_FILE' uses select, but is not bool or
  tristate

Add a 'bool' config so we can enable dependencies.

In addition, the DEFAULT_ENV_FILE works by setting Kconfig options,
therefore we also need to depend on
BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 boot/uboot/Config.in | 10 +++++++++-
 boot/uboot/uboot.mk  |  2 +-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 57aac06e20..92e7bcc20a 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -136,9 +136,15 @@ config BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES
 	  that will be merged to the main U-Boot configuration file.
 endif
 
+config BR2_TARGET_UBOOT_DEFAULT_ENV
+	bool "Use default environment file"
+	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
+	select BR2_TARGET_UBOOT_NEEDS_XXD
+
+if BR2_TARGET_UBOOT_DEFAULT_ENV
+
 config BR2_TARGET_UBOOT_DEFAULT_ENV_FILE
 	string "Text file with default environment"
-	select BR2_TARGET_UBOOT_NEEDS_XXD
 	help
 	  Text file containing the variables to be used as the default
 	  environment in U-Boot.
@@ -165,6 +171,8 @@ config BR2_TARGET_UBOOT_DEFAULT_ENV_FILE
 
 	  Requires U-Boot >= v2018.05.
 
+endif
+
 config BR2_TARGET_UBOOT_NEEDS_DTC
 	bool "U-Boot needs dtc"
 	select BR2_PACKAGE_HOST_DTC
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 6cc87b35d3..df53fb28c1 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -391,8 +391,8 @@ UBOOT_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 # time, so use HOSTCC_NOCCACHE.
 UBOOT_KCONFIG_OPTS = $(UBOOT_MAKE_OPTS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTLDFLAGS=""
 
+ifeq ($(BR2_TARGET_UBOOT_DEFAULT_ENV),y)
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
