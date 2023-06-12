Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A192C7EE23
	for <buildroot@archiver.kernel.org>; Mon, 12 Jun 2023 07:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6322D82030;
	Mon, 12 Jun 2023 07:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6322D82030
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AH7sv61uPo0z; Mon, 12 Jun 2023 07:52:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 932328202E;
	Mon, 12 Jun 2023 07:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 932328202E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD80A1BF3F3
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 07:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A65438202E
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 07:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A65438202E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XmK6pz3zvMMU for <buildroot@lists.busybox.net>;
 Mon, 12 Jun 2023 07:52:09 +0000 (UTC)
X-Greylist: delayed 00:15:30 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4C8C8202D
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C4C8C8202D
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 07:52:08 +0000 (UTC)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35C7Q6eY031621
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 07:36:36 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r5xyjg9j8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 07:36:36 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35C4pngo024455
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 07:36:34 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3r4gt50yb3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 07:36:34 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 35C7aWMD59048212
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 07:36:32 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 399A82004B
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 07:36:32 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0090620043
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 07:36:32 +0000 (GMT)
Received: from oc8242746057.ibm.com.com (unknown [9.171.37.90])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 07:36:31 +0000 (GMT)
From: Alexander Egorenkov <egorenar@linux.ibm.com>
To: buildroot@buildroot.org
Date: Mon, 12 Jun 2023 09:36:30 +0200
Message-Id: <20230612073630.83079-1-egorenar@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Xe3yeTvYkQc7dlUrtDZsEq_uVThiESvG
X-Proofpoint-GUID: Xe3yeTvYkQc7dlUrtDZsEq_uVThiESvG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_04,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1011 impostorscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 malwarescore=0 phishscore=0 mlxlogscore=666 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306120064
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=from : to : subject :
 date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=quZAMp0+K1v5ya8PwQ6zD5auxZUk0z7bIGlSg8NmbRY=;
 b=kzDQ+ybykyoovAuv7ryLSowPfChg/+UxlJU1t/JD8nhoh6ESTCnLInxYdB64mqqkiAvT
 U3jMyQ2fRCd4U8CLnPVWLxGIaIV3M4YYIts1xgksvVNTQMDSmdu+GTNOJhqwCltHTWDs
 rpfHIFVL3p/meCj6WU3Oyy8rN2v/xQtEl4e21gaSzv3xL5PZ3WITgxxgSPmCkmT9nXTA
 J3unyEZp/azQ8CFf0jsQkc3aUdn6Co8nUNHmUlgKBYfv4Df7KgxKMpt9/67G8x55a7lw
 u6qkUVqFqOiDuHTGXOt8o1qNRCTN4IbxoQPZ+k1tw6Ridg6+twTQB0y01qYxyFHew++A MQ== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=kzDQ+yby
Subject: [Buildroot] [PATCH 1/1] package/s390-tools: bump version to 2.27.0
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
index 37b67c5cb180..b7563d8bac9c 100644
--- a/package/s390-tools/s390-tools.hash
+++ b/package/s390-tools/s390-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  da81c55fb11d84923c0ebaed703f557052eb1a273495f60ebe3d20a74627303e  s390-tools-2.26.0.tar.gz
+sha256  4315e64cf2fe0240ff9bd9929501db731d5bf3e7acf964ecf323d48d90e08f6e  s390-tools-2.27.0.tar.gz
 sha256  cca17a9a944ebec769adee4aebd805c912c357785ff2705a99ffe68563021f75  LICENSE
diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
index ec01a18cb07c..187fefea6450 100644
--- a/package/s390-tools/s390-tools.mk
+++ b/package/s390-tools/s390-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S390_TOOLS_VERSION = 2.26.0
+S390_TOOLS_VERSION = 2.27.0
 S390_TOOLS_SITE = $(call github,ibm-s390-linux,s390-tools,v$(S390_TOOLS_VERSION))
 S390_TOOLS_LICENSE = MIT
 S390_TOOLS_LICENSE_FILES = LICENSE
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
