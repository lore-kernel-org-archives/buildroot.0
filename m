Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B27CC433EF
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 21:04:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91F2760FBF
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 21:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 91F2760FBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3651460715;
	Fri,  5 Nov 2021 21:04:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qO0EHZrAzfeo; Fri,  5 Nov 2021 21:04:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E1146075E;
	Fri,  5 Nov 2021 21:04:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A09401BF362
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 21:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F4AE4078A
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 21:04:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fn6PSvGN8EoO for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 21:04:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58AD840789
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 21:04:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 111EA8B35B; Fri,  5 Nov 2021 21:00:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 5 Nov 2021 21:59:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 639c0047a9321c6e061a7fe5b397e22089f09473
X-Git-Newrev: 7485f5be0c460649e7406699cde82bb492aa23f1
X-Patchwork-Hint: ignore
Message-Id: <20211105210056.111EA8B35B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libteam: new package
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
Content-Type: multipart/mixed; boundary="===============8215289373104820862=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8215289373104820862==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7485f5be0c460649e7406699cde82bb492aa23f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package is the userspace daemon, client tool, and library for the
team device implementation in the Linux kernel.  Team is an alternative
to the traditional bonding driver and provides more "runners", or modes,
of operation for aggregates.  None of these modes are enabled by default
and need a custom kernel config.

Backported the three most relevant patches to fix musl build, revert of
a fix prior to 1.31 that can cause high CPU load, and a fix to prevent
failing to stop the daemon due to too short timeout for kill command.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
[yann.morin.1998@free.fr: slight reword in help text]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../0001-revert-disregard-current-state.patch      | 51 ++++++++++++++++++++++
 .../0002-fix-build-on-openwrt-musl-libc.patch      | 41 +++++++++++++++++
 .../0003-increase-wait-time-for-daemon-kill.patch  | 37 ++++++++++++++++
 package/libteam/Config.in                          | 31 +++++++++++++
 package/libteam/libteam.hash                       |  3 ++
 package/libteam/libteam.mk                         | 24 ++++++++++
 8 files changed, 189 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index cae9e27a65..a2d34fdcc7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1344,6 +1344,7 @@ N:	Joachim Wiberg <troglobit@gmail.com>
 F:	configs/globalscale_espressobin_defconfig
 F:	board/globalscale/espressobin/
 F:	package/libite/
+F:	package/libteam/
 F:	package/libuev/
 F:	package/mg/
 F:	package/mrouted/
diff --git a/package/Config.in b/package/Config.in
index 47b8f54115..e355ab1987 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1829,6 +1829,7 @@ menu "Networking"
 	source "package/libsoup/Config.in"
 	source "package/libsrtp/Config.in"
 	source "package/libstrophe/Config.in"
+	source "package/libteam/Config.in"
 	source "package/libtelnet/Config.in"
 	source "package/libtirpc/Config.in"
 	source "package/libtorrent/Config.in"
