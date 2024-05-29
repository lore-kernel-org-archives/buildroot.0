Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C1AC25B75
	for <buildroot@archiver.kernel.org>; Wed, 29 May 2024 20:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2119404B1;
	Wed, 29 May 2024 20:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GIAyUVRPRUhB; Wed, 29 May 2024 20:24:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBC3E4136B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBC3E4136B;
	Wed, 29 May 2024 20:24:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 263871D3A87
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 20:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 112554089E
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 20:24:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x694PsWMECOi for <buildroot@lists.busybox.net>;
 Wed, 29 May 2024 20:24:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6B15E40858
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B15E40858
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6B15E40858
 for <buildroot@buildroot.org>; Wed, 29 May 2024 20:24:39 +0000 (UTC)
Received: from pps.filterd (m0346907.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 44TJghAH013357
 for <buildroot@buildroot.org>; Wed, 29 May 2024 20:24:39 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3ydhmt8urm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Wed, 29 May 2024 20:24:39 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
 by xusxph004rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 44TKObwf013584
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <buildroot@buildroot.org>; Wed, 29 May 2024 20:24:37 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 44TKObcO030363
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <buildroot@buildroot.org>; Wed, 29 May 2024 20:24:37 GMT
X-Received: from bspbox.kirk (unknown [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id 3D8903000479;
 Wed, 29 May 2024 15:24:37 -0500 (CDT)
To: buildroot@buildroot.org
Date: Wed, 29 May 2024 20:24:23 +0000
Message-ID: <20240529202425.469185-2-brandon.maier@collins.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405290143
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 spamscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405290143
X-Proofpoint-GUID: LlSaRhKEGZs2wGIs8BkFSkz6qVf0Yluj
X-Proofpoint-ORIG-GUID: LlSaRhKEGZs2wGIs8BkFSkz6qVf0Yluj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_16,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 clxscore=1015 phishscore=0 mlxlogscore=999
 priorityscore=1501 adultscore=0 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405290143
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=POD051818;
 bh=xD8OFvzkRCRpyTXi4drcb5Fg6geOGeWqksxqFX2Ucwo=;
 b=eyji4ujAkRvCDLBsdh+FXNULAZMi8ZB10LcRL/EiCzA2h7hMmhx+7WTOFWemVqXTUh5w
 2oZrtnP4bB5KguJCPkVKb2QTpWYKuJvpgj4sinTeS20/4qm6CzWy72RfpMH0Qq7tHxrH
 uvmGbnBjTEUu29/9ny5CG/wXMwWbjlR6XGV/fL8x+U+gbRVqZtVuZuAug2RXn9Ymutbw
 8Cj22XuWmdeoV+EgZdEHtYaq7HqCWu3k5XJuZfXsO2J0sVtjCEVNwii1aAPCnT2wASmh
 9s3UySJHLvAsG+t5OUQVu1SzTLWUOW+AXhwAo7NVjN8bUrJHcFRxG+u2yX79/4JKGViN ig== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=eyji4ujA
Subject: [Buildroot] [PATCH 2/4] package/mtd: switch to https mirror
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

As mentioned in the last release notes, there is an https mirror[1].
Switch to this as ftp is not as widely supported anymore.

[1] https://lists.infradead.org/pipermail/linux-mtd/2023-August/100922.html

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 package/mtd/mtd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 998cc419b3..39b9f2a523 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -6,7 +6,7 @@
 
 MTD_VERSION = 2.1.6
 MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
-MTD_SITE = ftp://ftp.infradead.org/pub/mtd-utils
+MTD_SITE = https://infraroot.at/pub/mtd
 MTD_LICENSE = GPL-2.0
 MTD_LICENSE_FILES = COPYING
 MTD_CPE_ID_VENDOR = mtd-utils_project
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
