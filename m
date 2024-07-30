Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6E0C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 07:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6078C80DF2;
	Tue, 30 Jul 2024 07:27:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cB9m6SaZgM1a; Tue, 30 Jul 2024 07:27:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6826B81083
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6826B81083;
	Tue, 30 Jul 2024 07:27:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 531CB1BF360
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 07:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4135C405DE
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 07:27:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tPWcvhG2SIns for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 07:27:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=egorenar@linux.ibm.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 66E9E405D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66E9E405D0
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 66E9E405D0
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 07:27:31 +0000 (UTC)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46U5xFDe008611
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 07:27:31 GMT
Received: from ppma23.wdc07v.mail.ibm.com
 (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40ptgm094f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 07:27:31 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 46U7HgDe011143
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 07:27:30 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 40ncqmkcyy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 07:27:29 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 46U7RPfD56951042
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 07:27:28 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D45AE2004B
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 07:27:25 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B403320043
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 07:27:25 +0000 (GMT)
Received: from oc8242746057.boeblingen.de.ibm.com (unknown [9.152.212.85])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 07:27:25 +0000 (GMT)
From: Alexander Egorenkov <egorenar@linux.ibm.com>
To: buildroot@buildroot.org
Date: Tue, 30 Jul 2024 09:27:25 +0200
Message-ID: <20240730072725.152016-1-egorenar@linux.ibm.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oi18j_HH1IvmbV_c1o6hYYNcuyvoTFKn
X-Proofpoint-ORIG-GUID: oi18j_HH1IvmbV_c1o6hYYNcuyvoTFKn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_07,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 malwarescore=0 mlxscore=0 spamscore=0 clxscore=1015 mlxlogscore=659
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407300054
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=from
 :to:subject:date:message-id:mime-version
 :content-transfer-encoding; s=pp1; bh=RxzLnXH4P0ELioohWguYUeYqPj
 zcdkLCXv6sfRsH+VY=; b=HOkTaz0uUVhZHoQMzdYZc5nxUjRknOmLsJeM6aQdhn
 Ho1qa49oYqlcEJlmre7M6WtKNx/J6jxAn6JwlhlFutlW5uXyCs6vLXpGr/ep0YeR
 fyd4D7mQlqdXaLJoFknOVC5T5b2Ibtgjx3Kh33ro9++uYfvxbhkQSzOjin+UM7v2
 dbeEUwY4tHyQtmZRLcmmg3GegUFP+wE/Y14g9QM7rUHcwL+VpJ1FBIqGWqRfGd8L
 HXUe8Y3sU+VBoj1HOe4BYpVCOEJXvHtIsmTXhtxQ/zbmM/5Ee9dyNwPvJ7OQ4RsW
 ecqRjCCp+VjEjVWl4Mtc+KdhRTtnW2aw9HcK53H2r/+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.ibm.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=HOkTaz0u
Subject: [Buildroot] [PATCH v1 1/1] package/qemu: enable s390x arch as
 target package
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
 package/qemu/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 74962f3e2664..608e4d429dd6 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
 	default y if BR2_powerpc64
 	default y if BR2_powerpc64le
 	default y if BR2_riscv
+	default y if BR2_s390x
 	default y if BR2_x86_64
 
 comment "QEMU requires a toolchain with wchar, threads, gcc >= 8"
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
