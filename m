Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A30ED0C614
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 14:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A8578175F;
	Fri, 25 Oct 2024 14:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ROUbDAwULBTg; Fri, 25 Oct 2024 14:07:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06C9481EDD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06C9481EDD;
	Fri, 25 Oct 2024 14:07:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 64885497A
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9070D60631
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 42-OI3W6WcjS for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 14:07:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.168.131;
 helo=mx0a-0031df01.pphosted.com; envelope-from=bcain@quicinc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9BE136064E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BE136064E
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9BE136064E
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:26 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PD6oVh028787
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:26 GMT
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42fdtxn5mk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PE7P7s013326
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:25 GMT
Received: from hu-bcain-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 25 Oct 2024 07:07:24 -0700
From: Brian Cain <bcain@quicinc.com>
To: <buildroot@buildroot.org>
CC: Brian Cain <bcain@quicinc.com>
Date: Fri, 25 Oct 2024 07:07:12 -0700
Message-ID: <20241025140714.2395033-11-bcain@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025140714.2395033-1-bcain@quicinc.com>
References: <20241025140714.2395033-1-bcain@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: AlhihnS_r8EGQ4MZM5ZtgDoSWZPZb6i7
X-Proofpoint-ORIG-GUID: AlhihnS_r8EGQ4MZM5ZtgDoSWZPZb6i7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 mlxlogscore=918
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250109
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ce80l7mQMHNyFqYmIQjaDRC25b8Oi6T1FX9Q/5bdpLE=; b=TL4Ma6XZAXfFtz3Z
 nS/hQgodRsUlSeXnA46Kuq+a1b1m8gGXIHFyzaiA1Nt6AZcw1YXeXyuE49wItmTm
 mIhEmuY6iikcRRcuJhqsEPtCTfZjZMOq45GoHWR2Uk6HiwjoNtu1tDOADprFNajE
 KlgvNgdrY12PQyPSqb+A7M9IzMYjEhrsjegZGexpFCAlfcBPgN22eTzyH3LGzM9l
 Pg7QKMqgTylUhJZLXsbtUKcW/DpuIy6P5QC98/IO6TK4q0p7jT1LlvY0awAX5pK3
 Q1ozlfLNjp8zf7ar/NL+RE9KnGqG7gtKX/iW+w04PLkP6cQygePn174veCLaVNG7
 gSs9sw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=quicinc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.a=rsa-sha256 header.s=qcppdkim1 header.b=TL4Ma6XZ
Subject: [Buildroot] [RFC 10/12] configs: add hexagon QEMU config
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Brian Cain <bcain@quicinc.com>
---
 configs/qcom_dsp_qemu_defconfig | 44 +++++++++++++++++++++++++++++++++
 linux/linux.hash                |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 configs/qcom_dsp_qemu_defconfig

diff --git a/configs/qcom_dsp_qemu_defconfig b/configs/qcom_dsp_qemu_defconfig
new file mode 100644
index 0000000000..f9a976fb91
--- /dev/null
+++ b/configs/qcom_dsp_qemu_defconfig
@@ -0,0 +1,44 @@
+BR2_hexagon=y
+BR2_HEXAGON_v73=y
+BR2_SHARED_LIBS=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_CLANG=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="https://artifacts.codelinaro.org/artifactory/codelinaro-toolchain-for-hexagon/19.1.2/clang+llvm-19.1.2-cross-hexagon-unknown-linux-musl.tar.xz"
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
index 5233de2b0b..ca5581d474 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -11,6 +11,7 @@ sha256  4e27cdf999359876a0ff489bff6ece7ba5798ff37c2289db0c9e9422a9014162  linux-
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
