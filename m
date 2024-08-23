Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1233CC52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 15:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9E8281EC0;
	Fri, 23 Aug 2024 15:26:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xwjlzHUo2sKD; Fri, 23 Aug 2024 15:26:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C337181EC1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C337181EC1;
	Fri, 23 Aug 2024 15:26:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D80651BF4E6
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 15:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4633612F4
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 15:26:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HuDw28y6UtQV for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 15:26:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.156.19;
 helo=mx0a-00230701.pphosted.com; envelope-from=yuriy.kolerov@synopsys.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 882A060630
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 882A060630
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com
 [148.163.156.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 882A060630
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 15:26:06 +0000 (UTC)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
 by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47NEJG2Y026270;
 Fri, 23 Aug 2024 08:26:01 -0700
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 414g8mcjxw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Aug 2024 08:26:00 -0700 (PDT)
Received: from mailhost.synopsys.com (eudc-mailhost1.synopsys.com
 [10.213.161.16])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B7DD340130;
 Fri, 23 Aug 2024 15:25:59 +0000 (UTC)
Received: from SNPS-HRlPxd6IgG.internal.synopsys.com
 (snps-hrlpxd6igg.internal.synopsys.com [10.120.15.181])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id 8B2C6C01E2;
 Fri, 23 Aug 2024 15:25:57 +0000 (UTC)
X-SNPS-Relay: synopsys.com
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 18:25:47 +0300
Message-Id: <20240823152547.1023215-1-ykolerov@synopsys.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Proofpoint-GUID: IwUA3Ml3aivAkFrgKjli1wbHL_F7_dop
X-Authority-Analysis: v=2.4 cv=T4TeTOKQ c=1 sm=1 tr=0 ts=66c8aa08 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=yoJbH4e0A30A:10 a=jIQo8A4GAAAA:8 a=e4x6tBIcj2PwPzYWiAsA:9
 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-ORIG-GUID: IwUA3Ml3aivAkFrgKjli1wbHL_F7_dop
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_11,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 mlxlogscore=809 impostorscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408230113
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=pfptdkimsnps; bh=efE3TxDw0jfsqIDlQlFt1PaGNFVx3LM2
 WlVehKieiSk=; b=FcYXZCxfh3/q2kfWcD/MXq1jvK7PuEBr0yLB3SRlJ/uMo/U+
 u/Ks7wUSGWuC5n3jWfAaba6ujyuHZNetQAyTmRqYAzySsfT4Eup9hKVlWo00JzmB
 0zeAWlHadaE6KQ1702m9E1/7Z7sxWmfowDiWmwOSMQKZjzrPqb0TxExSnhwIWmAD
 1NGyjB1zrCV/QtRyJb9v9GCs52xp0n4c8iZ5xUjdry+ltW6l+lJK0aAeUMRcMA6N
 KzlW9t2MPGhVVqZkbZR/FdWRkAb68cNdFIdBYbHl/I3FpRWJndEDFbKW9m0Hilo9
 zJq6FAHVFuhk9OE/+7sNmQGSUEbrWXL4SFasSA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1724426760; bh=y0pSjeMf4GOpiZQfO+EBSWSJhH1Y95OCfCZp12NwyKs=;
 h=From:To:Cc:Subject:Date:From;
 b=b8WkP47+5nyQxhgvWVRaxMsAyLBpnV5poTIBfbbl7P9W+bpMeydjCyv1Lg/sRlMD4
 jtU7r1jb+293UMolv5RioCMyesJV6yCg2ZJvs5vgZ3Pd6e9gDj8eVi+cp6+U71JBFI
 fmpBgLpiJPhLQIlnld48ngFjDjYP2cpjiULLLGp/UA4qCwI+WFEGGnhvKEzQdvV8XA
 euOKE+lGNYL0AOU3utq9Frv2+7zmzLlonazxqV64SmnULGtQLJqXm7j/21bssfKhjl
 WvKGzLunk269XTx85jljM08uFyckqucsALAnhHK/ZhswDyPIQWoin843AUaDFrRvC4
 L5EMxpIcqeNkg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=synopsys.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=synopsys.com
 header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps
 header.b=FcYXZCxf; 
 dkim=pass (2048-bit key,
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=mail header.b=b8WkP47+
Subject: [Buildroot] [PATCH 1/1] package/glibc: drop support of ARC 700
 targets
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
From: Yuriy Kolerov via buildroot <buildroot@buildroot.org>
Reply-To: Yuriy Kolerov <Yuriy.Kolerov@synopsys.com>
Cc: Romain Naour <romain.naour@gmail.com>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Yuriy Kolerov <Yuriy.Kolerov@synopsys.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Synopsys ARC 700 family is not supported by glibc. Thus, it is
necessary to prevent selecting glibc while configuring for
that processors family.

Signed-off-by: Yuriy Kolerov <ykolerov@synopsys.com>
---
 package/glibc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 81c64083f4..6075d28874 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -21,7 +21,7 @@ config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 	default y if BR2_x86_64
 	default y if BR2_microblaze
 	default y if BR2_nios2
-	default y if BR2_arc && BR2_ARC_ATOMIC_EXT
+	default y if BR2_arc && BR2_ARC_ATOMIC_EXT && !BR2_arc750d && !BR2_arc770d
 	depends on !BR2_POWERPC_CPU_HAS_SPE
 	depends on BR2_RISCV_ISA_RVA || !BR2_riscv
 	depends on BR2_USE_MMU
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
