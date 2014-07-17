From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Jul 2014 18:58:14 +0200
Subject: [Buildroot] [PATCH 1/1] dcron: provide init script
In-Reply-To: <1405589648-26777-1-git-send-email-alvaro.gamez@hazent.com>
References: <20140715211719.0ea2e053@free-electrons.com>
 <1405589648-26777-1-git-send-email-alvaro.gamez@hazent.com>
Message-ID: <20140717165814.GB3737@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alvaro, All,

On 2014-07-17 11:34 +0200, Alvaro G. M spake thusly:
> dcron doesn't create a pid file, so we run it in foreground but make
> start-stop-daemon create the pidfile and move the daemon to background.
> 
> Give it a number greater than exim's init script, so job output email
> can be sent.
> 
> Signed-off-by: Alvaro G. M <alvaro.gamez@hazent.com>
> ---
>  package/dcron/S90dcron | 22 ++++++++++++++++++++++
>  package/dcron/dcron.mk |  1 +
>  2 files changed, 23 insertions(+)
>  create mode 100644 package/dcron/S90dcron
> 
> diff --git a/package/dcron/S90dcron b/package/dcron/S90dcron
> new file mode 100644
> index 0000000..c2925fd
> --- /dev/null
> +++ b/package/dcron/S90dcron
> @@ -0,0 +1,22 @@
> +#!/bin/sh
> +
> +case "$1" in
> +	start)
> +		echo -n "Starting cron ... "
> +		start-stop-daemon -S -q -m -b -p /var/run/dcron.pid --exec /usr/sbin/crond -- -f
> +		echo "done."
> +		;;
> +	stop)
> +		echo -n "Stopping cron ..."
> +		start-stop-daemon -K -q -p /var/run/dcron.pid
> +		echo "done."
> +		;;
> +	restart)
> +		$0 stop
> +		sleep 1
> +		$0 start
> +		;;
> +	*)
> +		echo "usage: $0 {start|stop|restart}"
> +		;;
> +esac
> diff --git a/package/dcron/dcron.mk b/package/dcron/dcron.mk
> index 5174e38..e5a28f2 100644
> --- a/package/dcron/dcron.mk
> +++ b/package/dcron/dcron.mk
> @@ -27,6 +27,7 @@ define DCRON_INSTALL_TARGET_CMDS
>  	$(INSTALL) -d -m0755 $(TARGET_DIR)/var/spool/cron/crontabs \
>  	        $(TARGET_DIR)/etc/cron.daily $(TARGET_DIR)/etc/cron.hourly \
>  	        $(TARGET_DIR)/etc/cron.monthly $(TARGET_DIR)/etc/cron.weekly
> +	$(INSTALL) -m 0755 -D package/dcron/S90dcron $(TARGET_DIR)/etc/init.d/S90dcron

This should be in a DCRON_INSTALL_INIT_SYSV macro, see:
    http://buildroot.org/downloads/manual/manual.html#_infrastructure_for_packages_with_specific_build_systems

Also provide the systemd unit file (if it is available in the package!)
with the DCRON_INSTALL_INIT_SYSTEMD macro.

Regards,
Yann E. MORIN.

>  endef
>  
>  $(eval $(generic-package))
> -- 
> 2.0.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
