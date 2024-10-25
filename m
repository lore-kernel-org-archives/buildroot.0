Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521A3D0C612
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 14:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E13D240789;
	Fri, 25 Oct 2024 14:07:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q9JWJpnaI0Yj; Fri, 25 Oct 2024 14:07:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D4B540790
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D4B540790;
	Fri, 25 Oct 2024 14:07:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CA7422316
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8F54813D7
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Y6qslJIspEM for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 14:07:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.168.131;
 helo=mx0a-0031df01.pphosted.com; envelope-from=bcain@quicinc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A0A8F81440
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0A8F81440
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0A8F81440
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:24 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49P7Ra84019891
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:24 GMT
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42g6y915g4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PE7MQJ013319
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:22 GMT
Received: from hu-bcain-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 25 Oct 2024 07:07:22 -0700
From: Brian Cain <bcain@quicinc.com>
To: <buildroot@buildroot.org>
CC: Brian Cain <bcain@quicinc.com>
Date: Fri, 25 Oct 2024 07:07:03 -0700
Message-ID: <20241025140714.2395033-2-bcain@quicinc.com>
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
X-Proofpoint-GUID: tJ9HExIav6pXm_Lejtbjuwo0sZ_kzq0V
X-Proofpoint-ORIG-GUID: tJ9HExIav6pXm_Lejtbjuwo0sZ_kzq0V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=510 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250109
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jwRuBSYojCf4zpv/8XQGhhaCGO7Ip2k1ujinmDwY/z8=; b=aVKSTDR7o3iihAcW
 oIdraOs5fsEN7PUqwbKQxyCduv799jI3xMuHRs3Zun9Rn9K74S3iO2tO6mDxU7U0
 B92sI3LmmYoDFPZKAsgUlGEMvQPfqmFbY6hx+sSmzp9TfNsdSgvtYjIP2gsxaKr6
 Z9qcM+Cuq4nFWQHlFOD+JMVo5oIkcRhD2ItJEbPMi3Jl1+TohFi09RgyrYok7d6X
 zB9nk1/cDt2DcymrDauASqBqjD2Ppz2ZVhdEUfIdx9GqPKvG2N9YrR7MYGo5jMgQ
 LPDAtjlL85HrdVX/7zMT3akTfQ3HVL8g2nWdRPCvMMHb31q8Eki+BRgtF+LkzNJI
 1kZWHw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=quicinc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.a=rsa-sha256 header.s=qcppdkim1 header.b=aVKSTDR7
Subject: [Buildroot] [RFC 01/12] arch: add hexagon architecture support
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
 arch/Config.in         | 10 +++++++
 arch/Config.in.hexagon | 63 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 73 insertions(+)
 create mode 100644 arch/Config.in.hexagon

diff --git a/arch/Config.in b/arch/Config.in
index e57f4b2baa..fe863e50a7 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -254,6 +254,12 @@ config BR2_xtensa
 	  http://en.wikipedia.org/wiki/Xtensa
 	  http://www.tensilica.com/
 
+config BR2_hexagon
+	bool "Hexagon"
+	select BR2_USE_MMU
+	help
+	  Hexagon is a Qualcomm DSP processor.
+
 endchoice
 
 # For some architectures or specific cores, our internal toolchain
@@ -429,6 +435,10 @@ if BR2_xtensa
 source "arch/Config.in.xtensa"
 endif
 
+if BR2_hexagon
+source "arch/Config.in.hexagon"
+endif
+
 # Set up target binary format
 choice
 	prompt "Target Binary Format"
diff --git a/arch/Config.in.hexagon b/arch/Config.in.hexagon
new file mode 100644
index 0000000000..9a7cb62278
--- /dev/null
+++ b/arch/Config.in.hexagon
@@ -0,0 +1,63 @@
+# hexagon cpu features
+config BR2_HEXAGON_CPU_HAS_HVX
+	bool
+
+choice
+	prompt "Target Architecture Variant"
+	default BR2_HEXAGON_v65
+	help
+	  Specific CPU variant to use
+
+config BR2_HEXAGON_v5
+	bool "v5"
+config BR2_HEXAGON_v55
+	bool "v55"
+config BR2_HEXAGON_v60
+	bool "v60"
+	select BR2_HEXAGON_CPU_HAS_HVX
+config BR2_HEXAGON_v61
+	bool "v61"
+config BR2_HEXAGON_v62
+	bool "v62"
+	select BR2_HEXAGON_CPU_HAS_HVX
+config BR2_HEXAGON_v65
+	bool "v65"
+	select BR2_HEXAGON_CPU_HAS_HVX
+config BR2_HEXAGON_v66
+	bool "v66"
+	select BR2_HEXAGON_CPU_HAS_HVX
+config BR2_HEXAGON_v68
+	bool "v68"
+	select BR2_HEXAGON_CPU_HAS_HVX
+config BR2_HEXAGON_v69
+	bool "v69"
+	select BR2_HEXAGON_CPU_HAS_HVX
+config BR2_HEXAGON_v71
+	bool "v71"
+	select BR2_HEXAGON_CPU_HAS_HVX
+config BR2_HEXAGON_v73
+	bool "v73"
+	select BR2_HEXAGON_CPU_HAS_HVX
+endchoice
+
+config BR2_ARCH
+	default "hexagon"
+
+config BR2_ENDIAN
+	default "LITTLE"
+
+config BR2_READELF_ARCH_NAME
+	default "Qualcomm Hexagon"
+
+config BR2_GCC_TARGET_CPU
+	default "hexagonv5"	if BR2_HEXAGON_v5
+	default "hexagonv55"	if BR2_HEXAGON_v55
+	default "hexagonv60"	if BR2_HEXAGON_v60
+	default "hexagonv61"	if BR2_HEXAGON_v61
+	default "hexagonv62"	if BR2_HEXAGON_v62
+	default "hexagonv65"	if BR2_HEXAGON_v65
+	default "hexagonv66"	if BR2_HEXAGON_v66
+	default "hexagonv68"	if BR2_HEXAGON_v68
+	default "hexagonv69"	if BR2_HEXAGON_v69
+	default "hexagonv71"	if BR2_HEXAGON_v71
+	default "hexagonv73"	if BR2_HEXAGON_v73
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
