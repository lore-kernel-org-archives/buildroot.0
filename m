Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236C3E77184
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 06:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFD65606EF;
	Thu, 19 Dec 2024 06:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BUX4Lr82yMaK; Thu, 19 Dec 2024 06:07:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3583660857
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3583660857;
	Thu, 19 Dec 2024 06:07:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B2EDC0
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 06:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC43B4058C
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 06:07:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gCtrYZAArTkq for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 06:07:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.168.131;
 helo=mx0a-0031df01.pphosted.com; envelope-from=brian.cain@oss.qualcomm.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B642540563
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B642540563
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B642540563
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 06:07:46 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BIMsKaB012364
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:31:22 GMT
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43m7ka0q8q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:31:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-2ef9864e006so577243a91.2
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 21:31:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734586281; x=1735191081;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3gakxngRw2M7qLOkUniuFX6jOCIt4m/ldbYDhFIGGsc=;
 b=UuZuXBVjNC+dfU74VMWAkSctVFoXG46a5xZfxzOj4/xJPa5PdVuYuJ7gytYZFBn5Q/
 4KUyNF2wqaissm8BXZTD0+V/tp3eO76BQAdQCzUFCtOPnFw1wUCuRxX0ATUefqT3tP29
 tW0Fsxn0MunaBFvF2XBeRL9Oi7OaIDGjy5mpD7RGuS8WE7GtPC7mW27+22IiucYTgZBK
 7MQcNcn6WKAjYpiZNM7Z1mnnrYNN+IjAJoGwq38e/Yr81vOBIyXyWzdjqFQG6D/DPrEZ
 2GREAYQ2c0xWAd9m+zbBGHkLqPcZB+7utHlJDCJO0HTLyRepwCqfvaDA3u5P6RviVEl4
 SWtw==
X-Gm-Message-State: AOJu0YxzzV3i4ecmaz6Na5j4EnHr5PWDj5YGbcWR+lTGS4+ul77N9Ao7
 Fjb37Ign63Iap5F4sUe8EKkggKrm0vrrNL+UfAYLDQKpB7VBEd8/U378WiT/lG9VkQnqtGrFgow
 z3Lc/5Pd4IlAhr0bhS7T8asdZMYxUC4ICd74Kc5Sc/pP6KOvmV1UueAZv5NlQ2j5q
X-Gm-Gg: ASbGncuQd3HWLa58x6OCtxCRbPt91TNOrolJ9eNQCDiDmoRZ/QLtgYwR85OkUR53viU
 tGY8cDo4i/IXhFu/ip3PVk79RzhUJlpEDI30dcHRj1HeL8yxX6qZjV5cbROxu7WEvbPdZGELyxD
 dnZ4VfIW2PJwONq6UutQ3dNnA7pqLQAMHa3VX3pn6ocA+ndhQyPzOOfxfAJMWAiYboYdCUlE3Nl
 931TU1qbgapslq9bHONvbK6oKRNmjxeSA5lS5m0zDx6agqSPsky0iCVjv2GMXNQdCr7497HrIGd
 +PjJw/c3G388Co2CneHgAQ+k89FYkQ==
X-Received: by 2002:a17:90b:274a:b0:2ea:3d2e:a0d7 with SMTP id
 98e67ed59e1d1-2f2e91d6013mr9047378a91.15.1734586281431; 
 Wed, 18 Dec 2024 21:31:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxbx8dWKhe37q14IjMlNSuTOtPMNJIgUF94+r8Q1D8yimwF1FcQO6iWiLP2y5q594+j05dCA==
X-Received: by 2002:a17:90b:274a:b0:2ea:3d2e:a0d7 with SMTP id
 98e67ed59e1d1-2f2e91d6013mr9047350a91.15.1734586281045; 
 Wed, 18 Dec 2024 21:31:21 -0800 (PST)
Received: from hu-bcain-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f2ed52cf93sm2360676a91.6.2024.12.18.21.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 21:31:20 -0800 (PST)
To: buildroot@buildroot.org, thomas.petazzoni@bootlin.com
Cc: brian.cain@oss.qualcomm.com
Date: Wed, 18 Dec 2024 21:30:49 -0800
Message-Id: <20241219053053.2389046-11-brian.cain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
References: <20241025140714.2395033-1-bcain@quicinc.com>
 <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: xn3Y6DAo4cD_BWQW9RrOOPvSCxCjC3zL
