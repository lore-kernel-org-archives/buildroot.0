Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDDA5C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 20:16:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AAE16103C
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 20:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5AAE16103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3840F81DCA;
	Wed, 27 Oct 2021 20:16:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aHvFv0DkUG16; Wed, 27 Oct 2021 20:16:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B53C81DA0;
	Wed, 27 Oct 2021 20:16:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF4031BF9C2
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 20:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF03C4058A
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 20:15:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id alwxhb8pDPCn for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 20:15:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAB4940586
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 20:15:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9B89088FEE; Wed, 27 Oct 2021 20:12:22 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Oct 2021 22:10:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9dc2de5511039f983c87598fb90b9df1a14cd89
X-Git-Newrev: e694cc0a25906a7ca40ab95fd862940930500699
X-Patchwork-Hint: ignore
Message-Id: <20211027201222.9B89088FEE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/watchdogd: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=e694cc0a25906a7ca40ab95fd862940930500699
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds support for watchdogd, a watchdog daemon with built-in
process supervisor[1] as well as support for monitoring memory & file
descriptor leaks, and CPU load average.  When a monitored resource
reaches a high watermark, a warning message is logged and when critical
level is reached, the cause is saved and the system is rebooted.  On
reboot the reset cause can be retrieved to help locate the culprit.

Support for SysV init script in this patch, and systemd unit file is
installed from the one bundled with the package.  Both files supoort
additional command line options in /etc/default/watchdogd.

The Config.in is slightly big, but allows for disabling or adjusting
the poll interval for each resource monitor.

For more information, see https://github.com/troglobit/watchdogd

[1]: processes must have their main loop instrumented for supervision.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/watchdogd/Config.in      | 58 ++++++++++++++++++++++++++++++++++++++++
 package/watchdogd/S01watchdogd   | 47 ++++++++++++++++++++++++++++++++
 package/watchdogd/watchdogd.hash |  5 ++++
 package/watchdogd/watchdogd.mk   | 55 +++++++++++++++++++++++++++++++++++++
 6 files changed, 167 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 82577d4a95..5869971058 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1342,6 +1342,7 @@ F:	package/mg/
 F:	package/netcalc/
 F:	package/ssdp-responder/
 F:	package/sysklogd/
+F:	package/watchdogd/
 
 N:	Joao Pinto <jpinto@synopsys.com>
 F:	board/synopsys/vdk/
diff --git a/package/Config.in b/package/Config.in
index 56276df55c..c153285bb1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2549,6 +2549,7 @@ menu "System tools"
 	source "package/unscd/Config.in"
 	source "package/util-linux/Config.in"
 	source "package/watchdog/Config.in"
+	source "package/watchdogd/Config.in"
 	source "package/xdg-dbus-proxy/Config.in"
 	source "package/xen/Config.in"
 	source "package/xvisor/Config.in"
