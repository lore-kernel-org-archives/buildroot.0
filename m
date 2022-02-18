Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3C3C433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Feb 2022 21:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68E6460AC0;
	Fri, 18 Feb 2022 21:15:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mSW6tHMKjNvr; Fri, 18 Feb 2022 21:15:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF1A160A97;
	Fri, 18 Feb 2022 21:15:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 183B51BF350
 for <buildroot@lists.busybox.net>; Fri, 18 Feb 2022 21:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1310D84C06
 for <buildroot@lists.busybox.net>; Fri, 18 Feb 2022 21:15:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=ibm.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yL4HkeuqW0Bh for <buildroot@lists.busybox.net>;
 Fri, 18 Feb 2022 21:15:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FAB28403F
 for <buildroot@buildroot.org>; Fri, 18 Feb 2022 21:15:08 +0000 (UTC)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21IKCI1F018616
 for <buildroot@buildroot.org>; Fri, 18 Feb 2022 21:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=2tZoV4xP0kexpbg4DQycQSWgxnu93ea5b0vqViZR4ac=;
 b=siI61Xw7sxpxNFXHh6JoI5pKzSYc9aKbPHYRA3qjwvTdQheAjHYt6GOnyF8N631QDFiY
 uegH+j80cRR28IT4V2MZhwJFc086GqF2lM5QLdu/Jzx4Mq/I7hiMO1K+PuJG7ql4rypL
 UW+kLHq3w/OwbptrUV/I5TMzwes1Pdu9pMHVvdL2WHdpRykHsA9LX0TCoxDaogVpfzGm
 EFphgqUR0nsLv7sTaUGVTlom/Pn2QMU+8dxVg4QkBxLJOu1kJ2h/qwwCs4cDMCA7eZ4V
 lU0dPDVOoxWnzkkPwBKKxNjijsxqoz1hrJTbs6gK+EBoTUskdGLaM0A37CM9IYOs6twb WA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eaj9jh78a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Fri, 18 Feb 2022 21:15:05 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21IL87qU020901
 for <buildroot@buildroot.org>; Fri, 18 Feb 2022 21:15:03 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3e64havcfp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Fri, 18 Feb 2022 21:15:03 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21ILF1af30540128
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Fri, 18 Feb 2022 21:15:01 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 288F252050
 for <buildroot@buildroot.org>; Fri, 18 Feb 2022 21:15:01 +0000 (GMT)
Received: from oc8242746057.ibm.com.com (unknown [9.171.19.251])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 0BB8C5204E
 for <buildroot@buildroot.org>; Fri, 18 Feb 2022 21:15:01 +0000 (GMT)
From: Alexander Egorenkov <egorenar@linux.ibm.com>
To: buildroot@buildroot.org
Date: Fri, 18 Feb 2022 22:14:58 +0100
Message-Id: <20220218211458.197332-1-egorenar@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zEAQua_ISCFnGIfLrZLEkQebhgqZOAgD
X-Proofpoint-GUID: zEAQua_ISCFnGIfLrZLEkQebhgqZOAgD
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-18_09,2022-02-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=815
 adultscore=0 spamscore=0 clxscore=1011 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202180129
Subject: [Buildroot] [PATCH 1/1] package/s390-tools: bump to version 2.20.0
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

Fixes:
- https://release-monitoring.org/project/10714/

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
---
 package/s390-tools/s390-tools.hash | 2 +-
 package/s390-tools/s390-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s390-tools/s390-tools.hash b/package/s390-tools/s390-tools.hash
index 13c68fbf52f4..6ea8f7ea2076 100644
--- a/package/s390-tools/s390-tools.hash
+++ b/package/s390-tools/s390-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  17dc163e6a1e940f895c64955c130058600e1df834e1ab134410be7266ef724a  s390-tools-2.19.0.tar.gz
+sha256  6fa6add92e896541c0ef74885a4084474fc0d77049e8ac7372872a70a46ddd74  s390-tools-2.20.0.tar.gz
 sha256  cca17a9a944ebec769adee4aebd805c912c357785ff2705a99ffe68563021f75  LICENSE
diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
index 328986bcb37c..3c386af6fd10 100644
--- a/package/s390-tools/s390-tools.mk
+++ b/package/s390-tools/s390-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S390_TOOLS_VERSION = 2.19.0
+S390_TOOLS_VERSION = 2.20.0
 S390_TOOLS_SITE = $(call github,ibm-s390-linux,s390-tools,v$(S390_TOOLS_VERSION))
 S390_TOOLS_LICENSE = MIT
 S390_TOOLS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
