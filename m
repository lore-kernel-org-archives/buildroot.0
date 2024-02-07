Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511FBC4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 17:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC61283CBF;
	Wed,  7 Feb 2024 17:52:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 90HJF4Uzlo2x; Wed,  7 Feb 2024 17:52:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9484283CB9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9484283CB9;
	Wed,  7 Feb 2024 17:51:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 17A961BF954
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 17:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4C4E83C48
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 17:51:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i7QqyMs-nV7Q for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 17:51:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=arbab@linux.ibm.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C7B3083C60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7B3083C60
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C7B3083C60
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 17:51:48 +0000 (UTC)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 417HSF1K024999; Wed, 7 Feb 2024 17:51:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w4e9qge4s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Feb 2024 17:51:47 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 417HlklM012079;
 Wed, 7 Feb 2024 17:51:47 GMT
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w4e9qge4d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Feb 2024 17:51:47 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 417HnTPM008623; Wed, 7 Feb 2024 17:51:46 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w221k6x0q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Feb 2024 17:51:46 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com
 [10.39.53.230])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 417HpjmS17629702
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Feb 2024 17:51:45 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E8D15805A;
 Wed,  7 Feb 2024 17:51:45 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 674D958054;
 Wed,  7 Feb 2024 17:51:45 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.178.221])
 by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
 Wed,  7 Feb 2024 17:51:45 +0000 (GMT)
Received: by arbab-laptop.localdomain (Postfix, from userid 152845)
 id 3D7EC90AC2F; Wed,  7 Feb 2024 11:51:44 -0600 (CST)
From: Reza Arbab <arbab@linux.ibm.com>
To: buildroot@buildroot.org, Arnout Vandecappelle <arnout@mind.be>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Date: Wed,  7 Feb 2024 11:51:35 -0600
Message-Id: <20240207175135.1532037-6-arbab@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240207175135.1532037-1-arbab@linux.ibm.com>
References: <20240207175135.1532037-1-arbab@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bfjpFKz3VIm2PNbR7jWkjBXqfCgy2anp
X-Proofpoint-GUID: jqha4ZitFWztuYZIFhGgJfK2cu_3qwHK
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
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=VROBy6ma2zLUYkVviMRigTVpcsdGvQ+KCOJF2YfrnH4=;
 b=losRwdlWlZSI5c07G65brdQALCfwPDqATcdPafez+6PD24rhpW8rMVfeFiBJTYWDueyA
 VYsIh94zziKLSG5ce646TC7C4xi+4eBUfu62vnQwy1dUVeyHHAWV7R0IPv6X0bAHzinQ
 Tlnk9rwfGIuOvGZDiIBKja2VhKjcQVcRg8zhoEo86NTgsjq+8nnM00j9R6+w+PoXzYvj
 gYCfCid7rEjBqgslcHCVckaq4OJSmWevXd0ymQmx9Rnpx9KldOCLBjuJ29zKVy1cMf69
 ekauxJs1XxKZpM9UOXQefrcfowsUj4Wik2WtBt/WUEV9vLIWusTbQPcJiOfSXTwZXr4w PQ== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.ibm.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=losRwdlW
Subject: [Buildroot] [PATCH v5 5/5] package/petitboot: run UI as non-root
 user
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

Though the petitboot UI is a user application, it is currently being
run by root only because we use getty to display it on the console.

Create an unprivileged user to run the UI instead. The unix socket the
pb-discover daemon sets up is accessible to "petitgroup", so that should
be the gid, with arbitrary uid "petituser" to match.

This is currently the chain of processes leading to the UI:

1. /etc/init.d/pb-console start console
2. /usr/libexec/petitboot/pb-console --getty --detach -- -n -i 0 console linux
3. /sbin/getty -l/usr/libexec/petitboot/pb-console -n -i 0 console linux
4. /usr/libexec/petitboot/pb-console
5. /usr/sbin/petitboot-nc

Instead of (3) running the pb-console helper directly with "getty -l",
we can use "agetty -a" to autologin petituser, and run pb-console via
petituser's login shell:

