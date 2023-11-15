Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785BEC072A2
	for <buildroot@archiver.kernel.org>; Wed, 15 Nov 2023 22:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F75E6150D;
	Wed, 15 Nov 2023 22:00:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F75E6150D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o0NERUIDgz4l; Wed, 15 Nov 2023 22:00:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A278561687;
	Wed, 15 Nov 2023 22:00:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A278561687
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C67F91BF951
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 21:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CD92405E3
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 21:59:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CD92405E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Kon_uTBX3vV for <buildroot@lists.busybox.net>;
 Wed, 15 Nov 2023 21:59:46 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 391EC40017
 for <buildroot@buildroot.org>; Wed, 15 Nov 2023 21:59:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 391EC40017
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AFLPkQv006738; Wed, 15 Nov 2023 21:59:45 GMT
Received: from ppma23.wdc07v.mail.ibm.com
 (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ud5vxrpgh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Nov 2023 21:59:44 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AFKIx2o014619; Wed, 15 Nov 2023 21:59:44 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
 by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3uanektady-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Nov 2023 21:59:44 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com
 [10.241.53.102])
 by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3AFLxhUI35521046
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Nov 2023 21:59:43 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 457B258056;
 Wed, 15 Nov 2023 21:59:43 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 36F535805A;
 Wed, 15 Nov 2023 21:59:43 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.178.221])
 by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Wed, 15 Nov 2023 21:59:43 +0000 (GMT)
Received: by arbab-laptop.localdomain (Postfix, from userid 152845)
 id B077F2D9558C; Wed, 15 Nov 2023 15:59:42 -0600 (CST)
From: Reza Arbab <arbab@linux.ibm.com>
To: buildroot@buildroot.org
Date: Wed, 15 Nov 2023 15:59:30 -0600
Message-Id: <20231115215931.860940-5-arbab@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20231115215931.860940-1-arbab@linux.ibm.com>
References: <20231115215931.860940-1-arbab@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: lA5RcnUgV5itAwgB28mQXHlADxBR5jV5
X-Proofpoint-GUID: lA5RcnUgV5itAwgB28mQXHlADxBR5jV5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-15_20,2023-11-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311150173
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=HcJoGi9XGVkPRQxc+SOLRabEVaN8+efoFO5pNx83zV8=;
 b=jocP3ALQyWOC5D2hX96VNUVm6d8vdmQObPwHanc/+IBXwJUbdVc0cM0qmtSd8EInPCCI
 CmBF7WjX1PSuepOFCgNS6YDpewXeQvH5dVWttIOAbR6DI2LE1aZLjn4Q2P3WyWnDV1jB
 k5Q1WzNcMwWlFqINjMzAVBSaKlMH8fXC831U7mY7CJ63fG+9mLSQQ1CIKQS9MTeNDJ8l
 tFk2PE49wRElN9bNGLM0yOpCMxmUJg4kj3v58n4U+0hNvkEDKOCuJ5Gg0WzaXqIlAotR
 LS1j2ZtPqaHwRqEZEKZjhta7ljmkRUnJeiC1UG/ULpRAA68xOPGNLz4nbRq5Mmi875oq pQ== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=jocP3ALQ
Subject: [Buildroot] [PATCH v4 4/5] package/petitboot: run script when
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
Cc: Laurent Vivier <laurent@vivier.eu>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When the user selects the shell escape option from the petitboot menu,
reset the terminal and print some helpful text before running the shell.

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
index 000000000000..2f757061003b
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
+exec /bin/sh -l
diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
index fc1c5da03742..3d29d103b518 100644
--- a/package/petitboot/petitboot.mk
+++ b/package/petitboot/petitboot.mk
@@ -21,6 +21,7 @@ PETITBOOT_CONF_OPTS = \
 	--without-twin-x11 \
 	$(if $(BR2_PACKAGE_BUSYBOX),--enable-busybox,--disable-busybox) \
 	HOST_PROG_KEXEC=/usr/sbin/kexec \
+	HOST_PROG_SH=/usr/libexec/petitboot/pb-shell \
 	HOST_PROG_SHUTDOWN=/usr/sbin/kexec-restart
 
 # HPA and Busybox tftp are supported. HPA tftp is part of Buildroot's tftpd
@@ -73,6 +74,8 @@ define PETITBOOT_POST_INSTALL
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
