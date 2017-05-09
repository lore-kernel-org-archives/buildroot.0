From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 May 2017 13:51:19 +0200
Subject: [Buildroot] [PATCH 1/1] ptp4l: new package
In-Reply-To: <1494322944-22289-1-git-send-email-brain@jikos.cz>
References: <1494322944-22289-1-git-send-email-brain@jikos.cz>
Message-ID: <20170509135119.242c028e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Petr,

Thanks for this contribution! Looks mostly good, just a few comments,
see below.

On Tue,  9 May 2017 11:42:24 +0200, Petr Kulhavy wrote:

>  package/Config.in           |  1 +
>  package/ptp4l/Config.in     | 13 +++++++++++++
>  package/ptp4l/S65ptp4l      | 29 +++++++++++++++++++++++++++++
>  package/ptp4l/ptp4l.hash    |  2 ++
>  package/ptp4l/ptp4l.mk      | 37 +++++++++++++++++++++++++++++++++++++
>  package/ptp4l/ptp4l.service | 10 ++++++++++

Could you add yourself to the DEVELOPERS file for this package?

> diff --git a/package/ptp4l/Config.in b/package/ptp4l/Config.in
> new file mode 100644
> index 0000000..a070545
> --- /dev/null
> +++ b/package/ptp4l/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_PTP4L
> +	bool "ptp4l / Linux PTP"

Just:

	bool "ptp4l"

> +	help
> +	  The Linux PTP Project is the Precision Time Protocol implementation
> +	  according to IEEE standard 1588 for Linux.
> +
> +	  The dual design goals are to provide a robust implementation of the
> +	  standard and to use the most relevant and modern Application
> +	  Programming Interfaces (API) offered by the Linux kernel. Supporting
> +	  legacy APIs and other platforms is not a goal.
> +
> +	  http://linuxptp.sourceforge.net/
> +

Unneeded empty new line.

> +case "$1" in
> +  start)
> +	printf "Starting ptp4l: "
> +	start-stop-daemon -S -b -q -x /usr/sbin/ptp4l -- -A -i eth0
> +	if [ $? != 0 ]; then
> +		echo "FAILED"
> +		exit 1
> +	else
> +		echo "OK"
> +	fi

Use:

	[ $? = 0 ] && echo "OK" || echo "FAIL"

Also, please specify a PID file using:

	-p /var/run/ptp4l.pid

> +  stop)
> +	printf "Stopping ptp4l: "
> +	start-stop-daemon -K -q -x /usr/sbin/ptp4l

And use the PID file here as well.

> +  restart|reload)
> +	;;

Nothing?

> +PTP4L_VERSION = 1.8
> +PTP4L_SOURCE = linuxptp-$(PTP4L_VERSION).tgz
> +PTP4L_SITE = http://sourceforge.net/projects/linuxptp/files/v$(PTP4L_VERSION)
> +PTP4L_LICENSE = GPLv2

You should use SPDX license code, so instead of GPLv2 it should be
GPL-2.0.

However, after checking the actual tarball, it seems like the license
is GPL-2.0+ (i.e GPLv2 or later).

> +PTP4L_LICENSE_FILES = COPYING
> +PTP4L_CFLAGS = $(TARGET_CFLAGS)

Why is this variable useful?

> +
> +

One too many empty new line.

> +define PTP4L_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) KBUILD_OUTPUT=$(TARGET_DIR) CC=$(TARGET_CC) EXTRA_CFLAGS="$(PTP4L_CFLAGS)" -C $(@D) all

Just use TARGET_CFLAGS instead of PTP4L_CFLAGS.

Also, split this line that is a bit too long.

What is KBUILD_OUTPUT used for ?

> +endef
> +
> +define PTP4L_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) prefix=$(TARGET_DIR)/usr $(TARGET_CONFIGURE_OPTS) -C $(@D) install

Please use instead:

	prefix=/usr DESTDIR=$(TARGET_DIR)

Why are you passing TARGET_CONFIGURE_OPTS at install time and not build
time ?

> +endef
> +
> +define PTP4L_INSTALL_INIT_SYSV
> +	$(INSTALL) -m 755 -D $(@D)/package/ptp4l/S65ptp4l \
> +		$(TARGET_DIR)/etc/init.d/S65ptp4l
> +endef
> +
> +define PTP4L_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -D -m 644 $(PTP4L_PKGDIR)/ptp4l.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/ptp4l.service
> +	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +	ln -sf ../../../../usr/lib/systemd/system/ptp4l.service \
> +		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ptp4l.service
> +endef
> +
> +$(eval $(generic-package))
> +

Useless empty new line.

Final questions/comments:

 - Why is your package named ptp4l and not linuxptp like the upstream
   tarball/project ?

 - Make sure to run support/scripts/check-package (to verify that there
   are no coding style issues in your package) and
   support/scripts/test-pkg (to make sure your package builds fine with
   all toolchains).

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
