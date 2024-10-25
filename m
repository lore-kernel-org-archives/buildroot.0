Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D9ED0C614
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 14:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BD1740935;
	Fri, 25 Oct 2024 14:07:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6dWVupzM61Dt; Fri, 25 Oct 2024 14:07:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 914A440909
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 914A440909;
	Fri, 25 Oct 2024 14:07:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F6B45E48
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2B7040790
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i9oWYbgPAMr7 for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 14:07:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.168.131;
 helo=mx0a-0031df01.pphosted.com; envelope-from=bcain@quicinc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BAC3F40789
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAC3F40789
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BAC3F40789
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:24 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PDRkhk028679
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:24 GMT
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42fdtxn5mc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PE7MQK013319
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:23 GMT
Received: from hu-bcain-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 25 Oct 2024 07:07:22 -0700
From: Brian Cain <bcain@quicinc.com>
To: <buildroot@buildroot.org>
CC: Brian Cain <bcain@quicinc.com>
Date: Fri, 25 Oct 2024 07:07:04 -0700
Message-ID: <20241025140714.2395033-3-bcain@quicinc.com>
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
X-Proofpoint-GUID: pEpvpEmob6a3XJw9-xhfbgq1X0r0h7Ey
X-Proofpoint-ORIG-GUID: pEpvpEmob6a3XJw9-xhfbgq1X0r0h7Ey
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 mlxlogscore=732
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250109
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qmViaWgDTs0KF+tAJzO3Ua1qM8RKbBnihDte2iWZ0wg=; b=J7cak5Xrq3zbUY3u
 igeoxx3oi191LtI8AhC0i3Ql6eewOhanhW7vnBoR0OeEOfPJ7mL5EZM29/VNgjxF
 nWVC+N57eK9JGooSM1ck0SnLmb4KkmFsbat5d7nbr6pAMoVHKwJq46w097ABszgz
 FFUkyNF3dYzoBJWafIX4F4W/YdFkXiLYtyJF7FcTbw/cKFw3gpebjcC1fhfjIor4
 io7gvFYi+k7VULzcqRL3RkOVV8A5o0EEZf8kgMZV8VJPkCi6dFqsL+cs94UPWMnT
 8zK8GioSZWNU9Buak40OgflTpRSfMkvs+YzhHKn8ywGv1gCW99P4cWncbu/9zR3p
 5zca5g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=quicinc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=J7cak5Xr
Subject: [Buildroot] [RFC 02/12] toolchain/toolchain-external: add hexagon
 toolchain support
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
 toolchain/toolchain-external/Config.in             |  6 ++++++
 .../toolchain-external-hexagon/Config.in           |  7 +++++++
 .../toolchain-external-hexagon/Config.in.options   | 14 ++++++++++++++
 .../toolchain-external-hexagon.hash                |  6 ++++++
 .../toolchain-external-hexagon.mk                  | 14 ++++++++++++++
 5 files changed, 47 insertions(+)
 create mode 100644 toolchain/toolchain-external/toolchain-external-hexagon/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-hexagon/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-hexagon/toolchain-external-hexagon.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-hexagon/toolchain-external-hexagon.mk

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index e91aa16326..7bd5309671 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -29,6 +29,9 @@ source "toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in"
 # MIPS
 source "toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in"
 
+# Hexagon
+source "toolchain/toolchain-external/toolchain-external-hexagon/Config.in"
+
 # Bootlin toolchains, available for virtually all architectures
 source "toolchain/toolchain-external/toolchain-external-bootlin/Config.in"
 
@@ -123,6 +126,9 @@ source "toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in.opt
 # ARM big-endian
 source "toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in.options"
 
+# Hexagon
+source "toolchain/toolchain-external/toolchain-external-hexagon/Config.in.options"
+
 # MIPS
 source "toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in.options"
 
