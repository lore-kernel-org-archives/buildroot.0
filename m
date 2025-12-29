Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A12E92734
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 16:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03FE1816A2;
	Mon, 29 Dec 2025 16:32:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jc7iSmEUCSfR; Mon, 29 Dec 2025 16:32:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1179E816D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767025936;
	bh=ofCxlqGjbDQ840X0RXl6P4K2+NhwNpwC7a73/A+Plv4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Gh0G+rBZw9PCjlbS+MJQa1FyY4TBw9K8MUD2vABZR5beE0YVfIOyN/6MTZgB6ZCvE
	 7G8zkSiwmUdLo6mEGmKQFkUULlvIMaUhENpGjWKovhGb/mSZqFCFuRPkGBfG3f2tQt
	 lLFzjf8QRhbc6D8q2wb1R8hVBktbMwP0MGTbso66sTfZlOpqdQqorS174iyuBIQ1G9
	 o1b4/sPkOBnPq7T5sl+gcM/9294u3wWUMSHX+sPlCC6adZkLmOAdqXX34iT2yy6Rb9
	 beGaSE8cAM2Z42oKir/j75LVq7lk7jKhDrasJFPoybIma4Yq5lGxYFaBdKkDwNuZY4
	 jQ5JiQ+AvENkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1179E816D9;
	Mon, 29 Dec 2025 16:32:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C3FE1E1
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 16:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52F22608AC
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 16:32:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bbC6Ttl3K9QX for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 16:32:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5ABD560854
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5ABD560854
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 16:32:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 53B34813F1; Mon, 29 Dec 2025 16:32:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 17:31:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bfca06b350fa3c0a48af38f89ccfc04c70c3f946
X-Git-Newrev: 6d2dbb4684941ea35fbee5be5eaa5333f00e9b16
X-Patchwork-Hint: ignore
Message-Id: <20251229163213.53B34813F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libiio: refactor iiod init script
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

commit: https://git.buildroot.net/buildroot/commit/?id=6d2dbb4684941ea35fbee5be5eaa5333f00e9b16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Fix check-package issues and remove .checkpackageignore entry

* Remove fixed wait in "restart", wait for process termination in
  "stop" instead

* Print standard starting/stopping messages

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore    |  1 -
 package/libiio/S99iiod | 62 +++++++++++++++++++++++++++++++++++---------------
 2 files changed, 44 insertions(+), 19 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 9674128894..3e274f391f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -551,7 +551,6 @@ package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch l
 package/libgsm/0001-Misc-fixes-from-Archlinux.patch lib_patch.Upstream
 package/libgtk3/0001-Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch lib_patch.Upstream
 package/libhdhomerun/0001-dont-strip.patch lib_patch.Upstream
-package/libiio/S99iiod Shellcheck lib_sysv.Variables
 package/libiqrf/0001-cmake-handle-static-library-and-find-required-thread.patch lib_patch.Upstream
 package/libiqrf/0002-use-only-c-language.patch lib_patch.Upstream
 package/libjson/0001-fix-broken-makefile.patch lib_patch.Upstream
diff --git a/package/libiio/S99iiod b/package/libiio/S99iiod
index df2f763461..b1d56a73fa 100644
--- a/package/libiio/S99iiod
+++ b/package/libiio/S99iiod
@@ -1,29 +1,55 @@
 #!/bin/sh
 
+DAEMON="iiod"
+PIDFILE="/var/run/$DAEMON.pid"
+
 # Server-side demuxing by default
-IIOD_OPTS=-D
+IIOD_OPTS="-D"
 
-[ -r /etc/default/iiod ] && . /etc/default/iiod
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
 
-case "$1" in
-	start)
-		echo "Starting IIO Server Daemon"
-		start-stop-daemon -S -b -q -m -p /var/run/iiod.pid -x /usr/sbin/iiod -- $IIOD_OPTS
-		exit $?
-		;;
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon --start --background --make-pidfile \
+		--pidfile "$PIDFILE" --exec "/usr/sbin/$DAEMON" \
+		-- $IIOD_OPTS
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
 
-	stop)
-		echo "Stopping IIO Server Daemon"
-		start-stop-daemon -K -q -p /var/run/iiod.pid 2>/dev/null
-		exit $?
-		;;
+stop() {
+	printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon --stop --pidfile "$PIDFILE" --exec "/usr/sbin/$DAEMON"
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
 
-	restart)
-		$0 stop
-		sleep 1
-		$0 start
-		;;
+restart() {
+	stop
+	start
+}
 
+case "$1" in
+	start|stop|restart)
+		"$1";;
 	*)
 		echo "Usage: $0 {start|stop|restart}"
 		exit 1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
