Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E19C369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 21:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA6B960813;
	Mon, 21 Apr 2025 21:33:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e-v_T6_Ci45Q; Mon, 21 Apr 2025 21:33:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F25B060B26
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F25B060B26;
	Mon, 21 Apr 2025 21:33:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D2D51BC
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F5634026B
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:33:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tD8Pjpp0Mv7k for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 21:33:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FFE440A92
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FFE440A92
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:33:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 676B48607D; Mon, 21 Apr 2025 21:33:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 21 Apr 2025 23:33:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd9c6907c79bf180a9e0ce8674ffa2e48c1d4439
X-Git-Newrev: 340a4bd4f80f71c975f10bee575e8e7cb93131b9
X-Patchwork-Hint: ignore
Message-Id: <20250421213319.676B48607D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mosquitto: fix init script
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=340a4bd4f80f71c975f10bee575e8e7cb93131b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Restart would regularly fail because it did not wait for the old
process to be gone before starting the new one. Rewrite the script
according to current style to fix that, and add reload support (see
mosquitto docs for limitations of reload).

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore            |  1 -
 package/mosquitto/S50mosquitto | 79 +++++++++++++++++++++++++++++++-----------
 2 files changed, 59 insertions(+), 21 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 3affba382d..997ed1b896 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -822,7 +822,6 @@ package/mono-gtksharp3/0001-Fixes-MONO_PROFILE_ENTER_LEAVE-undeclared.patch lib_
 package/mono-gtksharp3/0002-Mono-compilation-error-branch.patch lib_patch.Upstream
 package/mono/0001-Fix-linkage-with-a-system-libatomic_ops-shared-library.patch lib_patch.Upstream
 package/mono/0002-Ongoing-work-on-the-cmake-build.patch lib_patch.Upstream
-package/mosquitto/S50mosquitto Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/motion/S99motion Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/mpir/0001-mpn-arm-udiv.asm-workaround-binutils-bug-14887.patch lib_patch.Upstream
 package/mpv/0001-fix-powerpc64-altivec.patch lib_patch.Upstream
diff --git a/package/mosquitto/S50mosquitto b/package/mosquitto/S50mosquitto
index 5241a071d7..89989179c1 100644
--- a/package/mosquitto/S50mosquitto
+++ b/package/mosquitto/S50mosquitto
@@ -1,35 +1,74 @@
 #!/bin/sh
 
+DAEMON="mosquitto"
+PIDFILE="/var/run/$DAEMON.pid"
+MOSQUITTO_CONF="/etc/mosquitto/mosquitto.conf"
+
+[ -f "$MOSQUITTO_CONF" ] || exit 0
+
 start() {
-	printf "Starting mosquitto: "
-	start-stop-daemon -S -q -m -b -p /var/run/mosquitto.pid \
-		--exec /usr/sbin/mosquitto \
-		-- -c /etc/mosquitto/mosquitto.conf
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	printf "Starting %s: " "$DAEMON"
+	start-stop-daemon --start --background --make-pidfile \
+		--pidfile "$PIDFILE" --exec "/usr/sbin/$DAEMON" \
+		-- -c "$MOSQUITTO_CONF"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
 }
+
 stop() {
-	printf "Stopping mosquitto: "
-	start-stop-daemon -K -q -p /var/run/mosquitto.pid
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	printf "Stopping %s: " "$DAEMON"
+	start-stop-daemon --stop --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+		return "$status"
+	fi
+	while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON"; do
+		sleep 0.1
+	done
+	rm -f "$PIDFILE"
+	return "$status"
 }
+
 restart() {
 	stop
 	start
 }
 
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
+}
+
 case "$1" in
-  start)
-	start
-	;;
-  stop)
-	stop
-	;;
-  restart|reload)
-	restart
-	;;
-  *)
-	echo "Usage: $0 {start|stop|restart}"
-	exit 1
+	start)
+		start;;
+	stop)
+		stop;;
+	restart)
+		restart;;
+	reload)
+		reload;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
 esac
 
 exit $?
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
