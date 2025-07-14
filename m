Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4217BC83F2A
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 10:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1615681E1C;
	Mon, 14 Jul 2025 10:09:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A7CLJXN4Pz5d; Mon, 14 Jul 2025 10:09:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AE5081DA0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AE5081DA0;
	Mon, 14 Jul 2025 10:09:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 53C27967
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 10:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39AAD81D70
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 10:09:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pYFR7es1KpNs for <buildroot@buildroot.org>;
 Mon, 14 Jul 2025 10:09:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D89B81DA3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D89B81DA3
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 10:09:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F188C86504; Mon, 14 Jul 2025 10:09:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 14 Jul 2025 11:48:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: abdc96eaf86b9691e37b2187e7b34a0c5c364952
X-Git-Newrev: 41258a81948fddfa7fc8ac06b69d77fa051b744d
X-Patchwork-Hint: ignore
Message-Id: <20250714100926.F188C86504@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/eudev: refactor init script and
 rename it to S10udevd
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

commit: https://git.buildroot.net/buildroot/commit/?id=41258a81948fddfa7fc8ac06b69d77fa051b744d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This brings the script in line with current init script standards, and
fixes all make check-package warnings. Other notable changes:

* Use start-stop-daemon to create a PID file, so we can monitor shutdown.

* Use "udevadm control --exit" to implement stop, instead of "killall".

* Do not require /etc/udev/udev.conf to exist, the default contains
  only comments and udevd works without.

* Do not parse /etc/udev/udev.conf, the udev_root configuration option
  it was used for has been removed in version 1.5.1 [1].

* Implement reload using udevadm.

[1] https://github.com/eudev-project/eudev/commit/6ada823a9a0979ea145fd70add1007c21caa45c0

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore    |  1 -
 package/eudev/S10udev  | 54 ----------------------------
 package/eudev/S10udevd | 96 ++++++++++++++++++++++++++++++++++++++++++++++++++
 package/eudev/eudev.mk |  4 +--
 4 files changed, 98 insertions(+), 57 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index a547816886..b0c103ee4b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -426,7 +426,6 @@ package/elfutils/0002-Really-make-Werror-conditional-to-BUILD_WERROR.patch lib_p
 package/erlang-rebar/0001-src-rebar_port_compiler-add-fPIC-to-LDFLAGS-by-defau.patch lib_patch.Upstream
 package/espeak/0001-Fix-build-of-shared-library-on-architectures-needing.patch lib_patch.Upstream
 package/espeak/0002-tr_languages-cast-string_ordinal-init-values.patch lib_patch.Upstream
-package/eudev/S10udev Shellcheck lib_sysv.ConsecutiveEmptyLines lib_sysv.Indent lib_sysv.Variables
 package/evemu/0001-Include-limits.h-for-PATH_MAX.patch lib_patch.Upstream
 package/evemu/0002-evemu-Update-struct-input_event.patch lib_patch.Upstream
 package/evemu/0003-src-evemu.c-fix-build-with-kernels-4.16.patch lib_patch.Upstream
