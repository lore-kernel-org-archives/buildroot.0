Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3936E77184
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 06:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8134F40748;
	Thu, 19 Dec 2024 06:05:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x7ZapePxwb9W; Thu, 19 Dec 2024 06:05:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 686274082A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 686274082A;
	Thu, 19 Dec 2024 06:05:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 192DEC0
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 06:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3FEA61613
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 06:05:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Fj_mtnPPkS1 for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 06:05:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.168.131;
 helo=mx0a-0031df01.pphosted.com; envelope-from=brian.cain@oss.qualcomm.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4F41561612
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F41561612
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F41561612
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 06:05:18 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ3TVFc002762
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:31:20 GMT
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mbm607c2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:31:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-2ef79403c5eso595458a91.0
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 21:31:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734586279; x=1735191079;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LUNJwh+9Rlu+EV7kDgEVdnzNj4rHbw68vpbzPbBEIIM=;
 b=l7ykcEOJbyr2O5qM9ttyhLk8zGLRNDMWL2f52lfKvoakOKJaeBmaRJnqGEQuEYrhE2
 NaM5Nhkqd1zB5OkpcN27L2wR2ioD6mcp40ayJeJZI6QG/vpmhN6fFQF9vxqKydC1Bc8C
 EaW8Owjzz8bSWZbu2gfnz0zn2u1whmQdaT2UFp4SULefi+drVQ4xbymbRCQPlGVRbFju
 nrSDpzAGN9PunCnYJbuPO+GEFMDw+waq3ZMQVn7XB0Tc/3oIH4Xi+YgmAdZ85/C8WisQ
 Q3i5yAMfN/bFZt/TgtFEjpsXukafHFWaGFeTdZ7U9H2oSaFo7jFI3Hf2T5dqybiYAmcc
 SP/A==
X-Gm-Message-State: AOJu0Yxnq9Vu0w/G8TqQtR6JEyLUEZnFTSWJANFuohvJtNvSlMkKmXqd
 XRvBTJu463j0+VGI3z3WCk1667/dGqGRREVTvPTkEktxIbGh+haeRfLeleLMJXUEEspEF/TIsiG
 t7Is504+7wNmsu+wlzjUE1fVSugcYyxAm8/bR0rR3ZVYF67izHGxWuY61vnSPHEc7
X-Gm-Gg: ASbGncvbfgr7h1f1L0c5GP+fRz4cpFd+qL6+NV2a0U21X9PuKboP7DBlK+SyXKdOGUq
 u6jm5buXKm4Sy87zFItI2+2auS5hlbfa3UD4hvLQPlAJ/dsVnTdRD0jAkqlZhtKAPSz34MehjAh
 OHv4E26vFCD7AaKki2thMJkdoBKl0CajKSjdZmJNPYnr4dpwiVjSLOCe3WOAkvzAedbpbmFpMJ5
 bc5pZyHWtJma3HRCqUSPBXpkU7m1q9iPzqu72KVeOHrN+2Sdc6sFhPAGKz03m3cZ4irD5HWdcNV
 V0sILiMTIoxCUUtLHGyoIWfsj9s6QQ==
X-Received: by 2002:a17:90b:6cb:b0:2ee:ee77:2263 with SMTP id
 98e67ed59e1d1-2f2e91a4d0fmr7905679a91.7.1734586278857; 
 Wed, 18 Dec 2024 21:31:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMX6htrZiLBit2B/h8KQtoHwKKGPZcXSfFJX4LaFzeHlkPGnQxZ9iBoEciXemomigH5B1tYA==
X-Received: by 2002:a17:90b:6cb:b0:2ee:ee77:2263 with SMTP id
 98e67ed59e1d1-2f2e91a4d0fmr7905652a91.7.1734586278514; 
 Wed, 18 Dec 2024 21:31:18 -0800 (PST)
Received: from hu-bcain-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f2ed52cf93sm2360676a91.6.2024.12.18.21.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 21:31:18 -0800 (PST)
To: buildroot@buildroot.org, thomas.petazzoni@bootlin.com
Cc: brian.cain@oss.qualcomm.com
Date: Wed, 18 Dec 2024 21:30:46 -0800
Message-Id: <20241219053053.2389046-8-brian.cain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
References: <20241025140714.2395033-1-bcain@quicinc.com>
 <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: qKo5fiREQQ9lNVueKrIsKJlpWSJxRp_a
X-Proofpoint-GUID: qKo5fiREQQ9lNVueKrIsKJlpWSJxRp_a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=743
 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190041
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LUNJwh+9Rlu+EV7kDgEVdnzNj4rHbw68vpbzPbBEIIM=; b=Ed4KBGZIPU422R8M
 LcjXnPOgVdagP27qpORphUwl3Bkye2DsV8K5VUNsjueZKKhTzEX58qot8EotS9bp
 x95Qm9axGYzjlc5t7UFo/EorJd0IbdMFSwDnasSBZsVzpAj3EMkJjmnxieHHV4bx
 t0sfBiYPoK1ME3iQlRIsXCJe0nJ1AyMDAHKh5Ku+23UOPbmcs0dpEH9gNqNS+Tk0
 FCL7OtibYiHvHHTyjqSShINGthWCBkQz8m3zAZrskT7gYqKbUPFSNciiUfdwbaz8
 nQlw4HzNUuxJTMpv5dKtFxouGycb+tzI1WtHTUyrQ8/7VsYH2UyHE6xysMYW5tAV
 H+iARA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=oss.qualcomm.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com
 header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ed4KBGZI
Subject: [Buildroot] [RFC v2 07/14] arch: add hexagon ARCH definition
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
 arch/Config.in.hexagon | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/Config.in.hexagon b/arch/Config.in.hexagon
index 9a7cb62278..4cf1e59e68 100644
--- a/arch/Config.in.hexagon
+++ b/arch/Config.in.hexagon
@@ -43,6 +43,12 @@ endchoice
 config BR2_ARCH
 	default "hexagon"
 
+config BR2_GCC_TARGET_ARCH
+	default "hexagon"
+
+config BR2_NORMALIZED_ARCH
+	default "hexagon"
+
 config BR2_ENDIAN
 	default "LITTLE"
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
