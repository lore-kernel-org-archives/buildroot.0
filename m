Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B40EC8738
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C99D82098;
	Thu,  7 Sep 2023 15:20:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C99D82098
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j9qyoH_rdLKE; Thu,  7 Sep 2023 15:20:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70ACC83B8E;
	Thu,  7 Sep 2023 15:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70ACC83B8E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A13E1BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFA4641E3C
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFA4641E3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BihzOZrmUAdI for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DE4C41D7B
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DE4C41D7B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7CEBA86A1E; Thu,  7 Sep 2023 14:51:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Aug 2023 20:46:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31d48b8a29efa7680097f60fcf5d1906f19d23d5
X-Git-Newrev: 15a7077a06327e8a92f41a9aab35b0ef929fc777
X-Patchwork-Hint: ignore
Message-Id: <20230907145128.7CEBA86A1E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netsnmp: add systemd service file
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

commit: https://git.buildroot.net/buildroot/commit/?id=15a7077a06327e8a92f41a9aab35b0ef929fc777
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: David Johnson <dave-git@centerclick.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/netsnmp/netsnmp.mk    | 10 ++++++++++
 package/netsnmp/snmpd.service | 15 +++++++++++++++
 2 files changed, 25 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
