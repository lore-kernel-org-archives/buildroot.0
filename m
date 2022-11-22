Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9704CC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 12:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 330BA4048F;
	Mon,  5 Dec 2022 12:15:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 330BA4048F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UTuMl3WL1sVV; Mon,  5 Dec 2022 12:15:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29B79415DA;
	Mon,  5 Dec 2022 12:15:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29B79415DA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 447B81BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C67D40613
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C67D40613
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wRF5bWE8l-Hg for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A2F7408BF
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A2F7408BF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 86DE385B9E; Mon,  5 Dec 2022 11:26:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Nov 2022 22:38:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea76443a4bca1bcfa0390383870bc21327def6e5
X-Git-Newrev: 10dbfdec2df187fe29ec3613e1bdc04e14322565
X-Patchwork-Hint: ignore
Message-Id: <20221205112610.86DE385B9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ssdp-responder: fix warnings from
 check-package and shellcheck
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

commit: https://git.buildroot.net/buildroot/commit/?id=10dbfdec2df187fe29ec3613e1bdc04e14322565
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Summary of changes:

 - Fix use of $DAEMON, found by check-package
   - Expects DAEMON to be name of daemon controlled by script, this
     causes ripple efects in rest of script
   - Recommend `chmod a-x`, .mk file installs with `-m 0755`
 - Fix shellcheck warnings:
   - Use "$VAR" in case of spaces in filenames
   - recommend not using $? in if stmt, should use `if start-stop ...`
   - mismatch in indentation in case-esac

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ssdp-responder/S50ssdpd | 47 +++++++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/package/ssdp-responder/S50ssdpd b/package/ssdp-responder/S50ssdpd
old mode 100755
new mode 100644
index e33992be91..8654de4f26
--- a/package/ssdp-responder/S50ssdpd
+++ b/package/ssdp-responder/S50ssdpd
@@ -1,25 +1,32 @@
 #!/bin/sh
 
-NAME=ssdpd
-PIDFILE=/var/run/$NAME.pid
-DAEMON=/usr/sbin/$NAME
-CFGFILE=/etc/default/$NAME
+DAEMON=ssdpd
+PIDFILE=/var/run/$DAEMON.pid
+CFGFILE=/etc/default/$DAEMON
 
 DAEMON_ARGS=""
 
 # Read configuration variable file if it is present
-[ -f $CFGFILE ] && . $CFGFILE
+# shellcheck source=/dev/null
+[ -r "$CFGFILE" ] && . "$CFGFILE"
 
+# shellcheck disable=SC2086
 start() {
-	printf 'Starting %s: ' "$NAME"
-	start-stop-daemon -S -q -p $PIDFILE -x $DAEMON -- $DAEMON_ARGS
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	printf 'Starting %s: ' "$DAEMON"
+	if start-stop-daemon -S -q -p "$PIDFILE" -x "$DAEMON" -- $DAEMON_ARGS; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
 }
 
 stop() {
-	printf 'Stopping %s: ' "$NAME"
-	start-stop-daemon -K -q -p $PIDFILE -x $DAEMON
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	printf 'Stopping %s: ' "$DAEMON"
+	if start-stop-daemon -K -q -p "$PIDFILE" -x "$DAEMON"; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
 }
 
 restart() {
@@ -28,15 +35,15 @@ restart() {
 }
 
 case "$1" in
-    start|stop|restart)
-	"$1"
-	;;
-    reload)
-	restart
-	;;
-    *)
-	echo "Usage: $0 {start|stop|restart|reload}"
-	exit 1
+	start|stop|restart)
+		"$1"
+		;;
+	reload)
+		restart
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
 esac
 
 exit $?
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
