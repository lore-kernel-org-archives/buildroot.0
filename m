Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDD7E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 22:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CC3081162;
	Sun, 29 Dec 2024 22:36:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CqRK8QE378dT; Sun, 29 Dec 2024 22:35:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69EA781166
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69EA781166;
	Sun, 29 Dec 2024 22:35:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6240FC8
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 22:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5638E401E1
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 22:35:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GFMm3zfiAcYu for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 22:35:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 586AB4004A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 586AB4004A
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 22:35:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 431FD87785; Sun, 29 Dec 2024 22:35:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 23:34:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 421a92a8973d23b017293ea8b776d34fb54a6b5e
X-Git-Newrev: 8ea76e0986920f57f12b56c57872edf106064982
X-Patchwork-Hint: ignore
Message-Id: <20241229223549.431FD87785@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bluez5_utils: tidy up the init
 script
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

commit: https://git.buildroot.net/buildroot/commit/?id=8ea76e0986920f57f12b56c57872edf106064982
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* use long-form options
* consistently use start-stop-daemon with --exec
* wait for process to be gone and delete PID file on stop

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bluez5_utils/S40bluetoothd | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/package/bluez5_utils/S40bluetoothd b/package/bluez5_utils/S40bluetoothd
index ee4abe8b63..04f3f5ee94 100644
--- a/package/bluez5_utils/S40bluetoothd
+++ b/package/bluez5_utils/S40bluetoothd
@@ -11,7 +11,8 @@ BLUETOOTHD_ARGS="-n"
 start() {
 	printf 'Starting %s: ' "$DAEMON"
 	# shellcheck disable=SC2086 # we need the word splitting
-	start-stop-daemon -S -q -m -b -p "$PIDFILE" -x "/usr/libexec/bluetooth/$DAEMON" \
+	start-stop-daemon --start --background --make-pidfile \
+		--pidfile "$PIDFILE" --exec "/usr/libexec/bluetooth/$DAEMON" \
 		-- $BLUETOOTHD_ARGS
 	status=$?
 	if [ "$status" -eq 0 ]; then
@@ -24,25 +25,32 @@ start() {
 
 stop() {
 	printf 'Stopping %s: ' "$DAEMON"
-	start-stop-daemon -K -q -p "$PIDFILE"
+	start-stop-daemon --stop --pidfile "$PIDFILE" \
+		--exec "/usr/libexec/bluetooth/$DAEMON"
 	status=$?
 	if [ "$status" -eq 0 ]; then
 		echo "OK"
 	else
 		echo "FAIL"
+		return "$status"
 	fi
+	while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
+		--exec "/usr/libexec/bluetooth/$DAEMON"; do
+		sleep 0.1
+	done
+	rm -f "$PIDFILE"
 	return "$status"
 }
 
 restart() {
 	stop
-	sleep 1
 	start
 }
 
 reload() {
 	printf 'Reloading %s: ' "$DAEMON"
-	start-stop-daemon -K -s HUP -q -p "$PIDFILE"
+	start-stop-daemon --stop --signal HUP -q --pidfile "$PIDFILE" \
+		--exec "/usr/libexec/bluetooth/$DAEMON"
 	status=$?
 	if [ "$status" -eq 0 ]; then
 		echo "OK"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
