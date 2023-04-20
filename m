Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D6CC7618E
	for <buildroot@archiver.kernel.org>; Thu, 20 Apr 2023 21:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C836140BAA;
	Thu, 20 Apr 2023 21:22:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C836140BAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id csksU03YcUKK; Thu, 20 Apr 2023 21:22:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D30D640B9E;
	Thu, 20 Apr 2023 21:22:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D30D640B9E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 04B431BF2CD
 for <buildroot@lists.busybox.net>; Thu, 20 Apr 2023 21:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAF8940B9E
 for <buildroot@lists.busybox.net>; Thu, 20 Apr 2023 21:22:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAF8940B9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bLVxn0zssbwo for <buildroot@lists.busybox.net>;
 Thu, 20 Apr 2023 21:22:18 +0000 (UTC)
X-Greylist: delayed 00:09:18 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06EB640134
Received: from lexington.centerclick.org (lexington2.centerclick.org
 [192.133.6.75])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06EB640134
 for <buildroot@buildroot.org>; Thu, 20 Apr 2023 21:22:17 +0000 (UTC)
Received: from alliance.centerclick.org (alliance.centerclick.org
 [IPv6:2620:9a:e000:1060::1:0])
 by lexington.centerclick.org (Postfix) with ESMTPS id 9986B614C;
 Thu, 20 Apr 2023 17:12:58 -0400 (EDT)
Received: from pmg by alliance.centerclick.org with local (Exim 4.94.2)
 (envelope-from <pmg@alliance.centerclick.org>)
 id 1ppbaM-00G8EY-A8; Thu, 20 Apr 2023 17:12:58 -0400
To: buildroot@buildroot.org
Date: Thu, 20 Apr 2023 17:12:26 -0400
Message-Id: <20230420211226.3844651-1-dave-git@centerclick.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=centerclick.org; 
 s=lexington; t=1682025178;
 bh=XGZ+7KkeT7iEeVPCEepR2odslRnORM/3zTDX43MTJtg=;
 h=From:To:Cc:Subject:Date:From;
 b=VdXFNvVHZ1YT70J1xjH80joJgDOjmfNxWP/B2Ifa3nsr90N4fGNbOxF9ZUZCbBj06
 CWfk7gwQ/bF1l3dNXPrl7CLE/WlQGnl2IDGVlc0DzXSSSLhqxKVNPl9R0zGNZDpHMq
 HKXoUKGMtIrQ2XiND0QYgUfiUTvQ6VnlDyChipqCaAHcWlsbH2TD0yNFP8zHTjOO3d
 uaBkpHnn8rMpSuwGZmnMSWn22YCqINokZwQ/HeYLe6f/7G395ktVivZaHv22xebTJm
 8sEHBSYC+hbQu8CZiTIarGtDGIAueXsJCnAuuSGGYCM7mc2811eywOA4uiDqa1Z7UE
 zLrteJKE0iliQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=centerclick.org header.i=@centerclick.org
 header.a=rsa-sha256 header.s=lexington header.b=VdXFNvVH
Subject: [Buildroot] [PATCH 1/1] package/netsnmp: add snmp user and systemd
 service file
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

* Add a snmp user so snmpd doesn't run as root
* Add a snmp systemd file as only an sysv was previously included

Signed-off-by: David Johnson <dave-git@centerclick.org>
---
 package/netsnmp/S59snmpd      |  2 +-
 package/netsnmp/netsnmp.mk    | 12 ++++++++++++
 package/netsnmp/snmpd.service | 15 +++++++++++++++
 3 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 package/netsnmp/snmpd.service

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
index 15bc318e36..8cb7862bbf 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -41,6 +41,14 @@ NETSNMP_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) LIB_LDCONFIG_CMD=true instal
 NETSNMP_MAKE = $(MAKE1)
 NETSNMP_CONFIG_SCRIPTS = net-snmp-config
 
+define NETSNMP_USERS
+	snmp -1 snmp -1 * - - - snmpd user
+endef
+
+ifeq ($(BR2_INIT_SYSTEMD),y)
+NETSNMP_CONF_OPTS += --with-systemd
+endif
+
 ifeq ($(BR2_ENDIAN),"BIG")
 NETSNMP_CONF_OPTS += --with-endianness=big
 else
@@ -104,6 +112,10 @@ define NETSNMP_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/netsnmp/S59snmpd \
 		$(TARGET_DIR)/etc/init.d/S59snmpd
 endef
+define NETSNMP_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 package/netsnmp/snmpd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/snmpd.service
+endef
 endif
 
 $(eval $(autotools-package))
diff --git a/package/netsnmp/snmpd.service b/package/netsnmp/snmpd.service
new file mode 100644
index 0000000000..6647b10c32
--- /dev/null
+++ b/package/netsnmp/snmpd.service
@@ -0,0 +1,15 @@
+[Unit]
+Description=SNMP Daemon
+After=network.target
+ConditionPathExists=/etc/snmp/snmpd.conf
+
+[Service]
+Type=simple
+Environment=MIBDIRS=/usr/share/snmp/mibs
+Environment=SNMPDOPTS='-Lsd -Lf /dev/null -p /var/run/snmpd.pid -u snmp -g snmp 127.0.0.1'
+EnvironmentFile=-/etc/default/snmpd
+PassEnvironment=MIBDIRS
+ExecStart=/usr/sbin/snmpd -f $SNMPDOPTS
+
+[Install]
+WantedBy=multi-user.target
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
