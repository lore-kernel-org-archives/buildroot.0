Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49CAC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 12:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 682AA4052F;
	Sun,  9 Jan 2022 12:51:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lSsBdpqGHmJX; Sun,  9 Jan 2022 12:51:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2617F40503;
	Sun,  9 Jan 2022 12:51:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0EB8B1BF417
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 12:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5B1B40351
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 12:50:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M-69y6QDmLt7 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 12:50:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E3E340336
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 12:50:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8A8BF82CFA; Sun,  9 Jan 2022 12:44:15 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 13:48:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f90d23112d2b9d52d2368a0a3f907ba37e2c60ce
X-Git-Newrev: eb49354eb34842f88218fcf9ef60576b85653e38
X-Patchwork-Hint: ignore
Message-Id: <20220109124415.8A8BF82CFA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: Update description and
 kernel options
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb49354eb34842f88218fcf9ef60576b85653e38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

realign the configuration to the README.

enable CONFIG_AUTOFS_FS (kernel >= 4.18) as well as the someday
to be removed CONFIG_AUTOFS4_FS option.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/systemd/Config.in  | 22 +++++++++++++++++-----
 package/systemd/systemd.mk | 16 ++++++++++++----
 2 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index c8c5a9c47b..27a12bc947 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -22,7 +22,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	depends on !BR2_STATIC_LIBS # kmod
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_TOOLCHAIN_HAS_SSP
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_HOST_GCC_AT_LEAST_5 # host-systemd
 	select BR2_PACKAGE_HAS_UDEV
@@ -51,13 +51,25 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	  an elaborate transactional dependency-based service control
 	  logic.  It can work as a drop-in replacement for sysvinit.
 
-	  Systemd requires a Linux kernel >= 3.0 with the following
+	  Systemd requires a Linux kernel >= 3.13 with the following
 	  options enabled:
 
-	  - CONFIG_CGROUPS
+	  - CONFIG_DEVTMPFS
+	  - CONFIG_CGROUPS (it is OK to disable all controllers)
 	  - CONFIG_INOTIFY_USER
-	  - CONFIG_FHANDLE
-	  - CONFIG_AUTOFS4_FS
+	  - CONFIG_SIGNALFD
+	  - CONFIG_TIMERFD
+	  - CONFIG_EPOLL
+	  - CONFIG_UNIX (it requires CONFIG_NET, but every other flag in
+	    it is not necessary)
+	  - CONFIG_SYSFS
+	  - CONFIG_PROC_FS
+	  - CONFIG_FHANDLE (libudev, mount and bind mount handling)
+
+	  - CONFIG_NET_NS (needed by PrivateNetwork=, used in some
+	    systemd units)
+
+	  - CONFIG_AUTOFS_FS / CONFIG_AUTOFS4_FS
 	  - CONFIG_TMPFS_POSIX_ACL
 	  - CONFIG_TMPFS_XATTR
 
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index d7d5e5289b..330619e206 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -725,14 +725,22 @@ SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
 SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
 
 define SYSTEMD_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_FHANDLE)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_EPOLL)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_SIGNALFD)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_TIMERFD)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_PROC_FS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_EPOLL)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_UNIX)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_SYSFS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PROC_FS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FHANDLE)
+
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_NS)
+
+	$(call KCONFIG_DISABLE_OPT,CONFIG_SYSFS_DEPRECATED)
+
+	$(call KCONFIG_ENABLE_OPT,CONFIG_AUTOFS_FS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_AUTOFS4_FS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_POSIX_ACL)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_XATTR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
