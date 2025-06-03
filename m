Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F25EC5AD49
	for <buildroot@archiver.kernel.org>; Tue,  3 Jun 2025 13:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 205A161305;
	Tue,  3 Jun 2025 13:58:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fVmZBciULjIp; Tue,  3 Jun 2025 13:58:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E4CD612E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E4CD612E3;
	Tue,  3 Jun 2025 13:58:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 31E08DA
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 13:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 109284045E
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 13:58:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ODUjuAXSxSf1 for <buildroot@buildroot.org>;
 Tue,  3 Jun 2025 13:58:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com;
 envelope-from=prvs=524987e87f=brandon.maier@collins.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 46D8740AAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46D8740AAB
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 46D8740AAB
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 13:58:41 +0000 (UTC)
Received: from pps.filterd (m0346908.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5538bTWt023014;
 Tue, 3 Jun 2025 13:58:40 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 471wpysx05-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Jun 2025 13:58:40 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.135])
 by xusxph005rp050.rtx.com (8.18.1.2/8.18.1.2) with ESMTPS id 553DwcY7030780
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Jun 2025 13:58:38 GMT
Received: from crulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.18.1.2/8.18.1.2) with ESMTPS id
 553Dwcs7005850
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 3 Jun 2025 13:58:38 GMT
X-Received: from kirk.rockwellcollins.lab (unknown [10.148.204.208])
 by crulimr02.rockwellcollins.com (Postfix) with ESMTP id 32EAE30041DE;
 Tue,  3 Jun 2025 08:58:38 -0500 (CDT)
X-Received: from kirk.rockwellcollins.lab (localhost [IPv6:::1])
 by kirk.rockwellcollins.lab (Postfix) with ESMTP id 207B112833F2;
 Tue,  3 Jun 2025 08:58:38 -0500 (CDT)
Date: Tue, 03 Jun 2025 08:58:31 -0500
MIME-Version: 1.0
Message-Id: <20250603-bats-1-12-0-v1-1-e008a8f59265@collins.com>
X-B4-Tracking: v=1; b=H4sIAIb/PmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMwNj3aTEkmJdQ11DI10DXUtzM1NjC8skI6OUZCWgjoKi1LTMCrBp0bG
 1tQBk0R1PXQAAAA==
X-Change-ID: 20250603-bats-1-12-0-9765389b22dc
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-MHapp-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506030121
X-DMZapp-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506030120
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDEyMSBTYWx0ZWRfX/WJx66vs54S7
 j9VewTutoa7PZ/w5DDNFKmXS5T8NRmMHJPERsl5Eq6+95JBQBVjP295vStKNpuETK3hDZh6AmlA
 v6gzFaRe8JwdcdUwWR0EX3xVSTaeiL3tv+XsYgcroZbzhEze2O9CJ2JFZ2mq1mKI7jpyGfeKYGa
 4gSkXZmOsbVklgy18GYhV+ExXh5WSpkQyND3iUMNdG+nn93YX2VQCxlDYCUMQGbyR145fE2Z2+5
 lIaCyx3KFcT3/KFzSrGp0wZNUDO6GdYxlQjnfbVsCnjvQJWVOcH4AuYOUt/o+LKhWTJQJ5UnaV0
 fNWR1xcM1QFpLjhGGFNkLc+Mvt5fj7fDRngr8yo8IAp+u2EroCw2fe0lKnUhNwRJSwHy79YBbY8
 JiLwSl5u
X-Proofpoint-GUID: YUkzkHJT9c04Qqlx4sYe9-ou5OxT-9Em
X-Proofpoint-ORIG-GUID: YUkzkHJT9c04Qqlx4sYe9-ou5OxT-9Em
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-CPOD-Spam-Details: rule=outbound_default_notspam policy=outbound_default
 score=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506030121
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=aW9g0CGd+gUmw35mJivCKw+pPKbCvvczgSSbYOE9F3A=;
 b=eZHFf4D72m0vG75LciWPsaXxYbqd+4PWOs/iF0QWOHk5TZMqYywqIlV7dQZjesvxyFgX
 gaH+VZ+G/eO3vyUcR8iVPtFOyuybf5H/0yU52lotqcXMsyYaucdC6muAvhPx7BRk9h7N
 fRyiBhYVynrdQmBYZUPWAN3MTw1JfxjFkD+eXKwIavYTVPdX/uuNCFsiRvsEWoSMJIKk
 ysWOq+YX9bIsv/lXeGd3AlZJs5wRXwowA7rbxzYwlQobNu/ING2sq9n8t7USQCu4p/uB
 P1UQbhqb2OEYY4TxBmEhRjlAKJQLF2cGnJ5PuOzGAdMJEIMi2yrTVpEE+mhRHZJ/aHrQ Eg== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=eZHFf4D7
Subject: [Buildroot] [PATCH] package/bats-core: update to 1.12.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Cc: Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://github.com/bats-core/bats-core/releases/tag/v1.12.0

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 package/bats-core/bats-core.hash | 2 +-
 package/bats-core/bats-core.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bats-core/bats-core.hash b/package/bats-core/bats-core.hash
index e528f0fc107b73f90a3b374ab11bd906f4b3693f..60e52e921452aa154beb91fa41ca22913555c67e 100644
--- a/package/bats-core/bats-core.hash
+++ b/package/bats-core/bats-core.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  5c57ed9616b78f7fd8c553b9bae3c7c9870119edd727ec17dbd1185c599f79d9  bats-core-1.11.1.tar.gz
+sha256  e36b020436228262731e3319ed013d84fcd7c4bd97a1b34dee33d170e9ae6bab  bats-core-1.12.0.tar.gz
 
 # License files
 sha256  55074b2b3b87809105034e1468e59076554d76a80c67bcc592000cc3d929852d  LICENSE.md
diff --git a/package/bats-core/bats-core.mk b/package/bats-core/bats-core.mk
index 5e1c9c4bbc62cd9b5a614aaf189824e3ec7ac0bd..53d3b5405b396708b3cce96b265288a40faf8f39 100644
--- a/package/bats-core/bats-core.mk
+++ b/package/bats-core/bats-core.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BATS_CORE_VERSION = 1.11.1
+BATS_CORE_VERSION = 1.12.0
 BATS_CORE_SITE = $(call github,bats-core,bats-core,v$(BATS_CORE_VERSION))
 BATS_CORE_LICENSE = MIT
 BATS_CORE_LICENSE_FILES = LICENSE.md

---
base-commit: 521920831ceedb28389802c8d9ceedfb685a7be2
change-id: 20250603-bats-1-12-0-9765389b22dc

Best regards,
-- 
Brandon Maier <brandon.maier@collins.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
