Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A66AC072A2
	for <buildroot@archiver.kernel.org>; Wed, 15 Nov 2023 22:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F7D26150D;
	Wed, 15 Nov 2023 22:00:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F7D26150D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1B_btwI66w15; Wed, 15 Nov 2023 22:00:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 548D161738;
	Wed, 15 Nov 2023 22:00:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 548D161738
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 74A561BF599
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 21:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CBE141F11
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 21:59:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CBE141F11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E5FyYglzZZWc for <buildroot@lists.busybox.net>;
 Wed, 15 Nov 2023 21:59:46 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE0A941F12
 for <buildroot@buildroot.org>; Wed, 15 Nov 2023 21:59:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE0A941F12
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AFKfPuC025592; Wed, 15 Nov 2023 21:59:46 GMT
Received: from ppma22.wdc07v.mail.ibm.com
 (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ud4chb1dx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Nov 2023 21:59:46 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AFKIwbg017489; Wed, 15 Nov 2023 21:59:44 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
 by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3uamayjmy3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Nov 2023 21:59:44 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com
 [10.39.53.228])
 by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3AFLxhB04588202
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Nov 2023 21:59:44 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 92AD358055;
 Wed, 15 Nov 2023 21:59:43 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A2BF58065;
 Wed, 15 Nov 2023 21:59:43 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.178.221])
 by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
 Wed, 15 Nov 2023 21:59:43 +0000 (GMT)
Received: by arbab-laptop.localdomain (Postfix, from userid 152845)
 id ADC242CBA5D1; Wed, 15 Nov 2023 15:59:42 -0600 (CST)
From: Reza Arbab <arbab@linux.ibm.com>
To: buildroot@buildroot.org
Date: Wed, 15 Nov 2023 15:59:29 -0600
Message-Id: <20231115215931.860940-4-arbab@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20231115215931.860940-1-arbab@linux.ibm.com>
References: <20231115215931.860940-1-arbab@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: i1GqwEHa5ethFeFKWsVTC5qxu5Hjrwo3
X-Proofpoint-ORIG-GUID: i1GqwEHa5ethFeFKWsVTC5qxu5Hjrwo3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-15_20,2023-11-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311150173
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=EfqNlwsQht+zkbJFIAxucPZEriOp6EgdsFQ+hurDb2U=;
 b=tjm9M8/wJ0dHczmavBMfgR9w5cAzvdGWhhB0WcIz5UIu3wTtqpQ0aiQ1zg3DHgiVG46d
 svHck3lT3PKpMOc+7FdYkN/G51iRnwjKJuyoS/ltnSUqqYMJqcLfIsttgeoyWIsBdGlz
 L5E8vDCM8KJayr/LVWc4GBdRqATfbafSSdrAaZ60jAbRLGLXTKwd3s+/sejXipOBdxEk
 nuTwEy6qvqtZ7qL6qQ+Rd+xWnOey/lr5Hgb12wSLVbXNTo6ktIRdSmrV63lCZUyKVejP
 hUTMwDhx43iOtx9GGtuD9VljxgDSK71reeReAn4ueyVGJ46zflGM6fTpPR3e3URJYzXP rg== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=tjm9M8/w
Subject: [Buildroot] [PATCH v4 3/5] package/petitboot: fix shutdown
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

It's good practice to unmount filesystems and gracefully terminate
running services before running "kexec -e". So when a boot option has
been chosen from the petitboot menu, poke init to shut the system down
and kexec the new kernel.

One benefit to us in particular is that when pb-console is killed, it
notifies the user that we're booting:

  trap 'reset; echo "SIGTERM received, booting..."; sleep 2' SIGTERM

This terminal reset is also useful, exiting the ncurses visual mode so
subsequent boot output is raw rather than being confined to the window
set up for the petitboot menu.

Currently we assume busybox init, but do not add an accompanying entry
in the inittab to run kexec, so things aren't working. Fix this and
accomodate the other buildroot init systems as well.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
---
 package/petitboot/kexec-restart | 26 ++++++++++++++++++++++++++
 package/petitboot/petitboot.mk  | 20 +++++++++++++++++---
 2 files changed, 43 insertions(+), 3 deletions(-)
 create mode 100644 package/petitboot/kexec-restart

