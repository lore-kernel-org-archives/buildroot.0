Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7E7C5B56A
	for <buildroot@archiver.kernel.org>; Wed, 12 Aug 2026 09:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A1634084E;
	Wed, 12 Aug 2026 09:26:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W8pJtPvoFlA3; Wed, 12 Aug 2026 09:26:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3F714052C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786526789;
	bh=wkHqvoWgzLrXpfydQval1t6gNNYqDscvuZO7sstO2tE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ju9EC+leEzhitzPjSFFBcMkcSAi5Doq+HbqA5W+IitUU0dbfCa4Rvb4Xhneduu4J+
	 Bqvoigg28vFHjqVtLjZimcV+HfWZ1OhsJ8HueuimQGsdjTGIOb3Oo92AdWn8d+7pbH
	 O4jPevf8MKFPZGvJgeGoiWcr72iw+hCwBjTa5jiXn8ghVid0Uriek4f9bDSgDTlwi6
	 z4ddNq79+lOF94m6bjpDhaGLa7gux9p/afjFETrYn+oK/TQqceFzGqGJLgA0HrpOvl
	 63LDv0t5t/MdZmlTn/zoMYFZ04/s4PEBa087TgK+crSSLZUsgPvYsei6BC+k0ZrP8I
	 y8AZEc7siizuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3F714052C;
	Wed, 12 Aug 2026 09:26:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A074949B
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 09:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 920B0608A7
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 09:26:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5F93xOAaCDca for <buildroot@buildroot.org>;
 Wed, 12 Aug 2026 09:26:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=egorenar@linux.ibm.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 902CD6088C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 902CD6088C
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 902CD6088C
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 09:26:25 +0000 (UTC)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67C63DUL2708720
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 09:26:24 GMT
Received: from ppma11.dal12v.mail.ibm.com
 (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fwvnw8xyy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 09:26:24 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
 by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67C9QG8p011444
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 09:26:23 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4fxhfy55q9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 09:26:23 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 67C9QLSI29688142
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 09:26:21 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA19F2004D
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 09:26:21 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AED492004B
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 09:26:21 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 09:26:21 +0000 (GMT)
From: Alexander Egorenkov <egorenar@linux.ibm.com>
To: buildroot@buildroot.org
Date: Wed, 12 Aug 2026 11:26:21 +0200
Message-ID: <20260812092621.1840808-1-egorenar@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=RsP16imK c=1 sm=1 tr=0 ts=6a7c3c40 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8 a=HPuQYDFUjL8t-h-qnKEA:9
X-Proofpoint-GUID: GTGWxYtvd_8q0Em13SuaAJQhVZQedUme
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA3MiBTYWx0ZWRfXxjva+FlukZ4a
 kAP6lO3ONnNrfiFEekr3TqmMhaiRvP2hUI+frubpNHgTO4DmtDGCH/f9TE5QLgCXZRqz/oXlEFj
 kHAaPTIZFHK3hu+ezpIK3rQZuhLYIXJMkzRxj2sfGa9WWuJRvWQYRVPHqbqposAc+DCFhePH0yO
 AU2qym+WPG5silRGarbHkiyv2tPgmjrip/x3/pVjhdtnizzMbc5m0nawqXxO/tWCCXsnh2Ni3QE
 4OcEmjL3Ch7/qYZBcoLEz89P4RZZ0xHkOJwq2fyBzw1AT5mZpygyeui2D5qW0KKZSFVSPNRNJqY
 ZUg1Z12max7ycku0W49JWKlGZAKaw6iTIaT5rBBU+FYech+4JtewsrC5+88qa49bHvC96XgVAJK
 YD7RiN3K/oUMVNWjjxcfJLw4DBL0Dpe81a6W6ReMkIQJ4PFo1JvJzi2I3fDlfOZJFX8yhy4egKo
 x/iJobJXkxGo7Nj5RWw==
X-Proofpoint-ORIG-GUID: GTGWxYtvd_8q0Em13SuaAJQhVZQedUme
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA3MiBTYWx0ZWRfXyYBFTGO1ZMZr
 GWSoKD7VFyi+jjrk6TgAzIEGqqNH4HUFE8Ww15y72r/5SDPiyHQGjn/Z7BzPmVp9q1UFRq9lFB6
 f1pEtezzKryFiSDi/AsUAQ4ET0gXRPs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120072
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=
 content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=pp1; bh=8vXEs/Ig/xQZkU5MZzcIeiwZ/a03tijQtLR9EL5+5
 yI=; b=EzAeySqsrw3sAnGXbLG04mhb70xD742ClzJJVfgQSH+J/CciV1WjJmdmX
 kXKy7yL96ThGf4DcFrX0J0J9KHO5bBKYi5wx9fYNdmUQYv3+DYTaMNdOk7CFkTK1
 iA8RYqfqvBjLEnPi0y0g5Wfe6MFymFnPPbjZ87LaGHaCD+7EFNiPt6E2z3Nty7r1
 d5HlkYsJ3ZAP1SsaBy9wld5VB/rC1k11nPfXTrXXb88lz5hUGeU8O3eSa+pOwLjx
 1CzNWNGEMKNVLVo6KgNKc2jXJvlr+u0Ki0nZMc7exR6CgevoZhpHnucKQjrfDv4b
 NR5U2paorbaOLs/pBIHt9YS9so5Sg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.ibm.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=EzAeySqs
Subject: [Buildroot] [PATCH v1 1/1] package/s390-tools: bump version to
 2.44.0
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
index d5f6cc5ea81a..093f850c3de2 100644
--- a/package/s390-tools/s390-tools.hash
+++ b/package/s390-tools/s390-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  2933c6c5233cb70b7c47d9410458d8e4c26347de683e2c027956b9c67c7ebe9a  s390-tools-2.33.1.tar.gz
+sha256  05455baba4bcd3f2e6243aacf2d26f742c22944a29e412d50b89cc73e3028114  s390-tools-2.44.0.tar.gz
 sha256  cca17a9a944ebec769adee4aebd805c912c357785ff2705a99ffe68563021f75  LICENSE
diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
index 6b7a52447bf1..a01129338edf 100644
--- a/package/s390-tools/s390-tools.mk
+++ b/package/s390-tools/s390-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S390_TOOLS_VERSION = 2.33.1
+S390_TOOLS_VERSION = 2.44.0
 S390_TOOLS_SITE = $(call github,ibm-s390-linux,s390-tools,v$(S390_TOOLS_VERSION))
 S390_TOOLS_LICENSE = MIT
 S390_TOOLS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
