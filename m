Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D743D0C614
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 14:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C107814B1;
	Fri, 25 Oct 2024 14:07:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HdTMSR_Qh7Ge; Fri, 25 Oct 2024 14:07:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95DA8813D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95DA8813D7;
	Fri, 25 Oct 2024 14:07:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DE2DE2318
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C971340147
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VLKwRWO0G9l3 for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 14:07:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.168.131;
 helo=mx0a-0031df01.pphosted.com; envelope-from=bcain@quicinc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0AE9B40173
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AE9B40173
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0AE9B40173
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:24 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PB2LaY001170
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:24 GMT
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ga3s0juh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PE7Ncm028945
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:23 GMT
Received: from hu-bcain-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 25 Oct 2024 07:07:23 -0700
From: Brian Cain <bcain@quicinc.com>
To: <buildroot@buildroot.org>
CC: Brian Cain <bcain@quicinc.com>
Date: Fri, 25 Oct 2024 07:07:06 -0700
Message-ID: <20241025140714.2395033-5-bcain@quicinc.com>
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
X-Proofpoint-ORIG-GUID: OnWzw0MPRsKOuKbvpx3KRw0OD-5f0i1A
X-Proofpoint-GUID: OnWzw0MPRsKOuKbvpx3KRw0OD-5f0i1A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410250109
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /+tcN2J9CcYOlEWw0R4ICfZoCpByqWwC08O6I3pv3jw=; b=dsPuCiRhB8ygOHKK
 sCA2E+C21IyMJbqh9dn64YgzIwwIejOgDslKScraHXuPyIeeQnR6qa0514AfGTyY
 /Un+PZ3QowixWqVEAXHmqWwwz3CQNO21xV/4Lx5vbeDsSPZS1DAodssvEZIZbxZi
 eGxvAGN6kXm2S5upe2+rJOc605KBEH6d9x3MadY+RGQDmC0DW103ifWY8JaCci4G
 DL3zA0D/pN3USNECihkSNsEKhjL9zIDhOQv6L05wrm7sTlL+onn/Rou69agz+Cam
 wNna96vk8Q/ktceblNvB1bxNAaXxD3Ho7xDLAeoK6Il97qmRDxIfJBVtuPs1AOLX
 tEVfAA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=quicinc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.a=rsa-sha256 header.s=qcppdkim1 header.b=dsPuCiRh
Subject: [Buildroot] [RFC 04/12] toolchain/toolchain-external: add support
 for clang
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
 package/Makefile.in                           | 24 ++++--
 toolchain/Config.in                           | 54 +++++++++++++
 toolchain/helpers.mk                          | 16 ++++
 .../pkg-toolchain-external.mk                 | 29 ++++++-
 .../Config.in.options                         | 76 +++++++++++++++++++
 5 files changed, 190 insertions(+), 9 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 829636900b..b54fe123ba 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -231,14 +231,28 @@ ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_7),y)
 TARGET_GCC_WRAPPERS_PREFIX = gcc-
 endif
 
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CLANG),y)
+TARGET_CC_SUFFIX=clang
+TARGET_CXX_SUFFIX=clang++
+TARGET_AS_SUFFIX=llvm-mc
+TARGET_LD_SUFFIX=clang
+TARGET_PREPROCESSOR=clang -E
+else
+TARGET_CC_SUFFIX=gcc
+TARGET_CXX_SUFFIX=g++
+TARGET_AS_SUFFIX=as
+TARGET_LD_SUFFIX=ld
+TARGET_PREPROCESSOR=cpp
+endif
+
 # Define TARGET_xx variables for all common binutils/gcc
 TARGET_AR       = $(TARGET_CROSS)$(TARGET_GCC_WRAPPERS_PREFIX)ar
-TARGET_AS       = $(TARGET_CROSS)as
-TARGET_CC       = $(TARGET_CROSS)gcc
-TARGET_CPP      = $(TARGET_CROSS)cpp
-TARGET_CXX      = $(TARGET_CROSS)g++
+TARGET_AS       = $(TARGET_CROSS)$(TARGET_AS_SUFFIX)
+TARGET_CC       = $(TARGET_CROSS)$(TARGET_CC_SUFFIX)
+TARGET_CPP      = $(TARGET_CROSS)$(TARGET_PREPROCESSOR)
+TARGET_CXX      = $(TARGET_CROSS)$(TARGET_CXX_SUFFIX)
 TARGET_FC       = $(TARGET_CROSS)gfortran
-TARGET_LD       = $(TARGET_CROSS)ld
+TARGET_LD       = $(TARGET_CROSS)$(TARGET_LD_SUFFIX)
 TARGET_NM       = $(TARGET_CROSS)$(TARGET_GCC_WRAPPERS_PREFIX)nm
 TARGET_RANLIB   = $(TARGET_CROSS)$(TARGET_GCC_WRAPPERS_PREFIX)ranlib
 TARGET_READELF  = $(TARGET_CROSS)readelf
