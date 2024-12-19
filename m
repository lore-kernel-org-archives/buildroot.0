Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1915E77184
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 05:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 600BF80DCA;
	Thu, 19 Dec 2024 05:37:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K4uIxYmmIEel; Thu, 19 Dec 2024 05:37:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B78680DEE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B78680DEE;
	Thu, 19 Dec 2024 05:37:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A1C8AE9
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8938680DCA
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:37:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6b6Xt4we3P5S for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 05:37:23 +0000 (UTC)
X-Greylist: delayed 368 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 19 Dec 2024 05:37:23 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 86D8880DC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86D8880DC1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.168.131;
 helo=mx0a-0031df01.pphosted.com; envelope-from=brian.cain@oss.qualcomm.com;
 receiver=<UNKNOWN> 
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 86D8880DC1
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:37:23 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ1lc6g029652
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:31:22 GMT
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ma4wrdp7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:31:21 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-2f2a9f056a8so416969a91.2
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 21:31:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734586281; x=1735191081;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a/1WvvQZZW7Bz+T9K5nNfvIU5ky1agi00Cflnmb6tss=;
 b=eHoUKkwUFbMui9+hCZyrXgHhQUO1+WvVGuP0Lnp3xOHvUMpwwFT9p4je2uuEcNrV5J
 /YXtsY3AfS1rQy1lJUpNjiPDQT7H8Ao5JPB/ica6AiQn0zDJZV8Ui4bAxWqVGIKl1ZhW
 7vHmOg2A5uHZWgYmJfCJDkZevdpbcC0qUcVS2OAkhjGFM+zXLOHQHYeo58Z67ewOVlG/
 +Rap41iYkGiYjcDnaOI3V1Vw/jlE6CowT9eZaLQDIwpTb5zvYg+wVxOB7Esl12DTJrKN
 6m89MR60alYDrteVBowIfosed806e2S7FFbaB0XcOAyV3pXuvijAXHShkXi1UkY3GP5R
 4eXQ==
X-Gm-Message-State: AOJu0Yyf2AO7iIQ0ev3h2K53hw8YT+HLRdldaeCxbRIsMCbwU1gY6NIr
 EcSnfPtALKeszhSbi+c7cWdmfoU4MQjX0nmTEMsvOfrWTWM77mAEMfINSV5XsslO65fMhf2nryV
 PdgA4xKO0B2mS9JlqRphU7LHk9osx80zZEoHayzMuiEThRoW5eXHmGo1LHnj+QTKx
X-Gm-Gg: ASbGncujool9V+x9FA+YI6yCjCDf2bx/1K2Ydg9bCgNpCA7HXHdv3RsIR+gCnCs3ajM
 HzgnSj2wySi2GkEF7fzQ+HW1rGnffTsu2BhE2pjNv40YeTnj6IRUs6Q6GfirYBPiFsDSIV8RB5C
 ZzNUvjYsa2mC1aUSRZO9Z0AMSS9dbT5uEVQ9pF9JeTGTiwVjiMKFohiE0uPspYEATupkPkoprAs
 z2V1enzUIS6pn0Slx+37wVoR7zupIl6NPXDpCa23B7ciIsWyM0xzParcRll9us1w0uKerF51HZI
 4GH8WTJQ075AA2FyXJy+93S5O/CJ2g==
X-Received: by 2002:a17:90b:544e:b0:2ee:c6c8:d8a2 with SMTP id
 98e67ed59e1d1-2f2e91f0db3mr8344276a91.14.1734586280692; 
 Wed, 18 Dec 2024 21:31:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzGKXIjV8Mm9y9zi+94zsqx4jfcGbuj9yfN2B1xmJ8+ItIXT4Wmd+0ApX9ZlSd0PEs44j80g==
X-Received: by 2002:a17:90b:544e:b0:2ee:c6c8:d8a2 with SMTP id
 98e67ed59e1d1-2f2e91f0db3mr8344242a91.14.1734586280182; 
 Wed, 18 Dec 2024 21:31:20 -0800 (PST)
Received: from hu-bcain-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f2ed52cf93sm2360676a91.6.2024.12.18.21.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 21:31:19 -0800 (PST)
From: Brian Cain <brian.cain@oss.qualcomm.com>
To: buildroot@buildroot.org, thomas.petazzoni@bootlin.com
Cc: brian.cain@oss.qualcomm.com
Date: Wed, 18 Dec 2024 21:30:48 -0800
Message-Id: <20241219053053.2389046-10-brian.cain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
References: <20241025140714.2395033-1-bcain@quicinc.com>
 <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: DqPu8IrNmlHp7FtS_H-Ls5Ovit9SNexP
