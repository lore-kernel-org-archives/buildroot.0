Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40FEEC3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 21:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0ED0861310;
	Fri,  2 Aug 2024 21:35:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id APsGAQseTNAl; Fri,  2 Aug 2024 21:35:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C4126131B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C4126131B;
	Fri,  2 Aug 2024 21:35:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4127C1BF3FF
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FB66606B8
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:35:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V8kx4zH8ZcEz for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 21:35:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19E90606A5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19E90606A5
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 21:35:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14012825C3; Fri,  2 Aug 2024 21:35:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Aug 2024 23:34:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef35d60e1a7f74d381deee26051f78c8bde0002d
X-Git-Newrev: f6aa6d1a5f7d57f65d47e3eb250a18ae23662b02
X-Patchwork-Hint: ignore
Message-Id: <20240802213534.14012825C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gpsd: add option to enable/disable
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f6aa6d1a5f7d57f65d47e3eb250a18ae23662b02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Reviewed-by: Jan Havran <havran.jan@email.cz>
Tested-by: Jan Havran <havran.jan@email.cz>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gpsd/Config.in | 13 +++++++++++
 package/gpsd/gpsd.mk   | 62 +++++++++++++++++++++++++++++---------------------
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
@@ -211,21 +244,8 @@ define GPSD_INSTALL_TARGET_CMDS
 		DESTDIR=$(TARGET_DIR) \
 		$(SCONS) \
 		$(GPSD_SCONS_OPTS) \
-		$(if $(BR2_PACKAGE_HAS_UDEV),udev-install,install))
-endef
-
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
+		$(GPSD_INSTALL_RULE))
 endef
-endif
 
 define GPSD_INSTALL_STAGING_CMDS
 	(cd $(@D); \
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