diff --git a/package/libteam/0001-revert-disregard-current-state.patch b/package/libteam/0001-revert-disregard-current-state.patch
new file mode 100644
index 0000000000..339afbf416
--- /dev/null
+++ b/package/libteam/0001-revert-disregard-current-state.patch
@@ -0,0 +1,51 @@
+From 61efd6de2fbb8ee077863ee5a355ac3dfd9365b9 Mon Sep 17 00:00:00 2001
+From: Xin Long <lucien.xin@gmail.com>
+Date: Tue, 1 Sep 2020 13:59:27 +0800
+Subject: [PATCH] Revert "teamd: Disregard current state when considering port
+ enablement"
+
+This reverts commit deadb5b715227429a1879b187f5906b39151eca9.
+
+As Patrick noticed, with that commit, teamd_port_check_enable()
+would set the team port to the new state unconditionally, which
+triggers another change message from kernel to userspace, then
+teamd_port_check_enable() is called again to set the team port
+to the new state.
+
+This would go around and around to update the team port state,
+and even cause teamd to consume 100% cpu.
+
+As the issue caused by that commit is serious, it has to be
+reverted. As for the issued fixed by that commit, I would
+propose a new fix later.
+
+Signed-off-by: Jiri Pirko <jiri@nvidia.com>
+---
+ teamd/teamd_per_port.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/teamd/teamd_per_port.c b/teamd/teamd_per_port.c
+index 166da57..d429753 100644
+--- a/teamd/teamd_per_port.c
++++ b/teamd/teamd_per_port.c
+@@ -442,14 +442,18 @@ int teamd_port_check_enable(struct teamd_context *ctx,
+ 			    bool should_enable, bool should_disable)
+ {
+ 	bool new_enabled_state;
++	bool curr_enabled_state;
+ 	int err;
+ 
+ 	if (!teamd_port_present(ctx, tdport))
+ 		return 0;
++	err = teamd_port_enabled(ctx, tdport, &curr_enabled_state);
++	if (err)
++		return err;
+ 
+-	if (should_enable)
++	if (!curr_enabled_state && should_enable)
+ 		new_enabled_state = true;
+-	else if (should_disable)
++	else if (curr_enabled_state && should_disable)
+ 		new_enabled_state = false;
+ 	else
+ 		return 0;
diff --git a/package/libteam/0002-fix-build-on-openwrt-musl-libc.patch b/package/libteam/0002-fix-build-on-openwrt-musl-libc.patch
new file mode 100644
index 0000000000..f2b38a137d
--- /dev/null
+++ b/package/libteam/0002-fix-build-on-openwrt-musl-libc.patch
@@ -0,0 +1,41 @@
+From 267f24839536234ca621d4fd0466d3b57cb6dccd Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Pavel=20=C5=A0imerda?= <code@simerda.eu>
+Date: Tue, 12 Jan 2021 04:41:56 +0100
+Subject: [PATCH] fix build on OpenWRT/musl-libc
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Pavel Šimerda <code@simerda.eu>
+Signed-off-by: Jiri Pirko <jiri@nvidia.com>
+---
+ teamd/teamd_runner_lacp.c | 2 --
+ utils/teamnl.c            | 1 +
+ 2 files changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/teamd/teamd_runner_lacp.c b/teamd/teamd_runner_lacp.c
+index 9437f05..f524be2 100644
+--- a/teamd/teamd_runner_lacp.c
++++ b/teamd/teamd_runner_lacp.c
+@@ -23,9 +23,7 @@
+ #include <unistd.h>
+ #include <limits.h>
+ #include <sys/ioctl.h>
+-#include <linux/if_ether.h>
+ #include <sys/socket.h>
+-#include <linux/netdevice.h>
+ #include <netinet/in.h>
+ #include <errno.h>
+ #include <team.h>
+diff --git a/utils/teamnl.c b/utils/teamnl.c
+index c53345d..ec2b435 100644
+--- a/utils/teamnl.c
++++ b/utils/teamnl.c
+@@ -24,6 +24,7 @@
+ #include <getopt.h>
+ #include <errno.h>
+ #include <sys/signalfd.h>
++#include <sys/select.h>
+ #include <signal.h>
+ #include <unistd.h>
+ #include <team.h>
diff --git a/package/libteam/0003-increase-wait-time-for-daemon-kill.patch b/package/libteam/0003-increase-wait-time-for-daemon-kill.patch
new file mode 100644
index 0000000000..7827a654ef
--- /dev/null
+++ b/package/libteam/0003-increase-wait-time-for-daemon-kill.patch
@@ -0,0 +1,37 @@
+From 6875e6c8efb0fe86766b3d4f1d0db390af6998b7 Mon Sep 17 00:00:00 2001
+From: Hangbin Liu <liuhangbin@gmail.com>
+Date: Tue, 15 Dec 2020 19:33:17 +0800
+Subject: [PATCH] teamd: increase the waitting time for daemon killing
+
+In the current code, we wait for at most 5s when kill the daemon pid.
+But in some environment, it may need more time. Then the teamd -k will
+failed and return error "Failed to kill daemon: Timer expired".
+
+Let's increase the value to have enough time. Here is the reuslt with
+this patch:
+
+$ time libteam/teamd/teamd -k -t team0
+
+real    0m10.442s
+user    0m0.017s
+sys     0m0.016s
+
+Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
+Signed-off-by: Jiri Pirko <jiri@nvidia.com>
+---
+ teamd/teamd.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/teamd/teamd.c b/teamd/teamd.c
+index 9360cbf..b310140 100644
+--- a/teamd/teamd.c
++++ b/teamd/teamd.c
+@@ -1858,7 +1858,7 @@ int main(int argc, char **argv)
+ 		break;
+ 	case DAEMON_CMD_KILL:
+ 		if (daemon_pid_file_is_running() > 0) {
+-			err = daemon_pid_file_kill_wait(SIGTERM, 5);
++			err = daemon_pid_file_kill_wait(SIGTERM, 30);
+ 			if (err)
+ 				teamd_log_warn("Failed to kill daemon: %s",
+ 					       strerror(errno));
diff --git a/package/libteam/Config.in b/package/libteam/Config.in
new file mode 100644
index 0000000000..aa566a6c94
--- /dev/null
+++ b/package/libteam/Config.in
@@ -0,0 +1,31 @@
+config BR2_PACKAGE_LIBTEAM
+	bool "libteam"
+	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS # libnl-tools
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
+	select BR2_PACKAGE_JANSSON
+	select BR2_PACKAGE_LIBDAEMON
+	select BR2_PACKAGE_LIBNL
+	select BR2_PACKAGE_LIBNL_TOOLS
+	help
+	  The purpose of the Team driver is to provide a mechanism to
+	  team multiple NICs (ports) into one logical one (teamdev) at
+	  L2 layer. The process is called "channel bonding", "Ethernet
+	  bonding", "channel teaming", "link aggregation", etc.
+
+	  Team tries to provide similar functionality as the bonding
+	  driver, however architecturally it is quite different. Team is
+	  modular, userspace driven, very lean and efficient, and it
+	  does have some distinct advantages over bonding. The way Team
+	  is configured differs dramatically from the way bonding is.
+
+	  If building the kernel with Buildroot, basic team support is
+	  automatically enabled, but you will still need to enable the
+	  modes you need, e.g. activebackup or loadbalance (e.g. with a
+	  config fragment or a custom config).
+
+	  https://github.com/jpirko/libteam
+
+comment "libteam needs MMU and a toolchain w/ dynamic library and threads"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libteam/libteam.hash b/package/libteam/libteam.hash
new file mode 100644
index 0000000000..39d29425d3
--- /dev/null
+++ b/package/libteam/libteam.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  c69f7cf5a98203d66db10e67b396fe325b77a5a9491d1e07e8a07cba3ba841bb  libteam-1.31.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libteam/libteam.mk b/package/libteam/libteam.mk
new file mode 100644
index 0000000000..99454a03e5
--- /dev/null
+++ b/package/libteam/libteam.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# libteam
+#
+################################################################################
+
+LIBTEAM_VERSION = 1.31
+LIBTEAM_SITE = $(call github,jpirko,libteam,v$(LIBTEAM_VERSION))
+LIBTEAM_CPE_ID_VENDOR = libteam
+LIBTEAM_LICENSE = LGPL-2.1+
+LIBTEAM_LICENSE_FILES = COPYING
+LIBTEAM_DEPENDENCIES = host-pkgconf jansson libdaemon libnl
+LIBTEAM_AUTORECONF = YES
+LIBTEAM_INSTALL_STAGING = YES
+
+# Note: this enables basic team support, use a custom kernel config, or
+#       fragment, to enable team modes, e.g. activebackup or loadbalance
+define LIBTEAM_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETDEVICES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_CORE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_TEAM)
+endef
+
+$(eval $(autotools-package))

--===============8215289373104820862==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8215289373104820862==--