X-Proofpoint-ORIG-GUID: DqPu8IrNmlHp7FtS_H-Ls5Ovit9SNexP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 mlxlogscore=717 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190041
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 a/1WvvQZZW7Bz+T9K5nNfvIU5ky1agi00Cflnmb6tss=; b=Ayjmrr7Zym3adsm/
 aFag/R7YcW7MFPcHBcdaAKQlNfMnEn3QRn8GRic19P3qTmkHm5WqljQLnPDF5g2c
 uKS0PyBDS6y+FfcuP35CTbe8LhlB+iP7XtKWrs1Dst/uVDvfR0XKRWAu6he6mt2L
 rPDSHOlvW/j1q4XHXhByMAzuoiM6RKAddhrULUTpbSY4TLRv0r4gbC1OgEwZYUXA
 d37d8PSXZWU56Sye0hCHXOB6fLx5PIO1scINZi8ZnNssVLa7BGvoTW5V/nw5PfEm
 1JvvpvBABT1H1YazLVlHgA56p8/2oGSqbgD4q0aOGzr7DV0Ij31cOhVuAF6vinLM
 K10SmA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=oss.qualcomm.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=Ayjmrr7Z
Subject: [Buildroot] [RFC v2 09/14] board/qcom/sa8775: add support for qcom
 sa8775-cdsp0
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

Signed-off-by: Brian Cain <brian.cain@oss.qualcomm.com>
---
 board/qcom/sa8775/post_build.sh     |  9 ++++++++
 configs/qcom_sa8775_cdsp0_defconfig | 35 +++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100755 board/qcom/sa8775/post_build.sh
 create mode 100644 configs/qcom_sa8775_cdsp0_defconfig

diff --git a/board/qcom/sa8775/post_build.sh b/board/qcom/sa8775/post_build.sh
new file mode 100755
index 0000000000..af13225d58
--- /dev/null
+++ b/board/qcom/sa8775/post_build.sh
@@ -0,0 +1,9 @@
+#!/bin/bash
+
+TARGETDIR=$1
+
+cat <<EOF >> "${TARGETDIR}/etc/fstab"
+devpts   /dev/pts              devpts  gid=5,mode=620  0 0
+/dev/vda /mnt/persist ext2 defaults 0 0
+debugfs  /sys/kernel/debug      debugfs  defaults  0 2
+EOF
diff --git a/configs/qcom_sa8775_cdsp0_defconfig b/configs/qcom_sa8775_cdsp0_defconfig
new file mode 100644
index 0000000000..f9363c930f
--- /dev/null
+++ b/configs/qcom_sa8775_cdsp0_defconfig
@@ -0,0 +1,35 @@
+BR2_hexagon=y
+BR2_HEXAGON_v73=y
+BR2_STATIC_LIBS=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_CLANG=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="https://artifacts.codelinaro.org/artifactory/codelinaro-toolchain-for-hexagon/19.1.5/clang+llvm-19.1.5-cross-hexagon-unknown-linux-musl.tar.zst"
+BR2_TOOLCHAIN_EXTERNAL_REL_BIN_PATH="x86_64-linux-gnu/bin"
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="hexagon-unknown-linux-musl"
+BR2_TOOLCHAIN_EXTERNAL_CLANG_19_0=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_7=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
+
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_DEVICE_CREATION_STATIC=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/qcom/sa8775/post_build.sh"
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+BR2_PACKAGE_BZIP2=y
+BR2_PACKAGE_ZLIB=y
+BR2_PACKAGE_LOCKDEV=n
+BR2_PACKAGE_LIBEVENT=n
+BR2_PACKAGE_ATFTP=n
+BR2_PACKAGE_DROPBEAR=y
+BR2_PACKAGE_LSH=y
+
+BR2_PACKAGE_LUA=y
+BR2_PACKAGE_BASH=y
+BR2_PACKAGE_ZSH=y
+
+BR2_PACKAGE_HEXAGONMVM=y
+BR2_PACKAGE_XINETD=n
+BR2_PACKAGE_COREUTILS=y
+BR2_TARGET_ROOTFS_TAR_GZIP=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
