Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E8AC2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 14:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F25540EBD;
	Tue,  9 Jul 2024 14:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G2bqf5RgFZ0k; Tue,  9 Jul 2024 14:24:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2DA240EF7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2DA240EF7;
	Tue,  9 Jul 2024 14:24:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E325E1BF27A
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 14:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF21140ED5
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 14:24:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VIB4X4Iw_AGk for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 14:24:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.122;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 342BA40EB7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 342BA40EB7
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.122])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 342BA40EB7
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 14:24:11 +0000 (UTC)
Received: from unknown (HELO opfedv1rlp0a.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 16:24:11 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0a.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Jul 2024 16:24:11 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 16:24:10 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Tue, 09 Jul 2024 16:24:09 +0200
X-IronPort-AV: E=Sophos;i="6.09,195,1716242400"; d="scan'208";a="167238091"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 9 Jul 2024 16:24:01 +0200
Message-ID: <e6e9df5fad92d96444cebc9ebc8c137b83f929a6.1720535037.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720535037.git.yann.morin@orange.com>
References: <cover.1720535037.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX101.corporate.adroot.infra.ftgroup (10.115.26.2)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1720535052; x=1752071052;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2BDjphr6zQ8i3rA/y1aX1Is2eS8/PxcEWxB2sHEkVlw=;
 b=lwVheT+Z9PzUNDz0+guvqQQAEcfoE18R2OdNpdXnXzihRYglexwAO4Rv
 hA18MgqSVRFuqill9Rrwk7VRCLMWv4kjpio+qSHkNMqlgT18g1xvCWkZr
 ut60/YyesbQI3Ru1npJ0+A3RyFkbcuZM6SiGkLFOReQF/fuoS4kEzYg7k
 PXC4RMm0JABqXhrANaraX8yTIwnLkmb+4MPHqtrw3Ey4pfrn2CUzaG4VG
 S2CanqtqWnTpuQysA9JuFOcVvRf2BUfrQAoTmb9PhAwGt0gYuMx/h/rHv
 NRfHumV0Bd0LtZTZ722bNLvhHboqp54/xU9TqszZUyrVh+8cpruDGKplJ
 w==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=lwVheT+Z
Subject: [Buildroot] [PATCH 5/5] package/gpsd: add option to enable/disable
 the daemon
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
Cc: Bernd Kuhls <bernd@kuhls.net>, yann.morin@orange.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Some scenarii, like building an RTK base, does not require a gpsd
daemon, but just a few python based tools (e.g. the python scripts
to configure a GNSS device).

Add an option to enable or disable building and instaling the daemon.
We make it enabled by default, for legacy purposes.

When the daemon is installed, it also installs a few ancillary helpers,
which need some of the clients (e.g. the udev rule will use gpsdctl), so
ensure they are enabled with the daemon.

Speaking of the udev rule: without the daemon, it does not need to be
installed, so only try to fix its mode when the daemomn is installed.

Similarly for systemd, no need to install the drop-in when the daemon is
not installed. And for sysv init, no need for a startup script without
the daemon either.

Now that everything is optional, daemon, clients, and python stuff, we
need to ensure that at least something is installed. The obvious
solution would be to ensure that the daemon is installed, but that
causes conflicts in the Kconfig depencies (elided for readability):

    config BR2_PACAKGE_GPSD
        bool "gpsd:
        select BR2_PACKAGE_GPSD_DAEMON if ! BR2_PACKAGE_GPSD_CLIENTS \
                                       && ! BR2_PACKAGE_GPSD_PYTHON

    config BR2_PACKAGE_GPSD_DAEMON
        bool "daemon"
        select BR2_PACKAGE_GPSD_CLIENTS

would cause errors like:

    package/gpsd/Config.in:27:error: recursive dependency detected!
    package/gpsd/Config.in:27:      symbol BR2_PACKAGE_GPSD_DAEMON is selected by BR2_PACKAGE_GPSD_CLIENTS
    package/gpsd/Config.in:226:     symbol BR2_PACKAGE_GPSD_CLIENTS is selected by BR2_PACKAGE_GPSD_DAEMON

So we chose the next best option: ensure that the clients get built, if
nothing else does.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Bernd Kuhls <bernd@kuhls.net>
---
 package/gpsd/Config.in | 13 +++++++++
 package/gpsd/gpsd.mk   | 62 ++++++++++++++++++++++++------------------
 2 files changed, 49 insertions(+), 26 deletions(-)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index cbdcdb5725..92a124b8ac 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -9,6 +9,8 @@ menuconfig BR2_PACKAGE_GPSD
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# Always tries to build a shared library
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_GPSD_CLIENTS if !BR2_PACKAGE_GPSD_DAEMON \
+				       && !BR2_PACKAGE_GPSD_PYTHON
 	help
 	  gpsd is a service daemon that monitors one or more GPSes or
 	  AIS receivers attached to a host computer through serial or
@@ -22,6 +24,15 @@ menuconfig BR2_PACKAGE_GPSD
 
 if BR2_PACKAGE_GPSD
 
+config BR2_PACKAGE_GPSD_DAEMON
+	bool "gpsd daemon"
+	default y # legacy
+	select BR2_PACKAGE_GPSD_CLIENTS
+	help
+	  Build and install the gpsd daemon itself
+
+if BR2_PACKAGE_GPSD_DAEMON
+
 config BR2_PACKAGE_GPSD_DEVICES
 	string "Where to look for GPSes"
 	default "/dev/ttyS1"
@@ -210,6 +221,8 @@ config BR2_PACKAGE_GPSD_UBX
 	help
 	  uBlox UBX binary support
 
+endif  # GPSD_DAEMON
+
 config BR2_PACKAGE_GPSD_CLIENTS
 	bool "gpsd clients"
 	default y # legacy
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 77c6f6c562..8f87766dcc 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -26,8 +26,7 @@ GPSD_SCONS_OPTS = \
 	prefix=/usr \
 	sysroot=$(STAGING_DIR) \
 	strip=no \
-	qt=no \
-	systemd=$(if $(BR2_INIT_SYSTEMD),yes,no)
+	qt=no
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 GPSD_DEPENDENCIES += ncurses
@@ -178,6 +177,40 @@ ifeq ($(BR2_PACKAGE_GPSD_MAX_DEV),y)
 GPSD_SCONS_OPTS += max_devices=$(BR2_PACKAGE_GPSD_MAX_DEV_VALUE)
 endif
 
+ifeq ($(BR2_PACKAGE_GPSD_DAEMON),y)
+GPSD_SCONS_OPTS += \
+	gpsd=yes \
+	systemd=$(if $(BR2_INIT_SYSTEMD),yes,no)
+
+GPSD_INSTALL_RULE = $(if $(BR2_PACKAGE_HAS_UDEV),udev-install,install)
+
+# When using chrony, wait for after Buildroot's chrony.service
+ifeq ($(BR2_PACKAGE_CHRONY),y)
+define GPSD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(GPSD_PKGDIR)/br-chrony.conf \
+		$(TARGET_DIR)/usr/lib/systemd/system/gpsd.service.d/br-chrony.conf
+endef
+endif
+
+define GPSD_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/gpsd/S50gpsd $(TARGET_DIR)/etc/init.d/S50gpsd
+	$(SED) 's,^DEVICES=.*,DEVICES=$(BR2_PACKAGE_GPSD_DEVICES),' $(TARGET_DIR)/etc/init.d/S50gpsd
+endef
+
+# After the udev rule is installed, make it writable so that this
+# package can be re-built/re-installed.
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+define GPSD_INSTALL_UDEV_RULES
+	chmod u+w $(TARGET_DIR)/lib/udev/rules.d/25-gpsd.rules
+endef
+GPSD_POST_INSTALL_TARGET_HOOKS += GPSD_INSTALL_UDEV_RULES
+endif
+
+else # GPSD_DAEMON
+GPSD_SCONS_OPTS += gpsd=no systemd=no
+GPSD_INSTALL_RULE = install
+endif
+
 ifeq ($(BR2_PACKAGE_GPSD_CLIENTS),y)
 GPSD_SCONS_OPTS += gpsdclients=yes
 else
@@ -211,22 +244,9 @@ define GPSD_INSTALL_TARGET_CMDS
 		DESTDIR=$(TARGET_DIR) \
 		$(SCONS) \
 		$(GPSD_SCONS_OPTS) \
-		$(if $(BR2_PACKAGE_HAS_UDEV),udev-install,install))
+		$(GPSD_INSTALL_RULE))
 endef
 
