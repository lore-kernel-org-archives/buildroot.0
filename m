Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A73DC021B2
	for <buildroot@archiver.kernel.org>; Tue, 25 Feb 2025 20:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2027440531;
	Tue, 25 Feb 2025 20:31:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M19aTw2zUVeX; Tue, 25 Feb 2025 20:31:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A76D9404BF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A76D9404BF;
	Tue, 25 Feb 2025 20:31:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A4B722019
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 20:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 942BF60A40
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 20:31:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AeZCpht6xFrR for <buildroot@buildroot.org>;
 Tue, 25 Feb 2025 20:31:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF8C0608CE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF8C0608CE
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 20:31:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCC6187B3E; Tue, 25 Feb 2025 20:31:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 25 Feb 2025 21:00:06 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 1e0d7b66f28421b40dc6c947abf2311df5978a81
X-Git-Newrev: 71ba7404535cb3a917da14c75e9c86f4cf885045
X-Patchwork-Hint: ignore
Message-Id: <20250225203128.BCC6187B3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/watchdogd: fix
 sysv init script
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=71ba7404535cb3a917da14c75e9c86f4cf885045
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

PIDFILE was set incorrectly, watchdogd writes its PID file to
/var/run/watchdogd/pid (note the slash), which is not configurable
without patching.

Restructure the rest of the script to match current style while at it.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 51b848b534b194dc716cf4a75133b64f0fa216d9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore            |   1 -
 package/watchdogd/S01watchdogd | 102 ++++++++++++++++++++++++++---------------
 2 files changed, 66 insertions(+), 37 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index f64e072664..ac289a9b41 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1337,7 +1337,6 @@ package/waffle/0003-drop-C-dependency.patch Upstream
 package/wampcc/0001-Add-RISC-V-endian-detection.patch Upstream
 package/wampcc/0002-include-wampcc-platform.h-fix-build-with-musl-1.2.0.patch Upstream
 package/wampcc/0003-Broken-build-on-Windows.patch Upstream
-package/watchdogd/S01watchdogd Indent NotExecutable
 package/wget/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch Upstream
 package/wilc-driver/0001-cfg80211.c-fix-missing-prandom_u32-with-Linux-6.1.0.patch Upstream
 package/wilc-driver/0002-spi.c-fix-build-failure-on-remove-callback.patch Upstream
diff --git a/package/watchdogd/S01watchdogd b/package/watchdogd/S01watchdogd
old mode 100755
new mode 100644
index df57b8ad7a..8f811ac0fc
--- a/package/watchdogd/S01watchdogd
+++ b/package/watchdogd/S01watchdogd
@@ -1,47 +1,77 @@
 #!/bin/sh
 
 DAEMON="watchdogd"
-PIDFILE="/var/run/$DAEMON.pid"
+PIDFILE="/var/run/$DAEMON/pid"
 
 # shellcheck source=/dev/null
 [ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
 
-cmd()
-{
-    start-stop-daemon -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" "$@"
-    status=$?
-    if [ $status -eq 0 ]; then
-	echo "OK"
-    else
-	echo "FAIL"
-    fi
-    return $status
+start() {
+	printf "Starting %s: " "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon --start --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON" -- $WATCHDOGD_ARGS
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
+	printf "Stopping %s: " "$DAEMON"
+	start-stop-daemon --stop --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	# watchdogd deletes its PID file on exit, wait for it to be gone
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
+	printf "Reloading %s config: " "$DAEMON"
+	start-stop-daemon --stop --signal HUP -q --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
 }
 
 case "$1" in
-    start)
-	printf 'Starting %s: ' "$DAEMON"
-	# shellcheck disable=SC2086 # we need the word splitting
-	cmd -S -- $SMCROUTED_ARGS
-	;;
-
-    stop)
-	printf 'Stopping %s: ' "$DAEMON"
-	cmd -K
-	;;
-
-    restart)
-	$0 stop
-	sleep 1
-	$0 start
-	;;
-
-    reload)
-	printf 'Reloading %s: ' "$DAEMON"
-	cmd -K -s HUP
-	;;
-
-    *)
-	echo "Usage: $0 {start|stop|restart|reload}"
-	exit 1
+	start)
+		start
+		;;
+	stop)
+		stop
+		;;
+	restart)
+		restart
+		;;
+	reload)
+		reload
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+		;;
 esac
+
+exit $?
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
