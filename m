Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1BAC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 18:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10F9881CA3;
	Sun,  5 Nov 2023 18:32:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10F9881CA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WZJf5s3T7-Y0; Sun,  5 Nov 2023 18:32:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDA6581CE9;
	Sun,  5 Nov 2023 18:32:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDA6581CE9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 272E21BF4D6
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 18:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 005C761013
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 18:31:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 005C761013
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WbCKI4PAsKCI for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 18:31:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D60961010
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 18:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D60961010
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 32102867F4; Sun,  5 Nov 2023 18:31:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Nov 2023 19:04:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1af0d4cb288b36548895967f0cf553d6f393d495
X-Git-Newrev: f7c2b6fefdc63329646e50432ddf8bff5a32173a
X-Patchwork-Hint: ignore
Message-Id: <20231105183144.32102867F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/petitboot: run petitboot UI on
 consoles
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f7c2b6fefdc63329646e50432ddf8bff5a32173a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Display the petitboot UI instead of a login prompt, allowing the
configuration of custom tty(s) as we do for the login prompt.

petitboot already depends on udev, so let's use it instead of rcS to
launch pb-console. This has the advantage of easily wildcarding the list
of ttys ("hvc*") and enables hotplug devices ("ttyUSB0").

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/petitboot/Config.in    |  8 ++++++++
 package/petitboot/pb-console   | 36 ++++++++++++++++++++++++++++++++++++
 package/petitboot/petitboot.mk | 10 ++++++++++
 system/Config.in               |  2 +-
 4 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/package/petitboot/Config.in b/package/petitboot/Config.in
index b81ab6310d..93ed3642c3 100644
--- a/package/petitboot/Config.in
+++ b/package/petitboot/Config.in
@@ -25,3 +25,11 @@ comment "petitboot needs a toolchain w/ wchar, dynamic library, threads, udev /d
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_PACKAGE_HAS_UDEV
+
+config BR2_PACKAGE_PETITBOOT_GETTY_PORT
+	string "TTY port(s)"
+	default "console"
+	depends on BR2_PACKAGE_PETITBOOT
+	help
+	  Specify a space-separated list of ports to run the petitboot
+	  UI on. Wildcards are allowed. Example: "hvc* ttys0 ttyS*"
diff --git a/package/petitboot/pb-console b/package/petitboot/pb-console
new file mode 100644
index 0000000000..407ff3b302
--- /dev/null
+++ b/package/petitboot/pb-console
@@ -0,0 +1,36 @@
+#!/bin/sh
+
+DAEMON="pb-console"
+
+PB_CONSOLE_PORT=${2:-"console"}
+PB_CONSOLE_ARGS="--getty --detach -- -n -i 0 $PB_CONSOLE_PORT linux"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/petitboot" ] && . "/etc/default/petitboot"
+
+start() {
+	printf 'Starting %s on %s: ' "$DAEMON" "$PB_CONSOLE_PORT"
+	mkdir -p /var/log/petitboot
+
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -x "/usr/libexec/petitboot/$DAEMON" \
+		-- $PB_CONSOLE_ARGS
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
+		"$1";;
+	stop|restart|reload)
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload} [port]"
+		exit 1
+		;;
+esac
diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
index 0992111cb1..c4eb20b44d 100644
--- a/package/petitboot/petitboot.mk
+++ b/package/petitboot/petitboot.mk
@@ -46,6 +46,8 @@ else
 PETITBOOT_CONF_OPTS += --without-fdt
 endif
 
+PETITBOOT_GETTY_PORT = $(patsubst %,'%',$(call qstrip,$(BR2_PACKAGE_PETITBOOT_GETTY_PORT)))
+
 define PETITBOOT_POST_INSTALL
 	$(INSTALL) -D -m 0755 $(@D)/utils/bb-kexec-reboot \
 		$(TARGET_DIR)/usr/libexec/petitboot/bb-kexec-reboot
@@ -55,6 +57,14 @@ define PETITBOOT_POST_INSTALL
 		$(TARGET_DIR)/etc/petitboot/boot.d/90-sort-dtb
 	$(INSTALL) -m 0755 -D $(PETITBOOT_PKGDIR)/S15pb-discover \
 		$(TARGET_DIR)/etc/init.d/S15pb-discover
+	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/pb-console \
+		$(TARGET_DIR)/etc/init.d/pb-console
+
+	mkdir -p $(TARGET_DIR)/etc/udev/rules.d
+	(for port in $(PETITBOOT_GETTY_PORT); do \
+		printf 'SUBSYSTEM=="tty", KERNEL=="%s", RUN+="/etc/init.d/pb-console start $$name"\n' "$$port"; \
+	done) > $(TARGET_DIR)/etc/udev/rules.d/petitboot-console-ui.rules
+
 	mkdir -p $(TARGET_DIR)/usr/share/udhcpc/default.script.d/
 	ln -sf /usr/sbin/pb-udhcpc \
 		$(TARGET_DIR)/usr/share/udhcpc/default.script.d/
diff --git a/system/Config.in b/system/Config.in
index 25485c2486..0b4dc9543e 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -403,7 +403,7 @@ config BR2_SYSTEM_BIN_SH
 
 menuconfig BR2_TARGET_GENERIC_GETTY
 	bool "Run a getty (login prompt) after boot"
-	default y
+	default y if !BR2_PACKAGE_PETITBOOT
 
 if BR2_TARGET_GENERIC_GETTY
 config BR2_TARGET_GENERIC_GETTY_PORT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
