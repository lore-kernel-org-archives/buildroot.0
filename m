Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010C6C636CC
	for <buildroot@archiver.kernel.org>; Sat, 18 Feb 2023 14:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 830A560EA6;
	Sat, 18 Feb 2023 14:22:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 830A560EA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lJ4sreVggjST; Sat, 18 Feb 2023 14:22:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF94C60E97;
	Sat, 18 Feb 2023 14:22:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF94C60E97
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 796781BF2F2
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 14:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 613FA403C6
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 14:22:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 613FA403C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dYaJ0ceW1THc for <buildroot@lists.busybox.net>;
 Sat, 18 Feb 2023 14:22:36 +0000 (UTC)
X-Greylist: delayed 00:41:30 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6D50402B1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6D50402B1
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 14:22:36 +0000 (UTC)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31ICCCKr007044
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 13:41:05 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ntxfes6p9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 13:41:05 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31I2sXRq003895
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 13:41:03 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3ntpa68ev4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 13:41:03 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31IDf1X945547902
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 13:41:01 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 037842004B
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 13:41:01 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C560C20040
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 13:41:00 +0000 (GMT)
Received: from oc8242746057.ibm.com.com (unknown [9.179.31.148])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 13:41:00 +0000 (GMT)
From: Alexander Egorenkov <egorenar@linux.ibm.com>
To: buildroot@buildroot.org
Date: Sat, 18 Feb 2023 14:40:59 +0100
Message-Id: <20230218134059.53863-1-egorenar@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7pzdVScpCKmDI4u7x4nfSKiKNjp69VtR
X-Proofpoint-GUID: 7pzdVScpCKmDI4u7x4nfSKiKNjp69VtR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-18_08,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 mlxlogscore=809 phishscore=0 spamscore=0 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1011 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302180116
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=from : to : subject :
 date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=PPz1bsl7aUud2g8y5UKuU6cByjTe6RSbJ0P3PnzAu34=;
 b=f20IxLMGwhAQTeZRGPLNUrhVaIQkzDp53t8ExqGFMguzd6cpYhUTdhKf1mqf4mDZ14kC
 hm51WO7yJUpiZeKXRTujwjimria/u61aXRHL27punhm4RhtPsEvX/5ZWppMEO67u48kr
 mh4yD9IqcFyOp+xI9BzJsiUkUfPf3l4uiM1ZxxQqG3t+lzyMsuIghUF04batH1so68oc
 0vzvZ5TmHruc9dNyBLAZQfGyGMH3m0H2B0BOpz4Bnv2nZ2w4ni57AQEKsz/fnzmtRxjp
 vrFNlXuh0yG9KAQYPcBfpApSRcdCO95aG8a6eSndLAyEkH5EV5thsSuO5CRB95bVAKy9 AQ== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=f20IxLMG
Subject: [Buildroot] [PATCH 1/1] package/s390-tools: bump to version 2.26.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
---
 package/s390-tools/s390-tools.hash | 2 +-
 package/s390-tools/s390-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s390-tools/s390-tools.hash b/package/s390-tools/s390-tools.hash
index a0dde477c324..37b67c5cb180 100644
--- a/package/s390-tools/s390-tools.hash
+++ b/package/s390-tools/s390-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  ccb20954e748309a50fd56edd9abd94c6f897081e9a1a33e9d965a56f650990d  s390-tools-2.25.0.tar.gz
+sha256  da81c55fb11d84923c0ebaed703f557052eb1a273495f60ebe3d20a74627303e  s390-tools-2.26.0.tar.gz
 sha256  cca17a9a944ebec769adee4aebd805c912c357785ff2705a99ffe68563021f75  LICENSE
diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
index cb6278dfb837..8cd549140547 100644
--- a/package/s390-tools/s390-tools.mk
+++ b/package/s390-tools/s390-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S390_TOOLS_VERSION = 2.25.0
+S390_TOOLS_VERSION = 2.26.0
 S390_TOOLS_SITE = $(call github,ibm-s390-linux,s390-tools,v$(S390_TOOLS_VERSION))
 S390_TOOLS_LICENSE = MIT
 S390_TOOLS_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
