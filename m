Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9D6C77B7C
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 20:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E548241854;
	Mon,  1 May 2023 20:37:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E548241854
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M0vousDHJtlq; Mon,  1 May 2023 20:37:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEACC41823;
	Mon,  1 May 2023 20:37:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEACC41823
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4F5911BF419
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 20:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28B5661133
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 20:37:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28B5661133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4al9JCcUTWKt for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 20:37:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71A546112E
Received: from lexington.centerclick.org (lexington2.centerclick.org
 [192.133.6.75])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71A546112E
 for <buildroot@buildroot.org>; Mon,  1 May 2023 20:37:24 +0000 (UTC)
Received: from alliance.centerclick.org (alliance.centerclick.org
 [IPv6:2620:9a:e000:1060::1:0])
 by lexington.centerclick.org (Postfix) with ESMTPS id 035BD63C3;
 Mon,  1 May 2023 16:37:22 -0400 (EDT)
Received: from pmg by alliance.centerclick.org with local (Exim 4.94.2)
 (envelope-from <pmg@alliance.centerclick.org>)
 id 1ptaGv-004wQQ-Nk; Mon, 01 May 2023 16:37:21 -0400
To: buildroot@buildroot.org
Date: Mon,  1 May 2023 16:36:47 -0400
Message-Id: <20230501203647.1177608-2-dave-git@centerclick.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230501203647.1177608-1-dave-git@centerclick.org>
References: <20230501203647.1177608-1-dave-git@centerclick.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=centerclick.org; 
 s=lexington; t=1682973442;
 bh=Rx2Zeu8d3RVxJoDcwkiOMPp4j6zglY9ufM4fLih+7yM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AY5vMAcS+y6b3uGIvIBzcX+LoOV/EF6Uj0vKCOy+rMM+d6qfWaZSARyk9joCtADO3
 U9ukPgx3UcfEXtzZFyiGUFnxQue5y1MN7FkR9ilGmrJzf+XDXun7I+oGL63TKkDvoP
 QGlhCD1g41XEP2YXRD3N8EZX7+DNsDU8opV9H4WSl4pDym89qxVDcrQrNiby9KC31w
 KIoAHjXsCCNfvobaKBRAVUd518fajrEgtOA57AwiL/D35CPLrNfdey+ivSfdhvzvG3
 CYhlA2c/YMZkKLeoh8M5/Gp1CESssJp3RByyYtkh4boGAC0fg0soY6s5OiF0qu/LnJ
 57crji8yzTdrw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=centerclick.org header.i=@centerclick.org
 header.a=rsa-sha256 header.s=lexington header.b=AY5vMAcS
Subject: [Buildroot] [PATCH 2/2] package/netsnmp: add a snmp user so snmpd
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
From: David Johnson via buildroot <buildroot@buildroot.org>
Reply-To: David Johnson <dave-git@centerclick.org>
Cc: David Johnson <dave-git@centerclick.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: David Johnson <dave-git@centerclick.org>
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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
