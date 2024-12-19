Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED535E77184
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 05:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9EDC8126D;
	Thu, 19 Dec 2024 05:39:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4bjfckHngaF3; Thu, 19 Dec 2024 05:39:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0594C81027
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0594C81027;
	Thu, 19 Dec 2024 05:39:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B898DE9
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B07CF4051D
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:39:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fn_9Ai6xO_iM for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 05:39:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.168.131;
 helo=mx0a-0031df01.pphosted.com; envelope-from=brian.cain@oss.qualcomm.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E743840193
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E743840193
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E743840193
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:39:26 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BIGQxxm000414
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:31:23 GMT
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43m0su9srx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:31:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-2ef8c7ef51dso419107a91.1
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 21:31:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734586282; x=1735191082;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ueYBBUyYyhJ21psN2M8oiMBCcES8vBXa3O3qeGEzFxo=;
 b=lm4FWCMzvky1dsoJ96y2B808HzQRe3a9L4KXQ2dLW+TIcj333S6Pj+wHby6V8lyyn3
 QEQygWoAYrGh27eiozdMhzqmbLXRgLNLUkJ6XtCyvsPsIztPElnF+gdAFRbWtgtnuQVe
 vtT7pzcOJ+J/qr0OKkqaOld7lRBjLKa2D9+p9cG/b3ax+TUcr+e7Qk5BGs3e8/slzPCl
 q1iCR+jgSm7dF3liXJW/bclCA8oa0yjHNtGpBGksxOyv/P84nAN3GJbyKg+MgOGCf3qC
 ahRexPVO0h5brMNIBwwjGfRU2opFSNyxCDFZGjPUrjZGpwrPNOSiN9l0BwSKZQWf8xqf
 PA2g==
X-Gm-Message-State: AOJu0Yz/3IlSUU5fzh3q1kMb3DUagR8Mv+vHI/rxV4DwtEOLU9+EVczN
 o5u8Ws97RTBz0uEqOzNyK2qw+Zmw7e16hRyM+OLVqywiXOQ1H3dz4rHPiIFIPNtQzpIwMNM8ADY
 M3krZ7ihH1Vq9cEmYpcibGvh679QB/r0THEXtzPg+TI8wT0IavsKgfu3SBodx+KmN
X-Gm-Gg: ASbGncsc5Tw8O5yBuSivwa79JoTLdlHeLeVC4AxgvW/n7sr1OczLRYFwPDftwuSttAn
 tG4gwU8Enbs+KmUERpSx2h7xk+qZtgDX+29WEasgoxwmPCGlQYHGeVxv2rP8vuZo82mJkFT3U4x
 Rvf9r2odaGT8jGuziInkgbo5nOX+uDVkF2sEkTotAvsBD2oDSRObU2vfyUIFVOxRhuKzN+KURIH
 7InJ66JykQylcW51xNGPr3uZRXY4DqxPma6JvgYLDlj81YZVV/c0A3quTnhKdQdvvDLLMTidVEU
 JTRzEYV61pWXtbqd+XdMclCqv9ejlg==
X-Received: by 2002:a17:90a:d502:b0:2ef:ad48:7175 with SMTP id
 98e67ed59e1d1-2f4438e4b30mr3024819a91.15.1734586282174; 
 Wed, 18 Dec 2024 21:31:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0aZB0t0ZYEZxzZMAHfK1fKmd+EN51o6+pHaFYA7AnlNYeiUMr2ahjIya9TbgDJsS+ECR9uQ==
X-Received: by 2002:a17:90a:d502:b0:2ef:ad48:7175 with SMTP id
 98e67ed59e1d1-2f4438e4b30mr3024801a91.15.1734586281815; 
 Wed, 18 Dec 2024 21:31:21 -0800 (PST)
Received: from hu-bcain-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f2ed52cf93sm2360676a91.6.2024.12.18.21.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 21:31:21 -0800 (PST)
To: buildroot@buildroot.org, thomas.petazzoni@bootlin.com
Cc: brian.cain@oss.qualcomm.com
Date: Wed, 18 Dec 2024 21:30:50 -0800
Message-Id: <20241219053053.2389046-12-brian.cain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
References: <20241025140714.2395033-1-bcain@quicinc.com>
 <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: EuwaI78uNV-ILduR9NRrw623w0l4I9TI
X-Proofpoint-ORIG-GUID: EuwaI78uNV-ILduR9NRrw623w0l4I9TI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=551 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 phishscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190041
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ueYBBUyYyhJ21psN2M8oiMBCcES8vBXa3O3qeGEzFxo=; b=VGHZU4P1/MD/mV5H
 uxss2h3xnGwpM8jhfAbbU4bsjGUV3N8q5gO8tV7R4I57HSejBTVh2LsddkETji3q
 zlsNa1S9mH+OwaOL9ygydAl/GefX3jmki/qBK0eO/IXXWBWK4nlow6nup9JCzK2d
 bARkdt4HtRtyCkb4taVVEXtiH5kG+90nnd4daxALCT79TgPElkW/u8l+uk6Zdtjg
 3z+tKLZuCpIVCD+wvBYMULHNJRcq3FqaeF+qsWOoDMJdK2VRghFhUNGcc3zJKyTj
 5fRwidw30pKg41lnz/oBWX2NH0KfnXVkGF3yDUTx1IN4FluzgqjcbsOCyQ/Dvb7T
 vomyxg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=oss.qualcomm.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=VGHZU4P1
Subject: [Buildroot] [RFC v2 11/14] DEVELOPERS: add myself as developer for
 hexagon
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
 DEVELOPERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 047dc4a88f..6f111b7294 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3449,3 +3449,11 @@ F:	package/quazip/
 F:	package/shapelib/
 F:	package/simple-mail/
 F:	package/tinc/
+
+N:	Brian Cain <brian.cain@oss.qualcomm.com>
+F:	arch/Config.in.hexagon
+F:	board/qcom/
+F:	configs/qcom_sa8775_cdsp0_defconfig
+F:	configs/qcom_dsp_qemu_defconfig
+F:	package/hexagonMVM/
+F:	toolchain/toolchain-external/toolchain-external-hexagon/
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
