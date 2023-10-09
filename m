Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7107E95A96
	for <buildroot@archiver.kernel.org>; Mon,  9 Oct 2023 15:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81ECE61309;
	Mon,  9 Oct 2023 15:19:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81ECE61309
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sq1PEqhks1PW; Mon,  9 Oct 2023 15:19:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B672D612E4;
	Mon,  9 Oct 2023 15:19:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B672D612E4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 15F981BF95C
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 15:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E337082140
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 15:18:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E337082140
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yZYbfIOLhwWU for <buildroot@lists.busybox.net>;
 Mon,  9 Oct 2023 15:18:24 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 608F38212A
 for <buildroot@buildroot.org>; Mon,  9 Oct 2023 15:18:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 608F38212A
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 399FHNS6008253; Mon, 9 Oct 2023 15:18:23 GMT
Received: from ppma23.wdc07v.mail.ibm.com
 (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmm1ar0xw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Oct 2023 15:18:23 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 399FI9QK000643; Mon, 9 Oct 2023 15:18:22 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
 by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tkk5k9n40-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Oct 2023 15:18:22 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com
 [10.39.53.230])
 by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 399FILNh61080010
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Oct 2023 15:18:21 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 896B15805D;
 Mon,  9 Oct 2023 15:18:21 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B60C5805C;
 Mon,  9 Oct 2023 15:18:19 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.61.33.25])
 by smtpav03.wdc07v.mail.ibm.com (Postfix) with SMTP;
 Mon,  9 Oct 2023 15:18:18 +0000 (GMT)
Received: by arbab-laptop.localdomain (Postfix, from userid 152845)
 id 8B0F42A37A73; Mon,  9 Oct 2023 10:17:48 -0500 (CDT)
From: Reza Arbab <arbab@linux.ibm.com>
To: buildroot@buildroot.org
Date: Mon,  9 Oct 2023 10:17:27 -0500
Message-Id: <20231009151729.2223963-7-arbab@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20231009151729.2223963-1-arbab@linux.ibm.com>
References: <20231009151729.2223963-1-arbab@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8w16Bva1bKLi1OOz9T8mFqZXZWjVzD8D
X-Proofpoint-ORIG-GUID: 8w16Bva1bKLi1OOz9T8mFqZXZWjVzD8D
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
 bh=BGmk2nNbfHqx1BMXXx1lHpv83ClRqX8k4Ojno3UUucQ=;
 b=Bu9izxHb7XMO8CwzOmSO37oxNrqaElzEMwDAQB6FS4gIILZpk2yn+naoelH2byRHHiXS
 UV6wDeDkxl6tqrx3PPMMx7ESQFe7r7gFxjMxkPXymwEeXSiyyPaJjGHVRTQeXHNP+d2o
 efc/uUpKL7xcdecfuzwDA3tr8YhUYhbLtvAIU4Pr8hKUruQMa74fn/GGQB+hQYrLrEbw
 DqzvrmFpWCj2+blya8K0i+VuCkvk5SLgIn/dTnI2qkNKawbDDP2CAmovhLXHWU7UVW2X
 0m0vrzlKVfYnYRIu/4gUKFe5u09gW0nttfWDEFHGrQEe7FVj74AUuX51/CowfloZvrTq 4g== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=Bu9izxHb
Subject: [Buildroot] [PATCH v3 6/8] package/petitboot: run petitboot UI on
 consoles
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

Display the petitboot UI instead of a login prompt, allowing the
configuration of custom tty(s) as we do for the login prompt.

petitboot already depends on udev, so let's use it instead of rcS to
launch pb-console. This has the advantage of easily wildcarding the list
of ttys ("hvc*") and enables hotplug devices ("ttyUSB0").

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
---
 package/petitboot/Config.in    |  8 ++++++++
 package/petitboot/pb-console   | 36 ++++++++++++++++++++++++++++++++++
 package/petitboot/petitboot.mk | 10 ++++++++++
 system/Config.in               |  2 +-
 4 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 package/petitboot/pb-console

