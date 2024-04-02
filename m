Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A49BC6FD1F
	for <buildroot@archiver.kernel.org>; Tue,  2 Apr 2024 20:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1814409E9;
	Tue,  2 Apr 2024 20:02:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nHAGxCbHIosS; Tue,  2 Apr 2024 20:02:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B597441061
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B597441061;
	Tue,  2 Apr 2024 20:02:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B5A71BF369
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 20:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 830D440890
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 20:02:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lvfNesd0uKcK for <buildroot@lists.busybox.net>;
 Tue,  2 Apr 2024 20:02:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CB4440902
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CB4440902
 for <buildroot@buildroot.org>; Tue,  2 Apr 2024 20:02:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 25FC88462C; Tue,  2 Apr 2024 20:02:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Apr 2024 21:58:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5c8577e3dcc4a8ea499e2fb6c6bb8839bf87bc98
X-Git-Newrev: 4ee858808d132fe7d290abbdad7d1f38b47e8b6f
X-Patchwork-Hint: ignore
Message-Id: <20240402200227.25FC88462C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/weston: bump to 13.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=4ee858808d132fe7d290abbdad7d1f38b47e8b6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Announce:
  https://lists.freedesktop.org/archives/wayland-devel/2023-November/043326.html

Drop -Dlauncher-libseat=true, as it has been dropped upstream [1].

Also drop the BR2_PACKAGE_SEATD_DAEMON, which was added in
commit 6d677931284d58ae0e8e001cfd990eafaee5cecc
  "package/weston: select the seatd daemon", and
commit 9d6f966f9ad012879bb472896eb35eeda5baa9ab
  "package/weston: don't select seatd daemon if we have logind",
as it is not strictly needed anymore.

In package/seatd/Config.in we have:
    select BR2_PACKAGE_SEATD_BUILTIN \
        if !BR2_PACKAGE_SYSTEMD_LOGIND && !BR2_PACKAGE_SEATD_DAEMON

Here we have:
    select BR2_PACKAGE_SEATD_DAEMON if !BR2_PACKAGE_SYSTEMD_LOGIND

This makes it impossible to select BR2_PACKAGE_SEATD_BUILTIN as the -only-
backend if not BR2_PACKAGE_SYSTEMD_LOGIND, so drop it altogether. This kind
of logic should be selected in the device defconfigs or by packages that
really need one specific backend.

[1]: https://gitlab.freedesktop.org/wayland/weston/-/commit/e3b6ed50f1c3c259c51274c78d08b58>

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/weston/Config.in   | 1 -
 package/weston/weston.hash | 6 +++---
 package/weston/weston.mk   | 3 +--
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index db6a78ee8a..1b282fb362 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -19,7 +19,6 @@ config BR2_PACKAGE_WESTON
 	select BR2_PACKAGE_LIBINPUT
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_SEATD
-	select BR2_PACKAGE_SEATD_DAEMON if !BR2_PACKAGE_SYSTEMD_LOGIND
 	# Runtime dependency
 	select BR2_PACKAGE_XKEYBOARD_CONFIG
 	select BR2_PACKAGE_WESTON_SHELL_DESKTOP if !BR2_PACKAGE_WESTON_HAS_SHELL
diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index 0ecbaa4168..ded5d35275 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,4 +1,4 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2023-May/042725.html
-sha256  b18591eab278bc191720f6c09158040b795e7118af1d5ddca6acd9a8e2039535  weston-12.0.1.tar.xz
-sha512  3dcfa1a2a6b9a605d3ecd597bf7ac0f87b0fd1971845b6e5c44b5e34296943ac146dae6e1cfea9be14ad7a9a8b6d30dc765f9289ef80920d7c516ebba1ba4688  weston-12.0.1.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2023-November/043326.html
+sha256  52ff1d4aa2394a2e416c85a338b627ce97fa71d43eb762fd4aaf145d36fc795a  weston-13.0.0.tar.xz
+sha512  8c656cdf24ec9429c76c64ebd2d58351991f5990a6d4b5900ac913243ad8e2c9c0fb1a748f018d177fbfd7e0a8836d0434d97acec287a8f977d47335ae30eacc  weston-13.0.0.tar.xz
 sha256  fdb65868f65d0fbdb05c2d3b779e10ce9969fa0c4b9262ba4f260e87086ab860  COPYING
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index b07e798765..5ae9c22973 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WESTON_VERSION = 12.0.1
+WESTON_VERSION = 13.0.0
 WESTON_SITE = https://gitlab.freedesktop.org/wayland/weston/-/releases/$(WESTON_VERSION)/downloads
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
@@ -19,7 +19,6 @@ WESTON_CONF_OPTS = \
 	-Ddoc=false \
 	-Dremoting=false \
 	-Dbackend-vnc=false \
-	-Dlauncher-libseat=true \
 	-Dtools=calibrator,debug,info,terminal,touch-calibrator
 
 ifeq ($(BR2_PACKAGE_WESTON_SIMPLE_CLIENTS),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
