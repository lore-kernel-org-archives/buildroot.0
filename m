Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963BCC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 22:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3932A41A3F;
	Fri, 12 Jul 2024 22:00:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ppa_Pew__wwK; Fri, 12 Jul 2024 22:00:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91B9941D70
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91B9941D70;
	Fri, 12 Jul 2024 22:00:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D41AB1BF3C4
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD26D82131
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:00:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qskknt91kqVj for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 22:00:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E620782144
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E620782144
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 22:00:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D265E84729; Fri, 12 Jul 2024 22:00:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 23:59:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5ba2db4011cd577732e26b5c081e57a26d8910f
X-Git-Newrev: eee0a2f226bc3c763f845c2f8caae2b06999460b
X-Patchwork-Hint: ignore
Message-Id: <20240712220004.D265E84729@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/petitboot: run UI as non-root user
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

commit: https://git.buildroot.net/buildroot/commit/?id=eee0a2f226bc3c763f845c2f8caae2b06999460b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Though the petitboot UI is a user application, it is currently being
run by root only because we use getty to display it on the console.

Create an unprivileged user to run the UI instead. The unix socket the
pb-discover daemon sets up is accessible to "petitgroup", so that should
be the gid, with arbitrary uid "petituser" to match.

This is currently the chain of processes leading to the UI:

1. /etc/init.d/pb-console start console
2. /usr/libexec/petitboot/pb-console --getty --detach -- -n -i 0 console linux
3. /sbin/getty -l/usr/libexec/petitboot/pb-console -n -i 0 console linux
4. /usr/libexec/petitboot/pb-console
5. /usr/sbin/petitboot-nc

Instead of (3) running the pb-console helper directly with "getty -l",
we can use "agetty -a" to autologin petituser, and run pb-console via
petituser's login shell:

1. /etc/init.d/pb-console start console
2. /usr/libexec/petitboot/pb-console --getty=/sbin/agetty --detach -- -a petituser -n -i console linux
3. /sbin/agetty -a petituser -n -i console linux
4. /home/petituser/.profile
5. /usr/libexec/petitboot/pb-console
6. /usr/sbin/petiboot-nc

Here, everything from (4) down is running as petituser. In (4), use
$PPID to determine if we're logging in via getty, so that logging in by
other means will give a normal shell. Otherwise we would recurse when
trying to get a shell from the menu.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
[Arnout: explicitly select util-linux, even though it comes indirectly
through other dependencies]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/petitboot/Config.in      | 4 +++-
 package/petitboot/S15pb-discover | 4 +++-
 package/petitboot/pb-console     | 6 ++++--
 package/petitboot/petitboot.mk   | 6 ++++++
 package/petitboot/shell_profile  | 3 +++
 5 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/package/petitboot/Config.in b/package/petitboot/Config.in
index 66836f31ac..50d5a4da70 100644
--- a/package/petitboot/Config.in
+++ b/package/petitboot/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PETITBOOT
 	bool "petitboot"
 	depends on BR2_PACKAGE_KEXEC_ARCH_SUPPORTS || BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS
-	depends on BR2_USE_MMU # lvm2
+	depends on BR2_USE_MMU # lvm2, agetty
 	depends on BR2_USE_WCHAR # elfutils, kexec-lite
 	depends on !BR2_STATIC_LIBS # elfutils, kexec-lite, lvm2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils, kexec-lite, lvm2
@@ -17,6 +17,8 @@ config BR2_PACKAGE_PETITBOOT
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_NVME if ( BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le )
 	select BR2_PACKAGE_POWERPC_UTILS if ( BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le )
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_AGETTY
 	help
 	  Petitboot is a small kexec-based bootloader
 
diff --git a/package/petitboot/S15pb-discover b/package/petitboot/S15pb-discover
index 71ab62d998..9e8f6c87f8 100644
--- a/package/petitboot/S15pb-discover
+++ b/package/petitboot/S15pb-discover
@@ -12,7 +12,9 @@ fi
 
 start() {
 	printf 'Starting %s: ' "$DAEMON"
-	mkdir -p /var/log/petitboot
+	# shellcheck disable=SC2174 # only apply -m to deepest dir
+	mkdir -p -m 0775 /var/log/petitboot
+	chown petituser:petitgroup /var/log/petitboot
 
 	# shellcheck disable=SC2086 # we need the word splitting
 	start-stop-daemon -S -q -b -m -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
diff --git a/package/petitboot/pb-console b/package/petitboot/pb-console
index 407ff3b302..8b23b2233d 100644
--- a/package/petitboot/pb-console
+++ b/package/petitboot/pb-console
@@ -3,14 +3,16 @@
 DAEMON="pb-console"
 
 PB_CONSOLE_PORT=${2:-"console"}
-PB_CONSOLE_ARGS="--getty --detach -- -n -i 0 $PB_CONSOLE_PORT linux"
+PB_CONSOLE_ARGS="--getty=/sbin/agetty --detach -- -a petituser -n -i $PB_CONSOLE_PORT linux"
 
 # shellcheck source=/dev/null
 [ -r "/etc/default/petitboot" ] && . "/etc/default/petitboot"
 
 start() {
 	printf 'Starting %s on %s: ' "$DAEMON" "$PB_CONSOLE_PORT"
-	mkdir -p /var/log/petitboot
+	# shellcheck disable=SC2174 # only apply -m to deepest dir
+	mkdir -p -m 0775 /var/log/petitboot
+	chown petituser:petitgroup /var/log/petitboot
 
 	# shellcheck disable=SC2086 # we need the word splitting
 	start-stop-daemon -S -q -x "/usr/libexec/petitboot/$DAEMON" \
diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
index 6f7789b185..a6588a68e9 100644
--- a/package/petitboot/petitboot.mk
+++ b/package/petitboot/petitboot.mk
@@ -97,6 +97,8 @@ define PETITBOOT_POST_INSTALL
 		$(TARGET_DIR)/etc/init.d/pb-console
 	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/pb-shell \
 		$(TARGET_DIR)/usr/libexec/petitboot/pb-shell
+	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/shell_profile \
+		$(TARGET_DIR)/home/petituser/.profile
 
 	mkdir -p $(TARGET_DIR)/etc/udev/rules.d
 	for port in $(PETITBOOT_GETTY_PORT); do \
@@ -111,4 +113,8 @@ endef
 
 PETITBOOT_POST_INSTALL_TARGET_HOOKS += PETITBOOT_POST_INSTALL
 
+define PETITBOOT_USERS
+	petituser -1 petitgroup -1 * /home/petituser /bin/sh - petitboot user
+endef
+
 $(eval $(autotools-package))
diff --git a/package/petitboot/shell_profile b/package/petitboot/shell_profile
new file mode 100644
index 0000000000..a958ca4402
--- /dev/null
+++ b/package/petitboot/shell_profile
@@ -0,0 +1,3 @@
+if [ "$PPID" = "1" ]; then
+	exec /usr/libexec/petitboot/pb-console
+fi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
