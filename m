Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E83C00A5A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 06:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0CD3822BA;
	Thu, 19 Jan 2023 06:58:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0CD3822BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r3bA142Z6jOc; Thu, 19 Jan 2023 06:58:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00A61822B6;
	Thu, 19 Jan 2023 06:58:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00A61822B6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A5F921BF25F
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 06:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F23E40289
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 06:58:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F23E40289
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6TLBetnrvfqZ for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 06:58:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACD6A4012D
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ACD6A4012D
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 06:58:12 +0000 (UTC)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30J5F2XR016229
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 06:58:11 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n6bu162yt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 06:58:11 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30IMmJYo013572
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 06:58:10 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3n3knfck20-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 06:58:09 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30J6w7em46268672
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 06:58:07 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6EBD72004D
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 06:58:07 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B15220040
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 06:58:07 +0000 (GMT)
Received: from oc8242746057.ibm.com (unknown [9.152.212.252])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 06:58:07 +0000 (GMT)
From: Alexander Egorenkov <egorenar@linux.ibm.com>
To: buildroot@buildroot.org
Date: Thu, 19 Jan 2023 07:58:06 +0100
Message-Id: <20230119065806.115380-1-egorenar@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XkLgSNQEkCG-lIaRFuGEWYyIxCofhtOC
X-Proofpoint-ORIG-GUID: XkLgSNQEkCG-lIaRFuGEWYyIxCofhtOC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-18_05,2023-01-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=670
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301190051
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=from : to : subject :
 date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=m7LYSjYZPyDk7L814QbGc4/KVqJGXVm6sRqgHlWn2Ms=;
 b=Q37tw7U81YcGXjmIAbdWf4agYXvSpd1hCGPYqfJkWeLIpe4WnyTklTJZs8vBNaiuUSiT
 12/XYkcFaoEC7mJctYgViWPOsmiSsBsrI7BCNVO7ibgVx724S/Z05q6FTODblcwKwQXY
 Bs9uWD2LRRxTFxJcRkc5Ps5Ape2xzfD4B3qdNEmrTJ++bJZytbXmIIDaJIFVuoT2ejYC
 IE4mG/NkB00veenPzWRkRH0e6msABz8OhHGEI5xwe/74tHYKGfTRMm7mGQX5AZC9AEIb
 /UpcK6arzp/8jHf+R2ZwvT/OzRkWDGeIE8dVd1o2JQDU4pWIJ4nf9vunSyAavY5ns3Qx oQ== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=Q37tw7U8
Subject: [Buildroot] [PATCH 1/1] package/s390-tools: bump to version 2.25
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
index f74695b81df8..a0dde477c324 100644
--- a/package/s390-tools/s390-tools.hash
+++ b/package/s390-tools/s390-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  c04d1f7d7f4c941f19a293188eb6302194cc298171f88a4dc17a08a8001c6c01  s390-tools-2.23.0.tar.gz
+sha256  ccb20954e748309a50fd56edd9abd94c6f897081e9a1a33e9d965a56f650990d  s390-tools-2.25.0.tar.gz
 sha256  cca17a9a944ebec769adee4aebd805c912c357785ff2705a99ffe68563021f75  LICENSE
diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
index 99fc669ce72e..cb6278dfb837 100644
--- a/package/s390-tools/s390-tools.mk
+++ b/package/s390-tools/s390-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S390_TOOLS_VERSION = 2.23.0
+S390_TOOLS_VERSION = 2.25.0
 S390_TOOLS_SITE = $(call github,ibm-s390-linux,s390-tools,v$(S390_TOOLS_VERSION))
 S390_TOOLS_LICENSE = MIT
 S390_TOOLS_LICENSE_FILES = LICENSE
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