1. /etc/init.d/pb-console start console
2. /usr/libexec/petitboot/pb-console --getty=/sbin/agetty --detach -- -a petituser -n -i console linux
3. /sbin/agetty -a petituser -n -i console linux
4. /home/petituser/.profile
5. /usr/libexec/petitboot/pb-console
6. /usr/sbin/petiboot-nc

Here, everything from (4) down is running as petituser. In (4), use
$PPID to determine if we're logging in via getty, so that logging in by
other means will give a normal shell.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
---
 package/petitboot/Config.in      | 1 +
 package/petitboot/S15pb-discover | 4 +++-
 package/petitboot/pb-console     | 6 ++++--
 package/petitboot/petitboot.mk   | 6 ++++++
 package/petitboot/shell_profile  | 3 +++
 5 files changed, 17 insertions(+), 3 deletions(-)
 create mode 100644 package/petitboot/shell_profile

diff --git a/package/petitboot/Config.in b/package/petitboot/Config.in
index 4f3b1c1ea4d1..e561547c10c8 100644
--- a/package/petitboot/Config.in
+++ b/package/petitboot/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_PETITBOOT
 	select BR2_PACKAGE_KEXEC_LITE if BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS && !BR2_PACKAGE_KEXEC
 	select BR2_PACKAGE_NVME if ( BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le )
 	select BR2_PACKAGE_POWERPC_UTILS if ( BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le )
+	select BR2_PACKAGE_UTIL_LINUX_AGETTY
 	help
 	  Petitboot is a small kexec-based bootloader
 
diff --git a/package/petitboot/S15pb-discover b/package/petitboot/S15pb-discover
index 71ab62d99859..9e8f6c87f8bb 100644
--- a/package/petitboot/S15pb-discover
+++ b/package/petitboot/S15pb-discover
@@ -12,7 +12,9 @@ fi
 
 start() {
 	printf 'Starting %s: ' "$DAEMON"
-	mkdir -p /var/log/petitboot
+	# shellcheck disable=SC2174 # only apply -m to deepest dir
+	mkdir -p -m 0775 /var/log/petitboot
+	chown petituser:petitgroup /var/log/petitboot
 
 	# shellcheck disable=SC2086 # we need the word splitting
 	start-stop-daemon -S -q -b -m -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
diff --git a/package/petitboot/pb-console b/package/petitboot/pb-console
index 407ff3b30232..8b23b2233dee 100644
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
+	chown petituser:petitgroup /var/log/petitboot
 
 	# shellcheck disable=SC2086 # we need the word splitting
 	start-stop-daemon -S -q -x "/usr/libexec/petitboot/$DAEMON" \
diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
index e2f762842534..8e02118f25f1 100644
--- a/package/petitboot/petitboot.mk
+++ b/package/petitboot/petitboot.mk
@@ -84,6 +84,8 @@ define PETITBOOT_POST_INSTALL
 		$(TARGET_DIR)/etc/init.d/pb-console
 	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/pb-shell \
 		$(TARGET_DIR)/usr/libexec/petitboot/pb-shell
+	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/shell_profile \
+		$(TARGET_DIR)/home/petituser/.profile
 
 	mkdir -p $(TARGET_DIR)/etc/udev/rules.d
 	for port in $(PETITBOOT_GETTY_PORT); do \
@@ -97,4 +99,8 @@ endef
 
 PETITBOOT_POST_INSTALL_TARGET_HOOKS += PETITBOOT_POST_INSTALL
 
+define PETITBOOT_USERS
+	petituser -1 petitgroup -1 * /home/petituser /bin/sh - petitboot user
+endef
+
 $(eval $(autotools-package))
diff --git a/package/petitboot/shell_profile b/package/petitboot/shell_profile
new file mode 100644
index 000000000000..a958ca4402f2
--- /dev/null
+++ b/package/petitboot/shell_profile
@@ -0,0 +1,3 @@
+if [ "$PPID" = "1" ]; then
+	exec /usr/libexec/petitboot/pb-console
+fi
-- 
2.39.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
