Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A49C433F5
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 08:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2376B40237;
	Mon, 22 Nov 2021 08:48:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QAZtGFmFcQkE; Mon, 22 Nov 2021 08:48:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2046840198;
	Mon, 22 Nov 2021 08:48:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 79D171BF82F
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 08:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6273B40207
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 08:48:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=ibm.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 69veGO4fTpxx for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 08:48:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 122A9401D0
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 08:48:15 +0000 (UTC)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AM8bUh9000308
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 08:48:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=PuEAuzo+HMMKsJQnZcL9jgNUAzrXbCWAYCpbw/Av2xI=;
 b=o55fh6Etn2w3q6ikmrX9w0v0OT0MCaFmuJbjCqHCEuXPB8EKUWpSJX3mV3qk1BTX24FT
 jpelM2BZXxxL6QX/DWRpE2zvimudPQeWqNx6FrPwXwEe6wQIwNGHV1l5MOBOQ1mZCfhd
 f2cvPy08NDaYvPjixZQhReIAIVfShJl+6S2xn4qNnW0NgO4dh6ZGza7f9sNZTWPU7nMn
 foVa4zklL3KMemegUF2Q0LOw/37YDybhNOHkxvbeg4u/Dtoy6mpo0DHzAa+AiC1dGSJ3
 EKM1rF6abfaaiDFc1POkM56Fa+CTStlMX+hLtQ48Uxc3QNIF0zf35Kq9y9wdvu+FkQeR tQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cg7furn0u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 08:48:14 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AM8grHH007227
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 08:48:13 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3cer9jbt83-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 08:48:12 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AM8mA1D62325050
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 08:48:10 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E0DBAE057
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 08:48:10 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66FF0AE059
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 08:48:10 +0000 (GMT)
Received: from oc8242746057.lan (unknown [9.171.46.61])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 08:48:10 +0000 (GMT)
From: Alexander Egorenkov <egorenar@linux.ibm.com>
To: buildroot@buildroot.org
Date: Mon, 22 Nov 2021 09:48:09 +0100
Message-Id: <20211122084809.475864-1-egorenar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: loRdS7bu9Ixs0pgL9PWt4fl-m078MxnG
X-Proofpoint-GUID: loRdS7bu9Ixs0pgL9PWt4fl-m078MxnG
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-22_04,2021-11-22_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1011 mlxlogscore=880 mlxscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111220043
Subject: [Buildroot] [PATCH 1/1] package/s390-tools: bump to version 2.19.0
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
index eafe7f4d7acf..13c68fbf52f4 100644
--- a/package/s390-tools/s390-tools.hash
+++ b/package/s390-tools/s390-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  a1e2118152a85201984d2045033d49f7fd92e8cd0ea80ae0a5ebeb0d258cdedb  s390-tools-2.18.0.tar.gz
+sha256  17dc163e6a1e940f895c64955c130058600e1df834e1ab134410be7266ef724a  s390-tools-2.19.0.tar.gz
 sha256  cca17a9a944ebec769adee4aebd805c912c357785ff2705a99ffe68563021f75  LICENSE
diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
index 6b4351ce83ed..328986bcb37c 100644
--- a/package/s390-tools/s390-tools.mk
+++ b/package/s390-tools/s390-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S390_TOOLS_VERSION = 2.18.0
+S390_TOOLS_VERSION = 2.19.0
 S390_TOOLS_SITE = $(call github,ibm-s390-linux,s390-tools,v$(S390_TOOLS_VERSION))
 S390_TOOLS_LICENSE = MIT
 S390_TOOLS_LICENSE_FILES = LICENSE
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
