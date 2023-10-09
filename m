Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A538E95A96
	for <buildroot@archiver.kernel.org>; Mon,  9 Oct 2023 15:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25BA3612A0;
	Mon,  9 Oct 2023 15:19:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25BA3612A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id axhiKMQWTvYL; Mon,  9 Oct 2023 15:19:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33AD06130A;
	Mon,  9 Oct 2023 15:19:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33AD06130A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 499451BF95C
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 15:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2336760C34
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 15:18:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2336760C34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aqbZe9iGHwF2 for <buildroot@lists.busybox.net>;
 Mon,  9 Oct 2023 15:18:24 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D1FAB612C7
 for <buildroot@buildroot.org>; Mon,  9 Oct 2023 15:18:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1FAB612C7
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 399FHRAQ030751; Mon, 9 Oct 2023 15:18:23 GMT
Received: from ppma12.dal12v.mail.ibm.com
 (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmm1cr0qh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Oct 2023 15:18:22 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
 by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 399E0BCf024461; Mon, 9 Oct 2023 15:18:21 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
 by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tkhnsa57f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Oct 2023 15:18:21 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com
 [10.241.53.101])
 by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 399FILem8978982
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Oct 2023 15:18:21 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C20D5805A;
 Mon,  9 Oct 2023 15:18:21 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 271525805F;
 Mon,  9 Oct 2023 15:18:19 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.61.33.25])
 by smtpav02.dal12v.mail.ibm.com (Postfix) with SMTP;
 Mon,  9 Oct 2023 15:18:18 +0000 (GMT)
Received: by arbab-laptop.localdomain (Postfix, from userid 152845)
 id 8E0322A37A74; Mon,  9 Oct 2023 10:17:48 -0500 (CDT)
From: Reza Arbab <arbab@linux.ibm.com>
To: buildroot@buildroot.org
Date: Mon,  9 Oct 2023 10:17:28 -0500
Message-Id: <20231009151729.2223963-8-arbab@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20231009151729.2223963-1-arbab@linux.ibm.com>
References: <20231009151729.2223963-1-arbab@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qfuPQ7v17SFMf59rPpjsGZ4uRY0CRI-T
X-Proofpoint-ORIG-GUID: qfuPQ7v17SFMf59rPpjsGZ4uRY0CRI-T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_13,2023-10-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310090126
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=LRhkgLevtiSSq68rm9o3jS/dxziIPVhQM7QraU7EW3s=;
 b=Y/8jBp/s08asGvfBZswx8CnqgcbyOLkIicjjVIv+f+yTdN+RDCsceZx1+FBezoz2XDnS
 1P5pe+Jn3wxJXOZxGIIL4XDNHC8hUfJgIBDgX7eJaL67qntwQ9YxjPa1Man4sLoYFaOR
 BKboKYKKey33Fg7GgaihNN2sKZF6Ij/UieLKR47vPtfbl6Yppb/117izixWM34yr7FZE
 Nrh918i4dbk72QxBoYb9FBjTiEqixoQwikdIP+Aj/b4EGnChO7oNI65gEf/nGZU/1l+k
 LT659Z+NIGJPRze4DAfIAnpxdhQ2glOeVxfX7fXIkmWMkVFxAtI+IVOTJ60OwFSWA8L5 KA== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=Y/8jBp/s
Subject: [Buildroot] [PATCH v3 7/8] package/petitboot: enable user separation
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

Run the petitboot UI as an unprivileged user. This requires using the
agetty package instead of the busybox getty utility, running the initial
pb-console helper at user login rather than directly.

If sudo is installed, with a sudoers policy allowing petituser to
perform sudo with no password (or a blank password), the "drop to shell"
feature of petitboot will automatically become a root shell.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
---
 package/petitboot/Config.in      |  1 +
 package/petitboot/S15pb-discover |  4 +++-
 package/petitboot/pb-console     |  6 ++++--
 package/petitboot/petitboot.mk   | 12 ++++++++++++
 package/petitboot/shell_config   | 24 ++++++++++++++++++++++++
 package/petitboot/shell_profile  |  2 ++
 6 files changed, 46 insertions(+), 3 deletions(-)
 create mode 100644 package/petitboot/shell_config
 create mode 100644 package/petitboot/shell_profile

diff --git a/package/petitboot/Config.in b/package/petitboot/Config.in
index 5f1d91e77ecb..0f965e71e628 100644
--- a/package/petitboot/Config.in
+++ b/package/petitboot/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_PETITBOOT
 	select BR2_PACKAGE_KEXEC_LITE if ( BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le )
 	select BR2_PACKAGE_NVME if ( BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le )
 	select BR2_PACKAGE_POWERPC_UTILS if ( BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le )
