Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEBDEC8736
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 173F482ED2;
	Thu,  7 Sep 2023 15:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 173F482ED2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fhiXjkR1g5P1; Thu,  7 Sep 2023 15:04:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E4CD830D7;
	Thu,  7 Sep 2023 15:04:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E4CD830D7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D3D971BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 614EE61291
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 614EE61291
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rNXVf4tb7tIo for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88AFB61282
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88AFB61282
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85EAF86A22; Thu,  7 Sep 2023 14:51:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Aug 2023 20:46:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15a7077a06327e8a92f41a9aab35b0ef929fc777
X-Git-Newrev: d582bf978fe6a9002a7950c6fd7c33fe1e0d5df5
X-Patchwork-Hint: ignore
Message-Id: <20230907145128.85EAF86A22@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netsnmp: add a snmp user so snmpd
 doesn't run as root
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d582bf978fe6a9002a7950c6fd7c33fe1e0d5df5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: David Johnson <dave-git@centerclick.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/netsnmp/S59snmpd      | 2 +-
 package/netsnmp/netsnmp.mk    | 4 ++++
 package/netsnmp/snmpd.service | 2 +-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/netsnmp/S59snmpd b/package/netsnmp/S59snmpd
index 96ed8237ac..aece896670 100644
--- a/package/netsnmp/S59snmpd
+++ b/package/netsnmp/S59snmpd
@@ -17,7 +17,7 @@ export PATH=/sbin:/usr/sbin:/bin:/usr/bin
 # Defaults
 export MIBDIRS=/usr/share/snmp/mibs
 SNMPDRUN=yes
-SNMPDOPTS='-Lsd -Lf /dev/null -p /var/run/snmpd.pid 127.0.0.1'
+SNMPDOPTS='-Lsd -Lf /dev/null -p /var/run/snmpd.pid -u snmp -g snmp 127.0.0.1'
 TRAPDRUN=no
 TRAPDOPTS='-Lsd -p /var/run/snmptrapd.pid'
 
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 0218e65b91..c7df49f947 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -41,6 +41,10 @@ NETSNMP_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) LIB_LDCONFIG_CMD=true instal
 NETSNMP_MAKE = $(MAKE1)
 NETSNMP_CONFIG_SCRIPTS = net-snmp-config
 
+define NETSNMP_USERS
+	snmp -1 snmp -1 * - - - snmpd user
+endef
+
 ifeq ($(BR2_INIT_SYSTEMD),y)
 NETSNMP_CONF_OPTS += --with-systemd
 else
diff --git a/package/netsnmp/snmpd.service b/package/netsnmp/snmpd.service
index 2a1e6e9715..6647b10c32 100644
--- a/package/netsnmp/snmpd.service
+++ b/package/netsnmp/snmpd.service
@@ -6,7 +6,7 @@ ConditionPathExists=/etc/snmp/snmpd.conf
 [Service]
 Type=simple
 Environment=MIBDIRS=/usr/share/snmp/mibs
-Environment=SNMPDOPTS='-Lsd -Lf /dev/null -p /var/run/snmpd.pid 127.0.0.1'
+Environment=SNMPDOPTS='-Lsd -Lf /dev/null -p /var/run/snmpd.pid -u snmp -g snmp 127.0.0.1'
 EnvironmentFile=-/etc/default/snmpd
 PassEnvironment=MIBDIRS
 ExecStart=/usr/sbin/snmpd -f $SNMPDOPTS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
