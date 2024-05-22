Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E88F0C25B78
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 16:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB17B606E9;
	Wed, 22 May 2024 16:13:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BquuMbW_pRsn; Wed, 22 May 2024 16:13:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 895EC60710
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 895EC60710;
	Wed, 22 May 2024 16:13:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 80E511C5D65
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 16:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7954180BF7
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 16:13:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WLl1vSYJPBUd for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 16:13:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8187F80A82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8187F80A82
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8187F80A82
 for <buildroot@buildroot.org>; Wed, 22 May 2024 16:13:45 +0000 (UTC)
Received: from pps.filterd (m0346902.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 44MDmDKR012936; Wed, 22 May 2024 16:13:43 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3y9hwma104-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 May 2024 16:13:43 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
 by xusxph004rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 44MGDgF1032185
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 22 May 2024 16:13:42 GMT
Received: from crulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 44MGDg1n001435
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 22 May 2024 16:13:42 GMT
X-Received: from bspbox.kirk (unknown [10.148.204.208])
 by crulimr02.rockwellcollins.com (Postfix) with ESMTP id 1163A30049B0;
 Wed, 22 May 2024 11:13:42 -0500 (CDT)
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 16:13:38 +0000
Message-ID: <20240522161338.1278400-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_08,2024-05-22_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_08,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 mlxlogscore=429 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405220110
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 mlxlogscore=401 mlxscore=0 bulkscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405220110
X-Proofpoint-ORIG-GUID: XavVE-L697Al3j9KoP0ODiahkQwmtmwt
X-Proofpoint-GUID: XavVE-L697Al3j9KoP0ODiahkQwmtmwt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_08,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 malwarescore=0 clxscore=1011 priorityscore=1501 spamscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 mlxscore=0 mlxlogscore=519 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405220110
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=POD051818; bh=u9aprYOYvIV8mo6Ml6q0G3ife1ZJZhasxNoG9Lx7NpY=;
 b=E6/vKfw5cbp0h5rrxlPQYH57sScf0Jwt5emJb9mDxjgarthaA4Tlui7xO5sUNIbVVBz3
 VEPDAxB38u0xJl15LSGoEsm6aXNuAxjKaqygj6n1kRzD7NUkxDq7XQMvKJhcQJn1fYHO
 T8o/FkrRLLwCEKgeR8+cOlOQjN8cAZoNmpdDV6Bhv0mueB0weSsMz2CJsm5qErIqSJJQ
 Oj8xVhSHjFAxACTmeoKNC9w//cEYoCSdxwXnm6ci0CBrn0y7Nq+UybG9f+MChikTpUx7
 knhB5sQbLtq3Cu8TpidecpoSSCUOpYCP0eCgTmYtN2UvlOrGgKwl9wnpC0HuX0zbbK7f 1w== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=E6/vKfw5
Subject: [Buildroot] [PATCH] configs/versal_vck190_defconfig: add hashes
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
Cc: Brandon Maier <brandon.maier@collins.com>,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable BR2_DOWNLOAD_FORCE_CHECK_HASHES

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 .checkpackageignore                                             | 1 -
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash      | 2 ++
 board/versal/patches/linux-headers/linux-headers.hash           | 2 ++
 board/versal/patches/linux/linux.hash                           | 2 ++
 board/versal/patches/uboot/uboot.hash                           | 2 ++
 board/versal/patches/versal-firmware/versal-firmware.hash       | 2 ++
 configs/versal_vck190_defconfig                                 | 1 +
 7 files changed, 11 insertions(+), 1 deletion(-)
 create mode 100644 board/versal/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 100644 board/versal/patches/linux-headers/linux-headers.hash
 create mode 100644 board/versal/patches/linux/linux.hash
 create mode 100644 board/versal/patches/uboot/uboot.hash
 create mode 100644 board/versal/patches/versal-firmware/versal-firmware.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 0ddf9effda..24314ee2aa 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -380,7 +380,6 @@ configs/ts4900_defconfig lib_defconfig.ForceCheckHash
 configs/ts5500_defconfig lib_defconfig.ForceCheckHash
 configs/ts7680_defconfig lib_defconfig.ForceCheckHash
 configs/uevm5432_defconfig lib_defconfig.ForceCheckHash
-configs/versal_vck190_defconfig lib_defconfig.ForceCheckHash
 configs/visionfive_defconfig lib_defconfig.ForceCheckHash
 configs/wandboard_defconfig lib_defconfig.ForceCheckHash
 configs/warp7_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/versal/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/versal/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..fc0245e519
--- /dev/null
+++ b/board/versal/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  fb15878cf8d656c8e048369ac6eab8e0771633a4a935964cde234979805248fa  xlnx_rebase_v2.8_2023.2.tar.gz
diff --git a/board/versal/patches/linux-headers/linux-headers.hash b/board/versal/patches/linux-headers/linux-headers.hash
new file mode 100644
index 0000000000..19e1df5ee1
--- /dev/null
+++ b/board/versal/patches/linux-headers/linux-headers.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  ab7c238394032c1c300bd6cbe0081bcf95af6020b276f29bd7eb1b6458be1e55  xlnx_rebase_v6.1_LTS_2023.2.tar.gz
diff --git a/board/versal/patches/linux/linux.hash b/board/versal/patches/linux/linux.hash
new file mode 100644
index 0000000000..19e1df5ee1
--- /dev/null
+++ b/board/versal/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  ab7c238394032c1c300bd6cbe0081bcf95af6020b276f29bd7eb1b6458be1e55  xlnx_rebase_v6.1_LTS_2023.2.tar.gz
diff --git a/board/versal/patches/uboot/uboot.hash b/board/versal/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..4a6437b33c
--- /dev/null
+++ b/board/versal/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  32a997a748697ff27e5e6db8edaff5ba893077214bc18b5267daff0b708dab53  xlnx_rebase_v2023.01_2023.2.tar.gz
diff --git a/board/versal/patches/versal-firmware/versal-firmware.hash b/board/versal/patches/versal-firmware/versal-firmware.hash
new file mode 100644
index 0000000000..5c63d345fd
--- /dev/null
+++ b/board/versal/patches/versal-firmware/versal-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  76d5b07417de5a26acd028d6e39ae5effbbcf4f5e1b8a89ba0dda8ef02b7a3f1  versal-firmware-xilinx_v2023.2.tar.gz
diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 8561b6641a..80a26f2675 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -1,6 +1,7 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
