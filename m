Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BB0C25B75
	for <buildroot@archiver.kernel.org>; Sun, 26 May 2024 20:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A72A605D8;
	Sun, 26 May 2024 20:41:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WIQsPNmUA6d6; Sun, 26 May 2024 20:41:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2990E60760
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2990E60760;
	Sun, 26 May 2024 20:41:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 039B61D13DC
 for <buildroot@lists.busybox.net>; Sun, 26 May 2024 20:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F12F34012F
 for <buildroot@lists.busybox.net>; Sun, 26 May 2024 20:41:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f19dXYhuWKdc for <buildroot@lists.busybox.net>;
 Sun, 26 May 2024 20:41:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1D83B400BF
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D83B400BF
 for <buildroot@buildroot.org>; Sun, 26 May 2024 20:41:06 +0000 (UTC)
Received: from pps.filterd (m0346905.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 44QJMFAG003469; Sun, 26 May 2024 20:41:02 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3yb8pc7y3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 26 May 2024 20:41:02 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 44QKf16c029240
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sun, 26 May 2024 20:41:01 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 44QKf1SR015880
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sun, 26 May 2024 20:41:01 GMT
X-Received: from bspbox.kirk (unknown [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id 5FD71300040F;
 Sun, 26 May 2024 15:41:01 -0500 (CDT)
To: buildroot@buildroot.org
Date: Sun, 26 May 2024 20:40:42 +0000
Message-ID: <20240526204042.14587-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-26_09,2024-05-24_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-26_09,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=412
 phishscore=0 mlxscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405260173
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 adultscore=0
 mlxlogscore=366 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405260173
X-Proofpoint-ORIG-GUID: nKu105QGzMqTzidtdt5JSTpkMezU5WJl
X-Proofpoint-GUID: nKu105QGzMqTzidtdt5JSTpkMezU5WJl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-26_09,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 clxscore=1011
 malwarescore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 bulkscore=0 mlxlogscore=484 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2405260173
X-Mailman-Original-DKIM-Signature: =?UTF-8?Q?v=3D1; _a=3Drsa-sha256;
 _c=3Drelaxed/relaxed; _d=3Dcollins.com; _h?=
 =?UTF-8?Q?=3Dcc:content-transfer-encoding:date:from:message-id:mime-versi?=
 =?UTF-8?Q?on:subject:to;_s=3DPOD051818;_bh=3DaFn9Qx7lmVNmt6YLTYBY535IcvCA?=
 =?UTF-8?Q?rOTrmHLenKNHplo=3D;_b=3Dlkqak4sFSSOYw6Ut7LC/K/7uMNIq2L1sAnp+HPe?=
 =?UTF-8?Q?3C5kZEAMxDuWSJyZZEz+TsZSaTWMw_5WnR3NkmcnZ/ONAbNM989rnrjn/FkadWM?=
 =?UTF-8?Q?nXEk0VFR7nYlURSUbKd7OOjWl4KXuTAHFp1_iwgQJh8IPKSVD+peqaJ/ngs8pzM?=
 =?UTF-8?Q?P8GHlEMnCkzCASizTyPLhIr9lo69B+mFNgS1ND+wp_jgEl6E9Dccqpcp78bRitC?=
 =?UTF-8?Q?qx5hsLJ7xWRR0ZYOwvq7W0u9aTcrJOQqNQ3ilBZ2qH/XfT7_o93mUZTzkTm7Mrx?=
 =?UTF-8?Q?BCtb3Kj85cmyGOBYpJv7SLjtdxXyX32Ap7No01rn3PtEp3Suo99Tz_Wg=3D=3D_?=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
Subject: [Buildroot] [PATCH] configs/zynq_*: add hashes
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

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 .checkpackageignore                                 | 4 ----
 board/zynq/patches/linux-headers/linux-headers.hash | 2 ++
 board/zynq/patches/linux/linux.hash                 | 2 ++
 board/zynq/patches/uboot/uboot.hash                 | 2 ++
 configs/zynq_microzed_defconfig                     | 2 ++
 configs/zynq_zc702_defconfig                        | 2 ++
 configs/zynq_zc706_defconfig                        | 2 ++
 configs/zynq_zed_defconfig                          | 2 ++
 8 files changed, 14 insertions(+), 4 deletions(-)
 create mode 100644 board/zynq/patches/linux-headers/linux-headers.hash
 create mode 100644 board/zynq/patches/linux/linux.hash
 create mode 100644 board/zynq/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 9b9e4a61f9..85be936c6a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -380,10 +380,6 @@ configs/versal_vck190_defconfig lib_defconfig.ForceCheckHash
 configs/visionfive_defconfig lib_defconfig.ForceCheckHash
 configs/wandboard_defconfig lib_defconfig.ForceCheckHash
 configs/warp7_defconfig lib_defconfig.ForceCheckHash
-configs/zynq_microzed_defconfig lib_defconfig.ForceCheckHash
-configs/zynq_zc702_defconfig lib_defconfig.ForceCheckHash
-configs/zynq_zc706_defconfig lib_defconfig.ForceCheckHash
-configs/zynq_zed_defconfig lib_defconfig.ForceCheckHash
 configs/zynqmp_kria_kd240_defconfig lib_defconfig.ForceCheckHash
 configs/zynqmp_kria_kr260_defconfig lib_defconfig.ForceCheckHash
 configs/zynqmp_kria_kv260_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/zynq/patches/linux-headers/linux-headers.hash b/board/zynq/patches/linux-headers/linux-headers.hash
new file mode 100644
index 0000000000..8ed4bbead4
--- /dev/null
+++ b/board/zynq/patches/linux-headers/linux-headers.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  56acddefc6f6fdc00df5b75ceb4f86a9d0af9a4fef78cf57f9f2c274b22f006f  xlnx_rebase_v6.1_LTS_merge_6.1.70.tar.gz
diff --git a/board/zynq/patches/linux/linux.hash b/board/zynq/patches/linux/linux.hash
new file mode 100644
index 0000000000..8ed4bbead4
--- /dev/null
+++ b/board/zynq/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  56acddefc6f6fdc00df5b75ceb4f86a9d0af9a4fef78cf57f9f2c274b22f006f  xlnx_rebase_v6.1_LTS_merge_6.1.70.tar.gz
diff --git a/board/zynq/patches/uboot/uboot.hash b/board/zynq/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..35e54e0baf
--- /dev/null
+++ b/board/zynq/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  32a997a748697ff27e5e6db8edaff5ba893077214bc18b5267daff0b708dab53  xlnx_rebase_v2023.01_2023.2.tar.gz
diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index 7ada84cb6c..8fb9bc49dc 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -3,6 +3,8 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_GLOBAL_PATCH_DIR="board/zynq/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
diff --git a/configs/zynq_zc702_defconfig b/configs/zynq_zc702_defconfig
index 7f762abc58..84c8843ced 100644
--- a/configs/zynq_zc702_defconfig
+++ b/configs/zynq_zc702_defconfig
@@ -3,6 +3,8 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_GLOBAL_PATCH_DIR="board/zynq/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index ffa734348a..e22ba7a3d9 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -3,6 +3,8 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_GLOBAL_PATCH_DIR="board/zynq/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index 4bc1880481..33e7aa02e0 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -3,6 +3,8 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_GLOBAL_PATCH_DIR="board/zynq/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
