Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4079E6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0C0084582;
	Fri,  6 Sep 2024 20:00:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2XNMnXu-EqiK; Fri,  6 Sep 2024 20:00:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD9FA84589
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD9FA84589;
	Fri,  6 Sep 2024 20:00:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 154B31BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A315861108
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:58:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xq9rN5ohovVI for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 196ED6077D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 196ED6077D
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14F9686EE5; Fri,  6 Sep 2024 19:58:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 14:53:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fcfdfb276d1711577e8aca61a3f80d7439e2ae86
X-Git-Newrev: ef5947774f04dbdf8edffb88b8688917cd6b71b2
X-Patchwork-Hint: ignore
Message-Id: <20240906195854.14F9686EE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-engine: rewrite dockerd
 init script
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef5947774f04dbdf8edffb88b8688917cd6b71b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This brings the dockerd init script in line with the standard
Buildroot init script pattern.

Reload using SIGHUP is also supported now, note that the Docker
documentation cautions that not all parameters can be changed at
runtime (without a full restart).

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore              |  1 -
 package/docker-engine/S60dockerd | 88 +++++++++++++++++++++++++++-------------
 2 files changed, 59 insertions(+), 30 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 203cfb4a2c..3580d49430 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -439,7 +439,6 @@ package/dmalloc/0004-Makefile-use-the-configure-detected-or-user-supplied.patch
 package/dmalloc/0005-configure-use-LD-instead-of-hard-coding-ld.patch lib_patch.Upstream
 package/dmraid/0001-fix-compilation-under-musl.patch lib_patch.Upstream
 package/dmraid/S20dmraid lib_sysv.Variables
-package/docker-engine/S60dockerd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/docopt-cpp/0001-only-build-one-target-use-BUILD_SHARED_LIBS-where-appropriate.patch lib_patch.Upstream
 package/domoticz/S99domoticz Shellcheck
 package/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch lib_patch.Upstream
diff --git a/package/docker-engine/S60dockerd b/package/docker-engine/S60dockerd
index def8bea149..aab50d84d4 100644
--- a/package/docker-engine/S60dockerd
+++ b/package/docker-engine/S60dockerd
@@ -1,38 +1,68 @@
 #!/bin/sh
 
-NAME=dockerd
-DAEMON=/usr/bin/$NAME
-PIDFILE=/var/run/$NAME.pid
-DAEMON_ARGS=""
-
-[ -r /etc/default/$NAME ] && . /etc/default/$NAME $1
-
-do_start() {
-        echo -n "Starting $NAME: "
-        start-stop-daemon --start --quiet --background --make-pidfile \
-		--pidfile $PIDFILE --exec $DAEMON -- $DAEMON_ARGS \
-                && echo "OK" || echo "FAIL"
+DAEMON="dockerd"
+PIDFILE="/var/run/$DAEMON.pid"
+
+DOCKERD_ARGS=""
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need word splitting for DOCKERD_ARGS
+	start-stop-daemon --start --background --pidfile "$PIDFILE" \
+		--exec "/usr/bin/$DAEMON" \
+		-- --pidfile "$PIDFILE" $DOCKERD_ARGS
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
+	printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon --stop --pidfile "$PIDFILE" --exec "/usr/bin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+		return "$status"
+	fi
+	while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
+		--exec "/usr/bin/$DAEMON"; do
+		sleep 0.1
+	done
+	rm -f "$PIDFILE"
+	return "$status"
+}
+
+restart() {
+	stop
+	start
 }
 
-do_stop() {
-        echo -n "Stopping $NAME: "
-        start-stop-daemon --stop --quiet --pidfile $PIDFILE \
-                && echo "OK" || echo "FAIL"
+reload() {
+	printf "Reloading %s config: " "$DAEMON"
+	start-stop-daemon --stop --signal HUP -q --pidfile "$PIDFILE" \
+		--exec "/usr/bin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
 }
 
 case "$1" in
-        start)
-                do_start
-                ;;
-        stop)
-                do_stop
-                ;;
-        restart)
-                do_stop
-                sleep 1
-                do_start
-                ;;
+	start|stop|restart|reload)
+		"$1";;
 	*)
-                echo "Usage: $0 {start|stop|restart}"
-                exit 1
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
 esac
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
