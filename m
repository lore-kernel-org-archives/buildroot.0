Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7670FC3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 17:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45F00607AA;
	Sun, 14 Jul 2024 17:32:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4RPNKpa-ufPc; Sun, 14 Jul 2024 17:32:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96827607D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96827607D5;
	Sun, 14 Jul 2024 17:32:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3E1BF1BF954
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 17:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B404401F6
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 17:32:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OUrkOq20-V4x for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 17:32:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F0864010D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F0864010D
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 17:32:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7008186909; Sun, 14 Jul 2024 17:32:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 19:31:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1f743f4004fc97576609dd8c09d80f0bfd08913e
X-Git-Newrev: 134a9f2beb24f831347b252c0fe015dce651a14d
X-Patchwork-Hint: ignore
Message-Id: <20240714173210.7008186909@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dnsmasq: tidy up init script
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

commit: https://git.buildroot.net/buildroot/commit/?id=134a9f2beb24f831347b252c0fe015dce651a14d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Create start/stop/restart functions

* Use long start-stop-daemon options, avoid --quiet

* Return start-stop-daemon exit code from start/stop functions

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dnsmasq/S80dnsmasq | 61 +++++++++++++++++++++++++++++-----------------
 1 file changed, 39 insertions(+), 22 deletions(-)

diff --git a/package/dnsmasq/S80dnsmasq b/package/dnsmasq/S80dnsmasq
index f1e1a68585..d483c0fb36 100644
--- a/package/dnsmasq/S80dnsmasq
+++ b/package/dnsmasq/S80dnsmasq
@@ -5,30 +5,47 @@ PIDFILE="/var/run/$DAEMON.pid"
 
 [ -f /etc/dnsmasq.conf ] || exit 0
 
+start() {
+	printf "Starting dnsmasq: "
+	start-stop-daemon --start --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON" \
+		-- --pid-file="$PIDFILE"
+	status=$?
+	[ "$status" -eq 0 ] && echo "OK" || echo "FAIL"
+	return "$status"
+}
+
+stop() {
+	printf "Stopping dnsmasq: "
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
+}
+
+restart() {
+	stop
+	start
+}
+
 case "$1" in
-	start)
-		printf "Starting dnsmasq: "
-		start-stop-daemon -S -p "$PIDFILE" -x "/usr/sbin/$DAEMON" -- \
-			--pid-file="$PIDFILE"
-		# shellcheck disable=SC2181
-		[ $? = 0 ] && echo "OK" || echo "FAIL"
-		;;
-	stop)
-		printf "Stopping dnsmasq: "
-		start-stop-daemon -K -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON"
-		# shellcheck disable=SC2181
-		[ $? = 0 ] && echo "OK" || echo "FAIL"
-		# wait for dnsmasq process to be gone
-		while true; do
-			pid="$( cat "${PIDFILE}" 2>/dev/null || true )"
-			{ [ -n "${pid}" ] && [ -d "/proc/${pid}" ]; } || break
-			sleep 0.1
-		done
-		rm -f "$PIDFILE"
+	start|stop|restart)
+		"$1"
 		;;
-	restart|reload)
-		$0 stop
-		$0 start
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart
 		;;
 	*)
 		echo "Usage: $0 {start|stop|restart}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
