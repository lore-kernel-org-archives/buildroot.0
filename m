Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3A2D0C612
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 14:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6AEE4082A;
	Fri, 25 Oct 2024 14:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TAxid-kZGUKP; Fri, 25 Oct 2024 14:07:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8587F40951
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8587F40951;
	Fri, 25 Oct 2024 14:07:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AFEF2316
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 290F681434
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o2ZbPErnsymE for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 14:07:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.168.131;
 helo=mx0a-0031df01.pphosted.com; envelope-from=bcain@quicinc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5D4DB81416
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D4DB81416
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D4DB81416
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:24 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PB255K001000
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:23 GMT
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ga3s0jug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PE7MH9028941
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:22 GMT
Received: from hu-bcain-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 25 Oct 2024 07:07:22 -0700
From: Brian Cain <bcain@quicinc.com>
To: <buildroot@buildroot.org>
CC: Brian Cain <bcain@quicinc.com>
Date: Fri, 25 Oct 2024 07:07:02 -0700
Message-ID: <20241025140714.2395033-1-bcain@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Lep0duzw0FZjMla0FCh1TiCUsuYFW4tB
X-Proofpoint-GUID: Lep0duzw0FZjMla0FCh1TiCUsuYFW4tB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxlogscore=446 malwarescore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410250109
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=Q+dvGQWamaPrqHr6Bs6BZ0
 0P57K2n3BdlVaf9pq+FmA=; b=oevuFldrYvp4i1WNe4dKI1R59y88yf3zK69aFA
 s0JFO8IJ4iTagLk19V2C/gXCN0TS8gzlfiL7f4/1sMQsF/x9kIAzk46DcTqt7vaZ
 lZM1H4CvpAoxwFA5NAxCySvhAsJKS83pS6ySvh6qpfveGP/HEgjWegSl5azGfmNs
 VgKrOpZnQneTx1ZZMkewSBm41VXZBxYeJ+UqwwPsvK6Ea0yAnjBNdYOcXg2ltK9I
 HedCFjancUK3HTAvRPwgctn6/Bv/uQ2YgbSjxdU0fp+2t4+zmhgTYHvYc/iJe7Od
 0oHffuM/SMUVisNqR0AZf2QE0z73tI8datIrXRk+X4AM+d3g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=quicinc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=oevuFldr
Subject: [Buildroot] [RFC 00/12] add hexagon architecture
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

I'm sending this RFC for discussion and high-level suggestions.  Since
I'm still quite new to buildroot, I'm hoping to learn how to better/more
idiomatically design this patch series.

Thanks in advance for any review.

Note that while the rootfs appears so far to be as-expected, outstanding
kernel/hypervisor bugs remain under investigation.  I'd like to use buildroot
to simplify collaboration among contributors.

Brian Cain (12):
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
  package: disable -ztext for hexagon

 DEVELOPERS                                    |  8 ++
 arch/Config.in                                | 10 +++
 arch/Config.in.hexagon                        | 69 +++++++++++++++++
 board/qcom/sa8775/post_build.sh               |  9 +++
 configs/qcom_dsp_qemu_defconfig               | 44 +++++++++++
 configs/qcom_sa8775_cdsp0_defconfig           | 35 +++++++++
 linux/linux.hash                              |  1 +
 linux/linux.mk                                | 10 +++
 package/Config.in                             |  1 +
 package/Makefile.in                           | 26 +++++--
 package/hexagonMVM/Config.in                  |  8 ++
 package/hexagonMVM/hexagonMVM.hash            |  5 ++
 package/hexagonMVM/hexagonMVM.mk              | 27 +++++++
 toolchain/Config.in                           | 54 +++++++++++++
 toolchain/helpers.mk                          | 16 ++++
 toolchain/toolchain-external/Config.in        |  6 ++
 .../pkg-toolchain-external.mk                 | 42 ++++++++--
 .../Config.in.options                         | 76 +++++++++++++++++++
 .../toolchain-external-hexagon/Config.in      |  7 ++
 .../Config.in.options                         | 14 ++++
 .../toolchain-external-hexagon.hash           |  6 ++
 .../toolchain-external-hexagon.mk             | 14 ++++
 22 files changed, 478 insertions(+), 10 deletions(-)
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
