Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1790C3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 20:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C8C260B61;
	Sun, 18 May 2025 20:47:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sWURwACmxZkr; Sun, 18 May 2025 20:47:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 752E660C17
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 752E660C17;
	Sun, 18 May 2025 20:47:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CA681BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 20:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E027401DD
 for <buildroot@buildroot.org>; Sun, 18 May 2025 20:47:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iFhlq8b3c_Uq for <buildroot@buildroot.org>;
 Sun, 18 May 2025 20:47:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6C6A410F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6C6A410F1
 for <buildroot@buildroot.org>; Sun, 18 May 2025 20:47:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B07298725C; Sun, 18 May 2025 20:47:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 22:42:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: faf2b8a6277c1a10ca08e5ad8ecb488d70a03de4
X-Git-Newrev: c09ee07b2c3b3167774c1d20c4685a7366b140cf
X-Patchwork-Hint: ignore
Message-Id: <20250518204755.B07298725C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hwclock-initscript: new package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c09ee07b2c3b3167774c1d20c4685a7366b140cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a new initscript to save the date and time to the hardware clock
on shutdown.

Signed-off-by: Michael Walle <michael@walle.cc>
[Arnout:
 - package as hwclock-initscript instead of buildroot-initscripts;
 - mention in help text that it isn't needed at boot;
 - rewrite initscript according to our usual pattern;
 - fix shellcheck errors.
]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/Config.in                                |  1 +
 package/hwclock-initscript/Config.in             | 10 ++++++
 package/hwclock-initscript/S20hwclock            | 39 ++++++++++++++++++++++++
 package/hwclock-initscript/hwclock-initscript.mk | 12 ++++++++
 4 files changed, 62 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index ffaed13c74..579b5ffc87 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2866,6 +2866,7 @@ menu "System tools"
 	source "package/getent/Config.in"
 	source "package/gkrellm/Config.in"
 	source "package/htop/Config.in"
+	source "package/hwclock-initscript/Config.in"
 	source "package/ibm-sw-tpm2/Config.in"
 	source "package/initscripts/Config.in"
 	source "package/iotop/Config.in"
diff --git a/package/hwclock-initscript/Config.in b/package/hwclock-initscript/Config.in
new file mode 100644
index 0000000000..a660a26eaa
--- /dev/null
+++ b/package/hwclock-initscript/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_HWCLOCK_INITSCRIPT
+	bool "hwclock-initscript"
+	depends on !BR2_PACKAGE_SYSTEMD
+	depends on BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_UTIL_LINUX_HWCLOCK
+	help
+	  Initscript to save the date and time to the hardware clock on
+	  shutdown.
+
+	  Note that the kernel already loads the time from the hwclock
+	  at boot time, no init script is needed for that.
diff --git a/package/hwclock-initscript/S20hwclock b/package/hwclock-initscript/S20hwclock
new file mode 100644
index 0000000000..c9f55cff1c
--- /dev/null
+++ b/package/hwclock-initscript/S20hwclock
@@ -0,0 +1,39 @@
+#! /bin/sh
+#
+# hwclock      This writes the system time to the RTC on shutdown
+#
+
+RTC_DEVICE=rtc0
+DAEMON=hwclock
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+# Quietly do nothing if /dev/rtc0 does not exist
+[ -c /dev/$RTC_DEVICE ] || exit 0
+
+start(){
+	: # Nothing to do on startup
+}
+
+stop(){
+	printf "Saving the system clock to /dev/%s\n" "${RTC_DEVICE}"
+	/sbin/$DAEMON -f "/dev/${RTC_DEVICE}" -w
+}
+
+case "$1" in
+	start)
+		start
+		;;
+	stop)
+		stop
+		;;
+	restart|reload)
+		stop
+		start
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+		;;
+esac
diff --git a/package/hwclock-initscript/hwclock-initscript.mk b/package/hwclock-initscript/hwclock-initscript.mk
new file mode 100644
index 0000000000..a5d42ef55f
--- /dev/null
+++ b/package/hwclock-initscript/hwclock-initscript.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# hwclock-initscript
+#
+################################################################################
+
+define HWCLOCK_INITSCRIPT_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 $(HWCLOCK_INITSCRIPT_PKGDIR)/S20hwclock \
+		$(TARGET_DIR)/etc/init.d/S20hwclock
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
