Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6F1C2BB3F
	for <buildroot@archiver.kernel.org>; Wed, 15 Nov 2023 22:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F832614FA;
	Wed, 15 Nov 2023 22:00:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F832614FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IAXmGBS0FN1U; Wed, 15 Nov 2023 22:00:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7599261514;
	Wed, 15 Nov 2023 22:00:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7599261514
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 517851BF228
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 21:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2791840017
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 21:59:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2791840017
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 14mUwLz_CIX5 for <buildroot@lists.busybox.net>;
 Wed, 15 Nov 2023 21:59:46 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AAF85405D8
 for <buildroot@buildroot.org>; Wed, 15 Nov 2023 21:59:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAF85405D8
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AFKiZi0000809; Wed, 15 Nov 2023 21:59:45 GMT
Received: from ppma21.wdc07v.mail.ibm.com
 (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ud52r9tnc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Nov 2023 21:59:45 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AFKIwAo015487; Wed, 15 Nov 2023 21:59:44 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
 by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3uamxnje8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Nov 2023 21:59:44 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com
 [10.39.53.230])
 by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3AFLxhox10879720
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Nov 2023 21:59:43 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86E8C58054;
 Wed, 15 Nov 2023 21:59:43 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 700595805D;
 Wed, 15 Nov 2023 21:59:43 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.178.221])
 by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
 Wed, 15 Nov 2023 21:59:43 +0000 (GMT)
Received: by arbab-laptop.localdomain (Postfix, from userid 152845)
 id AAA6D2CB5605; Wed, 15 Nov 2023 15:59:42 -0600 (CST)
From: Reza Arbab <arbab@linux.ibm.com>
To: buildroot@buildroot.org
Date: Wed, 15 Nov 2023 15:59:28 -0600
Message-Id: <20231115215931.860940-3-arbab@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20231115215931.860940-1-arbab@linux.ibm.com>
References: <20231115215931.860940-1-arbab@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6paVoruFT7Nca1RAfpqViCE8aBXQBZ4u
X-Proofpoint-ORIG-GUID: 6paVoruFT7Nca1RAfpqViCE8aBXQBZ4u
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-15_20,2023-11-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 mlxscore=0 phishscore=0 spamscore=0 mlxlogscore=989 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311150173
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=tP5rCM8qtxcm2G7qlJznG+PYqq3O78tbc4ykH6gJkZQ=;
 b=LKA9T0BY6KqKSB+ZoCb7tarvwlj5bk/PCWyXeH+bvB9Erx2fueHxmO3DY29d56t5nK53
 k48DEOrCVlYFYBXGhKKqW98XnHNA1lkMvliQS4dZyu1swr5/H5DOqGYKZxqmGYEBxhSk
 j6f1vOE7tl5YWLlupHDeVyvazZ3M6fietwCSD7jGBduckNIiCRNl8g4xo7FPzvjDasU0
 68uyaCPuRiGcIZFIxaCbYKEJSkk3+H4QyqCPJ7BnPDGQZiqA0ZmzhxZy/D9x9kq0wuLZ
 /TIQYsYqxWzJ6tmYuaRqD4sNLGDugDp3NNRJCLxl28YE30PlMfPVOjaUS5Jt9djcfZGz qQ== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=LKA9T0BY
Subject: [Buildroot] [PATCH v4 2/5] package/petitboot: prefer UTF-8 support
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
Cc: Laurent Vivier <laurent@vivier.eu>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The petitboot UI looks much nicer in a Unicode locale:

* Items in the language selection submenu use multibyte Unicode
  characters. In other locales, they say "Unable to display text in this
  locale".

* The combination of TERM=linux with a UTF-8 locale is required to
  trigger a special-case workaround in ncurses code[1]. Without
  this, line-drawing characters in the menu look like q's.

Add a reminder that a UTF-8 locale should be generated for things to
look right.

[1] https://invisible-island.net/ncurses/ncurses.faq.html#no_line_drawing

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
---
 package/petitboot/Config.in | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/petitboot/Config.in b/package/petitboot/Config.in
index 93ed3642c3c9..46327903ed2e 100644
--- a/package/petitboot/Config.in
+++ b/package/petitboot/Config.in
@@ -3,12 +3,14 @@ config BR2_PACKAGE_PETITBOOT
 	depends on BR2_PACKAGE_KEXEC_ARCH_SUPPORTS || BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # lvm2
 	depends on BR2_USE_WCHAR # elfutils
+	depends on BR2_ENABLE_LOCALE
 	depends on !BR2_STATIC_LIBS # elfutils, lvm2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils, lvm2
 	depends on BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_LVM2 # devmapper
 	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES_WCHAR
 	# run-time dependencies
 	select BR2_PACKAGE_KEXEC if !BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS
 	select BR2_PACKAGE_KEXEC_LITE if BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS && !BR2_PACKAGE_KEXEC
@@ -17,12 +19,14 @@ config BR2_PACKAGE_PETITBOOT
 	help
 	  Petitboot is a small kexec-based bootloader
 
+	  NOTE: petitboot looks best in a UTF-8 locale (BR2_GENERATE_LOCALE)
+
 	  http://www.kernel.org/pub/linux/kernel/people/geoff/petitboot/petitboot.html
 
-comment "petitboot needs a toolchain w/ wchar, dynamic library, threads, udev /dev management"
+comment "petitboot needs a toolchain w/ wchar, locale, dynamic library, threads, udev /dev management"
 	depends on BR2_PACKAGE_KEXEC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || \
+	depends on !BR2_USE_WCHAR || !BR2_ENABLE_LOCALE || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_PACKAGE_HAS_UDEV
 
-- 
2.39.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