diff --git a/toolchain/toolchain-external/toolchain-external-hexagon/Config.in b/toolchain/toolchain-external/toolchain-external-hexagon/Config.in
new file mode 100644
index 0000000000..256eeb87dc
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-hexagon/Config.in
@@ -0,0 +1,7 @@
+comment "Toolchains available for Hexagon DSP"
+
+config BR2_TOOLCHAIN_EXTERNAL_HEXAGON
+	bool "Clang/LLVM Hexagon Toolchain"
+	depends on BR2_HOSTARCH = "x86_64" || "aarch64"
+	select BR2_TOOLCHAIN_EXTERNAL_CLANG
+	select BR2_TOOLCHAIN_EXTERNAL_MUSL
diff --git a/toolchain/toolchain-external/toolchain-external-hexagon/Config.in.options b/toolchain/toolchain-external/toolchain-external-hexagon/Config.in.options
new file mode 100644
index 0000000000..cb4d6d5420
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-hexagon/Config.in.options
@@ -0,0 +1,14 @@
+
+if BR2_TOOLCHAIN_EXTERNAL_HEXAGON
+
+config BR2_TOOLCHAIN_EXTERNAL_PREFIX
+	default "hexagon-unknown-linux-musl"
+
+config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+	default "toolchain-external-hexagon"
+
+# This feature is not well-tested:
+config BR2_TOOLCHAIN_SUPPORTS_PIE
+	default "n"
+
+endif
diff --git a/toolchain/toolchain-external/toolchain-external-hexagon/toolchain-external-hexagon.hash b/toolchain/toolchain-external/toolchain-external-hexagon/toolchain-external-hexagon.hash
new file mode 100644
index 0000000000..c4c9b3cf36
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-hexagon/toolchain-external-hexagon.hash
@@ -0,0 +1,6 @@
+# From https://artifacts.codelinaro.org/artifactory/codelinaro-toolchain-for-hexagon/19.1.2/SHA256SUMS:
+sha256  082ce7e7b2955a79be4198123a6ff743fddaed6e2da4f0a1974f0153478fb372  clang+llvm-19.1.2-cross-hexagon-unknown-linux-musl.tar.xz
+sha256  c06958b1a6d73e32cc3fc08b5ec15ea3e1f41180defe3142c91e06e05ad70f0b  clang+llvm-19.1.2-cross-hexagon-unknown-linux-musl_aarch64-linux-gnu.tar.xz
+sha256  2c91bcca2d1645987723af7916184f81f287b7b94ab837dd429c8233899ce54d  clang+llvm-19.1.2-cross-hexagon-unknown-linux-musl_aarch64-windows-gnu.tar.xz
+sha256  1e5ef2a070255a917acbce644d4977fc0c19f82105c375f5260bb573cd4bbf0f  clang+llvm-19.1.2-cross-hexagon-unknown-linux-musl_x86_64-linux-musl.tar.xz
+sha256  f758e9e19ceac201ddd869a9aff6ffe623339e91329f7daf90960cf6218af278  clang+llvm-19.1.2-cross-hexagon-unknown-linux-musl_x86_64-windows-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-hexagon/toolchain-external-hexagon.mk b/toolchain/toolchain-external/toolchain-external-hexagon/toolchain-external-hexagon.mk
new file mode 100644
index 0000000000..f8df9c020c
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-hexagon/toolchain-external-hexagon.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# toolchain-external-hexagon
+#
+################################################################################
+
+TOOLCHAIN_EXTERNAL_HEXAGON_VERSION = 19.1.2
+TOOLCHAIN_EXTERNAL_HEXAGON_SITE= https://artifacts.codelinaro.org/artifactory/codelinaro-toolchain-for-hexagon/$(TOOLCHAIN_EXTERNAL_HEXAGON_VERSION)
+TOOLCHAIN_EXTERNAL_HEXAGON_SOURCE = clang+llvm-$(TOOLCHAIN_EXTERNAL_HEXAGON_VERSION)-cross-$(TOOLCHAIN_EXTERNAL_PREFIX).tar.xz
+
+# No trampoline support in lld yet, so for now:
+TOOLCHAIN_EXTERNAL_HEXAGON_CFLAGS += -mlong-calls
+
+$(eval $(toolchain-external-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
