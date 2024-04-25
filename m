Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E73C4345F
	for <buildroot@archiver.kernel.org>; Thu, 25 Apr 2024 19:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5358460645;
	Thu, 25 Apr 2024 19:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ul9xlZgejPw0; Thu, 25 Apr 2024 19:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 537A060676
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 537A060676;
	Thu, 25 Apr 2024 19:58:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F41331BF2F5
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 19:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE5B960676
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 19:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nqc5UsVOxCde for <buildroot@lists.busybox.net>;
 Thu, 25 Apr 2024 19:58:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5F42760645
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F42760645
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F42760645
 for <buildroot@buildroot.org>; Thu, 25 Apr 2024 19:58:46 +0000 (UTC)
Received: from pps.filterd (m0346909.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 43PJa8Ng026487; Thu, 25 Apr 2024 19:58:44 GMT
Received: from xusxph008rp050.rtx.com (xusxph008rp050.rtx.com [128.13.124.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3xqr2t4tua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Apr 2024 19:58:43 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.224])
 by xusxph008rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 43PJwhvg015259
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 25 Apr 2024 19:58:43 GMT
Received: from crulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 43PJwgDl028425
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 25 Apr 2024 19:58:42 GMT
X-Received: from bspbox.kirk (unknown [10.148.204.208])
 by crulimr02.rockwellcollins.com (Postfix) with ESMTP id A64793003A9A;
 Thu, 25 Apr 2024 14:58:42 -0500 (CDT)
To: buildroot@buildroot.org
Date: Thu, 25 Apr 2024 19:58:13 +0000
Message-ID: <20240425195816.2758964-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240412210850.17265-1-brandon.maier@collins.com>
References: <20240412210850.17265-1-brandon.maier@collins.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_19,2024-04-25_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_19,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404250143
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404250143
X-Proofpoint-GUID: _6fLcF23oZvvljhIGtn-DpbNFCphpVgJ
X-Proofpoint-ORIG-GUID: _6fLcF23oZvvljhIGtn-DpbNFCphpVgJ
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2404010000 definitions=main-2404250144
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=POD051818;
 bh=rwV57sDN446uYA3feitFClMxLIHLhpnEZ7750QLI7Y0=;
 b=j8UYk20gJgvQuaBpCgjxzD/w9qt7rEPetBVrNeFFye7GUa4NG3JobH1WNV6b4jwQMyW6
 UPxMG1+ZcxOSIXWVWnKb7KzcuVqZowZNgVsjhcBXBjNkgF+vFWp8OhXAsRxcmmlWChtm
 7upD6Tk6p04niYEFk2sqrcjoZWV9CYWerCngRhiOcAM6JXJmLU4isil1eeU5Bh/iIPuL
 MsYViawFIo69DtBkQF/jCgVxzqw6ZtVCuj6+Dg2McnFzBObG4EhEvgbqqnxV4BK77D/D
 +94m0thIJb5I9HD6Ujhb0/tWhwja6Ij7zBuYVNBMippHsDD+L9G3qi1gXMGT4NR/Y0Tp 3g== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=j8UYk20g
Subject: [Buildroot] [PATCH v2 1/4] package/bats-core: bump to version 1.11.0
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

https://github.com/bats-core/bats-core/releases/tag/v1.11.0
https://github.com/bats-core/bats-core/releases/tag/v1.10.0
https://github.com/bats-core/bats-core/releases/tag/v1.9.0

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 package/bats-core/bats-core.hash | 2 +-
 package/bats-core/bats-core.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bats-core/bats-core.hash b/package/bats-core/bats-core.hash
index 81c0229af4..25b2b60339 100644
--- a/package/bats-core/bats-core.hash
+++ b/package/bats-core/bats-core.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  0f2df311a536e625a72bff64c838e67c7b5032e6ea9edcdf32758303062b2f3b  bats-core-1.8.2.tar.gz
+sha256  aeff09fdc8b0c88b3087c99de00cf549356d7a2f6a69e3fcec5e0e861d2f9063  bats-core-1.11.0.tar.gz
 
 # License files
 sha256  55074b2b3b87809105034e1468e59076554d76a80c67bcc592000cc3d929852d  LICENSE.md
diff --git a/package/bats-core/bats-core.mk b/package/bats-core/bats-core.mk
index e172445930..716b167c00 100644
--- a/package/bats-core/bats-core.mk
+++ b/package/bats-core/bats-core.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BATS_CORE_VERSION = 1.8.2
+BATS_CORE_VERSION = 1.11.0
 BATS_CORE_SITE = $(call github,bats-core,bats-core,v$(BATS_CORE_VERSION))
 BATS_CORE_LICENSE = MIT
 BATS_CORE_LICENSE_FILES = LICENSE.md
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
