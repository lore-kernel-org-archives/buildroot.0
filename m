Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128CBE7718A
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 05:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B89DC616A2;
	Thu, 19 Dec 2024 05:40:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FxlmSreOmeGt; Thu, 19 Dec 2024 05:40:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABA60617BD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABA60617BD;
	Thu, 19 Dec 2024 05:40:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id ACF58EA
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 618F0408AB
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:40:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hkdycDFb5Mym for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 05:40:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.168.131;
 helo=mx0a-0031df01.pphosted.com; envelope-from=brian.cain@oss.qualcomm.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 416B542579
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 416B542579
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 416B542579
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:40:17 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ1mCBj030487
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:31:16 GMT
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ma4wrdnp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:31:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-2eebfd6d065so555129a91.3
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 21:31:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734586275; x=1735191075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1niBkfGoC/67gSpIfr/lMHWfC6dxgyL7Tln5UaZ57BE=;
 b=Ki8qEDeOhuHx9jA2r6gdbKi5wp+bnwwDepMdkIQIUi5fIsdApdTkxcl7W0N8U82Pma
 GDMs4lr4CveXUoUlhBOKZxMFiTTkEuCpPUHJYIYi8fZ8PgKN7FCCODHFy1EJx8LD2Uky
 ZGiMd5rkmOYZ6ThJIVxkrXTcpzJFcsGckIaQ0pyfS4H1NUntXUeHvwK3EP6K2P+MfN4x
 XvSrj7n1JU/tZCjFhs2Uoebx0qYnsT8KqGMc/WGY3Cjg88PSak2Y7gAFFV+VaBaIoAsv
 XvEd48lpFe9PWo9ogXU3rUiY77kkNDHe/ufbSKNmtusZ6krxW2O/0IZQSMIxJk8jpykD
 L+Qw==
X-Gm-Message-State: AOJu0Ywpj2W9JY2IiUxU240QaeB+JePOx34Byk14Qfd518icEVaIYs1p
 U1eEdVr4eq6AOZmwqVWB775RdSNUeNNn99ooq/kQgZmjVi2b0D3Dau+KFWNoC8ANDFm9nAPsA4x
 8rG4Tcr++nSdfqrOJrd+T2mIHeRJ3zF7GhEnWSovihUcSp0ISBEhdioE81CTC2OQk
X-Gm-Gg: ASbGncv20Hd7QXvybpUgbX2Ndi05fCahElBdUG86kv2EZLp4GLuNrPcMlDATWKI+Gko
 Nyk1KylF8BzmvD4F3ZvkAdt/ygDISBOAxl+6K3/xSyqVfcaRMbV/n9xvPE9NUSzWU37wmvXtUSI
 u4cJ2tInzAavXGGBCbUaOCb7QQf/IBgFlEWBesihpwzipQkborlfXYfNEEeWL3lVbeLOn0lzmsH
 FHdLH3qMVQh40QR+8GsFMSW8o1aDA9Kdqj1U8jV9l+UBvDskpCeT7uou90yHPrww7nT8yItNNlZ
 6bmPOFOOPUNPH+RiG9nEEGyVMkoxYg==
X-Received: by 2002:a17:90b:2743:b0:2ee:53b3:3f1c with SMTP id
 98e67ed59e1d1-2f2e91c4cf6mr8040611a91.5.1734586274823; 
 Wed, 18 Dec 2024 21:31:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbXYGx7fAYGE+/mULpNc3jPMLyrXw7ZZe+r/cDNTmD4CXhKogCBjfW18WT1MilIMBYdMGVJA==
X-Received: by 2002:a17:90b:2743:b0:2ee:53b3:3f1c with SMTP id
 98e67ed59e1d1-2f2e91c4cf6mr8040588a91.5.1734586274452; 
 Wed, 18 Dec 2024 21:31:14 -0800 (PST)
Received: from hu-bcain-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f2ed52cf93sm2360676a91.6.2024.12.18.21.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 21:31:13 -0800 (PST)
To: buildroot@buildroot.org, thomas.petazzoni@bootlin.com
Cc: brian.cain@oss.qualcomm.com
Date: Wed, 18 Dec 2024 21:30:41 -0800
Message-Id: <20241219053053.2389046-3-brian.cain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
References: <20241025140714.2395033-1-bcain@quicinc.com>
 <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: 4gevvJO2dk5IbyW_PMnQLRGKstfU-q9i
