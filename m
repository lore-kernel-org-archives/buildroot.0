Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589E0E95A96
	for <buildroot@archiver.kernel.org>; Mon,  9 Oct 2023 15:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15537612E0;
	Mon,  9 Oct 2023 15:19:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15537612E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qRIMf0mk-h87; Mon,  9 Oct 2023 15:19:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E5EE612C8;
	Mon,  9 Oct 2023 15:19:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E5EE612C8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0DC6E1BF364
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 15:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E83E7612B6
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 15:18:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E83E7612B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E7hCEa51GJqD for <buildroot@lists.busybox.net>;
 Mon,  9 Oct 2023 15:18:24 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5BF74612CB
 for <buildroot@buildroot.org>; Mon,  9 Oct 2023 15:18:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BF74612CB
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 399FHOEw008301; Mon, 9 Oct 2023 15:18:24 GMT
Received: from ppma21.wdc07v.mail.ibm.com
 (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmm1ar0xx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Oct 2023 15:18:23 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 399EmIfp025901; Mon, 9 Oct 2023 15:18:22 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
 by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tkjnn1ttc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Oct 2023 15:18:22 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com
 [10.241.53.102])
 by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 399FILxv61014402
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Oct 2023 15:18:21 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C67B5805A;
 Mon,  9 Oct 2023 15:18:21 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2433158060;
 Mon,  9 Oct 2023 15:18:19 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.61.33.25])
 by smtpav03.dal12v.mail.ibm.com (Postfix) with SMTP;
 Mon,  9 Oct 2023 15:18:18 +0000 (GMT)
Received: by arbab-laptop.localdomain (Postfix, from userid 152845)
 id 8845A2A37A72; Mon,  9 Oct 2023 10:17:48 -0500 (CDT)
From: Reza Arbab <arbab@linux.ibm.com>
To: buildroot@buildroot.org
Date: Mon,  9 Oct 2023 10:17:26 -0500
Message-Id: <20231009151729.2223963-6-arbab@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20231009151729.2223963-1-arbab@linux.ibm.com>
References: <20231009151729.2223963-1-arbab@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5VkCy6Y7nNLgE-NuNkk8022cm6ixMsHb
X-Proofpoint-ORIG-GUID: 5VkCy6Y7nNLgE-NuNkk8022cm6ixMsHb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_13,2023-10-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 phishscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310090126
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=VEPkt5faL08tabWnr5+fTAaR0kTOmYS9TgK/450ha5c=;
 b=D42FyxomSxw9IxK6BwV4YMH1ueqwTZpMF6F8sb06ErTrYLcnGTfAvpy6lFyD4cwGhSGP
 p7FqJHJbNMSqwsFlsUQ1bQ1YQEVFCs7A5KjjGLe9GkD168m7SKPWF+wu7TcgdMGRIzZx
 4Igc+nT4qRQ/nG2DSJtxJJwywyzERxwVwEGV0oYNUUeyXML1jIxx2MPNEA7xxOh3AtdO
 EVFPzgRvN2XcuM5suwSny+MYR8rlKs6cJ5zeX9GpqhoZP9J6dARoEhGLG4Q+Z0T5xSc9
 ix29INh89L0XY3zQXqzBW3coriMibgtVtZhYuS85qIvQZrI8bVy2jMnQYuqJUkL6UkG3 HA== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=D42Fyxom
Subject: [Buildroot] [PATCH v3 5/8] package/petitboot: fix shutdown
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

There are a few ways to set HOST_PROG_SHUTDOWN that enable us to
successfully kexec the new kernel chosen from the petitboot menu.

1. HOST_PROG_SHUTDOWN=/usr/libexec/petitboot/bb-kexec-reboot
    `- bb-kexec-reboot does 'exec kill -QUIT 1'
        |- init sends SIGTERM to pb-console
        |   `- pb-console does 'trap 'reset; echo "SIGTERM received, booting..."; sleep 2' SIGTERM'
        `- init runs 'null::restart:/usr/sbin/kexec-restart'
            `- kexec-restart does '/usr/sbin/kexec -f -e'

