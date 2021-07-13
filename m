From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 13 Jul 2021 06:43:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/libteam: new package
In-Reply-To: <20210710114153.369531-2-troglobit@gmail.com>
References: <20210710114153.369531-1-troglobit@gmail.com>
 <20210710114153.369531-2-troglobit@gmail.com>
Message-ID: <CAGm1_ksZH1EFy=kzgy2pMtCfec-6dwuOZnkVtbwb5bJxzkCOVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Joachim,

On Sat, Jul 10, 2021 at 1:42 PM Joachim Wiberg <troglobit@gmail.com> wrote:
>
> This package is the userspace daemon, client tool, and library for the
> team device implementation in the Linux kernel.  Team is an alternative
> to the traditional bonding driver and provides more "runners", or modes,
> of operation for aggregates.
>
> Team devices require the following kernel config, the most common modes
> have been included to be enabled when this package is selected:
>
>     CONFIG_NET_TEAM=y
>     CONFIG_NET_TEAM_MODE_ACTIVEBACKUP=y
>     CONFIG_NET_TEAM_MODE_LOADBALANCE=y
>
> Other possible, but not enabled, modes are:
>
>     CONFIG_NET_TEAM_MODE_BROADCAST=y
>     CONFIG_NET_TEAM_MODE_ROUNDROBIN=y
>     CONFIG_NET_TEAM_MODE_RANDOM=y
>
> Unfortunately the package relies on fork(), amongst other things, to
> run, hence BR2_USR_MMU.
>
> Backported the three most relevant patches to fix musl build, revert of
> a fix prior to 1.31 that can cause high CPU load, and a fix to prevent
> failing to stop the daemon due to too short timeout for kill command.
>
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
>  DEVELOPERS                                    |  1 +
>  package/Config.in                             |  1 +
>  .../0001-revert-disregard-current-state.patch | 51 +++++++++++++++++++
>  .../0002-fix-build-on-openwrt-musl-libc.patch | 41 +++++++++++++++
>  ...3-increase-wait-time-for-daemon-kill.patch | 37 ++++++++++++++
>  package/libteam/Config.in                     | 20 ++++++++
>  package/libteam/libteam.hash                  |  3 ++
>  package/libteam/libteam.mk                    | 22 ++++++++
>  8 files changed, 176 insertions(+)
>  create mode 100644 package/libteam/0001-revert-disregard-current-state.patch
>  create mode 100644 package/libteam/0002-fix-build-on-openwrt-musl-libc.patch
>  create mode 100644 package/libteam/0003-increase-wait-time-for-daemon-kill.patch
>  create mode 100644 package/libteam/Config.in
>  create mode 100644 package/libteam/libteam.hash
>  create mode 100644 package/libteam/libteam.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 2a69f88299..e46362b6ee 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1316,6 +1316,7 @@ F:        package/rtty/
>  N:     Joachim Wiberg <troglobit@gmail.com>
>  F:     configs/globalscale_espressobin_defconfig
>  F:     board/globalscale/espressobin/
> +F:     package/libteam/
>  F:     package/mg/
>  F:     package/netcalc/
>  F:     package/ssdp-responder/
> diff --git a/package/Config.in b/package/Config.in
> index 22947edf2c..6335b04e9d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1808,6 +1808,7 @@ menu "Networking"
>         source "package/libsoup/Config.in"
>         source "package/libsrtp/Config.in"
>         source "package/libstrophe/Config.in"
> +       source "package/libteam/Config.in"
>         source "package/libtelnet/Config.in"
>         source "package/libtirpc/Config.in"
>         source "package/libtorrent/Config.in"
> diff --git a/package/libteam/0001-revert-disregard-current-state.patch b/package/libteam/0001-revert-disregard-current-state.patch
> new file mode 100644
> index 0000000000..339afbf416
> --- /dev/null
> +++ b/package/libteam/0001-revert-disregard-current-state.patch
> @@ -0,0 +1,51 @@
> +From 61efd6de2fbb8ee077863ee5a355ac3dfd9365b9 Mon Sep 17 00:00:00 2001
> +From: Xin Long <lucien.xin@gmail.com>
> +Date: Tue, 1 Sep 2020 13:59:27 +0800
> +Subject: [PATCH] Revert "teamd: Disregard current state when considering port
> + enablement"
> +
> +This reverts commit deadb5b715227429a1879b187f5906b39151eca9.
> +
> +As Patrick noticed, with that commit, teamd_port_check_enable()
> +would set the team port to the new state unconditionally, which
> +triggers another change message from kernel to userspace, then
> +teamd_port_check_enable() is called again to set the team port
> +to the new state.
> +
> +This would go around and around to update the team port state,
> +and even cause teamd to consume 100% cpu.
> +
> +As the issue caused by that commit is serious, it has to be
> +reverted. As for the issued fixed by that commit, I would
> +propose a new fix later.
> +
> +Signed-off-by: Jiri Pirko <jiri@nvidia.com>
> +---
> + teamd/teamd_per_port.c | 8 ++++++--
> + 1 file changed, 6 insertions(+), 2 deletions(-)
> +
> +diff --git a/teamd/teamd_per_port.c b/teamd/teamd_per_port.c
> +index 166da57..d429753 100644
> +--- a/teamd/teamd_per_port.c
> ++++ b/teamd/teamd_per_port.c
> +@@ -442,14 +442,18 @@ int teamd_port_check_enable(struct teamd_context *ctx,
> +                           bool should_enable, bool should_disable)
> + {
> +       bool new_enabled_state;
> ++      bool curr_enabled_state;
> +       int err;
> +
> +       if (!teamd_port_present(ctx, tdport))
> +               return 0;
> ++      err = teamd_port_enabled(ctx, tdport, &curr_enabled_state);
> ++      if (err)
> ++              return err;
> +
> +-      if (should_enable)
> ++      if (!curr_enabled_state && should_enable)
> +               new_enabled_state = true;
> +-      else if (should_disable)
> ++      else if (curr_enabled_state && should_disable)
> +               new_enabled_state = false;
> +       else
> +               return 0;
> diff --git a/package/libteam/0002-fix-build-on-openwrt-musl-libc.patch b/package/libteam/0002-fix-build-on-openwrt-musl-libc.patch
> new file mode 100644
> index 0000000000..f2b38a137d
> --- /dev/null
> +++ b/package/libteam/0002-fix-build-on-openwrt-musl-libc.patch
> @@ -0,0 +1,41 @@
> +From 267f24839536234ca621d4fd0466d3b57cb6dccd Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Pavel=20=C5=A0imerda?= <code@simerda.eu>
> +Date: Tue, 12 Jan 2021 04:41:56 +0100
> +Subject: [PATCH] fix build on OpenWRT/musl-libc
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Signed-off-by: Pavel ?imerda <code@simerda.eu>
> +Signed-off-by: Jiri Pirko <jiri@nvidia.com>
> +---
> + teamd/teamd_runner_lacp.c | 2 --
> + utils/teamnl.c            | 1 +
> + 2 files changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/teamd/teamd_runner_lacp.c b/teamd/teamd_runner_lacp.c
> +index 9437f05..f524be2 100644
> +--- a/teamd/teamd_runner_lacp.c
> ++++ b/teamd/teamd_runner_lacp.c
> +@@ -23,9 +23,7 @@
> + #include <unistd.h>
> + #include <limits.h>
> + #include <sys/ioctl.h>
> +-#include <linux/if_ether.h>
> + #include <sys/socket.h>
> +-#include <linux/netdevice.h>
> + #include <netinet/in.h>
> + #include <errno.h>
> + #include <team.h>
> +diff --git a/utils/teamnl.c b/utils/teamnl.c
> +index c53345d..ec2b435 100644
> +--- a/utils/teamnl.c
> ++++ b/utils/teamnl.c
> +@@ -24,6 +24,7 @@
> + #include <getopt.h>
> + #include <errno.h>
> + #include <sys/signalfd.h>
> ++#include <sys/select.h>
> + #include <signal.h>
> + #include <unistd.h>
> + #include <team.h>
> diff --git a/package/libteam/0003-increase-wait-time-for-daemon-kill.patch b/package/libteam/0003-increase-wait-time-for-daemon-kill.patch
> new file mode 100644
> index 0000000000..7827a654ef
> --- /dev/null
> +++ b/package/libteam/0003-increase-wait-time-for-daemon-kill.patch
> @@ -0,0 +1,37 @@
> +From 6875e6c8efb0fe86766b3d4f1d0db390af6998b7 Mon Sep 17 00:00:00 2001
> +From: Hangbin Liu <liuhangbin@gmail.com>
> +Date: Tue, 15 Dec 2020 19:33:17 +0800
> +Subject: [PATCH] teamd: increase the waitting time for daemon killing
> +
> +In the current code, we wait for at most 5s when kill the daemon pid.
> +But in some environment, it may need more time. Then the teamd -k will
> +failed and return error "Failed to kill daemon: Timer expired".
> +
> +Let's increase the value to have enough time. Here is the reuslt with
> +this patch:
> +
> +$ time libteam/teamd/teamd -k -t team0
> +
> +real    0m10.442s
> +user    0m0.017s
> +sys     0m0.016s
> +
> +Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
> +Signed-off-by: Jiri Pirko <jiri@nvidia.com>
> +---
> + teamd/teamd.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/teamd/teamd.c b/teamd/teamd.c
> +index 9360cbf..b310140 100644
> +--- a/teamd/teamd.c
> ++++ b/teamd/teamd.c
> +@@ -1858,7 +1858,7 @@ int main(int argc, char **argv)
> +               break;
> +       case DAEMON_CMD_KILL:
> +               if (daemon_pid_file_is_running() > 0) {
> +-                      err = daemon_pid_file_kill_wait(SIGTERM, 5);
> ++                      err = daemon_pid_file_kill_wait(SIGTERM, 30);
> +                       if (err)
> +                               teamd_log_warn("Failed to kill daemon: %s",
> +                                              strerror(errno));
> diff --git a/package/libteam/Config.in b/package/libteam/Config.in
> new file mode 100644
> index 0000000000..743c0a4f7e
> --- /dev/null
> +++ b/package/libteam/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_LIBTEAM
> +       bool "libteam"
> +       depends on BR2_USE_MMU # fork()
> +       select BR2_PACKAGE_JANSSON
> +       select BR2_PACKAGE_LIBDAEMON
> +       select BR2_PACKAGE_LIBNL
> +       select BR2_PACKAGE_LIBNL_TOOLS
> +       help
> +         The purpose of the Team driver is to provide a mechanism to
> +         team multiple NICs (ports) into one logical one (teamdev) at
> +         L2 layer. The process is called "channel bonding", "Ethernet
> +         bonding", "channel teaming", "link aggregation", etc.
> +
> +         Team tries to provide similar functionality as the bonding
> +         driver, however architecturally it is quite different. Team is
> +         modular, userspace driven, very lean and efficient, and it
> +         does have some distinct advantages over bonding. The way Team
> +         is configured differs dramatically from the way bonding is.
> +
> +         https://github.com/jpirko/libteam

The dependencies for libnl and tools are missing:

comment "libnl tools needs a toolchain w/ dynamic library"
        depends on BR2_STATIC_LIBS

comment "libnl needs a toolchain w/ threads"
        depends on !BR2_TOOLCHAIN_HAS_THREADS

Best regards,
Yegor

> diff --git a/package/libteam/libteam.hash b/package/libteam/libteam.hash
> new file mode 100644
> index 0000000000..39d29425d3
> --- /dev/null
> +++ b/package/libteam/libteam.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  c69f7cf5a98203d66db10e67b396fe325b77a5a9491d1e07e8a07cba3ba841bb  libteam-1.31.tar.gz
> +sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/libteam/libteam.mk b/package/libteam/libteam.mk
> new file mode 100644
> index 0000000000..2a66345192
> --- /dev/null
> +++ b/package/libteam/libteam.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# libteam
> +#
> +################################################################################
> +
> +LIBTEAM_VERSION = 1.31
> +LIBTEAM_SITE = $(call github,jpirko,libteam,v$(LIBTEAM_VERSION))
> +LIBTEAM_AUTORECONF = YES
> +LIBTEAM_LICENSE = LGPL-2.1+
> +LIBTEAM_LICENSE_FILES = COPYING
> +LIBTEAM_INSTALL_STAGING = YES
> +LIBTEAM_DEPENDENCIES = host-pkgconf jansson libdaemon libnl
> +
> +# The most common team modes, use a custom kernel config to enable more.
> +define LIBTEAM_LINUX_CONFIG_FIXUPS
> +       $(call KCONFIG_ENABLE_OPT,CONFIG_NET_TEAM)
> +       $(call KCONFIG_ENABLE_OPT,CONFIG_NET_TEAM_MODE_ACTIVEBACKUP)
> +       $(call KCONFIG_ENABLE_OPT,CONFIG_NET_TEAM_MODE_LOADBALANCE)
> +endef
> +
> +$(eval $(autotools-package))
> --
> 2.25.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
