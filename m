From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 22 Mar 2015 09:34:05 +0200
Subject: [Buildroot] [PATCH 2/2] Add support for lirc files,
 lircd and irw etc
In-Reply-To: <1426928785-806-2-git-send-email-github@wilberforce.co.nz>
References: <1426928785-806-1-git-send-email-github@wilberforce.co.nz>
 <1426928785-806-2-git-send-email-github@wilberforce.co.nz>
Message-ID: <20150322073405.GD2825@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Rhys,

Thanks for your Buildroot contribution.

Please merge this patch with the previous one, and send as a single patch.

Subject should be: "lirc-tools: new package".

On Sat, Mar 21, 2015 at 10:06:25PM +1300, Rhys Williams wrote:
> Signed-off-by: Rhys Williams <github@wilberforce.co.nz>
> ---
>  package/lirc-tools/Config.in     | 15 +++++++++++++++
>  package/lirc-tools/S25lircd      | 39 +++++++++++++++++++++++++++++++++++++++
>  package/lirc-tools/lirc-tools.mk | 30 ++++++++++++++++++++++++++++++
>  3 files changed, 84 insertions(+)
>  create mode 100644 package/lirc-tools/Config.in
>  create mode 100755 package/lirc-tools/S25lircd
>  create mode 100644 package/lirc-tools/lirc-tools.mk
> 
> diff --git a/package/lirc-tools/Config.in b/package/lirc-tools/Config.in
> new file mode 100644
> index 0000000..011d85d
> --- /dev/null
> +++ b/package/lirc-tools/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_LIRC_TOOLS
> +	bool "lirc-tools"
> +	help
> +	  Linux Infrared Remote Control IR receiver/transmitter Daemon and tools
> +		  LIRC is a package that supports receiving and sending IR
> +          signals of the most common IR remote controls. It contains a
> +          daemon that decodes and sends IR signals, a mouse daemon
> +          that translates IR signals to mouse movements and a couple
> +          of user programs that allow to control your computer with a
> +          remote control.

Help lines should be indented with tab + 2 spaces just line the first help 
line above. Something went wrong with the rest.

> +          
> +	  lircd, irw, irrecord, mode2 etc
> +	  
> +	  http://www.lirc.org/
> +	  
> diff --git a/package/lirc-tools/S25lircd b/package/lirc-tools/S25lircd
> new file mode 100755
> index 0000000..ebf5ce4
> --- /dev/null
> +++ b/package/lirc-tools/S25lircd
> @@ -0,0 +1,39 @@
> +#!/bin/sh
> +#
> +# Start lirc
> +#
> +# Support for remotes - Add remotes to /etc/lirc/lircd.conf.d/
> +#
> +
> +start() {
> +	echo -n "Starting lirc: "
> +	mkdir /var/run/lirc
> +	ln -s /var/run/lirc/lircd /dev/lircd
> +	#lircd -O /etc/lirc/lirc_options.conf

Please remove unhelpful comments.

> +	start-stop-daemon -b -S -q -m -p /var/run/lirc.pid --exec /usr/sbin/lircd -- -O /etc/lirc/lirc_options.conf
> +	echo "OK"
> +}
> +
> +stop() {
> +	echo -n "Stopping lirc: "
> +	start-stop-daemon -K -q -p /var/run/lirc.pid
> +	echo "OK"
> +}
> +
> +case "$1" in
> +  start)
> +	start
> +	;;
> +  stop)
> +	stop
> +	;;
> +  restart|reload)
> +	stop
> +	start
> +	;;
> +  *)
> +	echo "Usage: $0 {start|stop|restart}"
> +	exit 1
> +esac
> +
> +exit $?
> diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
> new file mode 100644
> index 0000000..cd3b38c
> --- /dev/null
> +++ b/package/lirc-tools/lirc-tools.mk
> @@ -0,0 +1,30 @@
> +#############################################################
> +#
> +# lirc-tools
> +#
> +#############################################################

80 '#' characters in each separator please.

> +
> +LIRC_TOOLS_VERSION = 0.9.2
> +LIRC_TOOLS_SOURCE = lirc-$(LIRC_TOOLS_VERSION).tar.bz2
> +LIRC_TOOLS_SITE = http://downloads.sourceforge.net/project/lirc/LIRC/$(LIRC_TOOLS_VERSION)/
> +
> +LIRC_TOOLS_INSTALL_STAGING = YES

Why is this? Does this package install libraries/headers? Please explain in 
the commit log.

> +LIRC_TOOLS_INSTALL_TARGET = YES

Not needed. This is the default.

> +LIRC_TOOLS_AUTORECONF=YES

Why? Please explain the justification for this in the commit log, and in 
inline code comment.

> +
> +LIRC_TOOLS_CONF_OPTS = --without-x --enable-sandboxed --with-driver=userspace
> +
> +LIRC_TOOLS_POST_INSTALL_TARGET_HOOKS += LIRC_TOOLS_INSTALL_TARGET_SCRIPTS
> +LIRC_TOOLS_POST_UNINSTALL_TARGET_HOOKS += LIRC_TOOLS_UNINSTALL_TARGET_SCRIPTS
> +
> +define LIRC_TOOLS_INSTALL_TARGET_SCRIPTS

Please use the <PKG>_INSTALL_INIT_SYSV variable to install SysV init scripts. 
This also obviates the need for a _HOOKS addition above.

> +	mkdir -p $(TARGET_DIR)/etc/init.d

Not needed.

> +	$(INSTALL) -m 0755 package/lirc-tools/S25lircd $(TARGET_DIR)/etc/init.d/

Please add -D.

> +endef
> +
> +define LIRC_TOOLS_UNINSTALL_TARGET_SCRIPTS
> +	rm -f $(TARGET_DIR)/etc/init.d/S25lircd
> +endef

Support for package uninstall has been removed from Buildroot some time ago. 
Please remove this part, and the _HOOKS addition above.

> +$(eval $(autotools-package))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
