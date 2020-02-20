From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Feb 2020 19:15:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/restorecond: Fix restorecond
 init script.
In-Reply-To: <20200204100942.421804-1-aduskett@gmail.com>
References: <20200204100942.421804-1-aduskett@gmail.com>
Message-ID: <20200220191528.09723ed0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Feb 2020 02:09:42 -0800
Adam Duskett <aduskett@gmail.com> wrote:

> diff --git a/package/restorecond/S20restorecond b/package/restorecond/S20restorecond
> new file mode 100644
> index 0000000000..1abf678177
> --- /dev/null
> +++ b/package/restorecond/S20restorecond

This script needs to be rewritten to follow the coding style / best
practices of package/busybox/S01syslogd, which is our reference init
script.

> @@ -0,0 +1,45 @@
> +#!/bin/sh
> +RESTORECOND=/usr/sbin/restorecond
> +PIDFILE=/run/restorecond.pid
> +if [ -x /usr/sbin/selinuxenabled ]; then

Do we need to check if it's available ? Isn't selinuxenabled one of the
dependencies of this package anyway ?

> +  if ! /usr/sbin/selinuxenabled; then
> +    echo "Selinux is not enabled!"
> +    exit 7

Why 7 ?

> +  fi
> +fi
> +
> +# Check that we are root ... so non-root users stop here
> +if [ $EUID != 0 ]; then
> +  echo "Restorecond must be ran as root!"

Useless, init scripts in Buildroot are executed as root.

> +  exit 4
> +fi
> +
> +test -x /usr/sbin/restorecond  || exit 5
> +test -f /etc/selinux/restorecond.conf  || exit 6

Please drop these checks as well.

> +
> +case "$1" in
> +  start)
> +    echo "Starting restorecond..."
> +    unset HOME MAIL USER USERNAME
> +    start-stop-daemon -S -x "${RESTORECOND}" -p "${PIDFILE}"
> +  ;;
> +  stop)
> +  echo "Stopping restorecond..."
> +  start-stop-daemon -K -x "${RESTORECOND}" -p "${PIDFILE}" -o
> +  ;;
> +  reload|force-reload)
> +  echo "Reloading restorecond..."
> +  restart
> +  ;;
> +  restart)
> +  stop
> +  start

Follow the coding style of package/busybox/S01syslogd here.

> +  condrestart)
> +  [ -e /var/lock/subsys/restorecond ] && restart

We don't have any condrestart target in any other script.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
