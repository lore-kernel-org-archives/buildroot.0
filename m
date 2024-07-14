Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C227C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 17:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EF00607D5;
	Sun, 14 Jul 2024 17:32:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fx6URYfmf28y; Sun, 14 Jul 2024 17:32:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2371607FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2371607FA;
	Sun, 14 Jul 2024 17:32:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 943D01BF3F2
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 17:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8765781200
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 17:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x7_BHjTG81Ck for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 17:32:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9465F811FF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9465F811FF
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 17:32:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 808EF8690C; Sun, 14 Jul 2024 17:32:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 19:31:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 134a9f2beb24f831347b252c0fe015dce651a14d
X-Git-Newrev: b0a0c25e625a9736c38d0957956447e102ceec1e
X-Patchwork-Hint: ignore
Message-Id: <20240714173210.808EF8690C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/network-manager: rewrite init
 script
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

commit: https://git.buildroot.net/buildroot/commit/?id=b0a0c25e625a9736c38d0957956447e102ceec1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This brings the NetworkManager init script in line with the standard
Buildroot init script pattern, including the script name.

Reload using SIGHUP is also supported now, note that the
NetworkManager documentation cautions that not all parameters can be
changed at runtime (without a full restart).

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                        |  1 -
 package/network-manager/S45NetworkManager  | 68 ++++++++++++++++++++++++++++++
 package/network-manager/S45network-manager | 41 ------------------
 package/network-manager/network-manager.mk |  2 +-
 4 files changed, 69 insertions(+), 43 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 5bac2b73a0..42b22d4aed 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1003,7 +1003,6 @@ package/netsurf/0002-do-not-cross-compile-nsgenbind.patch lib_patch.Upstream
 package/netsurf/0003-fix-compilation-without-curl.patch lib_patch.Upstream
 package/netsurf/0004-framebuffer-Fix-internal-font-generated-source-for-GCC-10.patch lib_patch.Upstream
 package/nettle/0001-disable-testsuite-examples.patch lib_patch.Upstream
-package/network-manager/S45network-manager Shellcheck lib_sysv.ConsecutiveEmptyLines lib_sysv.EmptyLastLine lib_sysv.Variables
 package/nfs-utils/S60nfs Shellcheck lib_sysv.ConsecutiveEmptyLines lib_sysv.Variables
 package/nginx-modsecurity/0001-config-use-pkg-config.patch lib_patch.Upstream
 package/nginx/0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch lib_patch.Upstream
diff --git a/package/network-manager/S45NetworkManager b/package/network-manager/S45NetworkManager
new file mode 100644
index 0000000000..9f3398a347
--- /dev/null
+++ b/package/network-manager/S45NetworkManager
@@ -0,0 +1,68 @@
+#!/bin/sh
+
+DAEMON="NetworkManager"
+PIDFILE="/var/run/$DAEMON.pid"
+
+# shellcheck source=/dev/null
+test -r "/etc/default/$DAEMON" && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	[ ! -d "/var/run/$DAEMON" ] && install -d "/var/run/$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon --start --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON" \
+		-- --pid-file="$PIDFILE" $NETWORKMANAGER_ARGS
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
+	start-stop-daemon --stop --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+		return "$status"
+	fi
+	# NetworkManager deletes its PID file on exit, wait for it to
+	# be gone
+	while [ -f "$PIDFILE" ]; do
+		sleep 0.1
+	done
+	return "$status"
+}
+
+restart() {
+	stop
+	start
+}
+
+reload() {
+	printf 'Reloading %s config: ' "$DAEMON"
+	start-stop-daemon --stop --signal HUP -q --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+case "$1" in
+	start|stop|restart|reload)
+		"$1";;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
diff --git a/package/network-manager/S45network-manager b/package/network-manager/S45network-manager
deleted file mode 100644
index bc775d3b20..0000000000
--- a/package/network-manager/S45network-manager
+++ /dev/null
@@ -1,41 +0,0 @@
-#!/bin/sh
-
-# Allow a few customizations from a config file
-test -r /etc/default/NetworkManager && . /etc/default/NetworkManager
-
-PID=`pidof NetworkManager`
-case "$1" in
-	start)
-		printf "Starting NetworkManager ... "
-		[ ! -d /var/run/NetworkManager ] && install -d /var/run/NetworkManager
-		if [ -z "$PID" ]; then
-			/usr/sbin/NetworkManager $NETWORKMANAGER_ARGS
-		fi
-		if [ ! -z "$PID" -o $? -gt 0 ]; then
-			echo "failed!"
-		else
-			echo "done."
-		fi
-		;;
-	stop)
-		printf "Stopping NetworkManager ... "
-			[ ! -z "$PID" ] && kill $PID > /dev/null 2>&1
-		if [ $? -gt 0 ]; then
-			echo "failed!"
-		else
-			echo "done."
-		fi
-		;;
-	restart)
-		$0 stop
-		sleep 1
-		$0 start
-		;;
-	*)
-		echo "usage: $0 {start|stop|restart|sleep|wake}"
-		;;
-esac
-exit 0
-
-
-
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index cbd2ba8839..3937982c5f 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -163,7 +163,7 @@ NETWORK_MANAGER_CONF_OPTS += -Dnmcli=false
 endif
 
 define NETWORK_MANAGER_INSTALL_INIT_SYSV
-	$(INSTALL) -m 0755 -D package/network-manager/S45network-manager $(TARGET_DIR)/etc/init.d/S45network-manager
+	$(INSTALL) -m 0755 -D package/network-manager/S45NetworkManager $(TARGET_DIR)/etc/init.d/S45NetworkManager
 endef
 
 define NETWORK_MANAGER_INSTALL_INIT_SYSTEMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
