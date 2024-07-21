Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C12C3DA5D
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 17:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6149B60605;
	Sun, 21 Jul 2024 17:37:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ejACUcjVjN5w; Sun, 21 Jul 2024 17:37:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B448D60631
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B448D60631;
	Sun, 21 Jul 2024 17:37:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 636F11BF2C3
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 17:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 509C660631
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 17:37:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S92PUoxar1Wg for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 17:37:10 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br015@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CAC2B60605
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAC2B60605
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CAC2B60605
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 17:37:08 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 4D0C9BDE64FF;
 Sun, 21 Jul 2024 19:37:05 +0200 (CEST)
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 19:36:04 +0200
Message-ID: <20240721173604.13824-1-br015@umbiko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240721182342.6403c1d7@windsurf>
References: <20240721182342.6403c1d7@windsurf>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.5 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1721583426; bh=UokSvo1AhVj5IjUCuxDLscktHFKmFBJIuarr0Yuf7zw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=R/yIqqgfKurixO/sYGqBjNUv9VgDIRcA7toMP+9326qHZURl06x8Cw0GW5mCFwS2q
 1n8O1P84b5/bISKT8E6ovcxJHfvI0zNPj1QxW+hWottQJJ28VLBxdXIpTwPgV3ww0R
 P5OEXcF6vIbyc2iQG0lNVGbw17p5kgvsEQ82Jjd4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=R/yIqqgf
Subject: [Buildroot] [PATCH v2] package/mpd: rebase init script on layout
 introduced by openssh
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
Cc: Andreas Ziegler <br015@umbiko.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rebase S95mpd on commit 1f743f4 (package/openssh: tidy up init script)

$ utils/check-package package/mpd/S95mpd 
61 lines processed
0 warnings generated

(smoke test on live system)

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
---
Changes v1 -> v2
 - use --pidfile in startup of service [Thomas Petazzoni]

 package/mpd/S95mpd | 64 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 46 insertions(+), 18 deletions(-)

diff --git a/package/mpd/S95mpd b/package/mpd/S95mpd
index a258930b3e..ac971e04a2 100644
--- a/package/mpd/S95mpd
+++ b/package/mpd/S95mpd
@@ -1,33 +1,61 @@
 #!/bin/sh
+#
+# S95mpd	Starts Music Player daemon.
+#
+# shellcheck disable=SC2317 # functions are called via variable
+
+DAEMON="mpd"
+PIDFILE="/var/run/$DAEMON.pid"
 
 # Sanity checks
-test -f /etc/mpd.conf || exit 0
+[ -f /etc/$DAEMON.conf ] || exit 0
 
 start() {
-	printf "Starting mpd: "
-	start-stop-daemon --start --quiet --background --exec /usr/bin/mpd \
-		&& echo "OK" || echo "FAIL"
+	printf "Starting %s: " "$DAEMON"
+	start-stop-daemon --start --pidfile "$PIDFILE" \
+		--exec "/usr/bin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
 }
 
 stop() {
-	printf "Stopping mpd: "
-	start-stop-daemon --stop --quiet --pidfile /var/run/mpd.pid \
-		&& echo "OK" || echo "FAIL"
+	printf "Stopping %s: " "$DAEMON"
+	start-stop-daemon --stop --pidfile "$PIDFILE" \
+		--exec "/usr/bin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	# $DAEMON deletes its PID file on exit, wait for it to be gone
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
+	restart
 }
 
 case "$1" in
-	start)
-		start
-		;;
-	stop)
-		stop
-		;;
-	restart|reload)
-		stop
-		sleep 1
-		start
+	start|stop|reload|restart)
+		"$1"
 		;;
 	*)
-		echo "Usage: $0 {start|stop|restart}"
+		echo "Usage: $0 {start|stop|reload|restart}"
 		exit 1
 esac
+
+exit $?
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
