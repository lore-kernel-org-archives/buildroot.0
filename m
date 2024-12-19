Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB6EE77184
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 05:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A986851D0;
	Thu, 19 Dec 2024 05:39:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wskQk3bnp6Ro; Thu, 19 Dec 2024 05:39:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 564E2851C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 564E2851C3;
	Thu, 19 Dec 2024 05:39:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B21B5C0
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E4AE40EB1
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LKvrYOc-TQpm for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 05:39:42 +0000 (UTC)
X-Greylist: delayed 506 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 19 Dec 2024 05:39:42 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 454CE40193
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 454CE40193
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.180.131;
 helo=mx0b-0031df01.pphosted.com; envelope-from=brian.cain@oss.qualcomm.com;
 receiver=<UNKNOWN> 
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 454CE40193
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:39:42 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BIKC8C8012926
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:31:15 GMT
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43m57h10q4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:31:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2166855029eso4650755ad.0
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 21:31:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734586273; x=1735191073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ckN8HmDzcMDI+gs7nGoBeVWaaRJQXFmXGnCz0FuWw2w=;
 b=o/Goar0cZBn/num4vsX1Wvif8NrVtO3OsAdSxcjuyCpKWD6e7d4P1Zgnb9HnELYC4F
 8e922S8ycQ0k4a7YNM1EryzDHU3xQY5S0j2WpPlEM1Ji5n+JzO+UfvpJQXHkncOaJzys
 oZcL0cxrmLU1Ny0aKdL39F5/yvACFjsOrBjYlkUBSLLqOf4K9CAxNXSw33Ty03DZ55oc
 BYtWzHrgiWoQT3igsKqKHDWes494Nb9hVfMa/yB+ZKIp/yrpHt3yzp+HdpNlok48vK4N
 q57rI8TxsqhIuVPZyGKdul3YfMgx2mFhZoR4LmSnLFUHwncbqEULXRJ/0dJ0DRg7EbFH
 Xuwg==
X-Gm-Message-State: AOJu0YzzzfJ2VC8quRRI8ZrL2fHPvmn5sFUls0oJ0wrigA6QxBiXH75S
 26TiUWZyRwVNaPH1SF3YdtAZx4Y+MNTczUPOYGeCuhylnp97xZ3eHgsevJYERLO+e+dt1aesRw0
 UQDlDtLiX+Z0VyMQQwpz77OkIIJVm7h3m3Jb3Aoed3XnYiRjFyRuDKuj2z1mvY3SN
X-Gm-Gg: ASbGncsd2SpNbolvPGLnnvHVxZ4J8uI8IXdsa1mDpwo4eWHwJnB0HUyF5IRGjWMReF5
 n9vWk0YgB5g0Ks7rWBnlP+4N3gUzdNpdgBgBmAxCKtyxLPfIQlIAn81OZiJxFhhLFPrXU/y/NjS
 w3xVqexe3vEIPA/p9vjc5HmjGiR5oNW6yx/0uxCROrM7G93Q+PhlISiK7gSPDWLB0S53w1WPa/u
 ymTR0Dqdf4JpfRZcub2lOwRu4wY/yW+sidJ+BIMrP6KdNEFhzljdjXo3gZOOcWF5rWVoEODSAcl
 4vj4IGehi04U0pOf7aFlMLB1ec4Pig==
X-Received: by 2002:a17:902:ce8c:b0:216:7ee9:220b with SMTP id
 d9443c01a7336-219d96268a0mr31766585ad.22.1734586273537; 
 Wed, 18 Dec 2024 21:31:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETVF6nCVFl0w4OXBmssCQ8KKPQkvzXLzVvFWdVeTAcAV51dwjNIbHjfwQcQIkkZ2sdBNixHg==
X-Received: by 2002:a17:902:ce8c:b0:216:7ee9:220b with SMTP id
 d9443c01a7336-219d96268a0mr31766385ad.22.1734586273164; 
 Wed, 18 Dec 2024 21:31:13 -0800 (PST)
Received: from hu-bcain-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f2ed52cf93sm2360676a91.6.2024.12.18.21.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 21:31:12 -0800 (PST)
To: buildroot@buildroot.org, thomas.petazzoni@bootlin.com
Cc: brian.cain@oss.qualcomm.com
Date: Wed, 18 Dec 2024 21:30:40 -0800
Message-Id: <20241219053053.2389046-2-brian.cain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
References: <20241025140714.2395033-1-bcain@quicinc.com>
 <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: EJC3495GPVwS3GFA-1K6uzzHs6jE6MO6
X-Proofpoint-ORIG-GUID: EJC3495GPVwS3GFA-1K6uzzHs6jE6MO6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 mlxlogscore=594 mlxscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412190041
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ckN8HmDzcMDI+gs7nGoBeVWaaRJQXFmXGnCz0FuWw2w=; b=fPqJbhWlTXIOns3j
 zunrf8OHVecrbUjRR77L0c+skHEHYUdgo8uE3byj0TcT7pvakbBHxmAzKFDsTxEQ
 aMEUgMA1DTCM50OgvAMACW2fb5rd6zSKlxTvD0T/H5zsX4aGAq7D+czWrAQwARul
 s7G3KJEBslXtE4u3JpI2GLWRlR0jStD6BVV8sD/dCBsiUJ586hvkIwOAkEgiM+x/
 AACAXu8Q3HrD03y8aSVlPoW0w1qGintdqxVEctoUU4fGToekH59/+kLH1POXZlNz
 JsgGLfmEyG3ax/3t+AeCFC3q2QBk9zHq9siCkmSM5C58ErhfBBFO12VNT4AEbOnH
 Ez+SKQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=oss.qualcomm.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com
 header.a=rsa-sha256 header.s=qcppdkim1 header.b=fPqJbhWl
Subject: [Buildroot] [RFC v2 01/14] arch: add hexagon architecture support
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
