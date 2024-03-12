Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03720C54E58
	for <buildroot@archiver.kernel.org>; Tue, 12 Mar 2024 20:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DAF140463;
	Tue, 12 Mar 2024 20:16:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eSZNd9hfp2ej; Tue, 12 Mar 2024 20:16:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 926DD409E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 926DD409E6;
	Tue, 12 Mar 2024 20:16:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A31C1BF239
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 20:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56653406E7
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 20:16:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JR-1cJj_qIlO for <buildroot@lists.busybox.net>;
 Tue, 12 Mar 2024 20:16:20 +0000 (UTC)
X-Greylist: delayed 3972 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 12 Mar 2024 20:16:19 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D7F75403F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7F75403F5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7F75403F5
 for <buildroot@buildroot.org>; Tue, 12 Mar 2024 20:16:19 +0000 (UTC)
Received: from pps.filterd (m0346901.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 42CEkUHl014284; Tue, 12 Mar 2024 19:10:04 GMT
Received: from xusxph008rp050.rtx.com (xusxph008rp050.rtx.com [128.13.124.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3wtgt2qdpf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Mar 2024 19:10:04 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph008rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 42CJA3gf030508
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 12 Mar 2024 19:10:03 GMT
Received: from dtulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 42CJA2KU030104
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 12 Mar 2024 19:10:03 GMT
X-Received: from bspbox.kirk (kirk.rockwellcollins.lab [10.148.204.208])
 by dtulimr01.rockwellcollins.com (Postfix) with ESMTP id 616CE20225AC;
 Tue, 12 Mar 2024 14:10:02 -0500 (CDT)
To: buildroot@buildroot.org
Date: Tue, 12 Mar 2024 19:09:54 +0000
Message-ID: <20240312190954.71227-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-12_12,2024-03-12_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-12_12,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=900
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2403120146
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0
 mlxlogscore=831 bulkscore=0 suspectscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2403120146
X-Proofpoint-ORIG-GUID: phNuVnzSHhcd_NZl77cOipDeTp6WQZ-n
X-Proofpoint-GUID: phNuVnzSHhcd_NZl77cOipDeTp6WQZ-n
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2403120146
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=POD051818; bh=O9BvHuLI5jdlY5OWcCCewpDc81NhHDYc2x0SoEmrJTg=;
 b=IP7IqAUTfdMw2KldFINR5JMngz1WDj4j/MDYsUXfWXR8AXuUzbmOj7FvjRs3ypUpl5e1
 kbAQPEY3qj0qiGwL+b0s3GTqYl8qXiAi/rripVpGBspYpNJ7n+iJ0IAe8T3OZFnQzOYV
 vs4UHAT3bmnAlpjr/fZ5nJJt49ZipzQs6SRJW+oEUMs1oemQxfYOx4p136xgM5kpdaD3
 n+TUHkC4+Hmd5NgP+a3R9ey5LeUC15M/rQOmSyLBSkXBrD15HSWl1pJ+HiLb9DFZ9H9W
 N1glilzCzGL8RL6L026g4E46OP1pKK/afAsS+n95Rt3qXfT8pmxWAi2yCrJq0kR/8fcF Ag== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=IP7IqAUT
Subject: [Buildroot] [PATCH 1/1] package/gmp: fix target build with host gcc
 4.9
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
Cc: Brandon Maier <brandon.maier@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

GMP does not build if the host gcc is v4.9 due to the following error

  gen-sieve.c: In function 'setmask':
  gen-sieve.c:99:3: error: 'for' loop initial declarations are only allowed in C99 or C11 mode
     for (unsigned i = 0; i < 2 * a * b; ++i)
     ^
  gen-sieve.c:99:3: note: use option -std=c99, -std=gnu99, -std=c11 or -std=gnu11 to compile your code

The gen-sieve utility was added in GMP v6.3.0. It is built using
CC_FOR_BUILD (host compiler) during cross compilation as it generates
build files. Autoconf does not have a macro for add -std=c99 to
CC_FOR_BUILD, so it must be set manually.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 package/gmp/gmp.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index bd401c6a80..85836a8c72 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -14,6 +14,11 @@ GMP_CPE_ID_VENDOR = gmplib
 GMP_DEPENDENCIES = host-m4
 HOST_GMP_DEPENDENCIES = host-m4
 
+# The compiler for build requires C99 but GCC 4.9 defaults to C89
+ifeq ($(BR2_HOST_GCC_AT_LEAST_5),)
+GMP_CONF_ENV += CC_FOR_BUILD="$(HOSTCC) -std=c99"
+endif
+
 # GMP doesn't support assembly for coldfire or mips r6 ISA yet
 # Disable for ARM v7m since it has different asm constraints
 ifeq ($(BR2_m68k_cf)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6)$(BR2_ARM_CPU_ARMV7M),y)
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
