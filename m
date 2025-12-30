Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0248EE4992
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 17:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 766EF8183D;
	Tue, 30 Dec 2025 17:58:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pWZlWH3Ql5HQ; Tue, 30 Dec 2025 17:58:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 870E981A6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767117484;
	bh=cye5XQ1cVvztRbzgEdT1BnZ0SNLHdfKktftNCaSSqUc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KCL3dmsPQqydU8bzWnW0nxc7en1hnk9bD5R97iglsAUs04eEWDW6Vp6d93IV+G7X/
	 0UyOfc78e5lx+6LoFj/TppOe+3yjvpFFa+KX88DrkvOfWNR777x79xSH79J/juB2pq
	 HRAKHeO9rGPuD1bi4XB6SCc2+C16MDym95XzYGhJDDOWqbv8WAXToBApKfVKZIeyrZ
	 S6MgfL9WEem6+hoSLgRs/e+pWzE7da36LEufbMBkOoQhNJLJ9kK+hMzlXGZiB7/vBH
	 tOrvTdQQUsl6Hrvst02xMN6aP7kgtVr2hocIsxJKvpS8vSe5z4ZMIRRdFXDjjNnSeb
	 QJp9OXLcFy7Gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 870E981A6F;
	Tue, 30 Dec 2025 17:58:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BA5CE35B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6F934008D
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:58:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8e3d0FNrQayP for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 17:58:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 29C244005C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29C244005C
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29C244005C
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:57:59 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.107.189]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MGz1f-1vfsu629TP-00GuEU; Tue, 30
 Dec 2025 18:57:57 +0100
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>,
	Fiona Klute <fiona.klute@gmx.de>
Date: Tue, 30 Dec 2025 18:57:37 +0100
Message-ID: <20251230175738.267463-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251230175738.267463-1-fiona.klute@gmx.de>
References: <20251230175738.267463-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:QIj0iWfWpVRT3kM9Qr2onbLuAKcOlWygZS7y48Bt34g1QaxroWo
 jWhAZqybO3Xt778F68zjXyV3ceSma4/dviTUQyKbqhCYQtZK0/srdMnkj0MLQsVS69HOJjs
 Ew7SmtyXrPGGSw+qqVr5CbkKcc/TBRg9F9tlskYdLU0O9GoRfGB2/5alscgfpiI7cdxG5pL
 EHCaUdWYty3lzD36yXuVQ==
UI-OutboundReport: notjunk:1;M01:P0:2PcimF+RPiY=;mVzbzYoqqVSE5+/hbu5cbyTJY/i
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1767117477; x=1767722277; i=fiona.klute@gmx.de;
 bh=ZMfQEKacyyJwC9l/0uAieCBwGrn2QK2n6R4vb+bF69k=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=sbINzfAovbKALAkRejqElPA649avUfMKjOaMh0GAYsHyoOq+ew2eiEvDjhKeMA7d
 ICjDA2GVxSjGZwuAXnCuIDShuf1QU/z0ohgF4ePimql9vKFXmCOSf12Wm8BM8Pae1
 XrIvNpXp+ioxDTDwjXSx56mmYG3y+22aVmTmgmPgBOWlb0UZnLm6h0uhtOkXF9jQQ
 qXnPfl4zX8TiQT75kyKVnXSTa+GRapPRWQ1FaLpQXc/e8AajdZGifMooydk1ElXoX
 cQhmBoVuqt2WOMKnC5Mlq9IetU8RAw1vKOAG4lYTnPByqcSBCAYgCy5ZHMCgFGBON
 is1FSiU2zlj5rYh0cA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=sbINzfAo
Subject: [Buildroot] [PATCH 2/3] package/dbus: rewrite & rename SysV init
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This brings the script in line with current standards, except the
expected PIDFILE value because changing the PID file path would
require changing build options.

The stop action now uses the PID file instead of "killall", and reload
is supported using SIGHUP (with limitations described in D-Bus
documentation). "--syslog" is added to the dbus-daemon arguments to
ensure log messages will be available, otherwise log messages after
fork may be lost.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 .checkpackageignore         |  1 -
 package/dbus/S30dbus        | 58 ------------------------------
 package/dbus/S30dbus-daemon | 71 +++++++++++++++++++++++++++++++++++++
 package/dbus/dbus.mk        |  4 +--
 4 files changed, 73 insertions(+), 61 deletions(-)
 delete mode 100644 package/dbus/S30dbus
 create mode 100644 package/dbus/S30dbus-daemon

diff --git a/.checkpackageignore b/.checkpackageignore
index 3099dbc576..b6838c7c0d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -302,7 +302,6 @@ package/davfs2/0001-src-Makefile.am-do-not-hardcode-fstack-protector-str.patch l
 package/dbus-cpp/0001-gcc4.7.patch lib_patch.Upstream
 package/dbus-cpp/0002-cross-compile-tools.patch lib_patch.Upstream
 package/dbus-cpp/0003-src-pipe.c-fix-build-error-with-gcc-7.x.patch lib_patch.Upstream
-package/dbus/S30dbus Shellcheck lib_sysv.Indent lib_sysv.TrailingSpace lib_sysv.Variables
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
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
