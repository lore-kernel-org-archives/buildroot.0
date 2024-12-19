Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D281E77184
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 05:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAC22423E1;
	Thu, 19 Dec 2024 05:56:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hX9vSgBvC7iX; Thu, 19 Dec 2024 05:56:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D46FF423EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D46FF423EA;
	Thu, 19 Dec 2024 05:56:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AA4A2C0
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B17760E21
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DICq8icmdtoe for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 05:56:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.168.131;
 helo=mx0a-0031df01.pphosted.com; envelope-from=brian.cain@oss.qualcomm.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8221960E02
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8221960E02
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8221960E02
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:56:47 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BIGR1qg000501
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:31:19 GMT
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43m0su9srn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:31:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-2eedd15c29eso404340a91.3
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 21:31:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734586278; x=1735191078;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+dKkrcoYVawCNhH5gNEUzyjTco/H8SNde6TDKk/45Mw=;
 b=EuxCcj3I3lm1+DAEV7GTY2i7DL2uSkcYEcLhiyB4fKubNunPhOf1VRNB2/q/HCtd91
 HZP1tvAbKg5g7RPZjP3qDLW038GNkVA7hKk2nA+1pqwGQY1gvqrbPtvu6FMIyR6FF3Ci
 IMFnD+YUJ9pLx5HJFkJjmEo/F6urw/UDU0pg6ViJb6QzyIzC2iYHMiu1W9G1lz8e2DnP
 D6a0y/sQlZp0O6IvRNe8OHlKJycKLpmCu6oonwW/+lCrkkcO4NEXil1D5/lr5P8V1k5v
 5N65hiG1vHXSpFsWJLFYMIv1R0bgqsRIZ4woB+XMo6L3r/H5BQKTIE6Gog9E/zNOW7gc
 D00A==
X-Gm-Message-State: AOJu0YzxuM1GnuRXwaMTZc99RGv0tJBiWP3N/zvbe5TZR6Pi8YC13qhv
 5Caqh0y+Z/6JipS4+NBGG0aDvsgGfPQwFiMJ1Q5POgsUJr72/XqCmJsWBzn1N8AkzY/yE8Yi7Uo
 GdzmrEXo3EWgrcL+41X4XgQwL6vY0d4CHiyASHMBRuCdsR6u2zHEaKMjYXA9Ror9T
X-Gm-Gg: ASbGncsp9xiFlcm3GHIJVE3SZTSAjjtW7IUMwBINhEX7ufYXWhAO4gObSoNQ2wB+bC2
 jRIoNZ/TxR9y3q5NqDke68KHzDsXQfwi2bYLoWLOby+F81PIRteJH/EM9I6hnip+1j7Mjl7Apox
 5QtLOZBiUlgNpnfihlRYIBz+jM+H060j5h69p1b13ESC/4+ilyFowSY+8m9Uoaho+TdXQnCSlIO
 9Kj6ebtgGrWiXVqMWPmo5GGKFdmqzoRppaVFEs+YVSgh4W1yg57p1pXq5qQutnmdajIv0AtKLKC
 JzkrcQ2gLC1BCCQAwmT+2v45i3fW+A==
X-Received: by 2002:a17:90b:37c7:b0:2ee:6e22:bfd0 with SMTP id
 98e67ed59e1d1-2f2e91ff17fmr6806220a91.21.1734586278260; 
 Wed, 18 Dec 2024 21:31:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHCaSlWjK/0uJjPYpMcb3zJqAjwU+flXOfvrwG4aqonB8QV+Hlj3BsTxqaqfHEgyCHE5a37Q==
X-Received: by 2002:a17:90b:37c7:b0:2ee:6e22:bfd0 with SMTP id
 98e67ed59e1d1-2f2e91ff17fmr6806190a91.21.1734586277704; 
 Wed, 18 Dec 2024 21:31:17 -0800 (PST)
Received: from hu-bcain-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f2ed52cf93sm2360676a91.6.2024.12.18.21.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 21:31:17 -0800 (PST)
To: buildroot@buildroot.org, thomas.petazzoni@bootlin.com
Cc: brian.cain@oss.qualcomm.com
Date: Wed, 18 Dec 2024 21:30:45 -0800
Message-Id: <20241219053053.2389046-7-brian.cain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
References: <20241025140714.2395033-1-bcain@quicinc.com>
 <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: 8CqY7oZjZmjezVB9MbN2a8bGoRd_k-EW
X-Proofpoint-ORIG-GUID: 8CqY7oZjZmjezVB9MbN2a8bGoRd_k-EW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=846 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1011 phishscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190041
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +dKkrcoYVawCNhH5gNEUzyjTco/H8SNde6TDKk/45Mw=; b=JUWJ3fXRqzEhdGbq
 za/SE/+UdqErZugS52ORRvftJiqGlOtytmTqZCJ/3wpmFbpNpAnvtu2a/o+uesN7
 W0nTeauRKby0V4zgZX1vsjbbEuUh+cVrVsUOLp7Fue6UT8Scp4wHknxIoDrAb1oV
 04dHL8dsIVPjLuMDo9mjyOyL58Uayy+uCqCsESopICMGvfeSt05DUcwkeW5U4rCQ
 6q1aDRMHhHHoKXMhWCMidKH0xbL/pktDWliyp3X2WmjCUOjxF/cdt9wP55U1R5cK
 W4sOMzAfrZbY3Yz1d7w+eY71AIa9Sxw3cgR/lo+xn2Z9lMEsbtG/O/1ALWlYgLu1
 eV8GNA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=oss.qualcomm.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com
 header.a=rsa-sha256 header.s=qcppdkim1 header.b=JUWJ3fXR
Subject: [Buildroot] [RFC v2 06/14] linux: add support for hexagon clang
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
 linux/linux.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 1d3d8fffa6..f6385856d6 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -170,6 +170,16 @@ LINUX_MAKE_FLAGS = \
 	REGENERATE_PARSERS=1 \
 	DEPMOD=$(HOST_DIR)/sbin/depmod
 
+ifeq ($(BR2_hexagon),y)
+LINUX_MAKE_FLAGS += \
+	AS=$(TARGET_CROSS)clang \
+	CC=$(TARGET_CROSS)clang \
+	LD=$(TARGET_CROSS)ld.lld \
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
