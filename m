Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8745CC25B75
	for <buildroot@archiver.kernel.org>; Wed, 29 May 2024 20:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D0D941383;
	Wed, 29 May 2024 20:24:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c5uKchvaqbeA; Wed, 29 May 2024 20:24:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 142B341372
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 142B341372;
	Wed, 29 May 2024 20:24:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7EDF61BF359
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 20:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6ADD94089E
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 20:24:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vO564v1B3Gw0 for <buildroot@lists.busybox.net>;
 Wed, 29 May 2024 20:24:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EFF8240858
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFF8240858
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EFF8240858
 for <buildroot@buildroot.org>; Wed, 29 May 2024 20:24:43 +0000 (UTC)
Received: from pps.filterd (m0346904.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 44TJG9Vt024407
 for <buildroot@buildroot.org>; Wed, 29 May 2024 20:24:43 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3ye6wxc5fd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Wed, 29 May 2024 20:24:42 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph009rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 44TKOfUG007720
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <buildroot@buildroot.org>; Wed, 29 May 2024 20:24:41 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 44TKOeNp021694
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <buildroot@buildroot.org>; Wed, 29 May 2024 20:24:41 GMT
X-Received: from bspbox.kirk (unknown [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id 6A8CF300D88E;
 Wed, 29 May 2024 15:24:40 -0500 (CDT)
To: buildroot@buildroot.org
Date: Wed, 29 May 2024 20:24:24 +0000
Message-ID: <20240529202425.469185-3-brandon.maier@collins.com>
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
 phishscore=0 malwarescore=0
 suspectscore=0 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405290143
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 suspectscore=0 adultscore=0 bulkscore=0 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405290143
X-Proofpoint-GUID: 7mwBBtKnU8jKb4UYlMQi5cXTh8njCd0l
X-Proofpoint-ORIG-GUID: 7mwBBtKnU8jKb4UYlMQi5cXTh8njCd0l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_16,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 mlxscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2405290143
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=POD051818;
 bh=vFPmDW49rNWDnHlI7vak9cnCaawc51RjKp4BufTHFhI=;
 b=iXS5/ff6VFV0rFX6v7QEIp8vWAhLBmKMCxmntDHZy5MpX9TWzSvOQiXHR+EzvNXYij1H
 /6sr+2cJzUP6xppUbcbDd9m9J/EEHS1b1nbfr4evzlKdfX04ryJTqJWgLRR3pOLFb6jE
 dmAWG4RjWBs/NCvO0dH6YaAUiha4ZVbqWM0pqBrJke14pX1CLm5aBsmibWIrHOLZt5hM
 Md5ToZhz2pwlMbCXIB4vUIeWE4HCbkpXWTN147oQSuPZjFldeL8NKgf3di5JQ4HMmRP7
 Ffhd3R1/nZ1MeZDlCJi2KzoFktf/dAK1AU+t7jhshXLEYMqOqZseSZd2oKCeuY+jlsBz Zg== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=iXS5/ff6
Subject: [Buildroot] [PATCH 3/4] package/mtd: bump to version 2.2.0
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

https://lists.infradead.org/pipermail/linux-mtd/2024-March/104058.html

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 package/mtd/mtd.hash | 4 ++--
 package/mtd/mtd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mtd/mtd.hash b/package/mtd/mtd.hash
index 9926a34a80..1efb06f490 100644
--- a/package/mtd/mtd.hash
+++ b/package/mtd/mtd.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://infraroot.at/pub/mtd/mtd-utils-2.1.6.tar.bz2.asc
-sha256  c1d853bc4adf83bcabd2792fc95af33bdd8643c97e8f7b3f0180af36af76f0e5  mtd-utils-2.1.6.tar.bz2
+# https://infraroot.at/pub/mtd/mtd-utils-2.2.0.tar.bz2.asc
+sha256  250d082f67375ca8451b5fcfc9a23a53ced3ebebd8312c288daf2507bbab1324  mtd-utils-2.2.0.tar.bz2
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 39b9f2a523..a20e00e9da 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTD_VERSION = 2.1.6
+MTD_VERSION = 2.2.0
 MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE = https://infraroot.at/pub/mtd
 MTD_LICENSE = GPL-2.0
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
