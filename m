Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36092D3A697
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 20:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DACB080B1C;
	Tue, 29 Oct 2024 20:23:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6NOEmgo9G8wN; Tue, 29 Oct 2024 20:23:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D394580B49
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D394580B49;
	Tue, 29 Oct 2024 20:23:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 650804EC0
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5287680B49
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:23:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gQc0J3bpQv6Q for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 20:23:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E03880B04
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E03880B04
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:23:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 57ACE828DA; Tue, 29 Oct 2024 20:23:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 29 Oct 2024 21:23:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55d48e866e471e0b704f3ae56300cca6e87d7559
X-Git-Newrev: 01177dcc8169d374325e23aa640a58b6efbde9a3
X-Patchwork-Hint: ignore
Message-Id: <20241029202350.57ACE828DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/chrony: rewrite start script
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

commit: https://git.buildroot.net/buildroot/commit/?id=01177dcc8169d374325e23aa640a58b6efbde9a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch brings package/chrony/S49chronyd in line with the start
script standards. Note that users will need to update the location of
any script config from /etc/default/chrony to /etc/default/chronyd.

One deviation from the standard remains (and thus the check-package
override): The PID file is placed in /var/run/chrony/$DAEMON.pid. This
is necessary because chronyd drops privileges, and would not be able
to delete the PID file from root-owned /var/run on shutdown.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore       |  2 +-
 package/chrony/S49chrony  | 26 -------------------
 package/chrony/S49chronyd | 65 +++++++++++++++++++++++++++++++++++++++++++++++
 package/chrony/chrony.mk  |  2 +-
 4 files changed, 67 insertions(+), 28 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index babcb813b4..efbb6c39ad 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -360,7 +360,7 @@ package/cfm/S65cfm lib_sysv.Indent lib_sysv.Variables
 package/cgroupfs-mount/S30cgroupfs Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/chipmunk/0001-Fix-build-failure-on-musl.patch lib_patch.Upstream
 package/chocolate-doom/0001-Remove-redundant-demoextend-definition.patch lib_patch.Upstream
-package/chrony/S49chrony Shellcheck lib_sysv.Indent lib_sysv.Variables
+package/chrony/S49chronyd lib_sysv.Variables
 package/cmake/0001-rename-cmake-rootfile.patch lib_patch.Upstream
 package/cmocka/0001-Don-t-redefine-uintptr_t.patch lib_patch.Upstream
 package/collectd/0001-src-netlink.c-remove-REG_NOERROR.patch lib_patch.Upstream
diff --git a/package/chrony/S49chrony b/package/chrony/S49chrony
deleted file mode 100644
index f75233fe5e..0000000000
--- a/package/chrony/S49chrony
+++ /dev/null
@@ -1,26 +0,0 @@
-#!/bin/sh
-#
-# Start chrony
-
-[ -r /etc/default/chrony ] && . /etc/default/chrony
-
-case "$1" in
-  start)
-	printf "Starting chrony: "
-	chronyd $CHRONY_ARGS && echo "OK" || echo "FAIL"
-	;;
-  stop)
-	printf "Stopping chrony: "
-	killall chronyd && echo "OK" || echo "FAIL"
-	;;
-  restart|reload)
-	"$0" stop
-	sleep 1
-	"$0" start
-	;;
-  *)
-	echo "Usage: $0 {start|stop|restart}"
-	exit 1
-esac
-
-exit $?
diff --git a/package/chrony/S49chronyd b/package/chrony/S49chronyd
new file mode 100644
index 0000000000..6c1525dd76
--- /dev/null
+++ b/package/chrony/S49chronyd
@@ -0,0 +1,65 @@
+#!/bin/sh
+#
+# Start chrony
+
+DAEMON="chronyd"
+# /var/run/chrony is owned by the chrony user, this allows chrony to
+# delete the PID file during shutdown, long after dropping privileges.
+PIDFILE="/var/run/chrony/$DAEMON.pid"
+CHRONY_ARGS=""
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf "Starting %s: " "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon --start --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON" \
+		-- $CHRONY_ARGS
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
+	printf "Stopping %s: " "$DAEMON"
+	start-stop-daemon --stop --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
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
+case "$1" in
+	start)
+		start
+		;;
+	stop)
+		stop
+		;;
+	restart)
+		restart
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		exit 1
+esac
+
+exit $?
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 11270206bd..bcf69a59db 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -79,7 +79,7 @@ define CHRONY_INSTALL_TARGET_CMDS
 endef
 
 define CHRONY_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 755 package/chrony/S49chrony $(TARGET_DIR)/etc/init.d/S49chrony
+	$(INSTALL) -D -m 755 package/chrony/S49chronyd $(TARGET_DIR)/etc/init.d/S49chronyd
 endef
 
 define CHRONY_INSTALL_INIT_SYSTEMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
