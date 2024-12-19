Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E401DE77184
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 05:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8961851BA;
	Thu, 19 Dec 2024 05:39:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Udl0Mi-bqBpG; Thu, 19 Dec 2024 05:39:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91FC0851BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91FC0851BE;
	Thu, 19 Dec 2024 05:39:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 18511C0
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECAF7408AB
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:39:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v0-VvCKmh2uc for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 05:39:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.168.131;
 helo=mx0a-0031df01.pphosted.com; envelope-from=brian.cain@oss.qualcomm.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DCADA4080C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCADA4080C
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DCADA4080C
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:39:30 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BIGR0Yi000432
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:31:14 GMT
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43m0su9srb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:31:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-2f2a9743093so409220a91.3
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 21:31:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734586273; x=1735191073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o9/tfkzAl1z9eFi3KYE6ioRJPIVoZtRfQnl4dz8+yTA=;
 b=DzmjCVq0jHzBTrdAjmCmLqBXox0I6bfrz8lhNKQrgNMqcRMJpL3AYQjWXxVPv8OABY
 Jr2BnO7h5mzZu6qcCzBLL2Zt+fyf+GOHdxZMuS3ppDQVF5q4Nx+F062FJ636yF/J5Sym
 9NMl1U6DT3cDoWnYWgobcvP8oriBRKFokMFq50JbpPGnqNCtaEmiyGeCTKwQSPT3vm8c
 wULxqe4pGFMpkfPbzQoV9GKOa+Dv65tjUPiufO48rKAdtGVC4hI4vwhbJmppV3+0aG7G
 3fGWf+0zEde+Fp68QOpZKXdFA0iFg2hn6L0fp06b54SEqksPWl7HQhs+oaomFr1pNu3b
 zgxw==
X-Gm-Message-State: AOJu0Yzy2H1zdbsuFD57WZ5kNuk2OKF5XDDC/D7IYJUfnJB1KkHFDgpt
 BzkbQFSp5D1xfL6woOCy9JxUe7G4tZ1L6O9xvX+c8w7rAzJBohrOpe6/shick0HsCPiAAKZqg5E
 +zgAbt+Uxn4p8OB5uLbOhg4Lh2JimpCHk+RsW7r52MYc+STuxNvD5SWV3vGQiFauC
X-Gm-Gg: ASbGncvczIxihwW7/N8nYCj34IIMNmaOh5gqVNvmtltHyiENEz7oIhdhRDR0Egve4/o
 ikfEccs4G89q9tKgq4iMZpH7QPQCq5LzyGjx0vSccGwCLB/hvohDYFe3IPbx9r3qO9vDWw691Sx
 hL5tS66hK7PDhSRuJDHbzh7NkDV5OarOTnu7p2CAhl3D4PxeEDNetjGCTPT8gxy83g3oYN2jiDj
 JiIXox6MIHPIYOALIJXSntMQLxKIoFYJ15XCT9XAkYbdnPA2PnBhI+6ck0Ye4pjoxsa/3Foj3Eg
 8oT0FJyJWaTCeJNijb3weFCFFPVfHg==
X-Received: by 2002:a17:90b:2b88:b0:2ef:19d0:2261 with SMTP id
 98e67ed59e1d1-2f443cffb23mr3368747a91.16.1734586272730; 
 Wed, 18 Dec 2024 21:31:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEIk/44JlD9ZsNmT9ZtaZyMzE09E8b5NYp/85PGfLP16xFJI+HI7wNh717zPPr2whUO9dKFA==
X-Received: by 2002:a17:90b:2b88:b0:2ef:19d0:2261 with SMTP id
 98e67ed59e1d1-2f443cffb23mr3368723a91.16.1734586272348; 
 Wed, 18 Dec 2024 21:31:12 -0800 (PST)