diff --git a/toolchain/Config.in b/toolchain/Config.in
index c2522aca7f..1466425ce2 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -837,6 +837,60 @@ config BR2_TOOLCHAIN_GCC_AT_LEAST
 	default "4.4"	if BR2_TOOLCHAIN_GCC_AT_LEAST_4_4
 	default "4.3"	if BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
 
+config BR2_TOOLCHAIN_CLANG_AT_LEAST_4_0
+	bool
+config BR2_TOOLCHAIN_CLANG_AT_LEAST_5_0
+	bool
+config BR2_TOOLCHAIN_CLANG_AT_LEAST_6_0
+	bool
+config BR2_TOOLCHAIN_CLANG_AT_LEAST_7_0
+	bool
+config BR2_TOOLCHAIN_CLANG_AT_LEAST_9_0
+	bool
+config BR2_TOOLCHAIN_CLANG_AT_LEAST_10_0
+	bool
+config BR2_TOOLCHAIN_CLANG_AT_LEAST_11_0
+	bool
+config BR2_TOOLCHAIN_CLANG_AT_LEAST_12_0
+	bool
+config BR2_TOOLCHAIN_CLANG_AT_LEAST_13_0
+	bool
+config BR2_TOOLCHAIN_CLANG_AT_LEAST_14_0
+	bool
+config BR2_TOOLCHAIN_CLANG_AT_LEAST_15_0
+	bool
+config BR2_TOOLCHAIN_CLANG_AT_LEAST_16_0
+	bool
+config BR2_TOOLCHAIN_CLANG_AT_LEAST_17_0
+	bool
+config BR2_TOOLCHAIN_CLANG_AT_LEAST_18_0
+	bool
+config BR2_TOOLCHAIN_CLANG_AT_LEAST_19_0
+	bool
+config BR2_TOOLCHAIN_CLANG_AT_LEAST_20_0
+	bool
+
+# This order guarantees that the highest version is set, as kconfig
+# stops affecting a value on the first matching default.
+config BR2_TOOLCHAIN_CLANG_AT_LEAST
+	string
+	default "4.0"	if BR2_TOOLCHAIN_CLANG_AT_LEAST_4_0
+	default "5.0"	if BR2_TOOLCHAIN_CLANG_AT_LEAST_5_0
+	default "6.0"	if BR2_TOOLCHAIN_CLANG_AT_LEAST_6_0
+	default "7.0"	if BR2_TOOLCHAIN_CLANG_AT_LEAST_7_0
+	default "9.0"	if BR2_TOOLCHAIN_CLANG_AT_LEAST_9_0
+	default "10.0"	if BR2_TOOLCHAIN_CLANG_AT_LEAST_10_0
+	default "11.0"	if BR2_TOOLCHAIN_CLANG_AT_LEAST_11_0
+	default "12.0"	if BR2_TOOLCHAIN_CLANG_AT_LEAST_12_0
+	default "13.0"	if BR2_TOOLCHAIN_CLANG_AT_LEAST_13_0
+	default "14.0"	if BR2_TOOLCHAIN_CLANG_AT_LEAST_14_0
+	default "15.0"	if BR2_TOOLCHAIN_CLANG_AT_LEAST_15_0
+	default "16.0"	if BR2_TOOLCHAIN_CLANG_AT_LEAST_16_0
+	default "17.0"	if BR2_TOOLCHAIN_CLANG_AT_LEAST_17_0
+	default "18.0"	if BR2_TOOLCHAIN_CLANG_AT_LEAST_18_0
+	default "19.0"	if BR2_TOOLCHAIN_CLANG_AT_LEAST_19_0
+	default "20.0"	if BR2_TOOLCHAIN_CLANG_AT_LEAST_20_0
+
 config BR2_TOOLCHAIN_HAS_MNAN_OPTION
 	bool
 	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index f3fdaaec07..f4462db483 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -224,6 +224,22 @@ check_glibc_rpc_feature = \
 		exit 1 ; \
 	fi
 
