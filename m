Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6100C3DA45
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 07:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 476E6811EF;
	Mon, 15 Jul 2024 07:45:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W1jGH4P6jAWP; Mon, 15 Jul 2024 07:45:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28DEC811A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28DEC811A7;
	Mon, 15 Jul 2024 07:45:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A15521BF2B9
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 07:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F06F6069D
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 07:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t6tGoTHjguy5 for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 07:44:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A740D605E0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A740D605E0
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 07:44:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 919EA869F3; Mon, 15 Jul 2024 07:44:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 09:43:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f041540ef5b7b22b77906aaf55a7837a343f3a33
X-Git-Newrev: b3410239818fd8b03c41d9a75806ad6b5032e6bb
X-Patchwork-Hint: ignore
Message-Id: <20240715074448.919EA869F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/busybox: add crond init script
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

commit: https://git.buildroot.net/buildroot/commit/?id=b3410239818fd8b03c41d9a75806ad6b5032e6bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The init script will be installed only if no other package provides
cron (currently that could be package/dcron).

Our current default location for crontabs was the Busybox default of
/var/spool/cron/, but /var/spool is stored on tmpfs. This isn't
convenient as crontabs should normally be persistent, so we change
this default to /etc/cron, which is much more sensible. We also create
it to make sure to create this directory.

Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
[Thomas:
- Change default location of crontab
- Rework init script according to the latest coding style rules]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/busybox/S50crond       | 60 ++++++++++++++++++++++++++++++++++++++++++
 package/busybox/busybox.config |  2 +-
 package/busybox/busybox.mk     | 14 ++++++++++
 3 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/package/busybox/S50crond b/package/busybox/S50crond
new file mode 100644
index 0000000000..74a0c0849b
--- /dev/null
+++ b/package/busybox/S50crond
@@ -0,0 +1,60 @@
+#!/bin/sh
+
+DAEMON="crond"
+PIDFILE="/var/run/$DAEMON.pid"
+
+CROND_ARGS=""
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+# BusyBox' crond does not create a pidfile, so pass "-f" on the crond
+# command line and use "--make-pidfile" to instruct start-stop-daemon
+# to create one.
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon --start --background --make-pidfile \
+		--pidfile "$PIDFILE" --exec "/usr/sbin/$DAEMON" \
+		-- -f $CROND_ARGS
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+stop() {
+	printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon --stop --pidfile "$PIDFILE" --exec "/usr/sbin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
+		--exec "/sbin/$DAEMON"; do
+		sleep 0.1
+	done
+	rm -f "$PIDFILE"
+	return "$status"
+}
+
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+	start|stop|restart)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index 35c01181bd..69d896bebd 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -782,7 +782,7 @@ CONFIG_CROND=y
 # CONFIG_FEATURE_CROND_D is not set
 # CONFIG_FEATURE_CROND_CALL_SENDMAIL is not set
 CONFIG_FEATURE_CROND_SPECIAL_TIMES=y
-CONFIG_FEATURE_CROND_DIR="/var/spool/cron"
+CONFIG_FEATURE_CROND_DIR="/etc/cron"
 CONFIG_CRONTAB=y
 # CONFIG_DEVFSD is not set
 # CONFIG_DEVFSD_MODLOAD is not set
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index eb5e7ad922..f1e0a7e6da 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -312,6 +312,18 @@ define BUSYBOX_INSTALL_SYSCTL_SCRIPT
 endef
 endif
 
+# Only install our crond script if no other package does it.
+ifeq ($(BR2_PACKAGE_DCRON),)
+define BUSYBOX_INSTALL_CROND_SCRIPT
+	if grep -q CONFIG_CROND=y $(@D)/.config; \
+	then \
+		mkdir -p $(TARGET_DIR)/etc/cron/crontabs ; \
+		$(INSTALL) -m 0755 -D package/busybox/S50crond \
+			$(TARGET_DIR)/etc/init.d/S50crond; \
+	fi;
+endef
+endif
+
 ifeq ($(BR2_INIT_BUSYBOX),y)
 define BUSYBOX_INSTALL_INITTAB
 	if test ! -e $(TARGET_DIR)/etc/inittab; then \
@@ -407,6 +419,7 @@ define BUSYBOX_INSTALL_INIT_OPENRC
 	$(BUSYBOX_INSTALL_MDEV_SCRIPT)
 	$(BUSYBOX_INSTALL_LOGGING_SCRIPT)
 	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
+	$(BUSYBOX_INSTALL_CROND_SCRIPT)
 	$(BUSYBOX_INSTALL_TELNET_SCRIPT)
 endef
 
@@ -419,6 +432,7 @@ define BUSYBOX_INSTALL_INIT_SYSV
 	$(BUSYBOX_INSTALL_LOGGING_SCRIPT)
 	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
 	$(BUSYBOX_INSTALL_SYSCTL_SCRIPT)
+	$(BUSYBOX_INSTALL_CROND_SCRIPT)
 	$(BUSYBOX_INSTALL_TELNET_SCRIPT)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