2. HOST_PROG_SHUTDOWN=/usr/sbin/kexec-restart
    `- kexec-restart does '/usr/sbin/kexec -f -e'

3. unset HOST_PROG_SHUTDOWN (default is /sbin/shutdown)
    `- petitboot tries, in order:
        |- 1. '/sbin/shutdown -r now'
        |      `- file not found
        |- 2. '/usr/sbin/kexec -e'
        `- 3. '/usr/sbin/kexec -e -f'

If we're using busybox init, do (1). This performs a proper shutdown
before the kexec, giving us nice console output with a terminal reset
and the "booting..." notification. Otherwise, fall back to (2).

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
---
 package/petitboot/kexec-restart |  8 ++++++++
 package/petitboot/petitboot.mk  | 16 ++++++++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)
 create mode 100755 package/petitboot/kexec-restart

diff --git a/package/petitboot/kexec-restart b/package/petitboot/kexec-restart
new file mode 100755
index 000000000000..62fbea114513
--- /dev/null
+++ b/package/petitboot/kexec-restart
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+/usr/sbin/kexec -f -e
+
+while :
+do
+	sleep 1
+done
diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
index 0992111cb1ec..5c7913b560b1 100644
--- a/package/petitboot/petitboot.mk
+++ b/package/petitboot/petitboot.mk
@@ -21,7 +21,6 @@ PETITBOOT_CONF_OPTS = \
 	--without-twin-x11 \
 	$(if $(BR2_PACKAGE_BUSYBOX),--enable-busybox,--disable-busybox) \
 	HOST_PROG_KEXEC=/usr/sbin/kexec \
-	HOST_PROG_SHUTDOWN=/usr/libexec/petitboot/bb-kexec-reboot
 
 # HPA and Busybox tftp are supported. HPA tftp is part of Buildroot's tftpd
 # package.
@@ -46,6 +45,17 @@ else
 PETITBOOT_CONF_OPTS += --without-fdt
 endif
 
+ifeq ($(BR2_INIT_BUSYBOX),y)
+PETITBOOT_CONF_OPTS += HOST_PROG_SHUTDOWN=/usr/libexec/petitboot/bb-kexec-reboot
+define PETITBOOT_INITTAB
+	grep -q kexec-restart $(TARGET_DIR)/etc/inittab || \
+		printf "\nnull::restart:/usr/sbin/kexec-restart\n" >> $(TARGET_DIR)/etc/inittab
+endef
+PETITBOOT_TARGET_FINALIZE_HOOKS += PETITBOOT_INITTAB
+else
+PETITBOOT_CONF_OPTS += HOST_PROG_SHUTDOWN=/usr/sbin/kexec-restart
+endif
+
 define PETITBOOT_POST_INSTALL
 	$(INSTALL) -D -m 0755 $(@D)/utils/bb-kexec-reboot \
 		$(TARGET_DIR)/usr/libexec/petitboot/bb-kexec-reboot
@@ -53,8 +63,10 @@ define PETITBOOT_POST_INSTALL
 		$(TARGET_DIR)/etc/petitboot/boot.d/01-create-default-dtb
 	$(INSTALL) -D -m 0755 $(@D)/utils/hooks/90-sort-dtb \
 		$(TARGET_DIR)/etc/petitboot/boot.d/90-sort-dtb
-	$(INSTALL) -m 0755 -D $(PETITBOOT_PKGDIR)/S15pb-discover \
+	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/S15pb-discover \
 		$(TARGET_DIR)/etc/init.d/S15pb-discover
+	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/kexec-restart \
+		$(TARGET_DIR)/usr/sbin/kexec-restart
 	mkdir -p $(TARGET_DIR)/usr/share/udhcpc/default.script.d/
 	ln -sf /usr/sbin/pb-udhcpc \
 		$(TARGET_DIR)/usr/share/udhcpc/default.script.d/
-- 
2.39.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
