Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21ECD2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89C85403DB;
	Tue, 13 Jan 2026 19:41:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UZQQ3m-oGqWA; Tue, 13 Jan 2026 19:41:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F9FD40674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333277;
	bh=EE4dlU4VnozQWvzb/r/T/gDUpcgnHhuWrOx/DtloUN0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Y2eaKAcRbsPAno6M1uCXqnoEVMTUxfcFoGRXlemP5JCEWMXgw1xRXG085ZF5KtPv8
	 o1ffqN3L73LqG+dewEmk7j2TbLv1k2gOPU8j0ObEQRJOKZLhGK6J3unIxwOvdp74OS
	 t1Fbvo4/0HN0Z8GB6RCQmihWbinkb+Nv+ozEsd9Qg6hNFCVyXHHzkQazVUjQvpsj0W
	 hi1HXwyATpznnoGS5tqdzvceOwPnd46qYC13D9vU8Rbrs17IBoag+i7XI5s/eU6EGx
	 xuA8B+FKkOy+8V4zmDOHFKPSB482pw9kZGtS/4DyAfNpSPawKz8rdhqZgPqv3bmRK2
	 06MWTkp0UuLig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F9FD40674;
	Tue, 13 Jan 2026 19:41:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0287B231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F25D830C0
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0YatxgV1AoJT for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A269582CA5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A269582CA5
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A06638256D; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:28:10 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: f6d2f863880793072fc05ded5f1a4425390da7c9
X-Git-Newrev: 198829dc2f71ebb315ee019155d68fbc40de696d
X-Patchwork-Hint: ignore
Message-Id: <20260113194033.A06638256D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/dbus: rewrite and
 rename SysV init script
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=198829dc2f71ebb315ee019155d68fbc40de696d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

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
(cherry picked from commit f51a4752801860fff5749b03d145b6d41e3283b6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore         |  1 -
 package/dbus/S30dbus        | 58 ------------------------------------
 package/dbus/S30dbus-daemon | 71 +++++++++++++++++++++++++++++++++++++++++++++
 package/dbus/dbus.mk        |  4 +--
 4 files changed, 73 insertions(+), 61 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index dea84e98ec..980a979f52 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -303,7 +303,6 @@ package/davfs2/0001-src-Makefile.am-do-not-hardcode-fstack-protector-str.patch l
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
