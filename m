From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jul 2020 21:55:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/dbus: use /run for runtime data
In-Reply-To: <20200717215521.8868-1-nolange79@gmail.com>
References: <20200717215521.8868-1-nolange79@gmail.com>
Message-ID: <20200718195554.GN18825@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Norbert, All,

On 2020-07-17 23:55 +0200, Norbert Lange spake thusly:
> All init systems supported by busybox support the /run

s/busybox/Buildroot/

> directory and have a symlink for /var/run.
> 
> Use the /run directory directly.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>

Applied to master, with the above fixed. Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/dbus/S30dbus | 6 +++---
>  package/dbus/dbus.mk | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/dbus/S30dbus b/package/dbus/S30dbus
> index 52646cea2f..26772755d7 100644
> --- a/package/dbus/S30dbus
> +++ b/package/dbus/S30dbus
> @@ -7,11 +7,11 @@
>  #               and other messages. See http://www.freedesktop.org/software/dbus/
>  #
>  # processname: dbus-daemon
> -# pidfile: /var/run/messagebus.pid
> +# pidfile: /run/messagebus.pid
>  #
>  
>  # Create needed directories.
> -[ -d /var/run/dbus ] || mkdir -p /var/run/dbus
> +[ -d /run/dbus ] || mkdir -p /run/dbus
>  [ -d /var/lock/subsys ] || mkdir -p /var/lock/subsys
>  [ -d /tmp/dbus ] || mkdir -p /tmp/dbus
>  
> @@ -38,7 +38,7 @@ stop() {
>      echo "done"
>      if [ $RETVAL -eq 0 ]; then
>          rm -f /var/lock/subsys/dbus-daemon
> -        rm -f /var/run/messagebus.pid
> +        rm -f /run/messagebus.pid
>      fi
>  }
>  
> diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
> index 5c2a5fb2cc..312c6ba1d8 100644
> --- a/package/dbus/dbus.mk
> +++ b/package/dbus/dbus.mk
> @@ -15,7 +15,7 @@ define DBUS_PERMISSIONS
>  endef
>  
>  define DBUS_USERS
> -	dbus -1 dbus -1 * /var/run/dbus - dbus DBus messagebus user
> +	dbus -1 dbus -1 * /run/dbus - dbus DBus messagebus user
>  endef
>  
>  DBUS_DEPENDENCIES = host-pkgconf expat
> @@ -27,8 +27,8 @@ DBUS_CONF_OPTS = \
>  	--disable-xml-docs \
>  	--disable-doxygen-docs \
>  	--with-xml=expat \
> -	--with-system-socket=/var/run/dbus/system_bus_socket \
> -	--with-system-pid-file=/var/run/messagebus.pid
> +	--with-system-socket=/run/dbus/system_bus_socket \
> +	--with-system-pid-file=/run/messagebus.pid
>  
>  ifeq ($(BR2_STATIC_LIBS),y)
>  DBUS_CONF_OPTS += LIBS='-pthread'
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
