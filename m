From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 28 May 2012 22:15:33 +0200
Subject: [Buildroot] [PATCH v2] busybox: Install S41inetd and inetd.conf
	if inetd is enabled in busybox.
In-Reply-To: <1338190882-4548-1-git-send-email-keguang.zhang@gmail.com>
 (Kelvin Cheung's message of "Mon, 28 May 2012 15:41:22 +0800")
References: <1338190882-4548-1-git-send-email-keguang.zhang@gmail.com>
Message-ID: <87ipfg6p0a.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Kelvin" == Kelvin Cheung <keguang.zhang@gmail.com> writes:

Hi,

 Kelvin> Install S41inetd and inetd.conf if inetd is enabled in busybox.
 Kelvin> Add ftpd to /etc/inetd.conf if inetd and ftpd are enabled.
 Kelvin> Add telnetd to /etc/inetd.conf if inetd and telnetd are enabled.
 Kelvin> Add tftpd to /etc/inetd.conf if inetd and tftpd are enabled.

 Kelvin> Changes for v2:
 Kelvin> 	Update ftpd and tftpd configuration in inetd.conf.

These changes should go after the '---' line, otherwise they get
included in the commit message.


 Kelvin> Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
 Kelvin> ---
 Kelvin>  package/busybox/S41inetd   |   28 ++++++++++++++++++++++++++++
 Kelvin>  package/busybox/busybox.mk |   32 ++++++++++++++++++++++++++++++++
 Kelvin>  package/busybox/inetd.conf |    3 +++
 Kelvin>  3 files changed, 63 insertions(+), 0 deletions(-)
 Kelvin>  create mode 100644 package/busybox/S41inetd
 Kelvin>  create mode 100644 package/busybox/inetd.conf

 Kelvin> diff --git a/package/busybox/S41inetd b/package/busybox/S41inetd
 Kelvin> new file mode 100644
 Kelvin> index 0000000..9d7d3cd
 Kelvin> --- /dev/null
 Kelvin> +++ b/package/busybox/S41inetd
 Kelvin> @@ -0,0 +1,28 @@
 Kelvin> +#!/bin/sh
 Kelvin> +#
 Kelvin> +# Starts the inetd daemon.
 Kelvin> +#
 Kelvin> +
 Kelvin> +NAME=inetd
 Kelvin> +DAEMON=/usr/sbin/$NAME
 Kelvin> +
 Kelvin> +case "$1" in
 Kelvin> +  start)
 Kelvin> +	echo -n "Starting $NAME: "
 Kelvin> +	start-stop-daemon -S -q -x $DAEMON && echo "OK" || echo "Failed"

Minor nit - We typically use the '-m -p /var/run/$NAME.pid' options to
get ssd to create/use a pidfile. If you do that, then you need to stop
inetd from forking into the background with -f.

 Kelvin> +	;;
 Kelvin> +  stop)
 Kelvin> +	echo -n "Stopping $NAME: "
 Kelvin> +	start-stop-daemon -K -q -n $NAME && echo "OK" || echo "Failed"
 Kelvin> +	;;
 Kelvin> +  restart|reload)
 Kelvin> +	$0 stop
 Kelvin> +	$0 start
 Kelvin> +	;;
 Kelvin> +  *)
 Kelvin> +	echo $"Usage: $0 {start|stop|restart}"
 Kelvin> +	exit 1
 Kelvin> +esac
 Kelvin> +
 Kelvin> +exit $?
 Kelvin> +
 Kelvin> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
 Kelvin> index 1d988f8..4ddd552 100644
 Kelvin> --- a/package/busybox/busybox.mk
 Kelvin> +++ b/package/busybox/busybox.mk
 Kelvin> @@ -155,6 +155,36 @@ define BUSYBOX_INSTALL_WATCHDOG_SCRIPT
 Kelvin>  endef
 Kelvin>  endif
 
 Kelvin> +define BUSYBOX_INSTALL_INETD_SCRIPT
 Kelvin> +	if grep -q CONFIG_INETD=y $(@D)/.config; then \
 Kelvin> +		[ -f $(TARGET_DIR)/etc/init.d/S41inetd ] || \
 Kelvin> +			$(INSTALL) -m 0755 -D package/busybox/S41inetd \
 Kelvin> +				$(TARGET_DIR)/etc/init.d/S41inetd; \
 Kelvin> +	else rm -f $(TARGET_DIR)/etc/init.d/S41inetd; fi
 Kelvin> +endef
 Kelvin> +define BUSYBOX_INSTALL_INETD_CONF
 Kelvin> +	if grep -q CONFIG_INETD=y $(@D)/.config; then \


It would imho be better to merge INETD_SCRIPT and INETD_CONF handling so
we don't need to check if inetd is enabled twice.


 Kelvin> +		[ -f $(TARGET_DIR)/etc/inetd.conf ] || \
 Kelvin> +			install -D -m 0644 package/busybox/inetd.conf \
 Kelvin> +				$(TARGET_DIR)/etc/inetd.conf; \
 Kelvin> +		if grep -q CONFIG_FTPD=y $(@D)/.config; then \
 Kelvin> +			if ! grep -q '^ftp' $(TARGET_DIR)/etc/inetd.conf; then \
 Kelvin> +				echo -e "ftp\tstream\ttcp\tnowait\troot\tftpd\tftpd -w /root" >> $(TARGET_DIR)/etc/inetd.conf; \


Giving writable root permissions by default doesn't really sound right
to me.



 Kelvin> +			fi; \
 Kelvin> +		else $(SED) '/^ftp/d' $(TARGET_DIR)/etc/inetd.conf; fi; \
 Kelvin> +		if grep -q CONFIG_TELNETD=y $(@D)/.config; then \
 Kelvin> +			if ! grep -q '^telnet' $(TARGET_DIR)/etc/inetd.conf; then \
 Kelvin> +				echo -e "telnet\tstream\ttcp\tnowait\troot\ttelnetd\ttelnetd -i" >> $(TARGET_DIR)/etc/inetd.conf; \
 Kelvin> +			fi; \
 Kelvin> +		else $(SED) '/^telnet/d' $(TARGET_DIR)/etc/inetd.conf; fi; \
 Kelvin> +		if grep -q CONFIG_TFTPD=y $(@D)/.config; then \
 Kelvin> +			if ! grep -q '^tftp' $(TARGET_DIR)/etc/inetd.conf; then \
 Kelvin> +				echo -e "tftp\tdgram\tudp\tnowait\troot\ttftpd\ttftpd -l -c /root" >> $(TARGET_DIR)/etc/inetd.conf; \


Same here.

Maybe /etc/inetd.conf content is too hard to provide a good default for,
and we should just stick to the init script + an empty inetd.conf.

-- 
Bye, Peter Korsgaard
