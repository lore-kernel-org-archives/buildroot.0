Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE018C4345F
	for <buildroot@archiver.kernel.org>; Tue, 16 Apr 2024 14:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D7ED40114;
	Tue, 16 Apr 2024 14:49:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sRSw2I_GjGBY; Tue, 16 Apr 2024 14:49:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24D42404FF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24D42404FF;
	Tue, 16 Apr 2024 14:49:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 165F31BF27C
 for <buildroot@lists.busybox.net>; Tue, 16 Apr 2024 14:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0262A4027F
 for <buildroot@lists.busybox.net>; Tue, 16 Apr 2024 14:49:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hA4bJuFE3Co6 for <buildroot@lists.busybox.net>;
 Tue, 16 Apr 2024 14:49:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=arbab@linux.ibm.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0F98440114
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F98440114
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F98440114
 for <buildroot@buildroot.org>; Tue, 16 Apr 2024 14:49:03 +0000 (UTC)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 43GEZGs6031150; Tue, 16 Apr 2024 14:49:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xhu7mr11s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Apr 2024 14:49:02 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 43GEn2Bm018162;
 Tue, 16 Apr 2024 14:49:02 GMT
Received: from ppma21.wdc07v.mail.ibm.com
 (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xhu7mr11q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Apr 2024 14:49:02 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 43GCBG0W023576; Tue, 16 Apr 2024 14:49:01 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
 by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xg5cnxn91-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Apr 2024 14:49:01 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com
 [10.39.53.228])
 by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 43GEmwso57934114
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Apr 2024 14:49:01 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D280C58068;
 Tue, 16 Apr 2024 14:48:58 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA53D5805B;
 Tue, 16 Apr 2024 14:48:58 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.178.221])
 by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
 Tue, 16 Apr 2024 14:48:58 +0000 (GMT)
Received: by arbab-laptop.localdomain (Postfix, from userid 152845)
 id E46F2186F9C; Tue, 16 Apr 2024 09:48:57 -0500 (CDT)
From: Reza Arbab <arbab@linux.ibm.com>
To: buildroot@buildroot.org, "Yann E . MORIN" <yann.morin.1998@free.fr>
Date: Tue, 16 Apr 2024 09:48:18 -0500
Message-Id: <20240416144818.681220-1-arbab@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ln6Dy_l4thHtDXp818oqgEvNl-b88N4S
X-Proofpoint-ORIG-GUID: 8PZFRMk34P031OchjMlqSw2ADQ4G5sEC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-16_10,2024-04-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011
 impostorscore=0 spamscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404160090
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=hLPDezCRy76F3BsXUSSEsny5mMX2PV/3rZ1tivSR16g=;
 b=QWuZ+/QTqXToZnhjsgQ1eyQa4fe0sDZAXoszEKNqUyrHibHJiC1cAy8DCN6HmrSO4Je+
 LBcU+KmcvaTD6BwbWnCOezoTZbo3vMasbO7WPw4j9eMZfIrWF4W4b4fDN+jFkyhnZZ5n
 LncnQCtxiiSql39QRp94tAYROXg18FiE+n2gMwKuWePuK0KoUPUGCMANCoGlkrFanLOf
 QOhnUeOhIDSPlZh0JXm/0fyICSCKHqA3OcJG1Ne0Fwz8XbpTYyW8pR0CPLslNFlbr917
 pJIUWqIeNFyZ7ElMY1po0XnFNkGZ5EN4zpRq+rIOQhNHvKKq7DhmSttWjeePZKAdPfdB BQ== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.ibm.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=QWuZ+/QT
Subject: [Buildroot] [PATCH] package/petitboot: add libxcrypt optional
 dependency
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
Cc: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

  checking for crypt in -lcrypt... no
  configure: error: in `/home/arbab/src/buildroot/output/build/petitboot-1.15':
  configure: error: shadow/crypt libs required

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
---
 package/petitboot/Config.in    | 1 +
 package/petitboot/petitboot.mk | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/petitboot/Config.in b/package/petitboot/Config.in
index 533c7a9f2980..66836f31acd8 100644
--- a/package/petitboot/Config.in
+++ b/package/petitboot/Config.in
@@ -14,6 +14,7 @@ config BR2_PACKAGE_PETITBOOT
 	# run-time dependencies
 	select BR2_PACKAGE_KEXEC if !BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS
 	select BR2_PACKAGE_KEXEC_LITE if BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS && !BR2_PACKAGE_KEXEC
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_NVME if ( BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le )
 	select BR2_PACKAGE_POWERPC_UTILS if ( BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le )
 	help
diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
index cd7631fa5cae..2eb6461144cd 100644
--- a/package/petitboot/petitboot.mk
+++ b/package/petitboot/petitboot.mk
@@ -14,6 +14,7 @@ PETITBOOT_DEPENDENCIES = \
 	host-bison \
 	host-flex \
 	lvm2 \
+	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt) \
 	$(TARGET_NLS_DEPENDENCIES)
 PETITBOOT_LICENSE = GPL-2.0
 PETITBOOT_LICENSE_FILES = COPYING
-- 
2.39.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
