Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE946C3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 07:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DCB360EAB;
	Mon,  8 Jan 2024 07:14:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DCB360EAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id entDh7FnGeaL; Mon,  8 Jan 2024 07:14:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A60C60ED8;
	Mon,  8 Jan 2024 07:14:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A60C60ED8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ADB181BF580
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 07:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8602560ED8
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 07:14:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8602560ED8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lIMSEIUAczT7 for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 07:14:15 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D5BC60EAB
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 07:14:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D5BC60EAB
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 4085YioU016486
 for <buildroot@buildroot.org>; Mon, 8 Jan 2024 07:14:15 GMT
Received: from ppma23.wdc07v.mail.ibm.com
 (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vf1qepf58-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 07:14:14 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 40868MJw004388
 for <buildroot@buildroot.org>; Mon, 8 Jan 2024 07:14:13 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vfjpkeccs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 07:14:13 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 4087EBVd30671140
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Mon, 8 Jan 2024 07:14:11 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 672A52004B
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 07:14:11 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3051920040
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 07:14:11 +0000 (GMT)
Received: from oc8242746057.ibm.com (unknown [9.171.50.78])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 07:14:11 +0000 (GMT)
From: Alexander Egorenkov <egorenar@linux.ibm.com>
To: buildroot@buildroot.org
Date: Mon,  8 Jan 2024 08:14:10 +0100
Message-ID: <20240108071410.118585-1-egorenar@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vXFZZUIMDpbwTps5KlKc_HlxEIRmqzaC
X-Proofpoint-ORIG-GUID: vXFZZUIMDpbwTps5KlKc_HlxEIRmqzaC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-07_15,2024-01-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=499 bulkscore=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2401080059
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=from : to : subject :
 date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=WjzcR29UR7Z+ZjQmdQPjGeWJl/NskpGYlVeFnkushD8=;
 b=UKV3i343p8/x52TIWops4N+waeP+iuUWiKLOmAswwIS0ufdnWo1wG/gKmcWFJhM+lm3Y
 EZ9Azh+2vT6sfxiXnNV1M+2vpqrECx9JDsvOdp86VMY17mOXQDRiiPxa9KFhhioPCuXk
 7UsylROvYQ42YzUr41LZ9A63/lhfmqJQfsWZQUshsy3AT9EFA1Dr6V5OWz1wejDIlfp/
 dlt7GdTuctcqB//d5+z3+S7iJFQHtVg9qoixONjN85om2ZREYsnhJOs1txXlsipv8Tl/
 Z8X3inja039P2GNTpYieNy/UponlR/rm9PeI0PmwPWaCMdA2bsNThFSzOTa2G6Rn0ZVY yg== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=UKV3i343
Subject: [Buildroot] [PATCH 1/1] package/s390-tools: bump version to 2.30.0
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
index a00e95437b96..c70bf69f008c 100644
--- a/package/s390-tools/s390-tools.hash
+++ b/package/s390-tools/s390-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  849ff400dc6c1eb7eebe4aa3e7a4871721c25bcee6cfdd0535a056a038fd3ab0  s390-tools-2.29.0.tar.gz
+sha256  9e565701cc6df4808243027706ee0a76c5fc0c7f9aae0afce1479fd4ff68bcdf  s390-tools-2.30.0.tar.gz
 sha256  cca17a9a944ebec769adee4aebd805c912c357785ff2705a99ffe68563021f75  LICENSE
diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
index c3155a13ff5a..bc39a9bd1970 100644
--- a/package/s390-tools/s390-tools.mk
+++ b/package/s390-tools/s390-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S390_TOOLS_VERSION = 2.29.0
+S390_TOOLS_VERSION = 2.30.0
 S390_TOOLS_SITE = $(call github,ibm-s390-linux,s390-tools,v$(S390_TOOLS_VERSION))
 S390_TOOLS_LICENSE = MIT
 S390_TOOLS_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
