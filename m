From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 May 2011 22:43:39 +0200
Subject: [Buildroot] [PATCH 2/2] New package: input-event-daemon
In-Reply-To: <1303353009-6130-1-git-send-email-keguang.zhang@gmail.com>
	(keguang zhang's message of "Thu, 21 Apr 2011 10:30:09 +0800")
References: <1303353009-6130-1-git-send-email-keguang.zhang@gmail.com>
Message-ID: <87d3jzms5g.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "keguang" == keguang zhang <keguang.zhang@gmail.com> writes:

 keguang> From: Kelvin Cheung <keguang.zhang@gmail.com>
 keguang> Add new package: input-event-daemon

 keguang> input-event-daemon -  input event handling daemon for linux.

 keguang> Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
 keguang> ---
 keguang>  package/Config.in                                |    1 +
 keguang>  package/input-event-daemon/Config.in             |    8 ++++
 keguang>  package/input-event-daemon/S99input-event-daemon |   40 +++++++++++++++++++++
 keguang>  package/input-event-daemon/input-event-daemon.mk |   41 ++++++++++++++++++++++
 keguang>  4 files changed, 90 insertions(+), 0 deletions(-)
 keguang>  create mode 100644 package/input-event-daemon/Config.in
 keguang>  create mode 100755 package/input-event-daemon/S99input-event-daemon
 keguang>  create mode 100644 package/input-event-daemon/input-event-daemon.mk

 keguang> diff --git a/package/Config.in b/package/Config.in
 keguang> index 0db0cd6..4bd2864 100644
 keguang> --- a/package/Config.in
 keguang> +++ b/package/Config.in
 keguang> @@ -176,6 +176,7 @@ source "package/hdparm/Config.in"
 keguang>  endif
 keguang>  source "package/hwdata/Config.in"
 keguang>  source "package/i2c-tools/Config.in"
 keguang> +source "package/input-event-daemon/Config.in"
 keguang>  source "package/input-tools/Config.in"
 keguang>  source "package/iostat/Config.in"
 keguang>  source "package/irda-utils/Config.in"
 keguang> diff --git a/package/input-event-daemon/Config.in b/package/input-event-daemon/Config.in
 keguang> new file mode 100644
 keguang> index 0000000..edf2886
 keguang> --- /dev/null
 keguang> +++ b/package/input-event-daemon/Config.in
 keguang> @@ -0,0 +1,8 @@
 keguang> +config BR2_PACKAGE_INPUT_EVENT_DAEMON
 keguang> +	bool "input-event-daemon"
 keguang> +	help
 keguang> +	  input-event-daemon is a daemon which executes
 keguang> +	  a user-defined command on input events, such as
 keguang> +	  keys, mouse buttons and switches.
 keguang> +
 keguang> +	  http://github.com/gandro/input-event-daemon
 keguang> diff --git a/package/input-event-daemon/S99input-event-daemon b/package/input-event-daemon/S99input-event-daemon
 keguang> new file mode 100755
 keguang> index 0000000..ed374f4
 keguang> --- /dev/null
 keguang> +++ b/package/input-event-daemon/S99input-event-daemon
 keguang> @@ -0,0 +1,40 @@
 keguang> +#! /bin/sh
 keguang> +
 keguang> +[ -f /usr/bin/input-event-daemon ] || exit 0
 keguang> +
 keguang> +start() {
 keguang> +	echo -n "Starting input-event-daemon: "
 keguang> +	input-event-daemon
 keguang> +	echo "done"
 keguang> +}
 keguang> +
 keguang> +
 keguang> +stop() {
 keguang> +        echo -n "Stopping input-event-daemon: "
 keguang> +	echo
 keguang> +        killall input-event-daemon
 keguang> +	echo "done"

The empty echo seems misplaced, and a mix of tabs and spaces.

 keguang> +}
 keguang> +
 keguang> +restart() {
 keguang> +	stop
 keguang> +	start
 keguang> +}
 keguang> +
 keguang> +# See how we were called.
 keguang> +case "$1" in
 keguang> +  start)
 keguang> +	start
 keguang> +	;;
 keguang> +  stop)
 keguang> +	stop
 keguang> +	;;
 keguang> +  restart|reload)
 keguang> +	restart
 keguang> +	;;
 keguang> +  *)
 keguang> +	echo "Usage: $0 {start|stop|reload|restart}"
 keguang> +	exit 1
 keguang> +esac
 keguang> +
 keguang> +exit $?
 keguang> diff --git a/package/input-event-daemon/input-event-daemon.mk b/package/input-event-daemon/input-event-daemon.mk
 keguang> new file mode 100644
 keguang> index 0000000..5cd6e72
 keguang> --- /dev/null
 keguang> +++ b/package/input-event-daemon/input-event-daemon.mk
 keguang> @@ -0,0 +1,41 @@
 keguang> +#############################################################
 keguang> +#
 keguang> +# input-event-daemon
 keguang> +#
 keguang> +#############################################################
 keguang> +INPUT_EVENT_DAEMON_VERSION:=13f4d61
 keguang> +INPUT_EVENT_DAEMON_SITE:=git://github.com/gandro/input-event-daemon.git

Any reason to not use the v0.1.3 tag instead? Github also has tarballs,
but the download system seems a bit broken.

 keguang> +
 keguang> +define INPUT_EVENT_DAEMON_BUILD_CMDS
 keguang> +	touch  $(@D)/input-event-table.h
 keguang> +	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" CC="$(TARGET_CC)" -C $(@D)

You should also pass LDFLAGS even though we're not currently setting it
to anything.

 keguang> +endef
 keguang> +
 keguang> +define INPUT_EVENT_DAEMON_INSTALL_TARGET_CMDS
 keguang> +	$(INSTALL) -m 755 -D $(@D)/input-event-daemon $(TARGET_DIR)/usr/bin

You need to provide the destination filename when you use install -D

 keguang> +	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/input-event-daemon

Stripping is handled automatically nowadays.

 keguang> +	cp -n $(@D)/docs/sample.conf $(TARGET_DIR)/etc/input-event-daemon.conf

Here you use cp -n and below you use [ ! -f <file> ] (which is how it's
done elsewhere in BR).

 keguang> +endef
 keguang> +
 keguang> +define INPUT_EVENT_DAEMON_CLEAN_CMDS
 keguang> +	$(MAKE) -C $(@D) clean
 keguang> +endef
 keguang> +
 keguang> +define INPUT_EVENT_DAEMON_UNINSTALL_TARGET_CMDS
 keguang> +	rm -f $(TARGET_DIR)/usr/bin/input-event-daemon
 keguang> +	rm -f $(TARGET_DIR)/etc/input-event-daemon.conf
 keguang> +endef
 keguang> +
 keguang> +define INPUT_EVENT_DAEMON_COSTUM_INSTALL
 keguang> +	# install start/stop script
 keguang> +	$(call MESSAGE,"Installing S99input-event-daemon init script")
 keguang> +	if [ ! -f $(TARGET_DIR)/etc/init.d/S99input-event-daemon ]; then \
 keguang> +		$(INSTALL) -m 0755 -D package/input-event-daemon/S99input-event-daemon \
 keguang> +		$(TARGET_DIR)/etc/init.d/S99input-event-daemon; \
 keguang> +	fi
 keguang> +	$(Q)touch $@
 keguang> +endef

This might as well be combined with the normal install step.

I've committed it with those minor issues fixed, thanks!

-- 
Bye, Peter Korsgaard
