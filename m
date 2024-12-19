Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4480FE77184
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 05:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD0A060781;
	Thu, 19 Dec 2024 05:37:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kIOs0mbiiQRy; Thu, 19 Dec 2024 05:37:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D05EC6178F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D05EC6178F;
	Thu, 19 Dec 2024 05:37:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 83062C0
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64E8280DE0
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:37:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lXm6AWZD-KAU for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 05:37:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.168.131;
 helo=mx0a-0031df01.pphosted.com; envelope-from=brian.cain@oss.qualcomm.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B0F3A80DC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0F3A80DC1
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0F3A80DC1
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:37:24 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BIMrYdi011886
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:31:18 GMT
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43m7ka0q8j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:31:18 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-2efa0eb9cfeso430566a91.0
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 21:31:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734586277; x=1735191077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iwQn76jcONj5XOxVgIKldbk3Y85uc3+Dml+P2jCWwXk=;
 b=VEu6mAoh52/qb/t+dQE82tdx9apkcotNsRqn1FzwRLLGMi2iyY1SIELssDifX0xwYM
 Bh+rEIXF6kcAMj3IlI7lcHXtRA47OMd60LouenX6WEz1cUx0luAo6chd1P5Pdy1Nx2h7
 v3vt7Aq93fBwzwfUsqMM4v63aUz/yI0Ss9abkleB70d+OQnSWTFCfvHYsPKOTpkRFAtv
 MbvRMKinxgmedDM4gWboCprhpQldLo8jYtE0DI6CSnrs6RQq80kw89366fd1Li/trizv
 1iOp0YyKprU4fMrZDN4C852S3TZwtfaH/09g+fDEyDaH6Ud7XWuOfcxsMcqZrpEh0W8/
 H0sw==
X-Gm-Message-State: AOJu0YxnhYS2XCmS/YBtdXRbkaI4WC+DLSZhDEksit6DeXxilMvudLFE
 S6jwTTCRcn64mR0sadwaqaOfFyLqqRaRcnS8uePKZGLkfXjU3886Vn3VaULpLNP4wU6BZOgA+O/
 qXbfFXtVhjX6vrxeaLtZL4nv61ciT6wrffkUicG16O4CDxNk14tpw8Izwdsc7Ddpe
X-Gm-Gg: ASbGnctqVK/fUqm7rnK8k3M7Ldb9qpnGF/sHk4n5ACWaw6g3D3XY9iU6wo4wIzWbpLM
 bMj5qJgW/87HOW0ixCOct3wlemEPmfoPAnjhIKSdtoeW3cTOstnCentCoQDGitU4u0Q0l7A6ZND
 eBaoINWQyMK1sIoSWBQwxZmUIqsAJAFHkJVP24S8ArnGFQTac2KnRAmUv7HHyELrNJQpdv19TR7
 7modoNrILxYgIk6aInltU9Nz/EzRw8oMBQj3OxMjfm1XNOxNjJLh85CXQ0G9vr1pLIVi3mTJX4G
 91ET+FZBS3wNAJpJVyW+WOlMKHA7xg==
X-Received: by 2002:a17:90b:1f82:b0:2ee:5a82:433a with SMTP id
 98e67ed59e1d1-2f44378c618mr2956059a91.17.1734586277297; 
 Wed, 18 Dec 2024 21:31:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEB/r0wIwQEXeTBdlIRtKs55pQ9ZOMI4GiNhH8jbtPf9A+LUDypJ9BQyJuO05BMNot112Bp5Q==
X-Received: by 2002:a17:90b:1f82:b0:2ee:5a82:433a with SMTP id
 98e67ed59e1d1-2f44378c618mr2956036a91.17.1734586276926; 
 Wed, 18 Dec 2024 21:31:16 -0800 (PST)
Received: from hu-bcain-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f2ed52cf93sm2360676a91.6.2024.12.18.21.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 21:31:16 -0800 (PST)
To: buildroot@buildroot.org, thomas.petazzoni@bootlin.com
Cc: brian.cain@oss.qualcomm.com
Date: Wed, 18 Dec 2024 21:30:44 -0800
Message-Id: <20241219053053.2389046-6-brian.cain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
References: <20241025140714.2395033-1-bcain@quicinc.com>
 <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: 1KOOjAY2iraFeEk6wUkamnFf4vN9Fhiv
X-Proofpoint-ORIG-GUID: 1KOOjAY2iraFeEk6wUkamnFf4vN9Fhiv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 mlxlogscore=669 bulkscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190041
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iwQn76jcONj5XOxVgIKldbk3Y85uc3+Dml+P2jCWwXk=; b=Is9VU0cW9DwGei2B
 rDAY/jYN116gY3zjorocItNAKzEFUsdseopBo+YXGP75jDE6NkGUqUfrjt6hO0zS
 moz/tO31OVYnkc3PikauWD3uVx63wDB8I0aDSPLx+eGNGq6f5EHVlwqcdceQ5Ix9
 bQLMXsZDBKWaAv5fLTAb8OPUCP5u7JYcM4RRGmoSw2eruM2M/gBlJ72l5YgUWlIE
 Wjr766aA3deTazaRlWfCfe46rV3ZLx2ali4JdZ1aOJ/lK1M9SOO20fJ54ijPuokU
 S9oUmJsswzqoqkMeDMTg0QajFVkiftL2DG/yNFUo1QuCSIYIVOOJKV6Nc7tMdLqI
 p3H+4Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=oss.qualcomm.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com
 header.a=rsa-sha256 header.s=qcppdkim1 header.b=Is9VU0cW
Subject: [Buildroot] [RFC v2 05/14] toolchain/toolchain-external: skip
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
From: Brian Cain via buildroot <buildroot@buildroot.org>
Reply-To: Brian Cain <brian.cain@oss.qualcomm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For hexagon targets, clang rejects "-march" with:

    hexagon-unknown-linux-musl-clang: error: unsupported option '-march=' for target 'hexagon-unknown-linux-musl'

Signed-off-by: Brian Cain <brian.cain@oss.qualcomm.com>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index cc36b0bcfd..44891e638f 100644
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