-define GPSD_INSTALL_INIT_SYSV
-	$(INSTALL) -m 0755 -D package/gpsd/S50gpsd $(TARGET_DIR)/etc/init.d/S50gpsd
-	$(SED) 's,^DEVICES=.*,DEVICES=$(BR2_PACKAGE_GPSD_DEVICES),' $(TARGET_DIR)/etc/init.d/S50gpsd
-endef
-
-# When using chrony, wait for after Buildroot's chrony.service
-ifeq ($(BR2_PACKAGE_CHRONY),y)
-define GPSD_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 0644 $(GPSD_PKGDIR)/br-chrony.conf \
-		$(TARGET_DIR)/usr/lib/systemd/system/gpsd.service.d/br-chrony.conf
-endef
-endif
-
 define GPSD_INSTALL_STAGING_CMDS
 	(cd $(@D); \
 		$(GPSD_SCONS_ENV) \
@@ -236,14 +256,4 @@ define GPSD_INSTALL_STAGING_CMDS
 		install)
 endef
 
-# After the udev rule is installed, make it writable so that this
-# package can be re-built/re-installed.
-ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-define GPSD_INSTALL_UDEV_RULES
-	chmod u+w $(TARGET_DIR)/lib/udev/rules.d/25-gpsd.rules
-endef
-
-GPSD_POST_INSTALL_TARGET_HOOKS += GPSD_INSTALL_UDEV_RULES
-endif
-
 $(eval $(generic-package))
-- 
2.34.1

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
