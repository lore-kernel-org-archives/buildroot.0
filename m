Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB5ECA0EC3
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 10:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9822C6112E;
	Tue, 12 Sep 2023 10:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9822C6112E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SW-iwLlscCgZ; Tue, 12 Sep 2023 10:09:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E392760E13;
	Tue, 12 Sep 2023 10:09:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E392760E13
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5F93B1BF2A5
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 10:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45EC940B47
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 10:09:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45EC940B47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oiz_vfLdrZLg for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 10:09:07 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE45E410A7
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 10:09:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE45E410A7
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38CA7EJf007388
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 10:09:05 GMT
Received: from ppma21.wdc07v.mail.ibm.com
 (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t2n76h515-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 10:09:05 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 38C88HFT022958
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 10:03:55 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3t141nj5t3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 10:03:55 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 38CA3rxM12059136
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 10:03:53 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D39B20063
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 10:03:53 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D1212005A
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 10:03:53 +0000 (GMT)
Received: from oc8242746057.boeblingen.de.ibm.com (unknown [9.152.212.222])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 10:03:52 +0000 (GMT)
From: Alexander Egorenkov <egorenar@linux.ibm.com>
To: buildroot@buildroot.org
Date: Tue, 12 Sep 2023 12:03:52 +0200
Message-ID: <20230912100352.237822-1-egorenar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xAcThJwKfHlsaxfe96hsaTJ3UyzlUf8y
X-Proofpoint-ORIG-GUID: xAcThJwKfHlsaxfe96hsaTJ3UyzlUf8y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_07,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=544 adultscore=0
 mlxscore=0 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309120085
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=from : to : subject :
 date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=3wfmhZEVe1XjpljjzNl1AHPf9K/U9BaGJXzLVXB5Km4=;
 b=XmVrZL6oLtPwSR8v3PYAGZS6l7l6+QaiBZ0D1D+oBcDiS9vx/chlcuuYCTshTXxIIfJ6
 pXY1ly3PcDns0s2Sthv0I4Jv/up+e1Dy0eQ+RWDQCboWnAQTn7WDUCiZMSkWUcRmdDmz
 y2jR0xl/p/CAdurw9zdFyandZah8fpMNO753csuYXpj5Y/+C9Tgb8H8WIu8xT4KuBKxa
 czgnkM2nQH1YZnCI7NK/hgyjJQ41Uts5r5CydytHtkYwvRFBcYYUNUn+JLjkI5aZamJw
 Utpo3dUMkH8+CUQJGf/FyUaCn0qanYv2usjhftLcrt6NbFjRrW/dz1MakgJCgWomXdZC 3g== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=XmVrZL6o
Subject: [Buildroot] [PATCH 1/1] package/s390-tools: bump version to 2.29.0
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
index b7563d8bac9c..a00e95437b96 100644
--- a/package/s390-tools/s390-tools.hash
+++ b/package/s390-tools/s390-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  4315e64cf2fe0240ff9bd9929501db731d5bf3e7acf964ecf323d48d90e08f6e  s390-tools-2.27.0.tar.gz
+sha256  849ff400dc6c1eb7eebe4aa3e7a4871721c25bcee6cfdd0535a056a038fd3ab0  s390-tools-2.29.0.tar.gz
 sha256  cca17a9a944ebec769adee4aebd805c912c357785ff2705a99ffe68563021f75  LICENSE
diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
index 187fefea6450..c3155a13ff5a 100644
--- a/package/s390-tools/s390-tools.mk
+++ b/package/s390-tools/s390-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S390_TOOLS_VERSION = 2.27.0
+S390_TOOLS_VERSION = 2.29.0
 S390_TOOLS_SITE = $(call github,ibm-s390-linux,s390-tools,v$(S390_TOOLS_VERSION))
 S390_TOOLS_LICENSE = MIT
 S390_TOOLS_LICENSE_FILES = LICENSE
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
