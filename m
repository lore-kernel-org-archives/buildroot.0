Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187E6C83F03
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 19:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1AF460B1C;
	Wed,  9 Jul 2025 19:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pOtNeI6ncp4S; Wed,  9 Jul 2025 19:07:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0147060AFB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0147060AFB;
	Wed,  9 Jul 2025 19:07:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 409E812E
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 19:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 278B181551
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 19:07:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PKC40doxQm94 for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 19:07:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50D4981170
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50D4981170
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 19:07:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4148E86313; Wed,  9 Jul 2025 19:07:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Jul 2025 21:04:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e0dcb7ba02ca1f1eea721b9b136cc987d113c403
X-Git-Newrev: de9d24bf2c3ccaa69707503ed1201a8b714da6c1
X-Patchwork-Hint: ignore
Message-Id: <20250709190702.4148E86313@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tpm2-abrmd: rewrite init script
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=de9d24bf2c3ccaa69707503ed1201a8b714da6c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This brings the init script in line with current standards, including
PID file management.

The chown & chmod commands in the check_device function will run only
for systems without udev, and the permissions have been adjusted to
those udev would set.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore              |  1 -
 package/tpm2-abrmd/S80tpm2-abrmd | 95 +++++++++++++++++++---------------------
 2 files changed, 45 insertions(+), 51 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 687814076e..a547816886 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1138,7 +1138,6 @@ package/tinycbor/0001-Makefile-add-DISABLE_WERROR.patch lib_patch.Upstream
 package/tinycompress/0001-wave-add-time.h-missing-header-inclusion.patch lib_patch.Upstream
 package/tinydtls/0001-sha2-sha2.c-fix-build-on-big-endian.patch lib_patch.Upstream
 package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch lib_patch.Upstream
-package/tpm2-abrmd/S80tpm2-abrmd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch lib_patch.Upstream
 package/transmission/S92transmission Shellcheck lib_sysv.ConsecutiveEmptyLines lib_sysv.Indent lib_sysv.Variables
 package/triggerhappy/S10triggerhappy Shellcheck lib_sysv.Indent lib_sysv.Variables
diff --git a/package/tpm2-abrmd/S80tpm2-abrmd b/package/tpm2-abrmd/S80tpm2-abrmd
index 6a0bef0a31..3917a698e8 100644
--- a/package/tpm2-abrmd/S80tpm2-abrmd
+++ b/package/tpm2-abrmd/S80tpm2-abrmd
@@ -1,74 +1,69 @@
 #!/bin/sh
 
-my_name="$0"
+DAEMON="tpm2-abrmd"
+PIDFILE="/var/run/$DAEMON.pid"
 
-check_required_files() {
-	[ -f "$1" ] || {
-		echo "$my_name: $1 is missing"
-		exit 1
-	}
-}
+TABRMD_ARGS="--tcti=device --logger=syslog --max-connections=20"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
 
 check_device() {
-	ls -1 /dev/tpm[0-9]* > /dev/null 2>&1 || {
-		echo "device driver not loaded, skipping."
+	if ! ls /dev/tpm[0-9]* > /dev/null 2>&1; then
+		echo "no TPM device found, skipping."
 		exit 0
-	}
-	chown tss:tss /dev/tpm[0-9]* && chmod 600 /dev/tpm*
-}
-
-rm_stale_pidfile() {
-	if [ -e "$1" ]; then
-		exe="/proc/$(cat "$1")/exe"
-		{ [ -s "$exe" ] && [ "$(readlink -f "$exe")" = "$2" ]; } || rm -f "$1"
+	fi
+	if [ ! -x /sbin/udevd ]; then
+		chown tss:tss /dev/tpm[0-9]* && chmod 660 /dev/tpm*
 	fi
 }
 
 start() {
-	printf "Starting tpm2-abrmd: "
+	printf 'Starting %s: ' "$DAEMON"
 	check_device
-	rm_stale_pidfile /var/run/tpm2-abrmd.pid /usr/sbin/tpm2-abrmd
-	start-stop-daemon -S -q -o -b -m -p /var/run/tpm2-abrmd.pid -c tss:tss -x /usr/sbin/tpm2-abrmd -- ${DAEMON_OPTS} || {
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon --start --background --chuid tss:tss --make-pidfile \
+		--pidfile "$PIDFILE" --exec "/usr/sbin/$DAEMON" \
+		-- ${TABRMD_ARGS}
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
 		echo "FAIL"
-		exit 1
-	}
-	pidof /usr/sbin/tpm2-abrmd > /var/run/tpm2-abrmd.pid
-	echo "OK"
+	fi
+	return "$status"
 }
 
 stop() {
-	printf "Stopping tpm2-abrmd: "
-	start-stop-daemon -K -q -o -p /var/run/tpm2-abrmd.pid -u tss -x /usr/sbin/tpm2-abrmd || {
+	printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon --stop --pidfile "$PIDFILE" --exec "/usr/sbin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
 		echo "FAIL"
-		exit 1
-	}
-	rm_stale_pidfile /var/run/tpm2-abrmd.pid /usr/sbin/tpm2-abrmd
-	echo "OK"
+		return "$status"
+	fi
+	while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON"; do
+		sleep 0.1
+	done
+	rm -f "$PIDFILE"
+	return "$status"
 }
 
-check_required_files /etc/dbus-1/system.d/tpm2-abrmd.conf
-
-# defaults
-DAEMON_OPTS="--tcti=device --logger=syslog --max-connections=20"
-
-# Read configuration variable file if it is present
-[ -r /etc/default/tpm2-abrmd ] && . /etc/default/tpm2-abrmd
+restart() {
+	stop
+	start
+}
 
 case "$1" in
-	start)
-		start
-	       	;;
-	stop)
-	   	stop
-		;;
-	restart|reload)
-		stop
-		sleep 1
-		start
-		;;
+	start|stop|restart)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart;;
 	*)
 		echo "Usage: tpm2-abrmd {start|stop|restart|reload}" >&2
 		exit 1
 esac
-
-exit 0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
