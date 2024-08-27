Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050A3C5472F
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 13:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F253A40920;
	Tue, 27 Aug 2024 13:05:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HhvxWruzvk9N; Tue, 27 Aug 2024 13:05:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B44E4091E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B44E4091E;
	Tue, 27 Aug 2024 13:05:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C7471BF21A
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 13:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07ECC404D7
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 13:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VTtvAwKIvhxw for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 13:05:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 164CC404CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 164CC404CE
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 164CC404CE
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 13:05:00 +0000 (UTC)
Received: from pps.filterd (m0346904.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47R7xwOh028260;
 Tue, 27 Aug 2024 13:04:58 GMT
Received: from xusxph008rp050.rtx.com (xusxph008rp050.rtx.com [128.13.124.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 419awdt0tw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Aug 2024 13:04:58 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph008rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 47RD4vQw024783
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Aug 2024 13:04:57 GMT
Received: from dtulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 47RD4uQk010260
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 27 Aug 2024 13:04:57 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by dtulimr02.rockwellcollins.com (Postfix) with ESMTP id 60F8B3026D7C;
 Tue, 27 Aug 2024 08:04:56 -0500 (CDT)
Date: Tue, 27 Aug 2024 13:04:56 +0000
MIME-Version: 1.0
Message-Id: <20240827-package-dirclean-rdep-v1-2-d5e4f79a4241@collins.com>
References: <20240827-package-dirclean-rdep-v1-0-d5e4f79a4241@collins.com>
In-Reply-To: <20240827-package-dirclean-rdep-v1-0-d5e4f79a4241@collins.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_06,2024-08-27_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_06,2024-08-27_01,2024-05-17_01
X-MHapp-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=901
 suspectscore=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408270096
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 adultscore=0 mlxlogscore=927
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408270096
X-Proofpoint-GUID: E-kjqXSpAKw_PtHqw0X2u5ds-auRJvDS
X-Proofpoint-ORIG-GUID: E-kjqXSpAKw_PtHqw0X2u5ds-auRJvDS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_06,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 spamscore=0
 adultscore=0 malwarescore=0 mlxscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408270096
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=CRG1Ae25uwVEBYC+0LhKzje8183etIZkEkHeRUZtBMA=;
 b=eYbFprGY76kN9rUskQQMym0h+goseabj9e5N6XuSyis57WWsE/kzGIvJlCBvMG6UCNdk
 HCLWbQx2j23QiCvK1HovPef/xpU2S0T0JlJ60y28AggAu8UwtnsiXoexZaSk7dOzKTym
 ODK60xs1pqeM7mpKcakCDZbjsP94sj7sPBMIk+ZgPe/qWhf1mJZeLuXy+F/AKTEonTq5
 oXI6BPXf+CqJ3QlPeTxj/akxmsuq3cuM7ogZtGpywcFmFAwrqX8EF3+92CeUO+dynSqM
 +JtHy3wBBn4yJT7JuaG5R/DrUs/PHJy6//z2A03EhXSxk3Rhy9iFvr91v7gzNhihHCVj 2g== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=eYbFprGY
Subject: [Buildroot] [PATCH 2/2] Makefile: document <pkg>-dirclean-rdepends
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Brandon Maier via buildroot <buildroot@buildroot.org>
Reply-To: Brandon Maier <brandon.maier@collins.com>
Cc: Brandon Maier <brandon.maier@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 55aeafde23..5f9c42095e 100644
--- a/Makefile
+++ b/Makefile
@@ -1176,6 +1176,9 @@ help:
 	@echo '                         - Generate a graph of both <pkg>'\''s forward and'
 	@echo '                           reverse dependencies.'
 	@echo '  <pkg>-dirclean         - Remove <pkg> build directory'
+	@echo '  <pkg>-dirclean-rdepends'
+	@echo '                         - Remove build directory of <pkg> and <pkg>'\''s'
+	@echo '                           reverse dependencies'
 	@echo '  <pkg>-reconfigure      - Restart the build from the configure step'
 	@echo '  <pkg>-rebuild          - Restart the build from the build step'
 	@echo '  <pkg>-reinstall        - Restart the build from the install step'

-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
