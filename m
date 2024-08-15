Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301FCC3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 14:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D06CE40711;
	Thu, 15 Aug 2024 14:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L_XzxpCDAya3; Thu, 15 Aug 2024 14:18:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 958BD4073E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 958BD4073E;
	Thu, 15 Aug 2024 14:18:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EA0271BF591
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 14:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D80F3605C2
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 14:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zKdaxP_5a03k for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 14:18:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 19C7C600C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19C7C600C7
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 19C7C600C7
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 14:18:19 +0000 (UTC)
Received: from pps.filterd (m0346904.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 47FDh9Mf005765; Thu, 15 Aug 2024 14:18:14 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 411jt80m7v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Aug 2024 14:18:14 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph009rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 47FEIC5e023441
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Aug 2024 14:18:13 GMT
Received: from dtulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 47FEIBkr020444
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 15 Aug 2024 14:18:12 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by dtulimr01.rockwellcollins.com (Postfix) with ESMTP id AAB3220054A4;
 Thu, 15 Aug 2024 09:18:11 -0500 (CDT)
Date: Thu, 15 Aug 2024 14:18:02 +0000
MIME-Version: 1.0
Message-Id: <20240815-zynqmp-zcu10x-defconfig-fix-parallel-build-of-uboot-v1-1-5fef12406c32@collins.com>
X-B4-Tracking: v=1; b=H4sIABkOvmYC/x2NywrCMBAAf6Xs2YWk1GD9FfGQx6YuxCQmRmpL/
 93gcWCY2aFSYapwHXYo9OHKKXaQpwHsQ8eFkF1nGMU4iYs84/aNr2fGzTYpVnTkbYqeF/S8YtZ
 Fh0ABTePgMHlsJqU3KmWneVSzsV5AL+dCXf9fb/fj+AECEfeLhQAAAA==
To: buildroot@buildroot.org
X-Mailer: b4 0.14.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_06,2024-08-15_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_06,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=333
 mlxscore=0 phishscore=0
 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408150103
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0 mlxlogscore=305
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408150103
X-Proofpoint-GUID: e4nLjIpDj9-DhAutYJt8Zn-MCUdm_fyj
X-Proofpoint-ORIG-GUID: e4nLjIpDj9-DhAutYJt8Zn-MCUdm_fyj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_06,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 clxscore=1015
 bulkscore=0 mlxlogscore=393 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408150104
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=u0pVfG3cLZwo2WJT9YplKPwz7rxD3n+/4M9jUdkrtyg=;
 b=MYI72XXiwZSQ3w6OR6sQdEaUYh9vpwBNO8Sk3OXFvq8PJ/DcWBQ1hr5uAciB6wHGPay4
 s6JVQT2SR8bbB8tSPNA494NV8bDqsioChXSXTezCuFEkWHZKcMTEqGb3Vh1X2Eq1jnq2
 dRK1dH2+p1jY3wwivSvoI6BAvIX+TYeEAw9S1FML7KAdvmQ/ySAgoPck+WO6aV2wePM5
 NeqFDuBX4HZTVm0txrGmoht7R0Zc+hwyzwZxZbgoPpDb+Q+KDxBAIU54zs/d0qMZfW3m
 Im6m2CLGOIXJpL0POOfPXujJXs/JyhxNUXRsP2T5O2kIY89LrlM1V4jUY2GCN5rK9UPQ fA== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=MYI72XXi
Subject: [Buildroot] [PATCH] configs/zynqmp_zcu10*_defconfig: fix parallel
 build of U-Boot
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
 Brandon Maier <brandon.maier@collins.com>, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When building these boards with BR2_PER_PACKAGE_DIRECTORIES enabled, the
following error occurs from U-Boot.

  tools/mkeficapsule.c:18:10: fatal error: uuid/uuid.h: No such file or directory
     18 | #include <uuid/uuid.h>
        |          ^~~~~~~~~~~~~

The U-Boot defconfig these boards use 'xilinx_zynqmp_virt' enables
CONFIG_MKEFICAPSULE, which requires util-linux.

This doesn't fail when BR2_PER_PACKAGE_DIRECTORIES is disabled. This is
because host-e2fsprogs requires host-util-linux, and host-util-linux
always builds before host-uboot when single-threaded.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 configs/zynqmp_zcu102_defconfig | 1 +
 configs/zynqmp_zcu104_defconfig | 1 +
 configs/zynqmp_zcu106_defconfig | 1 +
 3 files changed, 3 insertions(+)

diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 3f1726a13f..df5eba7ca0 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -27,6 +27,7 @@ BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu102-rev1.0"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index b6d943333f..793a677ab2 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -27,6 +27,7 @@ BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu104-revC"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 970ed40d2c..fdf5e80795 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -27,6 +27,7 @@ BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-rev1.0"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y

---
base-commit: 48e7affffa06bbe23a1cd190d0a765956cf179b0
change-id: 20240815-zynqmp-zcu10x-defconfig-fix-parallel-build-of-uboot-66c49269bcf0

Best regards,
-- 
Brandon Maier <brandon.maier@collins.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
