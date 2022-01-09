Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E6DC433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 08:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDF2B401D5;
	Sun,  9 Jan 2022 08:57:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vKPzj7krcbKU; Sun,  9 Jan 2022 08:57:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23051401CC;
	Sun,  9 Jan 2022 08:57:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B41A91BF3AD
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 08:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1F6A60B03
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 08:57:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HMOcS5FPG968 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 08:57:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCA3760AD0
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 08:57:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8F3B482A95; Sun,  9 Jan 2022 08:51:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 09:56:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 01a7e1a9f8bcfa4d7f8b1dab85f84ec53797ea2b
X-Git-Newrev: 787f7b58a7fb7c68e1f54573b6c0a29defdc5dcb
X-Patchwork-Hint: ignore
Message-Id: <20220109085114.8F3B482A95@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/inadyn: refactor start script
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=787f7b58a7fb7c68e1f54573b6c0a29defdc5dcb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch is a complete rewrite of the Inadyn start script, based on
the BusyBox S01syslogd template.  Additional features, compared to the
template, are limited to the ability to:

 - Check if enabled, using an ENABLED="yes" from /etc/default/inadyn,
   this for compatibility with the previous version of the script
 - Override INADYN_ARGS from /etc/default/inadyn
 - A reload command that sends SIGHUP, since that works and is both
   quicker and a less resource intensive operation

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/inadyn/S70inadyn | 96 ++++++++++++++++++++++++++++++------------------
 1 file changed, 61 insertions(+), 35 deletions(-)

diff --git a/package/inadyn/S70inadyn b/package/inadyn/S70inadyn
old mode 100644
new mode 100755
index ca7b414678..8a71693cba
--- a/package/inadyn/S70inadyn
+++ b/package/inadyn/S70inadyn
@@ -1,44 +1,70 @@
 #!/bin/sh
+# Customizations are sourced from /etc/default/inadyn.  For example,
+# override INADYN_ARGS to adjust log level, add a startup delay, etc.
 #
-# Start & stop the inadyn client
-#
+# NOTE: to start, add a line ENABLED="yes" to /etc/default/inadyn
+
+DAEMON="inadyn"
+PIDFILE="/var/run/$DAEMON.pid"
+
+INADYN_ARGS=""
 
-CONFIG=/etc/inadyn.conf
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
 
-# check if CONFIG exists, print message & exit if it doesn't
-[ ! -f $CONFIG ] && ( echo "The config file "$CONFIG" is missing...exiting now." && exit 2 )
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	if [ "$ENABLED" != "yes" ]; then
+		echo "SKIPPED"
+		exit 0
+	fi
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
+			  -- $INADYN_ARGS
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
 
-# Allow a few customizations from a config file. Especially inadyn
-# must be explicitly enabled by adding ENABLED="yes" in this file.
-test -r /etc/default/inadyn && . /etc/default/inadyn
+stop() {
+	printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon -K -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		rm -f "$PIDFILE"
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+restart() {
+	stop
+	sleep 1
+	start
+}
+
+reload() {
+	printf 'Reloading %s: ' "$DAEMON"
+	start-stop-daemon -K -s HUP -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
 
 case "$1" in
-	start)
-		printf "Starting inadyn: "
-		if test "${ENABLED}" != "yes" ; then
-		    echo "SKIPPED"
-		    exit 0
-		fi
-		start-stop-daemon -b -q -S -p /var/run/inadyn.pid -x /usr/sbin/inadyn
-		[ $? = 0 ] && echo "OK" || echo "FAIL"
-		;;
-	stop)
-		printf "Stopping inadyn: "
-		if test "${ENABLED}" != "yes" ; then
-		    echo "SKIPPED"
-		    exit 0
-		fi
-		start-stop-daemon -q -K -p /var/run/inadyn.pid -x /usr/sbin/inadyn
-		[ $? = 0 ] && echo "OK" || echo "FAIL"
-		rm -f /var/run/inadyn.pid
-		;;
-	restart)
-		"$0" stop
-		"$0" start
-		;;
-		*)
-		echo "Usage: $0 {start|stop|restart}"
+	start|stop|restart|reload)
+		"$1";;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
 		exit 1
 esac
-
-exit $?
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
