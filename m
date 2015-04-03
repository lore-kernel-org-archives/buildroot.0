From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Apr 2015 15:21:32 +0200
Subject: [Buildroot] [PATCH v5] lirc-tools: new package
In-Reply-To: <1427233228-13602-1-git-send-email-github@wilberforce.co.nz>
References: <1427233228-13602-1-git-send-email-github@wilberforce.co.nz>
Message-ID: <20150403152132.5a67ce2a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rhys Williams,

Cc'ing Baruch since he gave his Reviewed-by on this patch.

On Wed, 25 Mar 2015 10:40:28 +1300, Rhys Williams wrote:
> This package adds the userspace tools and daemons LIRC -
> Linux remote control
> 
> Signed-off-by: Rhys Williams <github@wilberforce.co.nz>

Thanks, I've applied your patch after doing a number of
fixes/improvements to it. See below.

> diff --git a/package/lirc-tools/Config.in b/package/lirc-tools/Config.in
> new file mode 100644
> index 0000000..f29724b
> --- /dev/null
> +++ b/package/lirc-tools/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_LIRC_TOOLS
> +	bool "lirc-tools"

Missing dependency on BR2_USE_MMU, since fork() is used in lirc-tools.

> +	help
> +	  Linux Infrared Remote Control IR receiver/transmitter Daemon and tools
> +	  LIRC is a package that supports receiving and sending IR
> +	  signals of the most common IR remote controls. It contains a
> +	  daemon that decodes and sends IR signals, a mouse daemon
> +	  that translates IR signals to mouse movements and a couple
> +	  of user programs that allow to control your computer with a
> +	  remote control.

Lines too long, the text should be wrapped to a smaller length.

> +	  lircd, irw, irrecord, mode2 etc

This doesn't make much sense if there is no indication about what this
means, so I've removed this part.

> +	  Requires the kernel LIRC interface driver , add modules to support
> +	  your hardware.

I've slightly reworded since, and removed the space before comma.

> +	  
> +	  http://www.lirc.org/
> diff --git a/package/lirc-tools/S25lircd b/package/lirc-tools/S25lircd
> new file mode 100755
> index 0000000..e4d98f5
> --- /dev/null
> +++ b/package/lirc-tools/S25lircd
> @@ -0,0 +1,38 @@
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

This means that re-execution of the start step is not possible. I've
changed that to 'mkdir -p'.

> +	ln -s /var/run/lirc/lircd /dev/lircd

Same issue, I've changed to 'ln -sf'.

> +	start-stop-daemon -b -S -q -m -p /var/run/lirc.pid --exec /usr/sbin/lircd -- -O /etc/lirc/lirc_options.conf

With this, lircd continues to daemonize itself, so the pid stored in
/var/run/lirc.pid is not the real PID of the lircd daemon. I've changed
this to pass the '-n' option to lircd so that it doesn't daemonize
itself.

> diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
> new file mode 100644
> index 0000000..44e1848
> --- /dev/null
> +++ b/package/lirc-tools/lirc-tools.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# lirc-tools
> +#
> +################################################################################
> +
> +LIRC_TOOLS_VERSION = 0.9.2
> +LIRC_TOOLS_SOURCE = lirc-$(LIRC_TOOLS_VERSION).tar.bz2
> +LIRC_TOOLS_SITE = http://downloads.sourceforge.net/project/lirc/LIRC/$(LIRC_TOOLS_VERSION)/
> +LIRC_TOOLS_LICENSE = GPLv2+
> +LIRC_TOOLS_LICENSE_FILES = COPYING
> +
> +LIRC_TOOLS_CONF_OPTS = --without-x --enable-sandboxed --with-driver=userspace
> +
> +define LIRC_TOOLS_INSTALL_INIT_SYSV
> +	$(INSTALL) -D -m 0755 package/lirc-tools/S25lircd $(TARGET_DIR)/etc/init.d/

A full destination path is what we use when calling $(INSTALL), so I've
changed this as well.

But the most problematic issue was actually that your new package
Config.in file was not included anywhere! Seems like you forgot to 'git
add package/Config.in'.

Committed with those issues fixed, see
http://git.buildroot.net/buildroot/commit/?id=1ba7e76d5786114e05482ae6528e6da61eb12be3
for more details.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