+	select BR2_PACKAGE_UTIL_LINUX_AGETTY
 	help
 	  Petitboot is a small kexec-based bootloader
 
diff --git a/package/petitboot/S15pb-discover b/package/petitboot/S15pb-discover
index 71ab62d99859..a37e33521f1a 100644
--- a/package/petitboot/S15pb-discover
+++ b/package/petitboot/S15pb-discover
@@ -12,7 +12,9 @@ fi
 
 start() {
 	printf 'Starting %s: ' "$DAEMON"
-	mkdir -p /var/log/petitboot
+	# shellcheck disable=SC2174 # only apply -m to deepest dir
+	mkdir -p -m 0775 /var/log/petitboot
+	chown root:petitgroup /var/log/petitboot
 
 	# shellcheck disable=SC2086 # we need the word splitting
 	start-stop-daemon -S -q -b -m -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
diff --git a/package/petitboot/pb-console b/package/petitboot/pb-console
index 407ff3b30232..eea40163d02f 100644
--- a/package/petitboot/pb-console
+++ b/package/petitboot/pb-console
@@ -3,14 +3,16 @@
 DAEMON="pb-console"
 
 PB_CONSOLE_PORT=${2:-"console"}
-PB_CONSOLE_ARGS="--getty --detach -- -n -i 0 $PB_CONSOLE_PORT linux"
+PB_CONSOLE_ARGS="--getty=/sbin/agetty --detach -- -a petituser -n -i $PB_CONSOLE_PORT linux"
 
 # shellcheck source=/dev/null
 [ -r "/etc/default/petitboot" ] && . "/etc/default/petitboot"
 
 start() {
 	printf 'Starting %s on %s: ' "$DAEMON" "$PB_CONSOLE_PORT"
-	mkdir -p /var/log/petitboot
+	# shellcheck disable=SC2174 # only apply -m to deepest dir
+	mkdir -p -m 0775 /var/log/petitboot
+	chown root:petitgroup /var/log/petitboot
 
 	# shellcheck disable=SC2086 # we need the word splitting
 	start-stop-daemon -S -q -x "/usr/libexec/petitboot/$DAEMON" \
diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
index ff87f3498734..5b517eb3b1a6 100644
--- a/package/petitboot/petitboot.mk
+++ b/package/petitboot/petitboot.mk
@@ -71,6 +71,10 @@ define PETITBOOT_POST_INSTALL
 		$(TARGET_DIR)/usr/sbin/kexec-restart
 	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/pb-console \
 		$(TARGET_DIR)/etc/init.d/pb-console
+	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/shell_config \
+		$(TARGET_DIR)/home/petituser/.shrc
+	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/shell_profile \
+		$(TARGET_DIR)/home/petituser/.profile
 
 	mkdir -p $(TARGET_DIR)/etc/udev/rules.d
 	(for port in $(PETITBOOT_GETTY_PORT); do \
@@ -84,4 +88,12 @@ endef
 
 PETITBOOT_POST_INSTALL_TARGET_HOOKS += PETITBOOT_POST_INSTALL
 
+define PETITBOOT_USERS
+	petituser -1 petitgroup -1 * /home/petituser /bin/sh - petitboot user
+endef
+
+define PETITBOOT_PERMISSIONS
+	/var/petitboot d 775 root petitgroup - - - - -
+endef
+
 $(eval $(autotools-package))
diff --git a/package/petitboot/shell_config b/package/petitboot/shell_config
new file mode 100644
index 000000000000..b10b95baae6c
--- /dev/null
+++ b/package/petitboot/shell_config
@@ -0,0 +1,24 @@
+#!/bin/sh
+
+try_sudo() {
+	[ -x "$(command -v sudo)" ] || return
+	sudo -K
+	echo | sudo -S /bin/true >/dev/null 2>&1 || return
+
+	echo "No password required, running as root."
+	sudo -i
+	sudo -K
+	exit
+}
+
+reset
+
+echo "Exiting petitboot. Type 'exit' to return."
+echo "You may run 'pb-sos' to gather diagnostic data."
+
+if [ "$(id -u)" != "0" ]; then
+	try_sudo
+	export PS1='$ '
+else
+	export PS1='# '
+fi
diff --git a/package/petitboot/shell_profile b/package/petitboot/shell_profile
new file mode 100644
index 000000000000..1ca5e6364dba
--- /dev/null
+++ b/package/petitboot/shell_profile
@@ -0,0 +1,2 @@
+export ENV="/home/petituser/.shrc"
+exec /usr/libexec/petitboot/pb-console
-- 
2.39.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
