Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80300D0C615
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 14:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 468EC815CD;
	Fri, 25 Oct 2024 14:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GIo7Jc1qM5Nr; Fri, 25 Oct 2024 14:07:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D150581E67
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D150581E67;
	Fri, 25 Oct 2024 14:07:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F5E32318
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47A8B60AED
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sXenPo5DwXGE for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 14:07:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.168.131;
 helo=mx0a-0031df01.pphosted.com; envelope-from=bcain@quicinc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4A63E60658
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A63E60658
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A63E60658
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:26 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PDRkhl028679
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:25 GMT
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42fdtxn5mj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PE7PNO003754
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:25 GMT
Received: from hu-bcain-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 25 Oct 2024 07:07:24 -0700
From: Brian Cain <bcain@quicinc.com>
To: <buildroot@buildroot.org>
CC: Brian Cain <bcain@quicinc.com>
Date: Fri, 25 Oct 2024 07:07:11 -0700
Message-ID: <20241025140714.2395033-10-bcain@quicinc.com>
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
X-Proofpoint-GUID: -ZRr5bzyj36IFPl8wReJEWVsRpxCo9xn
X-Proofpoint-ORIG-GUID: -ZRr5bzyj36IFPl8wReJEWVsRpxCo9xn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 mlxlogscore=659
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250109
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WHT4cXT+c3PyHR7DGypTaE4pPLAR2ZYDzPLikPsy/3w=; b=o/wH3YENwsLOUlbW
 C+CoDSdFBB1HVQ1tz5jnBjA5i24nQUpUMbVRVbSTmvgRrsO8iYveqb/iz+OZNByF
 Dz4AU7FTZ+8DJMwlEKnb8D/uRNkA06Kga7+mF9pv0trFbXx5wOA9QDZMwyNsophM
 FP1113VQTPf+WhsojnYtO6ZNi3W8b5XZdjgVfNbaWFxNIcIDGGjki68AAgwgBIRg
 n5aG0Hdx9rS+Szyj6hrdAKtS9iQDwxd3yVsg+xrTHr79UUzALG9HBJ+iXrnIma+l
 UXxFp4cKdPGmq208dFtBT3srbpUDqm7eLtGZPuzEJgf8+7/2kyWjg9MTmXZ3yid+
 lak6gg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=quicinc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.a=rsa-sha256 header.s=qcppdkim1 header.b=o/wH3YEN
Subject: [Buildroot] [RFC 09/12] board/qcom/sa8775: add support for qcom
 sa8775-cdsp0
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
 board/qcom/sa8775/post_build.sh     |  9 ++++++++
 configs/qcom_sa8775_cdsp0_defconfig | 35 +++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100755 board/qcom/sa8775/post_build.sh
 create mode 100644 configs/qcom_sa8775_cdsp0_defconfig

diff --git a/board/qcom/sa8775/post_build.sh b/board/qcom/sa8775/post_build.sh
new file mode 100755
index 0000000000..af13225d58
--- /dev/null
+++ b/board/qcom/sa8775/post_build.sh
@@ -0,0 +1,9 @@
+#!/bin/bash
+
+TARGETDIR=$1
+
+cat <<EOF >> "${TARGETDIR}/etc/fstab"
+devpts   /dev/pts              devpts  gid=5,mode=620  0 0
+/dev/vda /mnt/persist ext2 defaults 0 0
+debugfs  /sys/kernel/debug      debugfs  defaults  0 2
+EOF
diff --git a/configs/qcom_sa8775_cdsp0_defconfig b/configs/qcom_sa8775_cdsp0_defconfig
new file mode 100644
index 0000000000..e0b49869ca
--- /dev/null
+++ b/configs/qcom_sa8775_cdsp0_defconfig
@@ -0,0 +1,35 @@
+BR2_hexagon=y
+BR2_HEXAGON_v73=y
+BR2_STATIC_LIBS=y
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
+
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
+BR2_PACKAGE_LUA=y
+BR2_PACKAGE_BASH=y
+BR2_PACKAGE_ZSH=y
+
+BR2_PACKAGE_HEXAGONMVM=y
+BR2_PACKAGE_XINETD=n
+BR2_PACKAGE_COREUTILS=y
+BR2_TARGET_ROOTFS_TAR_GZIP=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