+check_clang_version = \
+	expected_version="$(strip $2)" ; \
+	exit 0; \
+	real_version=`$(TOOLCHAIN_EXTERNAL_BIN)/llvm-config --version;`; \
+	if [ -z "$${expected_version}" ]; then \
+		printf "Internal error, __$${2}__ vs __$${expected_version}__ clang version unknown (no CLANG_AT_LEAST_X_Y selected)\n"; \
+		printf "real ver: __$${real_version}__\n"; \
+		exit 1 ; \
+	fi; \
+	real_version=`$(TOOLCHAIN_EXTERNAL_BIN)/$(TOOLCHAIN_EXTERNAL_PREFIX)-llvm-config --version;`; \
+	if [[ ! "$${real_version}" =~ ^$${expected_version}\. ]] ; then \
+	printf "Incorrect selection of clang version: expected %s.x, got %s\n" \
+			"$${expected_version}" "$${real_version}" ; \
+		exit 1 ; \
+	fi
+
 #
 # Check the correctness of a glibc external toolchain configuration.
 #  1. Check that the C library selected in Buildroot matches the one
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index d45f2c54de..3948ad1107 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -90,12 +90,28 @@ endif
 TOOLCHAIN_EXTERNAL_SUFFIX = \
 	$(if $(wildcard $(TOOLCHAIN_EXTERNAL_BIN)/*.br_real),.br_real)
 
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CLANG),y)
+TARGET_CC_SUFFIX=clang
+TARGET_CXX_SUFFIX=clang++
+TARGET_BINUTILS_PREFIX=llvm-
+TARGET_LD_SUFFIX=clang
+else
+TARGET_CC_SUFFIX=gcc
+TARGET_CXX_SUFFIX=g++
+TARGET_BINUTILS_PREFIX=
+TARGET_LD_SUFFIX=ld
+endif
+
 TOOLCHAIN_EXTERNAL_CROSS = $(TOOLCHAIN_EXTERNAL_BIN)/$(TOOLCHAIN_EXTERNAL_PREFIX)-
-TOOLCHAIN_EXTERNAL_CC = $(TOOLCHAIN_EXTERNAL_CROSS)gcc$(TOOLCHAIN_EXTERNAL_SUFFIX)
-TOOLCHAIN_EXTERNAL_CXX = $(TOOLCHAIN_EXTERNAL_CROSS)g++$(TOOLCHAIN_EXTERNAL_SUFFIX)
+TOOLCHAIN_EXTERNAL_CC = $(TOOLCHAIN_EXTERNAL_CROSS)$(TARGET_CC_SUFFIX)$(TOOLCHAIN_EXTERNAL_SUFFIX)
+TOOLCHAIN_EXTERNAL_CXX = $(TOOLCHAIN_EXTERNAL_CROSS)$(TARGET_CXX_SUFFIX)$(TOOLCHAIN_EXTERNAL_SUFFIX)
 TOOLCHAIN_EXTERNAL_GDC = $(TOOLCHAIN_EXTERNAL_CROSS)gdc$(TOOLCHAIN_EXTERNAL_SUFFIX)
 TOOLCHAIN_EXTERNAL_FC = $(TOOLCHAIN_EXTERNAL_CROSS)gfortran$(TOOLCHAIN_EXTERNAL_SUFFIX)
 TOOLCHAIN_EXTERNAL_READELF = $(TOOLCHAIN_EXTERNAL_CROSS)readelf
+TOOLCHAIN_EXTERNAL_LLVM_CONFIG = $(TOOLCHAIN_EXTERNAL_CROSS)llvm-config$(TOOLCHAIN_EXTERNAL_SUFFIX)
+TOOLCHAIN_CLANG_VERSION = \
+    `$(TOOLCHAIN_EXTERNAL_LLVM_CONFIG) --version | \
+     sed -e 's/\([0-9]\+\.[0-9]\+\.[0-9]\+\).*$$/\1/'`
 
 # Normal handling of downloaded toolchain tarball extraction.
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
@@ -595,8 +611,13 @@ define $(2)_CONFIGURE_CMDS
 		$$(call toolchain_find_sysroot,$$(TOOLCHAIN_EXTERNAL_CC)),\
 		$$(call qstrip,$$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)),\
 		$$(if $$(BR2_TOOLCHAIN_EXTERNAL_CUSTOM),loose,strict)); \
-	$$(call check_gcc_version,$$(TOOLCHAIN_EXTERNAL_CC),\
-		$$(call qstrip,$$(BR2_TOOLCHAIN_GCC_AT_LEAST))); \
+	if test "$(BR2_TOOLCHAIN_EXTERNAL_GCC)" = "y" ; then \
+		$(call check_gcc_version,$(TOOLCHAIN_EXTERNAL_CC),\
+			$(call qstrip,$(BR2_TOOLCHAIN_GCC_AT_LEAST))); \
+	else \
+		$(call check_clang_version,$(TOOLCHAIN_EXTERNAL_CC),\
+			$(call qstrip,$(BR2_TOOLCHAIN_CLANG_AT_LEAST))); \
+	fi ; \
 	if test "$$(BR2_arm)" = "y" ; then \
 		$$(call check_arm_abi,\
 			"$$(TOOLCHAIN_EXTERNAL_CC) $$(TOOLCHAIN_EXTERNAL_CFLAGS)") ; \
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index fcffeb6b77..0dbf317b92 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -40,8 +40,25 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
 	  so you can leave this option at default value if you use them
 	  as external toolchain.
 
+choice
+	bool "External toolchain Compiler"
+	default BR2_TOOLCHAIN_EXTERNAL_GCC
+	help
+	  Select between gcc and clang
+
+config BR2_TOOLCHAIN_EXTERNAL_GCC
+	bool "gcc"
+	select BR2_TOOLCHAIN_USES_GCC
+
+config BR2_TOOLCHAIN_EXTERNAL_CLANG
+	bool "clang"
+	select BR2_TOOLCHAIN_USES_CLANG
+
+endchoice
+
 choice
 	bool "External toolchain gcc version"
+	depends on BR2_TOOLCHAIN_EXTERNAL_GCC
 	help
 	  Set to the gcc version that is used by your external
 	  toolchain.
@@ -146,6 +163,65 @@ endchoice
 comment "GCC older than 4.8 is not tested by Buildroot. Use at your own risk."
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
+choice
+	bool "External toolchain clang version"
+	default BR2_TOOLCHAIN_EXTERNAL_CLANG_4_0
+	depends on BR2_TOOLCHAIN_EXTERNAL_CLANG
+	help
+	  Set to the clang version that is used by your external
+	  toolchain.
+
+config BR2_TOOLCHAIN_EXTERNAL_CLANG_4_0
+	bool "4.0"
+	select BR2_TOOLCHAIN_CLANG_AT_LEAST_4_0
+config BR2_TOOLCHAIN_EXTERNAL_CLANG_5_0
+	bool "5.0"
+	select BR2_TOOLCHAIN_CLANG_AT_LEAST_5_0
+config BR2_TOOLCHAIN_EXTERNAL_CLANG_6_0
+	bool "6.0"
+	select BR2_TOOLCHAIN_CLANG_AT_LEAST_6_0
+config BR2_TOOLCHAIN_EXTERNAL_CLANG_7_0
+	bool "7.0"
+	select BR2_TOOLCHAIN_CLANG_AT_LEAST_7_0
+config BR2_TOOLCHAIN_EXTERNAL_CLANG_9_0
+	bool "9.0"
+	select BR2_TOOLCHAIN_CLANG_AT_LEAST_9_0
+config BR2_TOOLCHAIN_EXTERNAL_CLANG_10_0
+	bool "10.0"
+	select BR2_TOOLCHAIN_CLANG_AT_LEAST_10_0
+config BR2_TOOLCHAIN_EXTERNAL_CLANG_11_0
+	bool "11.0"
+	select BR2_TOOLCHAIN_CLANG_AT_LEAST_11_0
+config BR2_TOOLCHAIN_EXTERNAL_CLANG_12_0
+	bool "12.0"
+	select BR2_TOOLCHAIN_CLANG_AT_LEAST_12_0
+config BR2_TOOLCHAIN_EXTERNAL_CLANG_13_0
+	bool "13.0"
+	select BR2_TOOLCHAIN_CLANG_AT_LEAST_13_0
+config BR2_TOOLCHAIN_EXTERNAL_CLANG_14_0
+	bool "14.0"
+	select BR2_TOOLCHAIN_CLANG_AT_LEAST_14_0
+config BR2_TOOLCHAIN_EXTERNAL_CLANG_15_0
+	bool "15.0"
+	select BR2_TOOLCHAIN_CLANG_AT_LEAST_15_0
+config BR2_TOOLCHAIN_EXTERNAL_CLANG_16_0
+	bool "16.0"
+	select BR2_TOOLCHAIN_CLANG_AT_LEAST_16_0
+config BR2_TOOLCHAIN_EXTERNAL_CLANG_17_0
+	bool "17.0"
+	select BR2_TOOLCHAIN_CLANG_AT_LEAST_17_0
+config BR2_TOOLCHAIN_EXTERNAL_CLANG_18_0
+	bool "18.0"
+	select BR2_TOOLCHAIN_CLANG_AT_LEAST_18_0
+config BR2_TOOLCHAIN_EXTERNAL_CLANG_19_0
+	bool "19.0"
+	select BR2_TOOLCHAIN_CLANG_AT_LEAST_19_0
+config BR2_TOOLCHAIN_EXTERNAL_CLANG_20_0
+	bool "20.0"
+	select BR2_TOOLCHAIN_CLANG_AT_LEAST_20_0
+
+endchoice
+
 choice
 	bool "External toolchain kernel headers series"
 	default BR2_TOOLCHAIN_EXTERNAL_HEADERS_REALLY_OLD
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
