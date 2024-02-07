Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78ADAC4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 17:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47E0D83C6C;
	Wed,  7 Feb 2024 17:51:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FCtK3J_7AbAl; Wed,  7 Feb 2024 17:51:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A7A883CAA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A7A883CAA;
	Wed,  7 Feb 2024 17:51:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F3BBA1BF868
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 17:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFBCA40137
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 17:51:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KQdo6qYd_4BW for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 17:51:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=arbab@linux.ibm.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8727240446
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8727240446
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8727240446
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 17:51:48 +0000 (UTC)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 417HSnZN026788; Wed, 7 Feb 2024 17:51:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w4e9qge4k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Feb 2024 17:51:47 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 417HSpZt027042;
 Wed, 7 Feb 2024 17:51:46 GMT
Received: from ppma11.dal12v.mail.ibm.com
 (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w4e9qge4b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Feb 2024 17:51:46 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
 by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 417FfRld016215; Wed, 7 Feb 2024 17:51:45 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
 by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w22h26t70-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Feb 2024 17:51:45 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com
 [10.39.53.228])
 by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 417HpjmP44695950
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Feb 2024 17:51:45 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0EE5258067;
 Wed,  7 Feb 2024 17:51:45 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 003D558065;
 Wed,  7 Feb 2024 17:51:45 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.178.221])
 by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
 Wed,  7 Feb 2024 17:51:44 +0000 (GMT)
Received: by arbab-laptop.localdomain (Postfix, from userid 152845)
 id 33DF990AC2C; Wed,  7 Feb 2024 11:51:44 -0600 (CST)
From: Reza Arbab <arbab@linux.ibm.com>
To: buildroot@buildroot.org, Arnout Vandecappelle <arnout@mind.be>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Date: Wed,  7 Feb 2024 11:51:32 -0600
Message-Id: <20240207175135.1532037-3-arbab@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240207175135.1532037-1-arbab@linux.ibm.com>
References: <20240207175135.1532037-1-arbab@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: shxutx1iJr-lfryKz5GhKIiE7dKCuDl1
X-Proofpoint-GUID: H7Tur-GoLOOVm8Ei_LgaowSjdA3t6hrU
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-07_09,2024-02-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 mlxscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402070132
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=5Yg4i6pQcAKfESexkAJMORgWi6RAJDRyH0Q20hGXmWY=;
 b=VDudYJHUARSLAXcZpUeLADXl+eftB/4Zlf8imJrwfX/yIrP+t7mCVJ7axZUjrBmM3xEH
 1bNq4QiZzSUXLNqes2oRG13dvxa2XogIT+HLANQDdODDGqCVTOfadHkWD/GVCt5woWAo
 0gWdlUkmHzBgNisXjGDEjT3isU9lZB90s2wua7FwJ8pGkTGaFZORJiXH7GoFrD2r3Azd
 WAFbzbxJMALbFjeml9EPhjGSkJvuDZnjzJfXpBJmZOvVWgzZqd9El88WX7rFj+jsaPWI
 GSIZ1FLOKUs68nYQoZR5+tfdYdgnPG0nrwQgb47idrmWQBsaBbjbp3652Cazy5CqT/25 tw== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.ibm.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=VDudYJHU
Subject: [Buildroot] [PATCH v5 2/5] package/petitboot: prefer UTF-8 support
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
Cc: Joel Stanley <joel@jms.id.au>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>
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

Turn on wchar support in ncurses, and add a reminder that a UTF-8 locale
should be generated for things to look right.

[1] https://invisible-island.net/ncurses/ncurses.faq.html#no_line_drawing

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
---
 package/petitboot/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/petitboot/Config.in b/package/petitboot/Config.in
index 6a3d476b11b3..4f3b1c1ea4d1 100644
--- a/package/petitboot/Config.in
+++ b/package/petitboot/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_PETITBOOT
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_LVM2 # devmapper
 	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES_WCHAR
 	# run-time dependencies
 	select BR2_PACKAGE_KEXEC if !BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS
 	select BR2_PACKAGE_KEXEC_LITE if BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS && !BR2_PACKAGE_KEXEC
@@ -18,6 +19,8 @@ config BR2_PACKAGE_PETITBOOT
 	help
 	  Petitboot is a small kexec-based bootloader
 
+	  NOTE: petitboot looks best in a UTF-8 locale (BR2_GENERATE_LOCALE)
+
 	  http://www.kernel.org/pub/linux/kernel/people/geoff/petitboot/petitboot.html
 
 if BR2_PACKAGE_PETITBOOT
-- 
2.39.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
