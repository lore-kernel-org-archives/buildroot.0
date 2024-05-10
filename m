Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5439DC25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 22:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F39936165C;
	Fri, 10 May 2024 22:07:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iY7_QPG757WI; Fri, 10 May 2024 22:07:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9C986167B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9C986167B;
	Fri, 10 May 2024 22:07:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 046261BF343
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 22:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4EFB40187
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 22:07:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4TRMpLDqtX6c for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 22:07:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C0381400F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0381400F9
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C0381400F9
 for <buildroot@buildroot.org>; Fri, 10 May 2024 22:07:33 +0000 (UTC)
Received: from pps.filterd (m0346903.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 44AHGMWC025449; Fri, 10 May 2024 22:07:29 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3y16mr9usk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 May 2024 22:07:28 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 44AM7Rwi004715
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 10 May 2024 22:07:27 GMT
Received: from ciulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 44AM7RJX008388
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 10 May 2024 22:07:27 GMT
X-Received: from bspbox.kirk (unknown [10.148.204.208])
 by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id 2CB131002A09;
 Fri, 10 May 2024 17:07:27 -0500 (CDT)
To: buildroot@buildroot.org
Date: Fri, 10 May 2024 22:07:04 +0000
Message-ID: <20240510220704.1924373-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_16,2024-05-10_02,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_16,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405100160
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0 mlxscore=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405100160
X-Proofpoint-ORIG-GUID: 6DebW1Za_DETlR79fCFlum_Cb9H2tXip
X-Proofpoint-GUID: 6DebW1Za_DETlR79fCFlum_Cb9H2tXip
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_16,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 impostorscore=0 adultscore=0 mlxscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 clxscore=1011 priorityscore=1501 malwarescore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405100160
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=POD051818; bh=X5XOCiVv7QhxzWBEIQOQ3Njhnenii2oGxS4Q3p1yk70=;
 b=kv6yZVFcYxYBU035Que9bpmt+D+lV1lH7d1cg8JDnCBmCCQT6hCRbQnUWva1vSg+U6dR
 SdwSc3hqWqIN9TQAYXiAeryT6mURQ91+65wX07zi6bJIUS4zyd4ds2Srt1YC3g/t7iR9
 5QBMQCjJRsOvYsBAPf1LSoLgI2vF346HiJO0vEL+yajLLece/P1osVijACSF7o8duzPp
 rIaUacAusPIAufp3MwFccH4ltrI8oo+DySMY8dppsRyqnOcoXlBMw9Y1UhWJ0WIIXvsQ
 jUAJ/2GhqI2SDveItfzCmr+q6/KNT+qZYCLX9IrfW4Wm2Sk1FxtNr6BvhnGWrsKtZr5U lQ== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=kv6yZVFc
Subject: [Buildroot] [PATCH] package/gcc: add patch to fix gcc 11 build
 warning
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
From: Brandon Maier via buildroot <buildroot@buildroot.org>
Reply-To: Brandon Maier <brandon.maier@collins.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When building GCC 11 with GCC 14 the following error occurs

> ../../../libiberty/simple-object-mach-o.c:1231:17: error: passing argument 1 of 'set_32' from incompatible pointer type [-Wincompatible-pointer-types]

This was fixed upstream in GCC12[1]. It is applied to the GCC 11 release
branch[2], but has not been officially released yet.

[1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=38757aa88735ab2e511bc428e2407a5a5e9fa0be
[2] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=02cd761eb1198df50453b2e39653f48053609ffc

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 ...libiberty-Darwin-Fix-a-build-warning.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/gcc/11.4.0/0009-libiberty-Darwin-Fix-a-build-warning.patch

diff --git a/package/gcc/11.4.0/0009-libiberty-Darwin-Fix-a-build-warning.patch b/package/gcc/11.4.0/0009-libiberty-Darwin-Fix-a-build-warning.patch
new file mode 100644
index 0000000000..3c694a89fa
--- /dev/null
+++ b/package/gcc/11.4.0/0009-libiberty-Darwin-Fix-a-build-warning.patch
@@ -0,0 +1,37 @@
+From d1fc3505cc09d0ee02abbb732eafc91967c3ac07 Mon Sep 17 00:00:00 2001
+From: Iain Sandoe <iain@sandoe.co.uk>
+Date: Mon, 23 Aug 2021 17:34:43 +0100
+Subject: [PATCH] libiberty, Darwin: Fix a build warning.
+
+r12-3005-g220c410162ebece4f missed a cast for the set_32 call.
+Fixed thus.
+
+Signed-off-by: Iain Sandoe <iain@sandoe.co.uk>
+
+libiberty/ChangeLog:
+
+	* simple-object-mach-o.c (simple_object_mach_o_write_segment):
+	Cast the first argument to set_32 as needed.
+
+Upstream: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=38757aa88735ab2e511bc428e2407a5a5e9fa0be
+Signed-off-by: Brandon Maier <brandon.maier@collins.com>
+---
+ libiberty/simple-object-mach-o.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libiberty/simple-object-mach-o.c b/libiberty/simple-object-mach-o.c
+index 72b69d19c21..a8869e7c639 100644
+--- a/libiberty/simple-object-mach-o.c
++++ b/libiberty/simple-object-mach-o.c
+@@ -1228,7 +1228,7 @@ simple_object_mach_o_write_segment (simple_object_write *sobj, int descriptor,
+       /* Swap the indices, if required.  */
+ 
+       for (i = 0; i < (nsects_in * 4); ++i)
+-	set_32 (&index[i], index[i]);
++	set_32 ((unsigned char *) &index[i], index[i]);
+ 
+       sechdr_offset += sechdrsize;
+ 
+-- 
+2.45.0
+
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