X-Proofpoint-ORIG-GUID: xn3Y6DAo4cD_BWQW9RrOOPvSCxCjC3zL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 mlxlogscore=969 bulkscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190041
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3gakxngRw2M7qLOkUniuFX6jOCIt4m/ldbYDhFIGGsc=; b=DBXdNEXpp0UvOASj
 v37QhQhFrH08TSkmbOH9Gj5xe9BYOss9Wtk6UEEcuR8GfSOiCUlw9KzOqcX8nAVG
 i1D2CvaQ1Gsx0i57H31O7oZfAhFDkXSfjko4A1vsli/M1PGxK0+OaxmEShtSNxJn
 vJjaWFH+sJyfzZC64wpq8zXIvBzLxiqqolevQE+VePEeFU4W75ywFsf/wag9yb9A
 SHK0ziThjBsdHS+CbIDBRYmrqBAnt8MIaEe8eT7fFtnIExCosZ7E2d1Y0poXE0PF
 fuyBPTps3SeiKIe/j/WEEn6nXWCOOLASv6C8jQgDMjr2jbe5nvI8xhoKWi8ApAng
 0TJi/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=oss.qualcomm.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com
 header.a=rsa-sha256 header.s=qcppdkim1 header.b=DBXdNEXp
Subject: [Buildroot] [RFC v2 10/14] configs: add hexagon QEMU config
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Brian Cain via buildroot <buildroot@buildroot.org>
Reply-To: Brian Cain <brian.cain@oss.qualcomm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Brian Cain <brian.cain@oss.qualcomm.com>
---
 configs/qcom_dsp_qemu_defconfig | 44 +++++++++++++++++++++++++++++++++
 linux/linux.hash                |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 configs/qcom_dsp_qemu_defconfig

diff --git a/configs/qcom_dsp_qemu_defconfig b/configs/qcom_dsp_qemu_defconfig
new file mode 100644
index 0000000000..cc9b7157ad
--- /dev/null
+++ b/configs/qcom_dsp_qemu_defconfig
@@ -0,0 +1,44 @@
+BR2_hexagon=y
+BR2_HEXAGON_v73=y
+BR2_STATIC_LIBS=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_CLANG=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="https://artifacts.codelinaro.org/artifactory/codelinaro-toolchain-for-hexagon/19.1.5/clang+llvm-19.1.5-cross-hexagon-unknown-linux-musl.tar.zst"
+BR2_TOOLCHAIN_EXTERNAL_REL_BIN_PATH="x86_64-linux-gnu/bin"
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="hexagon-unknown-linux-musl"
+BR2_TOOLCHAIN_EXTERNAL_CLANG_19_0=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_7=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_DEVICE_CREATION_STATIC=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/qcom/sa8775/post_build.sh"
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+BR2_PACKAGE_BZIP2=y
+BR2_PACKAGE_ZLIB=y
+BR2_PACKAGE_LOCKDEV=n
+BR2_PACKAGE_LIBEVENT=n
+BR2_PACKAGE_ATFTP=n
+BR2_PACKAGE_DROPBEAR=y
+BR2_PACKAGE_LSH=y
+
+BR2_PACKAGE_BASH=y
+BR2_PACKAGE_ZSH=y
+
+BR2_PACKAGE_LIQUID_DSP=y
+BR2_PACKAGE_GNURADIO_FFT=y
+
+BR2_PACKAGE_XINETD=n
+BR2_PACKAGE_COREUTILS=y
+BR2_PACKAGE_HEXAGONMVM=y
+BR2_TARGET_ROOTFS_TAR_GZIP=y
+BR2_TARGET_ROOTFS_INITRAMFS=y
+
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="bcain/boot_qemu_v6.11"
+BR2_LINUX_KERNEL_DEFCONFIG="qemu"
+
diff --git a/linux/linux.hash b/linux/linux.hash
index ccf6235166..3c5eaea676 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -9,6 +9,7 @@ sha256  0d0ffae5bf0e6f9c6a1ce42da2bc2a8696ca55721c103497eb1245be8cc04b20  linux-
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
+sha256  a97a6fdc814b57b15107139978369d4efd1474142911e8f76b050874cc9ee3e4  linux-bcain_boot_qemu_v6.11-git4.tar.gz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
