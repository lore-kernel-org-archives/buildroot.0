From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2020 17:42:54 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/earlyoom: new package
In-Reply-To: <20200612174029.732057-1-joseph.kogut@gmail.com>
References: <20200608175806.1064874-1-joseph.kogut@gmail.com>
 <20200612174029.732057-1-joseph.kogut@gmail.com>
Message-ID: <20200614154254.GV2346@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joseph, All,

On 2020-06-12 10:40 -0700, Joseph Kogut spake thusly:
> EarlyOOM daemon for triggering Linux OOM killer before running out of
> memory, avoiding situations where the machine becomes unresponsive from
> out of control swapping.
> 
> Some desktop distributions are installing and enabling this daemon by
> default to prevent unresponsive machines in OOM scenarios.
> 
> https://fedoraproject.org/wiki/Changes/EnableEarlyoom
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v2 -> v3:
>   * Depend on BR2_USE_MMU for fork()
>   * Include BR specific sysv init script
>   * Skip targets that call privileged commands
>   * Package cleanups
>   * Fix build on older versions of GCC by specifying required gnu99 dialect.
>   * Fix version definition used during build
> 
> Changes v1 -> v2:
>   * Amend commit message with additional information about usage by
>     other distros
>   * Add project URL to Config.in help section
>   * Add runlevel to sysv init script
> 
>  DEVELOPERS                     |  1 +
>  package/Config.in              |  1 +
>  package/earlyoom/Config.in     | 12 +++++++++
>  package/earlyoom/S02earlyoom   | 49 ++++++++++++++++++++++++++++++++++
>  package/earlyoom/earlyoom.hash |  4 +++
>  package/earlyoom/earlyoom.mk   | 40 +++++++++++++++++++++++++++
>  6 files changed, 107 insertions(+)
>  create mode 100644 package/earlyoom/Config.in
>  create mode 100644 package/earlyoom/S02earlyoom
>  create mode 100644 package/earlyoom/earlyoom.hash
>  create mode 100644 package/earlyoom/earlyoom.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 88050349db..3f64853316 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1366,6 +1366,7 @@ N:	Joseph Kogut <joseph.kogut@gmail.com>
>  F:	package/at-spi2-atk/
>  F:	package/at-spi2-core/
>  F:	package/clang/
> +F:	package/earlyoom/
>  F:	package/gconf/
>  F:	package/libnss/
>  F:	package/lld/
> diff --git a/package/Config.in b/package/Config.in
> index 85d7326361..9bda8419c0 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2335,6 +2335,7 @@ menu "System tools"
>  	source "package/docker-containerd/Config.in"
>  	source "package/docker-engine/Config.in"
>  	source "package/docker-proxy/Config.in"
> +	source "package/earlyoom/Config.in"
>  	source "package/efibootmgr/Config.in"
>  	source "package/efivar/Config.in"
>  	source "package/emlog/Config.in"
> diff --git a/package/earlyoom/Config.in b/package/earlyoom/Config.in
> new file mode 100644
> index 0000000000..a3cac273f0
> --- /dev/null
> +++ b/package/earlyoom/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_EARLYOOM
> +	bool "earlyoom"
> +	depends on BR2_USE_MMU
> +	help
> +	  Early OOM daemon for Linux.
> +
> +	  User space daemon for triggering Linux OOM killer
> +	  before running out of memory, avoiding situations
> +	  where the machine becomes unresponsive from out of
> +	  control swapping.
> +
> +	  https://github.com/rfjakob/earlyoom
> diff --git a/package/earlyoom/S02earlyoom b/package/earlyoom/S02earlyoom
> new file mode 100644
> index 0000000000..c02495af90
> --- /dev/null
> +++ b/package/earlyoom/S02earlyoom
> @@ -0,0 +1,49 @@
> +#!/bin/sh
> +
> +DAEMON="earlyoom"
> +PIDFILE="/var/run/$DAEMON.pid"
> +
> +EARLYOOM_ARGS=""
> +
> +[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
> +
> +start() {
> +	printf() 'Starting %s: ' "$DAEMON"
> +	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/bin/$DAEMON" \
> +	       -- $EARLYOOM_ARGS
> +	status=$?
> +	if [ "$status" -eq 0 ]; then
> +		echo "OK"
> +	else
> +		echo "FAIL"
> +	fi
> +	return "$status"
> +}
> +
> +stop() {
> +	printf 'Stopping %s: ' "$DAEMON"
> +	start-stop-daemon -K -q -p "$PIDFILE"
> +	status=$?
> +	if [ "$status" -eq 0 ]; then
> +		rm -f "$PIDFILE"
> +		echo "OK"
> +	else
> +		echo "FAIL"
> +	fi
> +	return "$status"
> +}
> +
> +restart() {
> +	stop
> +	start
> +}
> +
> +case "$1" in
> +	start|stop|restart)
> +		"$1";;
> +	reload)
> +		restart;;
> +	*)
> +		echo "Usage: $0 {start|stop|restart|reload}"
> +		exit 1
> +esac
> diff --git a/package/earlyoom/earlyoom.hash b/package/earlyoom/earlyoom.hash
> new file mode 100644
> index 0000000000..4cafe50bc3
> --- /dev/null
> +++ b/package/earlyoom/earlyoom.hash
> @@ -0,0 +1,4 @@
> +# locally calculated
> +sha256 b81804fc4470f996014d52252a87a1cf3b43d3d8754140035b10dcee349302b8  earlyoom-1.6.tar.gz
> +# License files, locally calculated
> +sha256 e730b3ec729de46d987ae73f30ed337e4cbe832f09205330acfa71848c6e0087  LICENSE
> diff --git a/package/earlyoom/earlyoom.mk b/package/earlyoom/earlyoom.mk
> new file mode 100644
> index 0000000000..066a479bd1
> --- /dev/null
> +++ b/package/earlyoom/earlyoom.mk
> @@ -0,0 +1,40 @@
> +################################################################################
> +#
> +# earlyoom
> +#
> +################################################################################
> +
> +EARLYOOM_VERSION = 1.6
> +EARLYOOM_SITE = $(call github,rfjakob,earlyoom,v$(EARLYOOM_VERSION))
> +EARLYOOM_LICENSE = MIT
> +EARLYOOM_LICENSE_FILES = LICENSE
> +
> +EARLYOOM_BUILD_TARGETS = earlyoom.service earlyoom
> +EARLYOOM_INSTALL_TARGETS = install-default install-bin
> +EARLYOOM_CFLAGS = '$(TARGET_CFLAGS) -std=gnu99 -DVERSION=\"1.6\"'
> +
> +EARLYOOM_MAKE_OPTS = \
> +	$(TARGET_CONFIGURE_OPTS) \
> +	PREFIX=/usr
> +
> +define EARLYOOM_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(EARLYOOM_MAKE_OPTS) -C $(@D) \
> +		$(EARLYOOM_BUILD_TARGETS) CFLAGS=$(EARLYOOM_CFLAGS)
> +endef
> +
> +define EARLYOOM_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(EARLYOOM_MAKE_OPTS) -C $(@D) \
> +		$(EARLYOOM_INSTALL_TARGETS) DESTDIR=$(TARGET_DIR)
> +endef
> +
> +define EARLYOOM_INSTALL_INIT_SYSV
> +	$(INSTALL) -D -m 755 $(EARLYOOM_PKGDIR)/S02earlyoom \
> +		$(TARGET_DIR)/etc/init.d/S02earlyoom
> +endef
> +
> +define EARLYOOM_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -D -m 644 $(@D)/earlyoom.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/earlyoom.service
> +endef
> +
> +$(eval $(generic-package))
> -- 
> 2.27.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
