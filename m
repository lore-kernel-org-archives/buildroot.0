From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Jul 2019 15:23:04 +0200
Subject: [Buildroot] [PATCH] package/sshguard: new package
In-Reply-To: <1562793228-5530-1-git-send-email-angelo@amarulasolutions.com>
References: <1562793228-5530-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20190714152304.37a32f23@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Angelo,

On Wed, 10 Jul 2019 23:13:48 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> sshguard protects hosts from brute-force attacks against SSH and other
> services.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

Thanks for this contribution!

> diff --git a/package/sshguard/S39sshguard b/package/sshguard/S39sshguard
> new file mode 100644
> index 0000000..8b46bc5
> --- /dev/null
> +++ b/package/sshguard/S39sshguard
> @@ -0,0 +1,27 @@
> +#!/bin/sh
> +
> +case "$1" in
> +	start)
> +		printf "Starting sshguard: "
> +		iptables -N sshguard
> +		iptables -A INPUT -j sshguard
> +		start-stop-daemon -S -q -b -p /run/sshguard.pid \
> +			-x /usr/sbin/sshguard -- -i /run/sshguard.pid
> +		[ $? = 0 ] && echo "OK" || echo "FAIL"
> +		;;
> +	stop)
> +		printf "Stopping sshguard: "
> +		start-stop-daemon -K -q -p /run/sshguard.pid
> +		[ $? = 0 ] && echo "OK" || echo "FAIL"
> +		iptables -D INPUT -j sshguard
> +		iptables -F sshguard
> +		iptables -X sshguard
> +		;;
> +	restart)
> +		"$0" stop
> +		"$0" start
> +		;;
> +	*)
> +		echo "Usage: $0 {start|stop|restart}"
> +		;;
> +esac

For the init script, could you use package/busybox/S01syslogd as a
template ? It is now our "canonical" init script format, so we would
like to follow it for new packages.

> diff --git a/package/sshguard/sshguard.mk b/package/sshguard/sshguard.mk
> new file mode 100644
> index 0000000..634bc17
> --- /dev/null
> +++ b/package/sshguard/sshguard.mk
> @@ -0,0 +1,35 @@
> +################################################################################
> +#
> +# sshguard
> +#
> +################################################################################
> +
> +SSHGUARD_VERSION = v2.4.0
> +SSHGUARD_SITE = https://bitbucket.org/sshguard/sshguard
> +SSHGUARD_SITE_METHOD = git
> +SSHGUARD_LICENSE = GPL-2.0+

The COPYING file at
https://bitbucket.org/sshguard/sshguard/src/v2.4.0/COPYING doesn't look
like GPLv2 at all. Are you sure about this ?

Could you fix those two issues and send an updated version ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
