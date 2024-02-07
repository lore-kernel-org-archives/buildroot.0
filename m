Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6279C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 17:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76B7183C65;
	Wed,  7 Feb 2024 17:52:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A82zThuDY8qf; Wed,  7 Feb 2024 17:52:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CF5783CD2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CF5783CD2;
	Wed,  7 Feb 2024 17:52:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4EBCE1BF868
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 17:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3978340137
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 17:51:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RnaMkH-qt8F6 for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 17:51:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=arbab@linux.ibm.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8721640154
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8721640154
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8721640154
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 17:51:48 +0000 (UTC)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 417Har5G007344; Wed, 7 Feb 2024 17:51:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w4cj6m3br-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Feb 2024 17:51:46 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 417Hm04S013651;
 Wed, 7 Feb 2024 17:51:46 GMT
Received: from ppma23.wdc07v.mail.ibm.com
 (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w4cj6m3bj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Feb 2024 17:51:46 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 417HQ9RZ005756; Wed, 7 Feb 2024 17:51:45 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
 by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3w21akq47x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Feb 2024 17:51:45 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com
 [10.241.53.100])
 by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 417HpieA49938782
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Feb 2024 17:51:44 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C681058058;
 Wed,  7 Feb 2024 17:51:44 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B68DC58057;
 Wed,  7 Feb 2024 17:51:44 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.178.221])
 by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Wed,  7 Feb 2024 17:51:44 +0000 (GMT)
Received: by arbab-laptop.localdomain (Postfix, from userid 152845)
 id 3741090AC2D; Wed,  7 Feb 2024 11:51:44 -0600 (CST)
From: Reza Arbab <arbab@linux.ibm.com>
To: buildroot@buildroot.org, Arnout Vandecappelle <arnout@mind.be>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Date: Wed,  7 Feb 2024 11:51:33 -0600
Message-Id: <20240207175135.1532037-4-arbab@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240207175135.1532037-1-arbab@linux.ibm.com>
References: <20240207175135.1532037-1-arbab@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JAxOzXmbhwwOUzPUnBlQVmTzlDCR1B8-
X-Proofpoint-ORIG-GUID: iVczysuyFO6uNWEhxOI9Xq0NP1t3fxHz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-07_09,2024-02-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402070132
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=OLme+n+66doktJEXevSEpPQ2jNaqdFiqpxjVc5etZJI=;
 b=gAEdy+6UIgyY0d1j6jmUtQOzEjIGvy/ipoym4Tc0L5VaJjbw12m9he1rX8cdRlUBI3/S
 deFTyhm6h68ThwVCG5Yr6vjGcHMIIw4UlH5w0ZBQ5yEdyURAi4SKrUUBTLHL1oFG63oM
 PcSMcV5yqZAVM/f3JyF997gnP+0rSxutjz5GPAh7MV4XiRYtrTElaAX+5cBb2lkTfPdq
 UREiYd/7nesmAIoyslLB0MATlGetrRgdOzIVkMawD8aAcIRIA+jjCkO9Vs9Gq8NoryQJ
 WDsE6ksYnfqldeODQpBB8MDFuz3YNK5Dht/M/tvUX5PQ3S+K8zYXkW0gcalN46zHHCMY Gw== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.ibm.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=gAEdy+6U
Subject: [Buildroot] [PATCH v5 3/5] package/petitboot: fix shutdown
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
index 4c8bc35adb38..291083269ae9 100644
--- a/package/petitboot/petitboot.mk
+++ b/package/petitboot/petitboot.mk
@@ -29,7 +29,7 @@ PETITBOOT_CONF_OPTS = \
 	--without-twin-x11 \
 	$(if $(BR2_PACKAGE_BUSYBOX),--enable-busybox,--disable-busybox) \
 	HOST_PROG_KEXEC=/usr/sbin/kexec \
-	HOST_PROG_SHUTDOWN=/usr/libexec/petitboot/bb-kexec-reboot
+	HOST_PROG_SHUTDOWN=/usr/sbin/kexec-restart
 
 # HPA and Busybox tftp are supported. HPA tftp is part of Buildroot's tftpd
 # package.
@@ -54,17 +54,31 @@ else
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
