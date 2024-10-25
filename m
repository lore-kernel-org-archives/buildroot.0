Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7236DD0C614
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 14:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 406B040793;
	Fri, 25 Oct 2024 14:08:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oZXms0zCmSu5; Fri, 25 Oct 2024 14:08:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 146BB40B3B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 146BB40B3B;
	Fri, 25 Oct 2024 14:08:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 109AD2318
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A036B813D7
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SZwWv7S8QzbL for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 14:07:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.168.131;
 helo=mx0a-0031df01.pphosted.com; envelope-from=bcain@quicinc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0E27581440
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E27581440
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E27581440
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:26 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PAulUK029345
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:26 GMT
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3w9b8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PE7PTW028955
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:07:25 GMT
Received: from hu-bcain-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 25 Oct 2024 07:07:25 -0700
From: Brian Cain <bcain@quicinc.com>
To: <buildroot@buildroot.org>
CC: Brian Cain <bcain@quicinc.com>
Date: Fri, 25 Oct 2024 07:07:14 -0700
Message-ID: <20241025140714.2395033-13-bcain@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 7jqpZxHJPr4B33J-6SLBgRMkCRnnxbFQ
X-Proofpoint-GUID: 7jqpZxHJPr4B33J-6SLBgRMkCRnnxbFQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=740
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250109
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lchUfNcsvD/aSnS63QUk1sKdPfVjst1sZ0c9GhNKRDM=; b=RzDrFZv1jiHwQ52K
 wZv8OwIDIg+dgzq3OGv++AFOLILc0KQjkZYV56YyrPX+AsAYJnY6+XKeVf2lRgKp
 nJOyL/2lgqwslYLl//fCisOnCwhhYC8Rth7FCn+5DhRLTMtUZKZIWeCWE8vFRjR5
 J0C1Yv2t6Cd037FpD3uJC+xBGon1MoKn8E/YHG213kFglJZeuITzo3ESQVAYxvO8
 BaP2J5PNPf5qldCryCLz/8XeMAPkM+OQtdgAdBi7aR/CLfN398N6bhqgwmTKh6qb
 KzWsr81fi3AtHtHSJbqwZxhkHtaGvkeHVfgeQgYeNwVtv2wKDFMl3lUptVUEM1Ga
 HJ4fdg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=quicinc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.a=rsa-sha256 header.s=qcppdkim1 header.b=RzDrFZv1
Subject: [Buildroot] [RFC 12/12] package: disable -ztext for hexagon
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

Without this commit, autotools compiler tests often fail with:

    hexagon-unknown-linux-musl-clang: error: unknown argument: '-ztext'

... but that's probably because we specified clang as LD and not lld.

Signed-off-by: Brian Cain <bcain@quicinc.com>
---
 package/Makefile.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index b54fe123ba..1f1b429462 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -171,8 +171,10 @@ TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
 # "-z" to be passed and the "text" keyword to be dropped otherwise. Both
 # gcc and ld supports that, so it probably won't cause us problems.
 ifeq ($(BR2_TOOLCHAIN_USES_MUSL):$(BR2_STATIC_LIBS),y:)
+ifneq ($(BR2_hexagon),y)
 TARGET_LDFLAGS += -ztext
 endif
+endif
 
 # By design, _FORTIFY_SOURCE requires gcc optimization to be enabled.
 # Therefore, we need to pass _FORTIFY_SOURCE and the optimization level
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
