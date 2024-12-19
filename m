Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1CAE7718A
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 05:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63A5980EB0;
	Thu, 19 Dec 2024 05:37:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lOTt1cW0y357; Thu, 19 Dec 2024 05:37:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67D0E81027
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67D0E81027;
	Thu, 19 Dec 2024 05:37:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 46660E9
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2683080EE9
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T1z4JchhjOId for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 05:37:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.168.131;
 helo=mx0a-0031df01.pphosted.com; envelope-from=brian.cain@oss.qualcomm.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5FF5080EDB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FF5080EDB
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5FF5080EDB
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:37:31 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ3Sdt1001985
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:31:25 GMT
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mbm607c8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:31:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-2ee3206466aso1397341a91.1
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 21:31:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734586284; x=1735191084;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0D0Cec3RRA2l+11JTg7bXKqwplBgnI+nYBk8KKdVDak=;
 b=OD4/3Pf/l/UL53UsELFCJ7gc2ri68qGoKa+s2jlYiw80A0GtpbfYf+QjmRQaIoLAu5
 +rym6Ths1tCv04VL9xS4EIlEQjKxwzVTzmGTTXlOvtyqxmlH+0RlQpxhY1BWti4faR74
 iG8o33ybfFKpRQkE1FAwNi96LnEIV9cqm9MUXTP8lzFBDmcauQttk4MfDQnAiqHPWH24
 /yVTAe3XbsfQr/lYTKUWNBb8VAYX3UueT+tjmTEZAGLJyVL23177PQXzA1FFINoNXB0u
 eAuyuRQ22dWYgaMhmSPz4ZxZ3YLbCY/OYm3ogfXh0R9zpC5dJ6OOvwSTU6LlRMCBK120
 VKKA==
X-Gm-Message-State: AOJu0YyplIhlebGkHBaDpDwP6mQg+5hk4d/fQSCs3B/xpF1Yb9A5NXzo
 t51Ue5niKSPa3JUuawgxQlibVIaURHgqi3BmsEnwCIACeW8qP5jJwjZ/P4tnEMS1KPVT+ytwxvr
 Fnh4yp4FS7hateMRulhA1UGRze3kP8Tz6UXr61foD2BHJNx7FSjHSkoLyzhGP8yT2
X-Gm-Gg: ASbGncvfsPe8fdybMSz3Iu5G+9JUjfrf5xhcB7jSFnFzYitYqCxq29l6O2Y6atde7PU
 HKpQR4ZIRS6jcXbJSQDgde370ULnBajX595/0NxDd8ZBnEo3TTCmGNlnPAVmiXmvTFUzkEi/6iH
 xKC9TBm7WoBqHZnePdEcaXGXCaDH+mh+XOQUqVnJW+NWt1BD6NDEqDrp5K0bhBpSf8eE5vfcOKR
 cEXJv8LS8qt3VJbr5WZDZxgVp7IbGQefimwpjZIB9Oy8KdWzJcRifCAPJ08vxCPxVvCxMmW7saz
 ahnPd0a4yWKGDINW6b8R/Uz/Icn9Pw==
X-Received: by 2002:a17:90b:544f:b0:2ee:8253:9a9f with SMTP id
 98e67ed59e1d1-2f4437bf7c4mr3073511a91.11.1734586283796; 
 Wed, 18 Dec 2024 21:31:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGi8UrgpHBAxshF0hO4uzWHtm6Dy9OMup2eUofdEQ6QwDd/Jc4ztSbBiMISHfX7FdsDE5Smig==
X-Received: by 2002:a17:90b:544f:b0:2ee:8253:9a9f with SMTP id
 98e67ed59e1d1-2f4437bf7c4mr3073479a91.11.1734586283350; 
 Wed, 18 Dec 2024 21:31:23 -0800 (PST)
Received: from hu-bcain-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f2ed52cf93sm2360676a91.6.2024.12.18.21.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 21:31:23 -0800 (PST)
To: buildroot@buildroot.org, thomas.petazzoni@bootlin.com
Cc: brian.cain@oss.qualcomm.com
Date: Wed, 18 Dec 2024 21:30:52 -0800
Message-Id: <20241219053053.2389046-14-brian.cain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
References: <20241025140714.2395033-1-bcain@quicinc.com>
 <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: fkNa6DB_l9SyjqpB4JfiMyumMwaCubGl
