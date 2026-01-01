Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E40EED60A
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 13:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CBBD407E9;
	Thu,  1 Jan 2026 13:24:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HB7jIQgO88mK; Thu,  1 Jan 2026 13:24:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61B8F40762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767273884;
	bh=MQLZd8vUJxkrWwnAwrljxsjZQYgXIGlAccmn2UYN23c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UAuN3um6J/MeE4d/9Y01ksukeK0rzNIcdAQTHI1UAyrs+RRT/l4uM6Vd5XbRhRWUA
	 bdLRuZS0lKUEb1Y9D0qHpEXC+pBKRyQEJ8e9uDYG1+g4N63912hKXjQk0xzTUmv074
	 +EAfCNXLoxGABu783k1Arix+F192+uc2jirfXhmGajNhtvcn6/rYRB/Oj4GQilapLV
	 cm3v3KGazcA4UwxtLyT1QP59zWP+mmR0CxKNEBLpW4FbDtXKU84HvHo/QN6EFnbbEQ
	 1DbWrlk1HTIqIKbOiJnzKjniEoB+6PHaPIU5bLLny/H0t2Ds7w7T/THQSqm2NB1KVu
	 kWFYDdeiiC6yA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61B8F40762;
	Thu,  1 Jan 2026 13:24:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CB94F19D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 13:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4D0760725
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 13:24:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8PtBBNhPdudJ for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 13:24:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A31D60717
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A31D60717
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 13:24:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EDEEA87D8F; Thu,  1 Jan 2026 13:24:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 14:24:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3dd3944097ebf333d7b8c41a0c9eb46d98cdc6d2
X-Git-Newrev: f51a4752801860fff5749b03d145b6d41e3283b6
X-Patchwork-Hint: ignore
Message-Id: <20260101132440.EDEEA87D8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dbus: rewrite and rename SysV init
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

commit: https://git.buildroot.net/buildroot/commit/?id=f51a4752801860fff5749b03d145b6d41e3283b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This brings the script in line with current standards, except the
expected PIDFILE value because changing the PID file path would
require changing build options.

The stop action now uses the PID file instead of "killall", and reload
is supported using SIGHUP (with limitations described in D-Bus
documentation). "--syslog" is added to the dbus-daemon arguments to
ensure log messages will be available, otherwise log messages after
fork may be lost.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore         |  1 -
 package/dbus/S30dbus        | 58 ------------------------------------
 package/dbus/S30dbus-daemon | 71 +++++++++++++++++++++++++++++++++++++++++++++
 package/dbus/dbus.mk        |  4 +--
 4 files changed, 73 insertions(+), 61 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 9dddc1788e..56e5451f57 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -301,7 +301,6 @@ package/davfs2/0001-src-Makefile.am-do-not-hardcode-fstack-protector-str.patch l
 package/dbus-cpp/0001-gcc4.7.patch lib_patch.Upstream
 package/dbus-cpp/0002-cross-compile-tools.patch lib_patch.Upstream
 package/dbus-cpp/0003-src-pipe.c-fix-build-error-with-gcc-7.x.patch lib_patch.Upstream
-package/dbus/S30dbus Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/dc3dd/0001-no_man.patch lib_patch.Upstream
 package/dc3dd/0002-fix-autoreconf.patch lib_patch.Upstream
 package/dc3dd/0003-fix-for-glibc-2.28.patch lib_patch.Upstream
diff --git a/package/dbus/S30dbus b/package/dbus/S30dbus
deleted file mode 100644
index da02609f2d..0000000000
--- a/package/dbus/S30dbus
+++ /dev/null
@@ -1,58 +0,0 @@
-#!/bin/sh
-#
-# messagebus:   The D-BUS systemwide message bus
-#
-# chkconfig: 345 97 03
-# description:  This is a daemon which broadcasts notifications of system events \
-#               and other messages. See http://www.freedesktop.org/software/dbus/
-#
-# processname: dbus-daemon
-# pidfile: /run/messagebus.pid
-#
-
-# Create needed directories.
-[ -d /run/dbus ] || mkdir -p /run/dbus
-[ -d /tmp/dbus ] || mkdir -p /tmp/dbus
-
-RETVAL=0
-
-start() {
-    printf "Starting system message bus: "
-
-    dbus-uuidgen --ensure
-    dbus-daemon --system
-    RETVAL=$?
-    echo "done"
-}
-
-stop() {
-    printf "Stopping system message bus: "
-    killall dbus-daemon
-    RETVAL=$?
-    echo "done"
-    if [ $RETVAL -eq 0 ]; then
-        rm -f /run/messagebus.pid
-    fi
-}
-
-# See how we were called.
-case "$1" in
-    start)
-        start
-        ;;
-    stop)
-        stop
-        ;;
-    restart)
-        stop
-        start
-        ;;
-    reload)
-        echo "Message bus can't reload its configuration, you have to restart it"
-        RETVAL=$?
-        ;;
-    *)
-        echo "Usage: $0 {start|stop|restart|reload}"
-        ;;
-esac
-exit $RETVAL
diff --git a/package/dbus/S30dbus-daemon b/package/dbus/S30dbus-daemon
new file mode 100644
index 0000000000..3331b11ced
--- /dev/null
+++ b/package/dbus/S30dbus-daemon
@@ -0,0 +1,71 @@
+#!/bin/sh
+
+DAEMON="dbus-daemon"
+# check-package lib_sysv.Variables
+PIDFILE="/run/messagebus.pid"
+
+start() {
+	printf 'Starting system %s: ' "$DAEMON"
+	# Create needed directories
+	mkdir -p /run/dbus
+	mkdir -p /tmp/dbus
+	# Generate /var/lib/dbus/machine-id if needed
+	dbus-uuidgen --ensure
+
+	start-stop-daemon --start --pidfile "$PIDFILE" \
+		--exec "/usr/bin/$DAEMON" \
+		-- --system --syslog
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
+}
+
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+	start|stop|reload|restart)
+		"$1"
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+		;;
+esac
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 2002e707f0..061a341363 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -93,8 +93,8 @@ endef
 DBUS_POST_INSTALL_TARGET_HOOKS += DBUS_REMOVE_DEVFILES
 
 define DBUS_INSTALL_INIT_SYSV
-	$(INSTALL) -m 0755 -D package/dbus/S30dbus \
-		$(TARGET_DIR)/etc/init.d/S30dbus
+	$(INSTALL) -m 0755 -D package/dbus/S30dbus-daemon \
+		$(TARGET_DIR)/etc/init.d/S30dbus-daemon
 
 	mkdir -p $(TARGET_DIR)/var/lib
 	rm -rf $(TARGET_DIR)/var/lib/dbus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
