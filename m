Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD464C3DA5D
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 06:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF62040470;
	Sun, 21 Jul 2024 06:58:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L53bcMVdiLYd; Sun, 21 Jul 2024 06:57:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1589740247
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1589740247;
	Sun, 21 Jul 2024 06:57:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 17BE51BF342
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 06:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0661A812D0
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 06:57:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eHI893GzW6rE for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 06:57:57 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br015@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 73A66812D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73A66812D1
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 73A66812D1
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 06:57:55 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 2D15CBDE4B39;
 Sun, 21 Jul 2024 08:57:51 +0200 (CEST)
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 08:57:37 +0200
Message-ID: <20240721065737.2744-1-br015@umbiko.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.5 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1721545071; bh=avLba0ClFMeGfULbd/lW38KrlyLBW0psPKthsvfVTTs=;
 h=From:To:Cc:Subject:Date;
 b=gtFc9UZDYy7aVlKCo/8Tx9ykbi3dSLpHMDWezK+TokrpZFD6A9Cp/0f4QxORh7js2
 bHk4gjgGvvE3TOG2z2CV3A0Aim1CC/tT7eUToquQr3JQLDEZh7oLvMOHZGH62mZokM
 U6z1+ZSQsR0H7XVH9IpF6sMJAshRzfTvavY0Vbgc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=gtFc9UZD
Subject: [Buildroot] [PATCH] package/mpd: rebase init script on layout
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
Cc: Andreas Ziegler <br015@umbiko.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rebase S95mpd on commit 1f743f4 (package/openssh: tidy up init script)

$ utils/check-package package/mpd/S95mpd 
61 lines processed
0 warnings generated

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
---
 package/mpd/S95mpd | 64 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 46 insertions(+), 18 deletions(-)

diff --git a/package/mpd/S95mpd b/package/mpd/S95mpd
index a258930b3e..8e5bac995a 100644
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
+	# $DAEMON creates its own $PIDFILE, so do not use --pidfile
+	start-stop-daemon --start --exec "/usr/bin/$DAEMON"
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
