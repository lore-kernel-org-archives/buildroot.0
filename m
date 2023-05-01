Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDCEC77B73
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 20:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2E4D82150;
	Mon,  1 May 2023 20:47:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2E4D82150
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IxHuW2tsIRrm; Mon,  1 May 2023 20:47:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A4958214E;
	Mon,  1 May 2023 20:47:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A4958214E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E58B81BF419
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 20:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD3418214F
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 20:47:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD3418214F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id if0gCB4t5ou9 for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 20:47:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1352F82127
Received: from lexington.centerclick.org (lexington2.centerclick.org
 [192.133.6.75])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1352F82127
 for <buildroot@buildroot.org>; Mon,  1 May 2023 20:47:06 +0000 (UTC)
Received: from alliance.centerclick.org (alliance.centerclick.org
 [IPv6:2620:9a:e000:1060::1:0])
 by lexington.centerclick.org (Postfix) with ESMTPS id D937462E0;
 Mon,  1 May 2023 16:37:15 -0400 (EDT)
Received: from pmg by alliance.centerclick.org with local (Exim 4.94.2)
 (envelope-from <pmg@alliance.centerclick.org>)
 id 1ptaGp-004wPj-JO; Mon, 01 May 2023 16:37:15 -0400
To: buildroot@buildroot.org
Date: Mon,  1 May 2023 16:36:46 -0400
Message-Id: <20230501203647.1177608-1-dave-git@centerclick.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=centerclick.org; 
 s=lexington; t=1682973435;
 bh=GOGOBkr6yZRkoH4Hogc5cWUlt5ahxJoHzUgJRxglWUg=;
 h=From:To:Cc:Subject:Date:From;
 b=Xe1SUoucghl/VuJuC37TZb6h9kIcNQmvsRiROb0lf3J09uSiop0tSj6THFNsqsrlZ
 69fiL6aXrDu4KkYkJfmlzmEA2LaDoiDSpWhLsyffjQ8kSHcWhihno9wchy2kSsp8X3
 /7AbNrHm/THlaCtREPKlksdoYa6nLz2nVRrtevMAg/8VTrfWn+Js8+ekIFP8OWT9gq
 pK/I1uZXQsGb29m5dfXgqdi6HfA834L97PepEBlh7rAvKk0lSltmk3Dt3F1eQVh3Zo
 v8CIwzIPbzHHeyag3H90STNMpypS8Yrr8qerTZ3kDtkp+noLPdwAf0Xj2XJKhaVZFP
 UgtvmwtcAajrA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=centerclick.org header.i=@centerclick.org
 header.a=rsa-sha256 header.s=lexington header.b=Xe1SUouc
Subject: [Buildroot] [PATCH 1/2] package/netsnmp: add systemd service file
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
 package/netsnmp/netsnmp.mk    | 10 ++++++++++
 package/netsnmp/snmpd.service | 15 +++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 package/netsnmp/snmpd.service

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 15bc318e36..0218e65b91 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -41,6 +41,12 @@ NETSNMP_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) LIB_LDCONFIG_CMD=true instal
 NETSNMP_MAKE = $(MAKE1)
 NETSNMP_CONFIG_SCRIPTS = net-snmp-config
 
+ifeq ($(BR2_INIT_SYSTEMD),y)
+NETSNMP_CONF_OPTS += --with-systemd
+else
+NETSNMP_CONF_OPTS += --without-systemd
+endif
+
 ifeq ($(BR2_ENDIAN),"BIG")
 NETSNMP_CONF_OPTS += --with-endianness=big
 else
@@ -104,6 +110,10 @@ define NETSNMP_INSTALL_INIT_SYSV
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
index 0000000000..2a1e6e9715
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
+Environment=SNMPDOPTS='-Lsd -Lf /dev/null -p /var/run/snmpd.pid 127.0.0.1'
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