Received: from hu-bcain-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f2ed52cf93sm2360676a91.6.2024.12.18.21.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 21:31:11 -0800 (PST)
From: Brian Cain <brian.cain@oss.qualcomm.com>
To: buildroot@buildroot.org, thomas.petazzoni@bootlin.com
Cc: brian.cain@oss.qualcomm.com
Date: Wed, 18 Dec 2024 21:30:39 -0800
Message-Id: <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025140714.2395033-1-bcain@quicinc.com>
References: <20241025140714.2395033-1-bcain@quicinc.com>
MIME-Version: 1.0
X-Proofpoint-GUID: Ai5tKVx_DmYUf2v0Y9fUgoPI-AWLDRzs
X-Proofpoint-ORIG-GUID: Ai5tKVx_DmYUf2v0Y9fUgoPI-AWLDRzs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=665 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1011 phishscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190041
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 o9/tfkzAl1z9eFi3KYE6ioRJPIVoZtRfQnl4dz8+yTA=; b=Qaq0K7FRM5mZ/QaX
 GOSP2aC9Gz23C7IO4kWupFF4CvIBW8QPSXywp8B9VPy1yvQUiVahpTv2mDlOdptG
 gRQSkLYV5d0fPSazqRaucYlVjcvYWVnwULOgbqjR7BH7P0w/JH0XW50AUXNQoWI5
 YeTdkPJvs4Mpyb/U49uyPWrhAt9jCEMCQ9Om8gfSeXn8u/L7fX1r7rGqKitDTWXx
 Brkh4XXsb0zDou2Xf9Y9G08HXcA2HkzY+043G1YKN88WUxgO2fREHOBr+a1wZR0f
 QeWzxm9rj0Ec0Fe0hqIAqmhXvEiA38vSnWns0wV3Xz1ZqyI89BfWSPM2oGZQvxIi
 ZwFfyQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=oss.qualcomm.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=Qaq0K7FR
Subject: [Buildroot] [RFC v2 00/14] add hexagon architecture
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

Status: rootfs build succeeds, limited testing so far.

Changes from RFC v1:
- Updated to 19.1.5 toolchain to fix some compiler driver+linker bugs
- switched QEMU config to BR2_SHARED_LIBS in order to enable more packages
- added workarounds to avoid the problems that occur w/SHARED

I'm sharing this series with the list for the sake of discussion about
how the approach taken could improve.  It's likely not quite ready for
upstreaming yet.

Brian Cain (14):
  arch: add hexagon architecture support
  toolchain/toolchain-external: add hexagon toolchain support
  toolchain/toolchain-external: add hexagon support for
    toolchain-wrapper
  toolchain/toolchain-external: add support for clang
  toolchain/toolchain-external: skip "-march=" for hexagon
  linux: add support for hexagon clang
  arch: add hexagon ARCH definition
  package/hexagonMVM: new package
  board/qcom/sa8775: add support for qcom sa8775-cdsp0
  configs: add hexagon QEMU config
  DEVELOPERS: add myself as developer for hexagon
  toolchain: disable PIE for hexagon
  configs: switch hexagon QEMU to SHARED
  package: disable -ztext

 DEVELOPERS                                    |  8 ++
 arch/Config.in                                | 10 +++
 arch/Config.in.hexagon                        | 69 +++++++++++++++++
 board/qcom/sa8775/post_build.sh               |  9 +++
 configs/qcom_dsp_qemu_defconfig               | 49 ++++++++++++
 configs/qcom_sa8775_cdsp0_defconfig           | 35 +++++++++
 linux/linux.hash                              |  1 +
 linux/linux.mk                                | 10 +++
 package/Config.in                             |  1 +
 package/Makefile.in                           | 28 +++++--
 package/hexagonMVM/Config.in                  |  8 ++
 package/hexagonMVM/hexagonMVM.hash            |  5 ++
 package/hexagonMVM/hexagonMVM.mk              | 27 +++++++
 toolchain/Config.in                           | 56 +++++++++++++-
 toolchain/helpers.mk                          | 16 ++++
 toolchain/toolchain-external/Config.in        |  6 ++
 .../pkg-toolchain-external.mk                 | 42 ++++++++--
 .../Config.in.options                         | 76 +++++++++++++++++++
 .../toolchain-external-hexagon/Config.in      |  7 ++
 .../Config.in.options                         | 10 +++
 .../toolchain-external-hexagon.hash           |  6 ++
 .../toolchain-external-hexagon.mk             | 11 +++
 22 files changed, 479 insertions(+), 11 deletions(-)
 create mode 100644 arch/Config.in.hexagon
 create mode 100755 board/qcom/sa8775/post_build.sh
 create mode 100644 configs/qcom_dsp_qemu_defconfig
 create mode 100644 configs/qcom_sa8775_cdsp0_defconfig
 create mode 100644 package/hexagonMVM/Config.in
 create mode 100644 package/hexagonMVM/hexagonMVM.hash
 create mode 100644 package/hexagonMVM/hexagonMVM.mk
 create mode 100644 toolchain/toolchain-external/toolchain-external-hexagon/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-hexagon/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-hexagon/toolchain-external-hexagon.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-hexagon/toolchain-external-hexagon.mk

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
