Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E35C4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 15:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BEA5B403B8;
	Tue, 13 Feb 2024 15:20:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SdcYuSU_EaNZ; Tue, 13 Feb 2024 15:20:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 807224149C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 807224149C;
	Tue, 13 Feb 2024 15:20:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 30B7D1BF322
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 15:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E55360BE5
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 15:20:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X_gJzh2VjIUM for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 15:20:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=arbab@linux.ibm.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CCA7960BD5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCA7960BD5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CCA7960BD5
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 15:20:53 +0000 (UTC)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 41DDOxIm014417; Tue, 13 Feb 2024 15:20:52 GMT
Received: from ppma12.dal12v.mail.ibm.com
 (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w899r32ex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Feb 2024 15:20:51 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
 by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 41DDc1DL032589; Tue, 13 Feb 2024 15:20:51 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
 by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w6kftgcqc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Feb 2024 15:20:50 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com
 [10.39.53.231])
 by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 41DFKmhK15270470
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Feb 2024 15:20:50 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3DB6458060;
 Tue, 13 Feb 2024 15:20:48 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 28AC558052;
 Tue, 13 Feb 2024 15:20:48 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.178.221])
 by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
 Tue, 13 Feb 2024 15:20:48 +0000 (GMT)
Received: by arbab-laptop.localdomain (Postfix, from userid 152845)
 id 6DFA84F577; Tue, 13 Feb 2024 09:20:47 -0600 (CST)
From: Reza Arbab <arbab@linux.ibm.com>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 09:20:05 -0600
Message-Id: <20240213152005.83369-1-arbab@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ogdT2J-16PbUnevttqnGh0G5kg6_yegM
X-Proofpoint-ORIG-GUID: ogdT2J-16PbUnevttqnGh0G5kg6_yegM
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-13_08,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402130120
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=CJ5YyoZpoLc1Vn3tzHOdHVW2yi1dkekpuc3Kf3Z8eDk=;
 b=gakv8nfdmky6ihghwoZofvzWgX0Z40L2gMX/H2y1XrwBEF37nD80PZ5h+fP0izC5HL2K
 wkXoviDO+KhnxMdI3DMK8SxHMeQFJayAfqomPWsCv/ZKJbiqxHi+qsXZgYPxHSZ8ciI0
 bjgqgN2hj4O8BE0Pvef48yfDejuNew8UtMiJfPq5aTmfgQgacdtsH4jpo7/SqQNQl4De
 EsBKh1z3BG3tZKihWDLa+kjKjUDIwE7TOgcjiF25MVz2LP1ypbdIW3Wd/2VK7mTSQ5Nn
 W6oWcMRuDfAQNu/P+oBNx9qBbST25t0RkwJhwxEUlViB6FOi3Ekivfn6kHu5b0Du0DQ+ NQ== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.ibm.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=gakv8nfd
Subject: [Buildroot] [PATCH] package/petitboot: bump to version 1.15
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
Cc: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes an issue where the pb-console helper was not properly
silencing kernel log messages printed to the console.

https://github.com/open-power/petitboot/releases/tag/v1.15

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
---
 package/petitboot/petitboot.hash | 2 +-
 package/petitboot/petitboot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/petitboot/petitboot.hash b/package/petitboot/petitboot.hash
index a9a21f2c1b69..3a90bc529672 100644
--- a/package/petitboot/petitboot.hash
+++ b/package/petitboot/petitboot.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fa2367370d3ce5dd9910ab08a0832071e2508c8bf75cfec6d3b9807fbefc507a  petitboot-v1.14.tar.gz
+sha256  eed29ec841c2bcd5ecc65347f5b95a0087a541bd9c04ca3c17c55d1f7357d189  petitboot-v1.15.tar.gz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
index 2f1e459dd3fa..a74992377131 100644
--- a/package/petitboot/petitboot.mk
+++ b/package/petitboot/petitboot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PETITBOOT_VERSION = 1.14
+PETITBOOT_VERSION = 1.15
 PETITBOOT_SOURCE = petitboot-v$(PETITBOOT_VERSION).tar.gz
 PETITBOOT_SITE = https://github.com/open-power/petitboot/releases/download/v$(PETITBOOT_VERSION)
 PETITBOOT_DEPENDENCIES = \
-- 
2.39.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
