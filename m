Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FA4E8FDC0
	for <buildroot@archiver.kernel.org>; Tue,  3 Oct 2023 23:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E72382369;
	Tue,  3 Oct 2023 23:48:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E72382369
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EhF3a6Vqp_TQ; Tue,  3 Oct 2023 23:47:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 815368234C;
	Tue,  3 Oct 2023 23:47:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 815368234C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 50AC51BF42D
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 23:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35CB5400D0
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 23:47:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35CB5400D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c7cm1_KzypeN for <buildroot@lists.busybox.net>;
 Tue,  3 Oct 2023 23:47:54 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 741864183F
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 23:47:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 741864183F
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 393N8oB3011056
 for <buildroot@buildroot.org>; Tue, 3 Oct 2023 23:47:53 GMT
Received: from ppma11.dal12v.mail.ibm.com
 (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tguhv9t4d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Tue, 03 Oct 2023 23:47:53 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
 by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 393NNVZJ010901
 for <buildroot@buildroot.org>; Tue, 3 Oct 2023 23:47:52 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tf0q1p50v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Tue, 03 Oct 2023 23:47:52 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 393NloEC45154904
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Tue, 3 Oct 2023 23:47:50 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 976E02004B
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 23:47:50 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21D8620040
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 23:47:50 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 23:47:50 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com.com (unknown [9.43.223.108])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id E7CB9602FC
 for <buildroot@buildroot.org>; Wed,  4 Oct 2023 10:47:45 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: buildroot@buildroot.org
Date: Wed,  4 Oct 2023 10:47:34 +1100
Message-ID: <20231003234734.525050-1-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8bUzvzOWE6d-VN-vIpJtXf5fszo0Feiz
X-Proofpoint-ORIG-GUID: 8bUzvzOWE6d-VN-vIpJtXf5fszo0Feiz
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-03_18,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 impostorscore=0 spamscore=0 mlxscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2310030179
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=from : to : subject :
 date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=xzkSgnMApjjpBASpYB3EBgUEyJibRldF41cIdfKWJJE=;
 b=gBrSrtUVrwwcX5YJufuUyR8Lj2q1/Md0C/5beo5XiR1qffbX7H/c06MBWiMQVopP0Zt8
 KrT9z7g/UBjNOJ95HahG8TQOFyIBK8io1u5wFGv1x/rel//EoGMkJck5DzAF3athddZV
 Go/KuJROggNp+qh2f4ecvCzU6Z2Y9RB7ntvRyniRMFwMvjD/5GCYE68T1/O43P3SBoVQ
 Cifi1cfMmsCG+EZRkLzJV91VbEz55a+1c6IQ9Kvckc47MUSc9h/sV1oORYIemSYkJGsE
 yWBagiPOFeaySf5I6oVYIiwXjcwhDF/3UYEhfKyn7nrc1DqhzQJF7R1CO+hhMLxGLTP7 DQ== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=gBrSrtUV
Subject: [Buildroot] [PATCH] package/libzlib: Switch to using HTTPS
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

Switch to using HTTPS for downloading libzlib from zlib.net.

(zlib.net doesn't default to HTTPS but does suggest HTTPS in the permalink
for the latest zlib release. Also works better with some corporate firewalls
that get suspicious about zlib for some reason.)

Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 package/libzlib/libzlib.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libzlib/libzlib.mk b/package/libzlib/libzlib.mk
index da452af8e9..e0a4e454e1 100644
--- a/package/libzlib/libzlib.mk
+++ b/package/libzlib/libzlib.mk
@@ -6,7 +6,7 @@
 
 LIBZLIB_VERSION = 1.3
 LIBZLIB_SOURCE = zlib-$(LIBZLIB_VERSION).tar.xz
-LIBZLIB_SITE = http://www.zlib.net
+LIBZLIB_SITE = https://www.zlib.net
 LIBZLIB_LICENSE = Zlib
 LIBZLIB_LICENSE_FILES = LICENSE
 LIBZLIB_INSTALL_STAGING = YES
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