X-Proofpoint-ORIG-GUID: 4gevvJO2dk5IbyW_PMnQLRGKstfU-q9i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 mlxlogscore=725 clxscore=1011 spamscore=0 priorityscore=1501 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190041
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1niBkfGoC/67gSpIfr/lMHWfC6dxgyL7Tln5UaZ57BE=; b=TRbwwCsDGCqovJWh
 4dWjvmf9SChEmSst0O1I2ysWlZak/OLoaM0RwqvYZVVHxSIxbmhlsAr0KcooqgWr
 0u9TO6zcWtI9Z6XdDm2iFXBasRJxw1rmZkxLxJRRYeHiYcKBtCRTIeGwrkDpwIHl
 +RYBs7P2HBskq2qoJO3pCDoESxI8QYUkRw5fMPbpfe5To2a59EsX4yXLV33apqjO
 lTWC08Jr3cWK9mz96GcD6IGfaadBEMN/w8byhrDsjTTwfMdzNvrAkRD/tRu45zNw
 EIEyxNYK7kBdwc6YrTMFXY9/NMIReITBMhaf0UhRc7RN4XdbUSqDZPJgsR7fxIf/
 Ek881Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=oss.qualcomm.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com
 header.a=rsa-sha256 header.s=qcppdkim1 header.b=TRbwwCsD
Subject: [Buildroot] [RFC v2 02/14] toolchain/toolchain-external: add
 hexagon toolchain support
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
 toolchain/toolchain-external/Config.in                |  6 ++++++
 .../toolchain-external-hexagon/Config.in              |  7 +++++++
 .../toolchain-external-hexagon/Config.in.options      | 10 ++++++++++
 .../toolchain-external-hexagon.hash                   |  6 ++++++
 .../toolchain-external-hexagon.mk                     | 11 +++++++++++
 5 files changed, 40 insertions(+)
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
index 0000000000..84611fdd9a
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-hexagon/Config.in.options
@@ -0,0 +1,10 @@
+
+if BR2_TOOLCHAIN_EXTERNAL_HEXAGON
+
+config BR2_TOOLCHAIN_EXTERNAL_PREFIX
+	default "hexagon-unknown-linux-musl"
+
+config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+	default "toolchain-external-hexagon"
+
+endif
diff --git a/toolchain/toolchain-external/toolchain-external-hexagon/toolchain-external-hexagon.hash b/toolchain/toolchain-external/toolchain-external-hexagon/toolchain-external-hexagon.hash
new file mode 100644
index 0000000000..acaa7bbe24
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-hexagon/toolchain-external-hexagon.hash
@@ -0,0 +1,6 @@
+# From https://artifacts.codelinaro.org/artifactory/codelinaro-toolchain-for-hexagon/19.1.5/SHA256SUMS:
+sha256 55b41922318f6331590ab7baa7f5dbdd99c109327a9c44a52c5e9878fab148c1  clang+llvm-19.1.5-cross-hexagon-unknown-linux-musl.tar.zst
+sha256 7dd6137d3e6f1516f9b2cf252ef3ca6b5b5b1f24e27423c69d88c32d51d6b483  clang+llvm-19.1.5-cross-hexagon-unknown-linux-musl_aarch64-linux-gnu.tar.zst
+sha256 91795d124c81d27c3829404627a2a06dab0a8683078ac898520d4a81e8853958  clang+llvm-19.1.5-cross-hexagon-unknown-linux-musl_aarch64-windows-gnu.tar.zst
+sha256 f41736f98d6d1d6f03ce6e2b6a032dca9c8d7eba126ca21acce9df7b695c41b0  clang+llvm-19.1.5-cross-hexagon-unknown-linux-musl_x86_64-linux-musl.tar.zst
+sha256 3cacc3cd0e5e531d91a9c70953d6793523c9b954e901a56d02c6b926cbca8690  clang+llvm-19.1.5-cross-hexagon-unknown-linux-musl_x86_64-windows-gnu.tar.zst
diff --git a/toolchain/toolchain-external/toolchain-external-hexagon/toolchain-external-hexagon.mk b/toolchain/toolchain-external/toolchain-external-hexagon/toolchain-external-hexagon.mk
new file mode 100644
index 0000000000..59e763a2e4
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-hexagon/toolchain-external-hexagon.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# toolchain-external-hexagon
+#
+################################################################################
+
+TOOLCHAIN_EXTERNAL_HEXAGON_VERSION = 19.1.5
+TOOLCHAIN_EXTERNAL_HEXAGON_SITE= https://artifacts.codelinaro.org/artifactory/codelinaro-toolchain-for-hexagon/$(TOOLCHAIN_EXTERNAL_HEXAGON_VERSION)
+TOOLCHAIN_EXTERNAL_HEXAGON_SOURCE = clang+llvm-$(TOOLCHAIN_EXTERNAL_HEXAGON_VERSION)-cross-$(TOOLCHAIN_EXTERNAL_PREFIX).tar.zst
+
+$(eval $(toolchain-external-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
