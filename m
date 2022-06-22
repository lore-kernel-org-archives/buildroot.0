Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93258C43334
	for <buildroot@archiver.kernel.org>; Wed, 22 Jun 2022 20:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2443960EA7;
	Wed, 22 Jun 2022 20:35:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2443960EA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AXzlsJRndMqo; Wed, 22 Jun 2022 20:35:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C24560E3F;
	Wed, 22 Jun 2022 20:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C24560E3F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C5DA11BF3B9
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 20:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE7F960E3F
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 20:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE7F960E3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RCSEtsyEwzWr for <buildroot@lists.busybox.net>;
 Wed, 22 Jun 2022 20:35:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3B2E60C1D
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 20:35:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3B2E60C1D
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 5496387528; Wed, 22 Jun 2022 20:22:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 22 Jun 2022 22:34:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f67720baa397698520fe5fd0903bb063eec680cb
X-Git-Newrev: 0b350cf7569005d3eec6bb55a3acd4688d2fbd4e
X-Patchwork-Hint: ignore
Message-Id: <20220622202243.5496387528@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender/S42mender: fix check-pkg
 and shellcheck warnings
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

commit: https://git.buildroot.net/buildroot/commit/?id=0b350cf7569005d3eec6bb55a3acd4688d2fbd4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Copy the basic syntax of package/polkit/S50polkit and change the following:

  - Add DAEMON, DAEMON_PATH, PIDFILE and DAEMON_ARGS variables.
  - Fix shellcheck warning SC2166 on line 16.
  - Fix shellcheck warning SC2181 on lines 29 and 34 by assigning the return
    code from the start-stop-daemon binary to a variable, and then check the
    value of the variable.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mender/S42mender | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/package/mender/S42mender b/package/mender/S42mender
index dc60f94f8b..29008beca0 100644
--- a/package/mender/S42mender
+++ b/package/mender/S42mender
@@ -2,6 +2,10 @@
 #
 # Starts mender service.
 #
+DAEMON="mender"
+DAEMON_PATH="/usr/bin/mender"
+PIDFILE="/var/run/${DAEMON}.pid"
+DAEMON_ARGS="-daemon"
 
 start() {
 	# If /var/lib/mender is a symlink to /var/run/mender, and
@@ -9,8 +13,7 @@ start() {
 	#     create the directory pointed to by the symlink.
 	#   - the filesystem is RW (i.e. we can rm the symlink),
 	#     replace the symlink with an actual directory
-	if [ -L /var/lib/mender \
-	     -a "$(readlink /var/lib/mender)" = "/var/run/mender" ]
+	if [ -L /var/lib/mender ] && [ "$(readlink /var/lib/mender)" = "/var/run/mender" ]
 	then
 		if rm -f /var/lib/mender >/dev/null 2>&1; then
 			mkdir -p /var/lib/mender
@@ -23,15 +26,16 @@ start() {
 
 	printf "Starting mender service: "
 	umask 077
-
-	start-stop-daemon -S -q -b -m -p /var/run/mender.pid \
-		--exec /usr/bin/mender -- daemon
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	start-stop-daemon -bmSqp "$PIDFILE" -x ${DAEMON_PATH} -- ${DAEMON_ARGS}
+	status=$?
+	[ "${status}" = 0 ] && echo "OK" || echo "FAIL"
 }
+
 stop() {
 	printf "Stopping mender service: "
-	start-stop-daemon -K -q -p /var/run/mender.pid
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	start-stop-daemon -Kqp "$PIDFILE"
+	status=$?
+	[ "${status}" = 0 ] && echo "OK" || echo "FAIL"
 }
 restart() {
 	stop
@@ -49,7 +53,7 @@ case "$1" in
 		restart
 		;;
 	*)
-		echo "Usage: $0 {start|stop|restart}"
+		echo "Usage: $0 {start|stop|reload|restart}"
 		exit 1
 esac
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
