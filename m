Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A824D0C615
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 14:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0550440A7A;
	Fri, 25 Oct 2024 14:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oEvQCU8HyjZm; Fri, 25 Oct 2024 14:07:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6CA440939
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6CA440939;
	Fri, 25 Oct 2024 14:07:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BFF7E2318
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E28481416
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FntoTaYQvvRD for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 14:07:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.168.131;
 helo=mx0a-0031df01.pphosted.com; envelope-from=bcain@quicinc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 424BB8143C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 424BB8143C
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 424BB8143C
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:26 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PB5nqO015403
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:25 GMT
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ga5jrjta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PE7O00028948
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:24 GMT
Received: from hu-bcain-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 25 Oct 2024 07:07:24 -0700
From: Brian Cain <bcain@quicinc.com>
To: <buildroot@buildroot.org>
CC: Brian Cain <bcain@quicinc.com>
Date: Fri, 25 Oct 2024 07:07:10 -0700
Message-ID: <20241025140714.2395033-9-bcain@quicinc.com>
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
X-Proofpoint-ORIG-GUID: tIpuAoitOKWE0UtKNtVc4J2t5dvZUaD8
X-Proofpoint-GUID: tIpuAoitOKWE0UtKNtVc4J2t5dvZUaD8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 mlxlogscore=522 malwarescore=0 clxscore=1015
 priorityscore=1501 adultscore=0 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250109
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Hq7CP0HcmpiDKb2yzFM0ThPKriC7MmfOt/svriG/M+o=; b=RM9viu4RXW89yIUh
 NQiop3/FzKBU5M6Pfdiqjtdn/4wOPpNMX07Bin/E2d6wRjjEUqMX4QHMvHNw7+md
 sHtKSh1OuagRwXCmVRNAFfxEi2S9xqpQmEHJ2fDRxK0/N802MbL91HcZRcYpz9Tz
 lf2+wcr9+4f6WyEd4tAOVw/0o/YWAsMH7aVENCQu1FIfMvQe/kmAK+tM7v6JIzsC
 rf78gW4FSAJMvg7hD78uWBk0sA4/PnNup5CofPIYihwJCpQSzH7e2+RixQbxkiqf
 +2vlt/fFsIcu4iJH/ff1IWZ3umu/WMotKEWoMwu+lAWPEeiz6iRRIeodjnC85lZH
 UKes5g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=quicinc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.a=rsa-sha256 header.s=qcppdkim1 header.b=RM9viu4R
Subject: [Buildroot] [RFC 08/12] package/hexagonMVM: new package
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

MiniVM is a virtual machine used by the Linux kernel for
the hexagon architecture.

Signed-off-by: Brian Cain <bcain@quicinc.com>
---
 package/Config.in                  |  1 +
 package/hexagonMVM/Config.in       |  8 ++++++++
 package/hexagonMVM/hexagonMVM.hash |  5 +++++
 package/hexagonMVM/hexagonMVM.mk   | 27 +++++++++++++++++++++++++++
 4 files changed, 41 insertions(+)
 create mode 100644 package/hexagonMVM/Config.in
 create mode 100644 package/hexagonMVM/hexagonMVM.hash
 create mode 100644 package/hexagonMVM/hexagonMVM.mk

diff --git a/package/Config.in b/package/Config.in
index b43e11b806..97c15c274f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2816,6 +2816,7 @@ menu "System tools"
 	source "package/ftop/Config.in"
 	source "package/getent/Config.in"
 	source "package/gkrellm/Config.in"
+	source "package/hexagonMVM/Config.in"
 	source "package/htop/Config.in"
 	source "package/ibm-sw-tpm2/Config.in"
 	source "package/initscripts/Config.in"
diff --git a/package/hexagonMVM/Config.in b/package/hexagonMVM/Config.in
new file mode 100644
index 0000000000..b00666188b
--- /dev/null
+++ b/package/hexagonMVM/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HEXAGONMVM
+	bool "Hexagon MiniVM"
+	depends on BR2_hexagon && BR2_TOOLCHAIN_CLANG_AT_LEAST_19_0
+	help
+	  Hexagon VM implementation.  This virtual machine can be used
+	  to boot linux or other operating systems / programs.
+
+	  https://github.com/quic/hexagonMVM
diff --git a/package/hexagonMVM/hexagonMVM.hash b/package/hexagonMVM/hexagonMVM.hash
new file mode 100644
index 0000000000..a1830939d3
--- /dev/null
+++ b/package/hexagonMVM/hexagonMVM.hash
@@ -0,0 +1,5 @@
+
+#
+# Locally computed
+sha256  e5e3ba941af491cab37ece5db85eb7422db9dd0d13464ea528dbf2c01c24b5f0  LICENSE
+sha256  a2ad5745e597d8401f696cba27eaaedac4dd43ebe0835f11daf90a8e8c307fa7  0.1.3.tar.gz
diff --git a/package/hexagonMVM/hexagonMVM.mk b/package/hexagonMVM/hexagonMVM.mk
new file mode 100644
index 0000000000..33e45792e0
--- /dev/null
+++ b/package/hexagonMVM/hexagonMVM.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# Hexagon MiniVM
+#
+################################################################################
+
+HEXAGONMVM_VERSION = 0.1.3
+HEXAGONMVM_SOURCE = $(HEXAGONMVM_VERSION).tar.gz
+HEXAGONMVM_SITE = $(call github,quic,hexagonMVM,v$(HEXAGONMVM_VERSION))
+
+HEXAGONMVM_LICENSE = BSD-3-Clause
+HEXAGONMVM_LICENSE_FILES = LICENSE
+
+HEXAGONMVM_DEPENDENCIES =
+HEXAGONMVM_INSTALL_IMAGES = YES
+
+HEXAGONMVM_CFLAGS=-fno-pie -fno-pic
+
+define HEXAGONMVM_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(HEXAGONMVM_CFLAGS)" -C $(@D) minivm
+endef
+
+define HEXAGONMVM_INSTALL_IMAGES_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(HEXAGONMVM_CFLAGS)" bindir=$(BINARIES_DIR) -C $(@D) install
+endef
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
