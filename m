Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD6CD0C612
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 14:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0B9C8149E;
	Fri, 25 Oct 2024 14:07:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RNgjsYKsXIvd; Fri, 25 Oct 2024 14:07:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B7FB814AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B7FB814AB;
	Fri, 25 Oct 2024 14:07:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B78E2318
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBF5060658
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wjV90iO7Mhzl for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 14:07:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.168.131;
 helo=mx0a-0031df01.pphosted.com; envelope-from=bcain@quicinc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 370F960626
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 370F960626
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 370F960626
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:25 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PDMpEN028676
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:24 GMT
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42fdtxn5me-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PE7NjF003744
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:23 GMT
Received: from hu-bcain-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 25 Oct 2024 07:07:23 -0700
From: Brian Cain <bcain@quicinc.com>
To: <buildroot@buildroot.org>
CC: Brian Cain <bcain@quicinc.com>
Date: Fri, 25 Oct 2024 07:07:07 -0700
Message-ID: <20241025140714.2395033-6-bcain@quicinc.com>
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
X-Proofpoint-GUID: pM7CCdKgy_U5YKtVJHDKm9flwQ0xvhMy
X-Proofpoint-ORIG-GUID: pM7CCdKgy_U5YKtVJHDKm9flwQ0xvhMy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 mlxlogscore=585
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250109
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lLGvtECen44tQNMwUZNT3YfxiXjlCgpZcKpLpgfqH94=; b=o8d6hbPkdBdiCRp5
 HhrOSMt5w21Q7q6fyCL83GooyMOZKnJPOA0SrTpbEfSUqCH2auLonQT6UiBBAhOE
 DKufk14rfzxMdpTGcHBaDyrOYGoSYPygEuTE/W4SgtEqnfkMhwD+EOtyp4s64DL/
 rm4IHCxEWeT+ur8vbPon4HsY3f4peNSQk635OJ1GZTx28VJnzwPHfM36d1BtV/JJ
 lcMEyJ5x0MyORPrpnKor4dImJWatbBHHQ+ZZCf8KjBzqDiA43mz/E70wAw5ukLhk
 I23S+p3mzXIwWgB1vK9Zi1YaNmR7P/DOZi7lqE9X9ujBGVNHs72FfM7isEFdbdkI
 pT0IIg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=quicinc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=o8d6hbPk
Subject: [Buildroot] [RFC 05/12] toolchain/toolchain-external: skip
 "-march=" for hexagon
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

For hexagon targets, clang rejects "-march" with:

    hexagon-unknown-linux-musl-clang: error: unsupported option '-march=' for target 'hexagon-unknown-linux-musl'

Signed-off-by: Brian Cain <bcain@quicinc.com>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 3948ad1107..8a7c4a5c1e 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -210,9 +210,11 @@ TOOLCHAIN_EXTERNAL_CFLAGS += -m64
 TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_64
 endif
 ifneq ($(GCC_TARGET_ARCH),)
+ifneq ($(BR2_hexagon),y)
 TOOLCHAIN_EXTERNAL_CFLAGS += -march=$(GCC_TARGET_ARCH)
 TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_ARCH='"$(GCC_TARGET_ARCH)"'
 endif
+endif
 ifneq ($(GCC_TARGET_CPU),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -mcpu=$(GCC_TARGET_CPU)
 TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_CPU='"$(GCC_TARGET_CPU)"'
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
