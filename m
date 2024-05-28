Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE6AC25B7C
	for <buildroot@archiver.kernel.org>; Tue, 28 May 2024 14:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E3438131E;
	Tue, 28 May 2024 14:59:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rHowDMQhDSl0; Tue, 28 May 2024 14:59:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03C3A81337
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03C3A81337;
	Tue, 28 May 2024 14:59:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 107A61D2173
 for <buildroot@lists.busybox.net>; Tue, 28 May 2024 14:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F167940199
 for <buildroot@lists.busybox.net>; Tue, 28 May 2024 14:59:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EKjbh4k1HQtK for <buildroot@lists.busybox.net>;
 Tue, 28 May 2024 14:59:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 09759400B5
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 09759400B5
 for <buildroot@buildroot.org>; Tue, 28 May 2024 14:59:34 +0000 (UTC)
Received: from pps.filterd (m0346909.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 44SErwJ7029482; Tue, 28 May 2024 14:59:33 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3yddsxtkgu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 May 2024 14:59:32 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
 by xusxph004rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 44SExVlQ025114
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 May 2024 14:59:31 GMT
Received: from ciulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 44SExUxS030158
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 28 May 2024 14:59:31 GMT
X-Received: from bspbox.kirk (unknown [10.148.204.208])
 by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id CDDDC10026B8;
 Tue, 28 May 2024 09:59:30 -0500 (CDT)
To: buildroot@buildroot.org
Date: Tue, 28 May 2024 14:59:11 +0000
Message-ID: <20240528145912.68580-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240522165745.1340174-1-brandon.maier@collins.com>
References: <20240522165745.1340174-1-brandon.maier@collins.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_11,2024-05-28_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_11,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 mlxlogscore=659
 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405280112
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 spamscore=0
 phishscore=0 malwarescore=0 mlxlogscore=635 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405280112
X-Proofpoint-GUID: HCEz6g0QFWhGaWCrKUKNv1gv6Zfoh2SK
X-Proofpoint-ORIG-GUID: HCEz6g0QFWhGaWCrKUKNv1gv6Zfoh2SK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_11,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 mlxlogscore=732
 bulkscore=0 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2405280112
X-Mailman-Original-DKIM-Signature: =?UTF-8?Q?v=3D1; _a=3Drsa-sha256;
 _c=3Drelaxed/relaxed; _d=3Dcollins.com; _h?=
 =?UTF-8?Q?=3Dcc:content-transfer-encoding:date:from:in-reply-to:message-i?=
 =?UTF-8?Q?d:mime-version:references:subject:to;_s=3DPOD051818;_bh=3D/7puk?=
 =?UTF-8?Q?/bJRI6GB74AnLXVkJQ60hfWQlFVwo4aHqrTQSw=3D;_b=3DIC03xItqn9uwhS3U?=
 =?UTF-8?Q?KG4Z5cei17HT6Nuhe6D0j+TrAaxMcCgHntu83DY5ux0Q3lKvdvpv_9IygmZKtZV?=
 =?UTF-8?Q?USWZixXdOAr5BGWbCsIJZnI1Zdx+JqB3Ni9OmDprt8i3SrrODlp3AeY/aN_x3fw?=
 =?UTF-8?Q?TJ33wHH/pf1u7pvQ3Lv9wz/4SCq0orFqWHlafiINe2tX0sRiOIK5kmkygCHOpfs?=
 =?UTF-8?Q?9_n4oWnHJwZMu91iF6AYAovkwEILHypckE/OI3RcXec/xPC9VKcDxrCn/78LAFG?=
 =?UTF-8?Q?z6HqcPf_DRAv7MLSaScxbR7F0btZ4R6u037yvXC8BxU6EoOgyEFT+iMzEqU0oDp?=
 =?UTF-8?Q?ral81kAAkFR4x_Kw=3D=3D_?=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
Subject: [Buildroot] [PATCH v2] configs/raspberrypi: add hashes
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
Changes v1 -> v2:
- symlink linux-headers to linux

 .checkpackageignore                                  | 12 ------------
 .../patches/linux-headers/linux-headers.hash         |  1 +
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
 15 files changed, 51 insertions(+), 12 deletions(-)
 create mode 120000 board/raspberrypi/patches/linux-headers/linux-headers.hash
 create mode 100644 board/raspberrypi/patches/linux/linux.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 1070281f98..f6d54361bc 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -321,18 +321,6 @@ configs/qemu_x86_64_defconfig lib_defconfig.ForceCheckHash
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
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/raspberrypi/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
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
