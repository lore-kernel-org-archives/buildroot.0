Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E48EC25B75
	for <buildroot@archiver.kernel.org>; Wed, 29 May 2024 20:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F0F74139F;
	Wed, 29 May 2024 20:24:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Ns09FD01aCG; Wed, 29 May 2024 20:24:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0FC6413A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0FC6413A3;
	Wed, 29 May 2024 20:24:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6D6821D3A88
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 20:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58D1E4138B
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 20:24:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jp6vugddpQuk for <buildroot@lists.busybox.net>;
 Wed, 29 May 2024 20:24:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E7C3241380
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7C3241380
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E7C3241380
 for <buildroot@buildroot.org>; Wed, 29 May 2024 20:24:45 +0000 (UTC)
Received: from pps.filterd (m0346901.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 44TICtvc010119
 for <buildroot@buildroot.org>; Wed, 29 May 2024 20:24:44 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3ye65rdcet-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Wed, 29 May 2024 20:24:44 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 44TKOh3X004856
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <buildroot@buildroot.org>; Wed, 29 May 2024 20:24:43 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 44TKOhC9030440
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <buildroot@buildroot.org>; Wed, 29 May 2024 20:24:43 GMT
X-Received: from bspbox.kirk (unknown [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id D9B3C3000479;
 Wed, 29 May 2024 15:24:42 -0500 (CDT)
To: buildroot@buildroot.org
Date: Wed, 29 May 2024 20:24:25 +0000
Message-ID: <20240529202425.469185-4-brandon.maier@collins.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240529202425.469185-1-brandon.maier@collins.com>
References: <20240529202425.469185-1-brandon.maier@collins.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_16,2024-05-28_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_16,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=766
 phishscore=0 mlxscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405290143
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 spamscore=0
 phishscore=0 malwarescore=0 mlxlogscore=736 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405290143
X-Proofpoint-ORIG-GUID: VCR-w7YxEkz8etyEw9IsO_UqCP9OSb17
X-Proofpoint-GUID: VCR-w7YxEkz8etyEw9IsO_UqCP9OSb17
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_16,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 spamscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 mlxscore=0 mlxlogscore=858 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405290143
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=POD051818;
 bh=panyfHo9rkHoaCjcGXGWC5aXV6Odfc39ICIOZbWf0R0=;
 b=ON6xusiV1ZgHQ7hRfbBNXbaLFtpcVASoV8uDI6fC9VzVPOzWXt3HpIN7i8fXWTXShRhz
 RFoPpLUZB/7OoFE7LbpZS5Ue+/jr1eRcpMbWCku+N/k4kZZ5dJXnAJXQIW3NNZOH44bh
 U67RuvTzw3QfB/3kU2fuuWo0Ae8mxhqRdxbrcjtotGODxLnrm2yi3NyuIztPaAcClfdY
 9VeZ8/mMmDvV/8bu5Ip+hQ3hxx6K2SoURLOuIgIkueykj55ePbCGa5B1ZE6TrWF7ohio
 3d9opoiBUZrhaNxt22f2PbAjeni+fyUQ5ZYasd9CyL2SwMu/hGy0OuFbXLdgXKRg2yB0 jQ== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=ON6xusiV
Subject: [Buildroot] [PATCH 4/4] DEVELOPERS: add myself for package/mtd
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
Cc: Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 52c9b84a9d..cc9f3b7165 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -544,6 +544,7 @@ F:	configs/ls1046a-frwy_defconfig
 F:	package/bats-assert/
 F:	package/bats-file/
 F:	package/bats-support/
+F:	package/mtd/
 F:	package/python-pysensors/
 F:	package/qoriq-fm-ucode/
 F:	package/unifdef/
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
