Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F16C433EF
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 10:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E132610B9;
	Wed, 11 May 2022 10:36:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lzFU27AFlefC; Wed, 11 May 2022 10:36:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5EC960A68;
	Wed, 11 May 2022 10:36:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1121E1BF2CE
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 10:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F307260A68
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 10:36:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3FuiOZS-FsgB for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 10:36:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BFD72607A3
 for <buildroot@buildroot.org>; Wed, 11 May 2022 10:36:35 +0000 (UTC)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24B9JCBJ021679
 for <buildroot@buildroot.org>; Wed, 11 May 2022 10:36:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=3dLe5yBgp/8VbLIk2lsckgj9o5NGeQBzwuKSsrnK7LU=;
 b=A7XXtBjnWssZ7XWGGWZljrpf1js29ONvBx1GeGKGbVspBgkwVR1UtNolMOOmdB79515d
 7g+v+9hlo6R4gh0+gu0ZDm0QZcVWCloawY/rNLJif6/sP2lsb4oPLB85MuvRNUwQOQZ3
 7gl1zU1zbbzGLMaGeYYATqJEs/jhhX+XgjitYataD+eUMSuOu9bUsHhXPXZ1KOcQymW7
 AY6sGwGqnTEFmmegPhxBLEE5/Rj2XalKFbupkO2qc9/grWK4Xb2NnQSeO36SrfRtCDDl
 PuEsNzOnvblroAOUq/VR+kvkjNTy6RIl7nnnR5yUaM00pMIEz70Hc70Hpc8Mla2YCSmI Ag== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g0adkhbdw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Wed, 11 May 2022 10:36:35 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24BAOdm4010196
 for <buildroot@buildroot.org>; Wed, 11 May 2022 10:36:32 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3fwgd8warb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Wed, 11 May 2022 10:36:32 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 24BAMsUO54329744
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Wed, 11 May 2022 10:22:54 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 903F9A404D
 for <buildroot@buildroot.org>; Wed, 11 May 2022 10:36:30 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 60B41A4040
 for <buildroot@buildroot.org>; Wed, 11 May 2022 10:36:30 +0000 (GMT)
Received: from oc8242746057.ibm.com.com (unknown [9.171.68.62])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <buildroot@buildroot.org>; Wed, 11 May 2022 10:36:30 +0000 (GMT)
From: Alexander Egorenkov <egorenar@linux.ibm.com>
To: buildroot@buildroot.org
Date: Wed, 11 May 2022 12:36:29 +0200
Message-Id: <20220511103629.259937-1-egorenar@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RittRQutEPPc6Z6DE9EMLHB9cQPTALTq
X-Proofpoint-GUID: RittRQutEPPc6Z6DE9EMLHB9cQPTALTq
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_03,2022-05-11_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 mlxlogscore=543 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205110047
Subject: [Buildroot] [PATCH 1/1] package/s390-tools: drop fuse2 support and
 replace it with fuse3
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

s390-tools dropped FUSE2 support since v2.20.
It has been replaced with FUSE3.

Fixes:
- http://autobuild.buildroot.net/results/e12bace34870a33b68eb5759cece051aaaf5c1f9

References:
- https://github.com/ibm-s390-linux/s390-tools/pull/117
- https://github.com/ibm-s390-linux/s390-tools/issues/116

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
---
 package/s390-tools/s390-tools.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
index 040db78c05a6..f38110079282 100644
--- a/package/s390-tools/s390-tools.mk
+++ b/package/s390-tools/s390-tools.mk
@@ -77,8 +77,8 @@ else
 S390_TOOLS_MAKE_OPTS += HAVE_PFM=0
 endif
 
-ifeq ($(BR2_PACKAGE_LIBFUSE),y)
-S390_TOOLS_DEPENDENCIES += libfuse
+ifeq ($(BR2_PACKAGE_LIBFUSE3),y)
+S390_TOOLS_DEPENDENCIES += libfuse3
 S390_TOOLS_MAKE_OPTS += HAVE_FUSE=1
 else
 S390_TOOLS_MAKE_OPTS += HAVE_FUSE=0
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
