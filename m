Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E9EEC25B78
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 16:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E0306071A;
	Wed, 22 May 2024 16:58:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id emIWS5-7i2u3; Wed, 22 May 2024 16:58:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 489D060763
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 489D060763;
	Wed, 22 May 2024 16:58:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC81E1C56AD
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 16:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9442082161
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 16:57:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IlmKU3V-029U for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 16:57:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8410E8215E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8410E8215E
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8410E8215E
 for <buildroot@buildroot.org>; Wed, 22 May 2024 16:57:57 +0000 (UTC)
Received: from pps.filterd (m0346904.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 44MGs8TI030701; Wed, 22 May 2024 16:57:56 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3y9ga1bvkm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 May 2024 16:57:55 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
 by xusxph004rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 44MGvsNX002958
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 22 May 2024 16:57:54 GMT
Received: from ciulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 44MGvsHu031602
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 22 May 2024 16:57:54 GMT
X-Received: from bspbox.kirk (unknown [10.148.204.208])
 by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id F06841002A1E;
 Wed, 22 May 2024 11:57:53 -0500 (CDT)
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 16:57:45 +0000
Message-ID: <20240522165745.1340174-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_09,2024-05-22_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_09,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 mlxlogscore=604 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405220115
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 mlxlogscore=579 mlxscore=0 bulkscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405220116
X-Proofpoint-GUID: bQO42M8Fbk6ZGBUIf0JKCXhqHJhhGFBP
X-Proofpoint-ORIG-GUID: bQO42M8Fbk6ZGBUIf0JKCXhqHJhhGFBP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_09,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 mlxlogscore=676 adultscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 clxscore=1011 bulkscore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405220116
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=POD051818; bh=NHXGldOJW5n//CR6Nedl3/UtcYwmWX4cMrF2O0o/GMk=;
 b=Bowa0B/WTuCC7cS1rnlawwxWx96yb6W3JvQ0DWweNvrseWxhRPUNBzMpEJ6J3iYcaKUc
 XOg8hc6P5sZG5ZMDG8T/kCNGneSNxERVHf3k8VoDaezD55pVD782cGIaolt7+wIRG1A6
 GBjv8Tz0I9aNpczNHN3saA2zqkQPLuh/tMHBQzB3Ym3dS8K5wwTUnJya+X6b1pdo1uai
 cdb7f0dh8F+yL4js9vPugkoF3I4qY8D7NYdRjYQlscphtRFCXkdaTu4REcU5sIrhpsMC
 SoFOwbOLXX+U4kxLB2qesDXNXhfdDSvuMPCoij07fEp0hSkkJ8ecEYxlvfFoOMbDCMpi Xw== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=Bowa0B/W
Subject: [Buildroot] [PATCH] configs/raspberrypi: add hashes
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
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 .checkpackageignore                                  | 12 ------------
 .../patches/linux-headers/linux-headers.hash         |  2 ++
 board/raspberrypi/patches/linux/linux.hash           |  2 ++
 configs/raspberrypi0_defconfig                       |  4 ++++
 configs/raspberrypi0w_defconfig                      |  4 ++++
 configs/raspberrypi2_defconfig                       |  4 ++++
 configs/raspberrypi3_64_defconfig                    |  4 ++++
 configs/raspberrypi3_defconfig                       |  4 ++++
 configs/raspberrypi3_qt5we_defconfig                 |  4 ++++
 configs/raspberrypi4_64_defconfig                    |  4 ++++
 configs/raspberrypi4_defconfig                       |  4 ++++
 configs/raspberrypi_defconfig                        |  4 ++++
 configs/raspberrypicm4io_64_defconfig                |  4 ++++
 configs/raspberrypicm4io_defconfig                   |  4 ++++
 configs/raspberrypizero2w_defconfig                  |  4 ++++
 15 files changed, 52 insertions(+), 12 deletions(-)
 create mode 100644 board/raspberrypi/patches/linux-headers/linux-headers.hash
 create mode 100644 board/raspberrypi/patches/linux/linux.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 0ddf9effda..9a70d08380 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -326,18 +326,6 @@ configs/qemu_x86_64_defconfig lib_defconfig.ForceCheckHash
 configs/qemu_x86_defconfig lib_defconfig.ForceCheckHash
 configs/qemu_xtensa_lx60_defconfig lib_defconfig.ForceCheckHash
 configs/qemu_xtensa_lx60_nommu_defconfig lib_defconfig.ForceCheckHash
-configs/raspberrypi0_defconfig lib_defconfig.ForceCheckHash
-configs/raspberrypi0w_defconfig lib_defconfig.ForceCheckHash
-configs/raspberrypi2_defconfig lib_defconfig.ForceCheckHash
-configs/raspberrypi3_64_defconfig lib_defconfig.ForceCheckHash
-configs/raspberrypi3_defconfig lib_defconfig.ForceCheckHash
-configs/raspberrypi3_qt5we_defconfig lib_defconfig.ForceCheckHash
-configs/raspberrypi4_64_defconfig lib_defconfig.ForceCheckHash
-configs/raspberrypi4_defconfig lib_defconfig.ForceCheckHash
-configs/raspberrypi_defconfig lib_defconfig.ForceCheckHash
-configs/raspberrypicm4io_64_defconfig lib_defconfig.ForceCheckHash
-configs/raspberrypicm4io_defconfig lib_defconfig.ForceCheckHash
-configs/raspberrypizero2w_defconfig lib_defconfig.ForceCheckHash
 configs/riotboard_defconfig lib_defconfig.ForceCheckHash
 configs/roc_pc_rk3399_defconfig lib_defconfig.ForceCheckHash
 configs/rock64_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/raspberrypi/patches/linux-headers/linux-headers.hash b/board/raspberrypi/patches/linux-headers/linux-headers.hash
new file mode 100644
index 0000000000..2843b7023d
--- /dev/null
+++ b/board/raspberrypi/patches/linux-headers/linux-headers.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  4d3a2af178ac6ed8f35b773836c8d216493a850aeb80932b379348e2df0cf5d2  linux-17f135b742c4edb340afb365873c3a574f7e16cb.tar.gz
diff --git a/board/raspberrypi/patches/linux/linux.hash b/board/raspberrypi/patches/linux/linux.hash
new file mode 100644
index 0000000000..2843b7023d
--- /dev/null
+++ b/board/raspberrypi/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  4d3a2af178ac6ed8f35b773836c8d216493a850aeb80932b379348e2df0cf5d2  linux-17f135b742c4edb340afb365873c3a574f7e16cb.tar.gz
diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
index 6bff1ebf81..74a8477cc6 100644
--- a/configs/raspberrypi0_defconfig
+++ b/configs/raspberrypi0_defconfig
@@ -2,6 +2,10 @@ BR2_arm=y
 BR2_arm1176jzf_s=y
 BR2_ARM_EABIHF=y
 
+# patches
+BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 # Linux headers same as kernel, a 6.1 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defconfig
index ac72d49f92..03f6a805e6 100644
--- a/configs/raspberrypi0w_defconfig
+++ b/configs/raspberrypi0w_defconfig
@@ -2,6 +2,10 @@ BR2_arm=y
 BR2_arm1176jzf_s=y
 BR2_ARM_EABIHF=y
 
+# patches
+BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 # Linux headers same as kernel, a 6.1 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index dee9a0b23f..79de3fbf3e 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -3,6 +3,10 @@ BR2_cortex_a7=y
 BR2_ARM_EABIHF=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
+# patches
+BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index 6871dc0fe0..5460cd8c62 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -2,6 +2,10 @@ BR2_aarch64=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_VFPV4=y
 
+# patches
+BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index f0e7b82191..eded94014d 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -2,6 +2,10 @@ BR2_arm=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
+# patches
+BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
index 532b3ed686..72e1c349f2 100644
--- a/configs/raspberrypi3_qt5we_defconfig
+++ b/configs/raspberrypi3_qt5we_defconfig
@@ -2,6 +2,10 @@ BR2_arm=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
+# patches
+BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
index 453bbe9440..8da3ecee12 100644
--- a/configs/raspberrypi4_64_defconfig
+++ b/configs/raspberrypi4_64_defconfig
@@ -2,6 +2,10 @@ BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_ARM_FPU_VFPV4=y
 
+# patches
+BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
diff --git a/configs/raspberrypi4_defconfig b/configs/raspberrypi4_defconfig
index 1ed5d34b56..2c37631396 100644
--- a/configs/raspberrypi4_defconfig
+++ b/configs/raspberrypi4_defconfig
@@ -2,6 +2,10 @@ BR2_arm=y
 BR2_cortex_a72=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
+# patches
+BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 01b4353b84..c911ec63e9 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -2,6 +2,10 @@ BR2_arm=y
 BR2_arm1176jzf_s=y
 BR2_ARM_EABIHF=y
 
+# patches
+BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 BR2_SYSTEM_DHCP="eth0"
 
 # Linux headers same as kernel, a 6.1 series
diff --git a/configs/raspberrypicm4io_64_defconfig b/configs/raspberrypicm4io_64_defconfig
index d53711c3a7..75077263e4 100644
--- a/configs/raspberrypicm4io_64_defconfig
+++ b/configs/raspberrypicm4io_64_defconfig
@@ -2,6 +2,10 @@ BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_ARM_FPU_VFPV4=y
 
+# patches
+BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
diff --git a/configs/raspberrypicm4io_defconfig b/configs/raspberrypicm4io_defconfig
index 4b50dc9ef9..07adb962a4 100644
--- a/configs/raspberrypicm4io_defconfig
+++ b/configs/raspberrypicm4io_defconfig
@@ -2,6 +2,10 @@ BR2_arm=y
 BR2_cortex_a72=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
+# patches
+BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
diff --git a/configs/raspberrypizero2w_defconfig b/configs/raspberrypizero2w_defconfig
index e152889f2d..0b1457f407 100644
--- a/configs/raspberrypizero2w_defconfig
+++ b/configs/raspberrypizero2w_defconfig
@@ -2,6 +2,10 @@ BR2_arm=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
+# patches
+BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 # Linux headers same as kernel, 6.1 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