diff --git a/package/watchdogd/Config.in b/package/watchdogd/Config.in
new file mode 100644
index 0000000000..ca5933848d
--- /dev/null
+++ b/package/watchdogd/Config.in
@@ -0,0 +1,58 @@
+config BR2_PACKAGE_WATCHDOGD
+	bool "watchdogd"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBCONFUSE
+	select BR2_PACKAGE_LIBITE
+	select BR2_PACKAGE_LIBUEV
+	help
+	  Extended version of uClinux-dist watchdogd.  Monitors loadavg,
+	  file descriptors and memory leaks, and capable of supervising
+	  your processes main loop using an instrumentation API.
+
+	  A reset reason is saved for power loss, CPU overload, or any
+	  of the monitored conditions (above).	The full capabilities
+	  are limited by the kernel watchdog driver, but even the basic
+	  "softdog" driver is supported.  See /etc/watchdogd.conf for
+	  details, and try watchdogctl for system status and available
+	  commands.
+
+	  https://github.com/troglobit/watchdogd/
+
+if BR2_PACKAGE_WATCHDOGD
+
+config BR2_PACKAGE_WATCHDOGD_TEST_SUITE
+	bool "Enable watchdogctl test cases"
+	help
+	  The watchdogctl program comes with a suite of tests built-in.
+	  They can be used to verify correct operation of watchdogd and
+	  the kernel watchdog driver.
+
+config BR2_PACKAGE_WATCHDOGD_GENERIC_POLL
+	int "Generic script monitor poll interval (sec)"
+	default "300"
+	help
+	  Poll interval for generic script monitor, in seconds.  A value
+	  of zero (0) disables the monitor.
+
+config BR2_PACKAGE_WATCHDOGD_LOADAVG_POLL
+	int "CPU load average monitor poll interval (sec)"
+	default "300"
+	help
+	  Poll interval for CPU load average monitor, in seconds.  A
+	  value of zero (0) disables the monitor.
+
+config BR2_PACKAGE_WATCHDOGD_FILENR_POLL
+	int "File descriptor leak monitor poll interval (sec)"
+	default "300"
+	help
+	  Poll interval for file descriptor leak monitor, in seconds.  A
+	  value of zero (0) disables the monitor.
+
+config BR2_PACKAGE_WATCHDOGD_MEMINFO_POLL
+	int "Memory leak monitor poll interval (sec)"
+	default "300"
+	help
+	  Poll interval for memory leak monitor, in seconds.  A value of
+	  zero (0) disables the monitor.
+
+endif
diff --git a/package/watchdogd/S01watchdogd b/package/watchdogd/S01watchdogd
new file mode 100755
index 0000000000..df57b8ad7a
--- /dev/null
+++ b/package/watchdogd/S01watchdogd
@@ -0,0 +1,47 @@
+#!/bin/sh
+
+DAEMON="watchdogd"
+PIDFILE="/var/run/$DAEMON.pid"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+cmd()
+{
+    start-stop-daemon -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" "$@"
+    status=$?
+    if [ $status -eq 0 ]; then
+	echo "OK"
+    else
+	echo "FAIL"
+    fi
+    return $status
+}
+
+case "$1" in
+    start)
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	cmd -S -- $SMCROUTED_ARGS
+	;;
+
+    stop)
+	printf 'Stopping %s: ' "$DAEMON"
+	cmd -K
+	;;
+
+    restart)
+	$0 stop
+	sleep 1
+	$0 start
+	;;
+
+    reload)
+	printf 'Reloading %s: ' "$DAEMON"
+	cmd -K -s HUP
+	;;
+
+    *)
+	echo "Usage: $0 {start|stop|restart|reload}"
+	exit 1
+esac
diff --git a/package/watchdogd/watchdogd.hash b/package/watchdogd/watchdogd.hash
new file mode 100644
index 0000000000..7c1acf0820
--- /dev/null
+++ b/package/watchdogd/watchdogd.hash
@@ -0,0 +1,5 @@
+# Upstream .sha256 from GitHub
+sha256 f36fdea9b323534a704c4c23d9af8050480bca4bdad89cdb50d26fcac316d172  watchdogd-3.4.tar.gz
+
+# Locally calculated
+sha256 fd685e20931174308c45a26418a7ce34d66704c4e4b92ab1d8299deb255cd676  LICENSE
diff --git a/package/watchdogd/watchdogd.mk b/package/watchdogd/watchdogd.mk
new file mode 100644
index 0000000000..34b17aa169
--- /dev/null
+++ b/package/watchdogd/watchdogd.mk
@@ -0,0 +1,55 @@
+################################################################################
+#
+# watchdogd
+#
+################################################################################
+
+WATCHDOGD_VERSION = 3.4
+WATCHDOGD_SITE = https://github.com/troglobit/watchdogd/releases/download/$(WATCHDOGD_VERSION)
+WATCHDOGD_LICENSE = ISC
+WATCHDOGD_LICENSE_FILES = LICENSE
+WATCHDOGD_CPE_ID_VENDOR = troglobit
+WATCHDOGD_DEPENDENCIES = host-pkgconf libconfuse libite libuev
+WATCHDOGD_CONF_OPTS = --disable-compat --disable-examples --disable-test-mode
+
+ifneq ($(BR2_PACKAGE_WATCHDOGD_TEST_SUITE),y)
+WATCHDOGD_CONF_OPTS += --disable-builtin-tests
+else
+WATCHDOGD_CONF_OPTS += --enable-builtin-tests
+endif
+
+ifeq ($(BR2_PACKAGE_WATCHDOGD_GENERIC_POLL),0)
+WATCHDOGD_CONF_OPTS += --without-generic
+else
+WATCHDOGD_CONF_OPTS += --with-generic=$(BR2_PACKAGE_WATCHDOGD_GENERIC_POLL)
+endif
+
+ifeq ($(BR2_PACKAGE_WATCHDOGD_LOADAVG_POLL),0)
+WATCHDOGD_CONF_OPTS += --without-loadavg
+else
+WATCHDOGD_CONF_OPTS += --with-loadavg=$(BR2_PACKAGE_WATCHDOGD_LOADAVG_POLL)
+endif
+
+ifeq ($(BR2_PACKAGE_WATCHDOGD_FILENR_POLL),0)
+WATCHDOGD_CONF_OPTS += --without-filenr
+else
+WATCHDOGD_CONF_OPTS += --with-filenr=$(BR2_PACKAGE_WATCHDOGD_FILENR_POLL)
+endif
+
+ifeq ($(BR2_PACKAGE_WATCHDOGD_MEMINFO_POLL),0)
+WATCHDOGD_CONF_OPTS += --without-meminfo
+else
+WATCHDOGD_CONF_OPTS += --with-meminfo=$(BR2_PACKAGE_WATCHDOGD_MEMINFO_POLL)
+endif
+
+define WATCHDOGD_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/watchdogd/S01watchdogd \
+		$(TARGET_DIR)/etc/init.d/S01watchdogd
+endef
+
+define WATCHDOGD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 $(WATCHDOGD_SRCDIR)/watchdogd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/watchdogd.service
+endef
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
