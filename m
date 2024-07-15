Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4489AC2BD09
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 08:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DACB5605E0;
	Mon, 15 Jul 2024 08:15:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XkGgIeo3YCDH; Mon, 15 Jul 2024 08:15:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34BC5606B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34BC5606B4;
	Mon, 15 Jul 2024 08:15:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C82511BF421
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 08:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2E49810F2
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 08:15:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w7tGidvJfhtu for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 08:15:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D33C2810EB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D33C2810EB
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 08:15:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B90F586ADB; Mon, 15 Jul 2024 08:15:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 10:13:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b3410239818fd8b03c41d9a75806ad6b5032e6bb
X-Git-Newrev: 8841eb005d90e7e49bc0c9bb64a48fa468f2b1db
X-Patchwork-Hint: ignore
Message-Id: <20240715081535.B90F586ADB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/busybox: add ifplugd init script
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

commit: https://git.buildroot.net/buildroot/commit/?id=8841eb005d90e7e49bc0c9bb64a48fa468f2b1db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The init script will be installed only if no other package provides
ifplugd (currently that could be package/ifplugd). Users can configure
the interface(s) which ifplugd should watch either using
/etc/default/ifplugd (for one interface) or using per-interface
symlinks to the script in /etc/init.d (for any number of
interfaces). The action script that ifplugd runs when a link change is
detected must be supplied separately.

Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/busybox/S41ifplugd | 85 ++++++++++++++++++++++++++++++++++++++++++++++
 package/busybox/busybox.mk | 13 +++++++
 2 files changed, 98 insertions(+)

diff --git a/package/busybox/S41ifplugd b/package/busybox/S41ifplugd
new file mode 100644
index 0000000000..8c2c1a5038
--- /dev/null
+++ b/package/busybox/S41ifplugd
@@ -0,0 +1,85 @@
+#!/bin/sh
+
+DAEMON="ifplugd"
+
+# Each ifplugd instance handles only one interface, so this script is
+# designed to be symlinked per interface. For each interface create a
+# symlink with .IFACE appended to the name. E.g. to launch ifplugd for
+# eth1 create a symlink from /etc/init.d/S41ifplugd.eth1 to this
+# script. DEFAULT_IFACE sets the interface the non-symlink script will
+# use, set it to empty in /etc/default/ifplugd to disable the default
+# instance and use symlinked instances only.
+DEFAULT_IFACE="eth0"
+# If your action script is not in the default location
+# /etc/ifplugd/ifplugd.action, use the "-r" option to set the
+# location.
+IFPLUGD_ARGS="-M"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+NAME_IFACE="$(basename "$0" | cut -s -d. -f2)"
+if [ -n "$NAME_IFACE" ]; then
+	IFACE="${NAME_IFACE}"
+elif [ -n "$DEFAULT_IFACE" ]; then
+	IFACE="${DEFAULT_IFACE}"
+else
+	# no interface configured
+	exit 0
+fi
+
+# check-package disable Variables
+PIDFILE="/var/run/${DAEMON}.${IFACE}.pid"
+IFPLUGD_ARGS="${IFPLUGD_ARGS} -i ${IFACE}"
+
+# BusyBox' ifplugd does not create a pidfile, so pass "-n" in the
+# command line and use "--make-pidfile" to instruct start-stop-daemon
+# to create one.
+start() {
+	printf 'Starting %s for %s: ' "$DAEMON" "$IFACE"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon --start --background --make-pidfile \
+		--pidfile "$PIDFILE" --exec "/usr/sbin/$DAEMON" \
+		-- -n $IFPLUGD_ARGS
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
+	printf 'Stopping %s for %s: ' "$DAEMON" "$IFACE"
+	start-stop-daemon --stop --pidfile "$PIDFILE" --exec "/usr/sbin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+		return "$status"
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
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index f1e0a7e6da..6c20a98d2d 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -324,6 +324,17 @@ define BUSYBOX_INSTALL_CROND_SCRIPT
 endef
 endif
 
+# Only install our ifplugd script if no other package does it.
+ifeq ($(BR2_PACKAGE_IFPLUGD),)
+define BUSYBOX_INSTALL_IFPLUGD_SCRIPT
+	if grep -q CONFIG_IFPLUGD=y $(@D)/.config; \
+	then \
+		$(INSTALL) -m 0755 -D package/busybox/S41ifplugd \
+			$(TARGET_DIR)/etc/init.d/S41ifplugd; \
+	fi;
+endef
+endif
+
 ifeq ($(BR2_INIT_BUSYBOX),y)
 define BUSYBOX_INSTALL_INITTAB
 	if test ! -e $(TARGET_DIR)/etc/inittab; then \
@@ -419,6 +430,7 @@ define BUSYBOX_INSTALL_INIT_OPENRC
 	$(BUSYBOX_INSTALL_MDEV_SCRIPT)
 	$(BUSYBOX_INSTALL_LOGGING_SCRIPT)
 	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
+	$(BUSYBOX_INSTALL_IFPLUGD_SCRIPT)
 	$(BUSYBOX_INSTALL_CROND_SCRIPT)
 	$(BUSYBOX_INSTALL_TELNET_SCRIPT)
 endef
@@ -432,6 +444,7 @@ define BUSYBOX_INSTALL_INIT_SYSV
 	$(BUSYBOX_INSTALL_LOGGING_SCRIPT)
 	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
 	$(BUSYBOX_INSTALL_SYSCTL_SCRIPT)
+	$(BUSYBOX_INSTALL_IFPLUGD_SCRIPT)
 	$(BUSYBOX_INSTALL_CROND_SCRIPT)
 	$(BUSYBOX_INSTALL_TELNET_SCRIPT)
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
