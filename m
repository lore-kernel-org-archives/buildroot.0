Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583CBD0C615
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 14:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2476881B71;
	Fri, 25 Oct 2024 14:07:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TdJ0Y_82M3Gu; Fri, 25 Oct 2024 14:07:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42B4281C21
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42B4281C21;
	Fri, 25 Oct 2024 14:07:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 58C55497A
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 475AC60626
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZESKMV0GgLay for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 14:07:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.168.131;
 helo=mx0a-0031df01.pphosted.com; envelope-from=bcain@quicinc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B13356064E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B13356064E
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B13356064E
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:25 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PB62Oa015727
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:25 GMT
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ga5jrjt9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PE7OXG003747
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:24 GMT
Received: from hu-bcain-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 25 Oct 2024 07:07:23 -0700
From: Brian Cain <bcain@quicinc.com>
To: <buildroot@buildroot.org>
CC: Brian Cain <bcain@quicinc.com>
Date: Fri, 25 Oct 2024 07:07:08 -0700
Message-ID: <20241025140714.2395033-7-bcain@quicinc.com>
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
X-Proofpoint-ORIG-GUID: PYud-0TLvszPlM-aHATKmDbwZ1tlhQqx
X-Proofpoint-GUID: PYud-0TLvszPlM-aHATKmDbwZ1tlhQqx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 mlxlogscore=704 malwarescore=0 clxscore=1015
 priorityscore=1501 adultscore=0 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250109
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 o7DGHq64hlF+NVUeEuDkuNHZuBltesGCTk0OHxXmbNw=; b=Mjj/sMvV3LcnwjRY
 ZUqSz2i6yv4+nxSYBukODlgvOOpVz1GaHVeqN7W+hnA26fa4ajC34yrC+5WGj1q2
 TJQGhUCONCUzcLUkzn+SBo33qxrsRJn2uGkK6uT1fAVbXog6Vk4TmWiQmTvs0+xW
 kCbi5on2MIGieaUgjKwFxvzzeolafVSEZcReWDkQu8QmY+t3txxJYBsY+Z8WV8F7
 rUyhZyz8v9eEmRoAHXYEBMx2eU9GZlz0c/gfeso0KmZ/rxIl1oasfQA3ltus3r+V
 ttgjRSy/8adACXgR/B1oH9e3nmniWcIAIBuqeKDi596JnGcHN8sABDHObZIWv6wB
 shGung==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=quicinc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mjj/sMvV
Subject: [Buildroot] [RFC 06/12] linux: add support for hexagon clang
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
 linux/linux.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 469a80db9f..f5d2a9e763 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -170,6 +170,16 @@ LINUX_MAKE_FLAGS = \
 	REGENERATE_PARSERS=1 \
 	DEPMOD=$(HOST_DIR)/sbin/depmod
 
+ifeq ($(BR2_hexagon),y)
+LINUX_MAKE_FLAGS += \
+	AS=$(TARGET_CROSS)clang \
+	CC=$(TARGET_CROSS)clang \
+	LD=ld.lld \
+	LLVM_IAS=1 \
+	LLVM=1 \
+	$()
+endif
+
 ifeq ($(BR2_REPRODUCIBLE),y)
 LINUX_MAKE_ENV += \
 	KBUILD_BUILD_VERSION=1 \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
