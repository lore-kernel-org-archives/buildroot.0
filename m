Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3FFC3DA41
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 21:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA35340649;
	Mon,  8 Jul 2024 21:51:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qauG88NboAZW; Mon,  8 Jul 2024 21:51:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C9FB405ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C9FB405ED;
	Mon,  8 Jul 2024 21:51:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 537461BF3BD
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 21:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4196B80E21
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 21:51:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WdaFQhztgdIx for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 21:51:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FA7880DFB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FA7880DFB
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 21:51:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 34972841EF; Mon,  8 Jul 2024 21:51:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 23:49:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cb25b54c2dd12c9d298a04b78668592b9593cd97
X-Git-Newrev: 8900311b7e5450082cace986533a093d37900efa
X-Patchwork-Hint: ignore
Message-Id: <20240708215103.34972841EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openssh: manage sshd using
 start-stop-daemon
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

commit: https://git.buildroot.net/buildroot/commit/?id=8900311b7e5450082cace986533a093d37900efa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The previously used "killall sshd" stopped all instances of sshd. With
OpenSSH before 9.8 that meant not only the listening server, but also
instances serving currently open sessions, possibly including the one
used to send the restart command, preventing it from completing the
"start" part of "restart" and leaving the system unreachable over SSH.

start-stop-daemon uses the PID file to target only the intended
process, and has built-in capability to check if it is running. This
ensures any open SSH sessions are unaffected, as well as unrelated
processes (in case a daemon crashed and the PID got reused).

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore     |  2 +-
 package/openssh/S50sshd | 36 ++++++++++++++++++++++++++++--------
 2 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index d0061485fb..0f33ed0705 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1103,7 +1103,7 @@ package/openrc/0003-init.d-agetty-replace-sbin-agetty-by-sbin-getty.patch lib_pa
 package/openrc/0004-init.d-agetty-start-agetty-after-all-sevices.patch lib_patch.Upstream
 package/openrc/0005-runlevels-do-not-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch lib_patch.Upstream
 package/openrc/0006-Also-create-run-lock-subsys-directory.patch lib_patch.Upstream
-package/openssh/S50sshd lib_sysv.EmptyLastLine lib_sysv.Indent lib_sysv.Variables
+package/openssh/S50sshd lib_sysv.Indent
 package/openswan/0001-lib-libopenswan-constants.c-workaround-missing-ns_t_.patch lib_patch.Upstream
 package/opentyrian/0001-Move-definitions-that-don-t-need-to-be-exposed-from-opl-h-to-opl-c.patch lib_patch.Upstream
 package/openvmtools/0001-no_cflags_werror.patch lib_patch.Upstream
diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
index 22da41d1ca..8f4fe10153 100644
--- a/package/openssh/S50sshd
+++ b/package/openssh/S50sshd
@@ -3,6 +3,9 @@
 # sshd        Starts sshd.
 #
 
+DAEMON="sshd"
+PIDFILE="/var/run/$DAEMON.pid"
+
 # Make sure the ssh-keygen progam exists
 [ -f /usr/bin/ssh-keygen ] || exit 0
 
@@ -12,17 +15,35 @@ start() {
 	# Create any missing keys
 	/usr/bin/ssh-keygen -A
 
-	printf "Starting sshd: "
-	/usr/sbin/sshd
-	touch /var/lock/sshd
-	echo "OK"
+	printf "Starting %s: " "$DAEMON"
+	start-stop-daemon -S -q -p "$PIDFILE" \
+		-x "/usr/sbin/$DAEMON"
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
 	printf "Stopping sshd: "
-	killall sshd
-	rm -f /var/lock/sshd
-	echo "OK"
+	start-stop-daemon -K -q -p "$PIDFILE" \
+		-x "/usr/sbin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	# sshd deletes its PID file on exit, wait for it to be gone
+	while [ -f "$PIDFILE" ]; do
+		sleep 0.1
+	done
+	return "$status"
 }
+
 restart() {
 	stop
 	start
@@ -44,4 +65,3 @@ case "$1" in
 esac
 
 exit $?
-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
