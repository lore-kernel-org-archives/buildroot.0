From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Tue, 26 Apr 2011 09:52:14 +0800
Subject: [Buildroot] [PATCH 2/2] New package: input-event-daemon
In-Reply-To: <1303353009-6130-1-git-send-email-keguang.zhang@gmail.com>
References: <1303353009-6130-1-git-send-email-keguang.zhang@gmail.com>
Message-ID: <BANLkTikzWbEgGnnwiF4g=o2LEmu=_Gv3Ag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/4/21 <keguang.zhang@gmail.com>

> From: Kelvin Cheung <keguang.zhang@gmail.com>
>
> Add new package: input-event-daemon
>
> input-event-daemon -  input event handling daemon for linux.
>
> Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
> ---
>  package/Config.in                                |    1 +
>  package/input-event-daemon/Config.in             |    8 ++++
>  package/input-event-daemon/S99input-event-daemon |   40
> +++++++++++++++++++++
>  package/input-event-daemon/input-event-daemon.mk |   41
> ++++++++++++++++++++++
>  4 files changed, 90 insertions(+), 0 deletions(-)
>  create mode 100644 package/input-event-daemon/Config.in
>  create mode 100755 package/input-event-daemon/S99input-event-daemon
>  create mode 100644 package/input-event-daemon/input-event-daemon.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 0db0cd6..4bd2864 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -176,6 +176,7 @@ source "package/hdparm/Config.in"
>  endif
>  source "package/hwdata/Config.in"
>  source "package/i2c-tools/Config.in"
> +source "package/input-event-daemon/Config.in"
>  source "package/input-tools/Config.in"
>  source "package/iostat/Config.in"
>  source "package/irda-utils/Config.in"
> diff --git a/package/input-event-daemon/Config.in
> b/package/input-event-daemon/Config.in
> new file mode 100644
> index 0000000..edf2886
> --- /dev/null
> +++ b/package/input-event-daemon/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_INPUT_EVENT_DAEMON
> +       bool "input-event-daemon"
> +       help
> +         input-event-daemon is a daemon which executes
> +         a user-defined command on input events, such as
> +         keys, mouse buttons and switches.
> +
> +         http://github.com/gandro/input-event-daemon
> diff --git a/package/input-event-daemon/S99input-event-daemon
> b/package/input-event-daemon/S99input-event-daemon
> new file mode 100755
> index 0000000..ed374f4
> --- /dev/null
> +++ b/package/input-event-daemon/S99input-event-daemon
> @@ -0,0 +1,40 @@
> +#! /bin/sh
> +
> +[ -f /usr/bin/input-event-daemon ] || exit 0
> +
> +start() {
> +       echo -n "Starting input-event-daemon: "
> +       input-event-daemon
> +       echo "done"
> +}
> +
> +
> +stop() {
> +        echo -n "Stopping input-event-daemon: "
> +       echo
> +        killall input-event-daemon
> +       echo "done"
> +}
> +
> +restart() {
> +       stop
> +       start
> +}
> +
> +# See how we were called.
> +case "$1" in
> +  start)
> +       start
> +       ;;
> +  stop)
> +       stop
> +       ;;
> +  restart|reload)
> +       restart
> +       ;;
> +  *)
> +       echo "Usage: $0 {start|stop|reload|restart}"
> +       exit 1
> +esac
> +
> +exit $?
> diff --git a/package/input-event-daemon/input-event-daemon.mkb/package/input-event-daemon/
> input-event-daemon.mk
> new file mode 100644
> index 0000000..5cd6e72
> --- /dev/null
> +++ b/package/input-event-daemon/input-event-daemon.mk
> @@ -0,0 +1,41 @@
> +#############################################################
> +#
> +# input-event-daemon
> +#
> +#############################################################
> +INPUT_EVENT_DAEMON_VERSION:=13f4d61
> +INPUT_EVENT_DAEMON_SITE:=git://github.com/gandro/input-event-daemon.git
> +
> +define INPUT_EVENT_DAEMON_BUILD_CMDS
> +       touch  $(@D)/input-event-table.h
> +       $(MAKE) CFLAGS="$(TARGET_CFLAGS)" CC="$(TARGET_CC)" -C $(@D)
> +endef
> +
> +define INPUT_EVENT_DAEMON_INSTALL_TARGET_CMDS
> +       $(INSTALL) -m 755 -D $(@D)/input-event-daemon $(TARGET_DIR)/usr/bin
> +       -$(STRIPCMD) $(STRIP_STRIP_UNNEEDED)
> $(TARGET_DIR)/usr/bin/input-event-daemon
> +       cp -n $(@D)/docs/sample.conf
> $(TARGET_DIR)/etc/input-event-daemon.conf
> +endef
> +
> +define INPUT_EVENT_DAEMON_CLEAN_CMDS
> +       $(MAKE) -C $(@D) clean
> +endef
> +
> +define INPUT_EVENT_DAEMON_UNINSTALL_TARGET_CMDS
> +       rm -f $(TARGET_DIR)/usr/bin/input-event-daemon
> +       rm -f $(TARGET_DIR)/etc/input-event-daemon.conf
> +endef
> +
> +define INPUT_EVENT_DAEMON_COSTUM_INSTALL
> +       # install start/stop script
> +       $(call MESSAGE,"Installing S99input-event-daemon init script")
> +       if [ ! -f $(TARGET_DIR)/etc/init.d/S99input-event-daemon ]; then \
> +               $(INSTALL) -m 0755 -D
> package/input-event-daemon/S99input-event-daemon \
> +               $(TARGET_DIR)/etc/init.d/S99input-event-daemon; \
> +       fi
> +       $(Q)touch $@
> +endef
> +
> +INPUT_EVENT_DAEMON_POST_INSTALL_TARGET_HOOKS +=
> INPUT_EVENT_DAEMON_COSTUM_INSTALL
> +
> +$(eval $(call GENTARGETS,package,input-event-daemon))
> --
> 1.7.1
>
>
Hi Peter,

What about this patch?
input-event-daemon is a very useful tool for non-GUI system.

-- 
Best Regards!
Kelvin
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110426/1a9683eb/attachment.html>