diff --git a/package/petitboot/Config.in b/package/petitboot/Config.in
index 4981c165bf76..5f1d91e77ecb 100644
--- a/package/petitboot/Config.in
+++ b/package/petitboot/Config.in
@@ -28,3 +28,11 @@ comment "petitboot needs a uClibc or glibc toolchain w/ wchar, dynamic library,
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC) || \
 		!BR2_PACKAGE_HAS_UDEV
+
+config BR2_PACKAGE_PETITBOOT_GETTY_PORT
+	string "TTY port(s)"
+	default "console"
+	depends on BR2_PACKAGE_PETITBOOT
+	help
+	  Specify a space-separated list of ports to run the petitboot UI on.
+	  Wildcards are allowed. Example: "hvc* ttys0 ttyS*"
diff --git a/package/petitboot/pb-console b/package/petitboot/pb-console
new file mode 100644
index 000000000000..407ff3b30232
--- /dev/null
+++ b/package/petitboot/pb-console
@@ -0,0 +1,36 @@
+#!/bin/sh
+
+DAEMON="pb-console"
+
+PB_CONSOLE_PORT=${2:-"console"}
+PB_CONSOLE_ARGS="--getty --detach -- -n -i 0 $PB_CONSOLE_PORT linux"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/petitboot" ] && . "/etc/default/petitboot"
+
+start() {
+	printf 'Starting %s on %s: ' "$DAEMON" "$PB_CONSOLE_PORT"
+	mkdir -p /var/log/petitboot
+
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -x "/usr/libexec/petitboot/$DAEMON" \
+		-- $PB_CONSOLE_ARGS
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+case "$1" in
+	start)
+		"$1";;
+	stop|restart|reload)
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload} [port]"
+		exit 1
+		;;
+esac
diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
index 5c7913b560b1..ff87f3498734 100644
--- a/package/petitboot/petitboot.mk
+++ b/package/petitboot/petitboot.mk
@@ -56,6 +56,8 @@ else
 PETITBOOT_CONF_OPTS += HOST_PROG_SHUTDOWN=/usr/sbin/kexec-restart
 endif
 
+PETITBOOT_GETTY_PORT = $(patsubst %,'%',$(call qstrip,$(BR2_PACKAGE_PETITBOOT_GETTY_PORT)))
+
 define PETITBOOT_POST_INSTALL
 	$(INSTALL) -D -m 0755 $(@D)/utils/bb-kexec-reboot \
 		$(TARGET_DIR)/usr/libexec/petitboot/bb-kexec-reboot
@@ -67,6 +69,14 @@ define PETITBOOT_POST_INSTALL
 		$(TARGET_DIR)/etc/init.d/S15pb-discover
 	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/kexec-restart \
 		$(TARGET_DIR)/usr/sbin/kexec-restart
+	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/pb-console \
+		$(TARGET_DIR)/etc/init.d/pb-console
+
+	mkdir -p $(TARGET_DIR)/etc/udev/rules.d
+	(for port in $(PETITBOOT_GETTY_PORT); do \
+		printf 'SUBSYSTEM=="tty", KERNEL=="%s", RUN+="/etc/init.d/pb-console start $$name"\n' "$$port"; \
+	done) > $(TARGET_DIR)/etc/udev/rules.d/petitboot-console-ui.rules
+
 	mkdir -p $(TARGET_DIR)/usr/share/udhcpc/default.script.d/
 	ln -sf /usr/sbin/pb-udhcpc \
 		$(TARGET_DIR)/usr/share/udhcpc/default.script.d/
diff --git a/system/Config.in b/system/Config.in
index 24798dc06803..9587dd9ce4db 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -375,7 +375,7 @@ config BR2_SYSTEM_BIN_SH
 
 menuconfig BR2_TARGET_GENERIC_GETTY
 	bool "Run a getty (login prompt) after boot"
-	default y
+	default y if !BR2_PACKAGE_PETITBOOT
 
 if BR2_TARGET_GENERIC_GETTY
 config BR2_TARGET_GENERIC_GETTY_PORT
-- 
2.39.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