X-Proofpoint-GUID: fkNa6DB_l9SyjqpB4JfiMyumMwaCubGl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=816
 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190041
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0D0Cec3RRA2l+11JTg7bXKqwplBgnI+nYBk8KKdVDak=; b=TeMsGrb2o06hp1vW
 /Ish1cgqzBpNpTQXlqcKYtcnvZpK9rojevTYKtYuEk7L4IZAW+lMJk9AKS0SLMLD
 Drsxvo8hyW1l1NwLrJkmbH5+RWWyKW2Sm94FKqeT1x2XlqxOApDKn3ALpojNdVO6
 XrJiwuM55uVRSUqO0ZDV3qvo/zEGSXlrHA5pQjOETQsv/YizrJW+xDkJRKJgM1je
 cma66psNIQexheBmLXO+TJx3Zmf2PoCi6DApYHmSLFQAlFHXen5wDMgMvZWY08WP
 LsPfblsgPtDwVx93uPkPM19lZPFskXYxFR/hOp7NGhDD53j/Q4rNp5WMeuSJIT63
 ZYJnhQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=oss.qualcomm.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com
 header.a=rsa-sha256 header.s=qcppdkim1 header.b=TeMsGrb2
Subject: [Buildroot] [RFC v2 13/14] configs: switch hexagon QEMU to SHARED
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

While we're making this change, set RELRO=NONE because clang rejects
linker args when passed to compiler invocation (from the toolchain-wrapper):

    Command line: `/local/mnt/workspace/upstream/obj_br_qemu/host/bin/hexagon-unknown-linux-musl-clang /local/mnt/workspace/upstream/obj_br_qemu/build/dav1d-1.5.0/build/meson-private/tmpe68fyhas/testfile.c -o /local/mnt/workspace/upstream/obj_br_qemu/build/dav1d-1.5.0/build/meson-private/tmpe68fyhas/output.obj -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -O2 -g0 -D_FILE_OFFSET_BITS=64 -O0 -Werror=implicit-function-declaration -Werror=unknown-warning-option -Werror=unused-command-line-argument -Werror=ignored-optimization-argument -std=c99 -D_GNU_SOURCE` -> 1
    stderr:
    hexagon-unknown-linux-musl-clang: error: -Wl,-z,now: 'linker' input unused [-Werror,-Wunused-command-line-argument]
    hexagon-unknown-linux-musl-clang: error: -Wl,-z,relro: 'linker' input unused [-Werror,-Wunused-command-line-argument]

Signed-off-by: Brian Cain <brian.cain@oss.qualcomm.com>
---
 configs/qcom_dsp_qemu_defconfig | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/configs/qcom_dsp_qemu_defconfig b/configs/qcom_dsp_qemu_defconfig
index cc9b7157ad..dbfc8f1adf 100644
--- a/configs/qcom_dsp_qemu_defconfig
+++ b/configs/qcom_dsp_qemu_defconfig
@@ -1,6 +1,6 @@
 BR2_hexagon=y
 BR2_HEXAGON_v73=y
-BR2_STATIC_LIBS=y
+BR2_SHARED_LIBS=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_CLANG=y
@@ -28,11 +28,16 @@ BR2_PACKAGE_BASH=y
 BR2_PACKAGE_ZSH=y
 
 BR2_PACKAGE_LIQUID_DSP=y
+BR2_PACKAGE_DAV1D=y
+BR2_PACKAGE_CMAKE=y
+BR2_PACKAGE_LUA=y
 BR2_PACKAGE_GNURADIO_FFT=y
 
+BR2_RELRO_NONE=y
+
 BR2_PACKAGE_XINETD=n
 BR2_PACKAGE_COREUTILS=y
-BR2_PACKAGE_HEXAGONMVM=y
+BR2_PACKAGE_HEXAGONMVM=n
 BR2_TARGET_ROOTFS_TAR_GZIP=y
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