diff --git a/package/petitboot/kexec-restart b/package/petitboot/kexec-restart
new file mode 100644
index 000000000000..14e6899f70bb
--- /dev/null
+++ b/package/petitboot/kexec-restart
@@ -0,0 +1,26 @@
+#!/bin/sh
+
+case "$(/usr/bin/readlink -f /proc/1/exe)" in
+	/bin/busybox)
+		# inittab "restart" runlevel entry runs kexec
+		/bin/kill -QUIT 1
+		;;
+	/sbin/init)
+		# inittab runlevel 6 entry runs kexec
+		/sbin/shutdown -r now
+		;;
+	/sbin/openrc-init)
+		/sbin/openrc-shutdown --kexec now
+		;;
+	/usr/lib/systemd/systemd)
+		/usr/bin/systemctl kexec
+		;;
+	*)
+		/usr/sbin/kexec -f -e
+		;;
+esac
+
+while :
+do
+	sleep 1
+done
diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
index 28e29c02ea26..fc1c5da03742 100644
--- a/package/petitboot/petitboot.mk
+++ b/package/petitboot/petitboot.mk
@@ -21,7 +21,7 @@ PETITBOOT_CONF_OPTS = \
 	--without-twin-x11 \
 	$(if $(BR2_PACKAGE_BUSYBOX),--enable-busybox,--disable-busybox) \
 	HOST_PROG_KEXEC=/usr/sbin/kexec \
-	HOST_PROG_SHUTDOWN=/usr/libexec/petitboot/bb-kexec-reboot
+	HOST_PROG_SHUTDOWN=/usr/sbin/kexec-restart
 
 # HPA and Busybox tftp are supported. HPA tftp is part of Buildroot's tftpd
 # package.
@@ -46,17 +46,31 @@ else
 PETITBOOT_CONF_OPTS += --without-fdt
 endif
 
+ifeq ($(BR2_INIT_BUSYBOX),y)
+define PETITBOOT_BUSYBOX_INITTAB
+	grep -q kexec $(TARGET_DIR)/etc/inittab || \
+		printf "\nnull::restart:/usr/sbin/kexec -f -e\n" >> $(TARGET_DIR)/etc/inittab
+endef
+PETITBOOT_TARGET_FINALIZE_HOOKS += PETITBOOT_BUSYBOX_INITTAB
+else ifeq ($(BR2_INIT_SYSV),y)
+define PETITBOOT_SYSV_INITTAB
+	grep -q kexec $(TARGET_DIR)/etc/inittab || \
+		$(SED) 's~^reb0:.*~reb0:6:wait:/usr/sbin/kexec -f -e~' $(TARGET_DIR)/etc/inittab
+endef
+PETITBOOT_TARGET_FINALIZE_HOOKS += PETITBOOT_SYSV_INITTAB
+endif
+
 PETITBOOT_GETTY_PORT = $(patsubst %,'%',$(call qstrip,$(BR2_PACKAGE_PETITBOOT_GETTY_PORT)))
 
 define PETITBOOT_POST_INSTALL
-	$(INSTALL) -D -m 0755 $(@D)/utils/bb-kexec-reboot \
-		$(TARGET_DIR)/usr/libexec/petitboot/bb-kexec-reboot
 	$(INSTALL) -D -m 0755 $(@D)/utils/hooks/01-create-default-dtb \
 		$(TARGET_DIR)/etc/petitboot/boot.d/01-create-default-dtb
 	$(INSTALL) -D -m 0755 $(@D)/utils/hooks/90-sort-dtb \
 		$(TARGET_DIR)/etc/petitboot/boot.d/90-sort-dtb
 	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/S15pb-discover \
 		$(TARGET_DIR)/etc/init.d/S15pb-discover
+	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/kexec-restart \
+		$(TARGET_DIR)/usr/sbin/kexec-restart
 	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/pb-console \
 		$(TARGET_DIR)/etc/init.d/pb-console
 
-- 
2.39.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