diff --git a/package/eudev/S10udev b/package/eudev/S10udev
deleted file mode 100644
index 6f20fc51f5..0000000000
--- a/package/eudev/S10udev
+++ /dev/null
@@ -1,54 +0,0 @@
-#!/bin/sh
-#
-# udev	This is a minimal non-LSB version of a UDEV startup script.  It
-#	was derived by stripping down the udev-058 LSB version for use
-#	with buildroot on embedded hardware using Linux 2.6.34+ kernels.
-#
-#	You may need to customize this for your system's resource limits
-#	(including startup time!) and administration.  For example, if
-#	your early userspace has a custom initramfs or initrd you might
-#	need /dev much earlier; or without hotpluggable busses (like USB,
-#	PCMCIA, MMC/SD, and so on) your /dev might be static after boot.
-#
-#	This script assumes your system boots right into the eventual root
-#	filesystem, and that init runs this udev script before any programs
-#	needing more device nodes than the bare-bones set -- /dev/console,
-#	/dev/zero, /dev/null -- that's needed to boot and run this script.
-#
-
-DAEMON="udevd"
-
-SETTLE_TIMEOUT=30
-UDEVD_ARGS="-d"
-
-# shellcheck source=/dev/null
-[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
-
-# Check for config file and read it
-UDEV_CONFIG=/etc/udev/udev.conf
-test -r $UDEV_CONFIG || exit 6
-. $UDEV_CONFIG
-
-case "$1" in
-    start)
-        printf "Populating %s using udev: " "${udev_root:-/dev}"
-        [ -e /proc/sys/kernel/hotplug ] && printf '\000\000\000\000' > /proc/sys/kernel/hotplug
-        /sbin/udevd $UDEVD_ARGS || { echo "FAIL"; exit 1; }
-        udevadm trigger --type=subsystems --action=add
-        udevadm trigger --type=devices --action=add
-        udevadm settle --timeout=$SETTLE_TIMEOUT || echo "udevadm settle failed"
-        echo "done"
-        ;;
-    stop)
-        # Stop execution of events
-        udevadm control --stop-exec-queue
-        killall udevd
-        ;;
-    *)
-        echo "Usage: $0 {start|stop}"
-        exit 1
-        ;;
-esac
-
-
-exit 0
diff --git a/package/eudev/S10udevd b/package/eudev/S10udevd
new file mode 100644
index 0000000000..8bb8f6eb3a
--- /dev/null
+++ b/package/eudev/S10udevd
@@ -0,0 +1,96 @@
+#!/bin/sh
+#
+# udev	This is a minimal non-LSB version of a UDEV startup script.  It
+#	was derived by stripping down the udev-058 LSB version for use
+#	with buildroot on embedded hardware using Linux 2.6.34+ kernels.
+#
+#	You may need to customize this for your system's resource limits
+#	(including startup time!) and administration.  For example, if
+#	your early userspace has a custom initramfs or initrd you might
+#	need /dev much earlier; or without hotpluggable busses (like USB,
+#	PCMCIA, MMC/SD, and so on) your /dev might be static after boot.
+#
+#	This script assumes your system boots right into the eventual root
+#	filesystem, and that init runs this udev script before any programs
+#	needing more device nodes than the bare-bones set -- /dev/console,
+#	/dev/zero, /dev/null -- that's needed to boot and run this script.
+#
+
+DAEMON="udevd"
+PIDFILE="/var/run/$DAEMON.pid"
+
+SETTLE_TIMEOUT=30
+UDEVD_ARGS=""
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf "Starting %s: " "$DAEMON"
+	[ -e /proc/sys/kernel/hotplug ] && printf '\000\000\000\000' > /proc/sys/kernel/hotplug
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon --start --background --make-pidfile \
+		--pidfile "$PIDFILE" --exec "/sbin/$DAEMON" \
+		-- $UDEVD_ARGS
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	udevadm trigger --type=subsystems --action=add
+	udevadm trigger --type=devices --action=add
+	udevadm settle --timeout=$SETTLE_TIMEOUT || echo "udevadm settle failed"
+	return "$status"
+}
+
+stop() {
+	printf "Stopping %s: " "$DAEMON"
+	udevadm control --exit
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+		return "$status"
+	fi
+	while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
+		--exec "/sbin/$DAEMON"; do
+		sleep 0.1
+	done
+	rm -f "$PIDFILE"
+	return "$status"
+}
+
+restart() {
+	stop
+	start
+}
+
+reload() {
+	printf "Reloading %s config: " "$DAEMON"
+	udevadm control --reload
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+case "$1" in
+	start)
+		start;;
+	stop)
+		stop;;
+	restart)
+		restart;;
+	reload)
+		reload;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
+
+exit $?
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index e9884f52d5..1a56cfd2f0 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -52,10 +52,10 @@ EUDEV_CONF_OPTS += --disable-selinux
 endif
 
 define EUDEV_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 package/eudev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
+	$(INSTALL) -D -m 0755 package/eudev/S10udevd $(TARGET_DIR)/etc/init.d/S10udevd
 endef
 
-# Avoid installing S10udev with openrc, as the service is started by a unit
+# Avoid installing S10udevd with openrc, as the service is started by a unit
 # from the udev-gentoo-scripts package.
 define EUDEV_INSTALL_INIT_OPENRC
 	@:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
