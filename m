Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027B8C2BB85
	for <buildroot@archiver.kernel.org>; Mon, 17 Jun 2024 18:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 285F6414F2;
	Mon, 17 Jun 2024 18:43:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZCcLAibpQ_Iq; Mon, 17 Jun 2024 18:43:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83683410A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83683410A8;
	Mon, 17 Jun 2024 18:43:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F20B71BF2BD
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 18:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EAEDF409E7
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 18:43:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g1JgXU8mSUDP for <buildroot@lists.busybox.net>;
 Mon, 17 Jun 2024 18:43:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EE74F405D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE74F405D3
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE74F405D3
 for <buildroot@buildroot.org>; Mon, 17 Jun 2024 18:43:49 +0000 (UTC)
Received: from pps.filterd (m0346904.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 45HFCq7E012545; Mon, 17 Jun 2024 18:43:48 GMT
Received: from xusxph008rp050.rtx.com (xusxph008rp050.rtx.com [128.13.124.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3ys3hyfw0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2024 18:43:48 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
 by xusxph008rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 45HIhkFv016745
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2024 18:43:47 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45HIhkS6009816
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 17 Jun 2024 18:43:46 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id 2C9E93000434;
 Mon, 17 Jun 2024 13:43:46 -0500 (CDT)
Date: Mon, 17 Jun 2024 18:43:23 +0000
Message-Id: <20240617-mtd-2-2-0-bugfixes-v1-0-a136825e24ff@collins.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMuDcGYC/x2LQQqAIBAAvxJ7bsGkEvtKdNDaag9ZaEUg/b0l5
 jQMkyFRZErQFRki3Zx4DyJVWcC4urAQ8iQOWulatZXB7ZxQCwr9tcz8UEJrG6Pq2TnvNch4RPq
 DfP3wvh9QPmoJZAAAAA==
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_14,2024-06-17_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_14,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 spamscore=0
 malwarescore=0 mlxlogscore=588 suspectscore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406170144
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxscore=0 mlxlogscore=547 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406170144
X-Proofpoint-ORIG-GUID: b5Bl9cVAGfUmvhzDjQaZkWDTDJnw3Fg_
X-Proofpoint-GUID: b5Bl9cVAGfUmvhzDjQaZkWDTDJnw3Fg_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_14,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 clxscore=1015
 mlxscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=681 spamscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406170144
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=I/kigkJV1A9quBOaceAA0Wt+hKLOhMEUmykndlGyPt8=;
 b=CFwa5s8vy0lFrCpkHExlxm5UR9gQwinszneR7Epq6Ioqswdy4s+RMtz6cRmHQBzoe0qV
 SxaHRqK9hOT/vM7wTrFYT1foLFw2lL3q1oCoIWOeiN8skySNRCJcA3TdPBIjCsyrAaqK
 KRr6NOM85lzri/qSYEkk0zdeSJVgzBn5gkac6UUyDqel9rm5eg5m6a5rsyQ3pf7/iF5E
 YtITvNseb3rG86YNaNuT2tROrUzDkDBo1ZaToi7vbAIw0x5yuDVjEVfVdVX4vUER6LCN
 D7HQuDkZpzuxf0TkcQk5NHSwUd8C3DmAx2wPegwrkLNGOvTeLt44mPX6S3kHpJerLLhi MA== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=CFwa5s8v
Subject: [Buildroot] [PATCH 0/3] package/mtd: fixes and changes for release
 2.2.0
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
Brandon Maier (3):
      package/mtd: fix tests compiling when disabled
      package/mtd: make lzo an optional dependency
      package/mtd: make zlib an optional dependency

 package/mtd/Config.in |  4 ----
 package/mtd/mtd.mk    | 24 +++++++++++++++++++-----
 2 files changed, 19 insertions(+), 9 deletions(-)
---
base-commit: 7bfea9372f1842279a8f57b5fc4428bbae822e91
change-id: 20240617-mtd-2-2-0-bugfixes-995704faabb2

Best regards,
-- 
Brandon Maier <brandon.maier@collins.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
