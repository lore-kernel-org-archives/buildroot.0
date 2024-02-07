Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CA4C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 17:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43BE983C66;
	Wed,  7 Feb 2024 17:51:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GzY1hC0nETnr; Wed,  7 Feb 2024 17:51:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09EE683C69
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09EE683C69;
	Wed,  7 Feb 2024 17:51:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A16791BF954
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 17:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 971BD83C62
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 17:51:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ptv7udl-I9DW for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 17:51:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=arbab@linux.ibm.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 864DE83C48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 864DE83C48
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 864DE83C48
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 17:51:48 +0000 (UTC)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 417HLvJS020935; Wed, 7 Feb 2024 17:51:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w4dc7ae5g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Feb 2024 17:51:46 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 417HMNHd022410;
 Wed, 7 Feb 2024 17:51:46 GMT
Received: from ppma22.wdc07v.mail.ibm.com
 (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w4dc7ae59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Feb 2024 17:51:46 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 417GPKqw008758; Wed, 7 Feb 2024 17:51:45 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
 by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3w206yqdyu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Feb 2024 17:51:45 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 417Hpjuj8061494
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Feb 2024 17:51:45 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 204CE58059;
 Wed,  7 Feb 2024 17:51:45 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 091A158043;
 Wed,  7 Feb 2024 17:51:45 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.178.221])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
 Wed,  7 Feb 2024 17:51:44 +0000 (GMT)
Received: by arbab-laptop.localdomain (Postfix, from userid 152845)
 id 3A46D90AC2E; Wed,  7 Feb 2024 11:51:44 -0600 (CST)
From: Reza Arbab <arbab@linux.ibm.com>
To: buildroot@buildroot.org, Arnout Vandecappelle <arnout@mind.be>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Date: Wed,  7 Feb 2024 11:51:34 -0600
Message-Id: <20240207175135.1532037-5-arbab@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240207175135.1532037-1-arbab@linux.ibm.com>
References: <20240207175135.1532037-1-arbab@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: r3M8U9IOv1LZz6rFpnAHV20Rpn8L_6_I
X-Proofpoint-ORIG-GUID: 6qZ4WOAKaeCeSIMyKvTaiSw5wLWdOvsW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-07_09,2024-02-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 phishscore=0 clxscore=1011 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402070132
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=KgkX4GVioCnnMCY0ye9BfBYywAh/vnfxhQ2t+w5OL0g=;
 b=E6LrMABBVv6uEf969ZGt5jy5sPt1ZWuKxa2tWABuRmeN8YyuVbzO3GjKFK6m4m/8qaqS
 Rpr1QMl7Of9l6NxvKsaEPRq3dhJLoamGg+hjstNco2KAKFd+oEQOo+WC2QaavwOIjcIi
 OFBm0WFQ83iU9SEMg3vPSvecSPLNDJbAtq23mAaiBAJFZQlKaO+bjg4FVQfR2ibfZyeb
 mG66HguMnxBAJbMfsVC7iOK+/t23hy32hgQnWB2BNK0uL1AnN48K69L7GHVE2eBQ0Xod
 wGFXrrH06E0HtMXw75XYdT4MH6V/VA5cRZU+cFGRlH+iQ395UowQBz/MAdv6ui83S3oC jA== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.ibm.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=E6LrMABB
Subject: [Buildroot] [PATCH v5 4/5] package/petitboot: run script when
 exiting to shell
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

When the user selects the shell escape option from the petitboot menu,
reset the terminal so output is raw rather than being confined to the
ncurses window set up for the petitboot menu, and print some helpful
text before running the shell.

To do this, override the default HOST_PROG_SH (/bin/sh) with a small
script. Doing so also enables someone to customize this behavior by
overlaying a different script.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
---
 package/petitboot/pb-shell     | 10 ++++++++++
 package/petitboot/petitboot.mk |  3 +++
 2 files changed, 13 insertions(+)
 create mode 100644 package/petitboot/pb-shell

diff --git a/package/petitboot/pb-shell b/package/petitboot/pb-shell
new file mode 100644
index 000000000000..99887c3f3b87
--- /dev/null
+++ b/package/petitboot/pb-shell
@@ -0,0 +1,10 @@
+#!/bin/sh
+
+reset
+
+cat <<EOM
+Exiting petitboot. Type 'exit' to return.
+You may run 'pb-sos' to gather diagnostic data.
+EOM
+
+exec /bin/sh
diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
index 291083269ae9..e2f762842534 100644
--- a/package/petitboot/petitboot.mk
+++ b/package/petitboot/petitboot.mk
@@ -29,6 +29,7 @@ PETITBOOT_CONF_OPTS = \
 	--without-twin-x11 \
 	$(if $(BR2_PACKAGE_BUSYBOX),--enable-busybox,--disable-busybox) \
 	HOST_PROG_KEXEC=/usr/sbin/kexec \
+	HOST_PROG_SH=/usr/libexec/petitboot/pb-shell \
 	HOST_PROG_SHUTDOWN=/usr/sbin/kexec-restart
 
 # HPA and Busybox tftp are supported. HPA tftp is part of Buildroot's tftpd
@@ -81,6 +82,8 @@ define PETITBOOT_POST_INSTALL
 		$(TARGET_DIR)/usr/sbin/kexec-restart
 	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/pb-console \
 		$(TARGET_DIR)/etc/init.d/pb-console
+	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/pb-shell \
+		$(TARGET_DIR)/usr/libexec/petitboot/pb-shell
 
 	mkdir -p $(TARGET_DIR)/etc/udev/rules.d
 	for port in $(PETITBOOT_GETTY_PORT); do \
-- 
2.39.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
