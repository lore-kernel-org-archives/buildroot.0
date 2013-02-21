From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Feb 2013 22:21:22 +0100
Subject: [Buildroot] [PATCH] new package: consolekit
In-Reply-To: <1361467992-9438-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1361467992-9438-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <201302212221.23206.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan, All,

On Thursday 21 February 2013 Stefan Fr?berg wrote:
> ConsoleKit
  ^^^
Useless line.

> ConsoleKit is a framework for defining and tracking users,
> login sessions, and seats.
> 
> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
[--SNIP--]
> diff --git a/package/consolekit/90-consolekit b/package/consolekit/90-consolekit
> new file mode 100644
> index 0000000..358fc24
> --- /dev/null
> +++ b/package/consolekit/90-consolekit

Did you author that file? If not, they please point to where you got it
from. If yes, say so. (In a comment in the file.)

[--SNIP--]
> diff --git a/package/consolekit/Config.in b/package/consolekit/Config.in
> new file mode 100644
> index 0000000..905dada
> --- /dev/null
> +++ b/package/consolekit/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_CONSOLEKIT
> +	bool "consolekit"
> +	select BR2_PACKAGE_DBUS_GLIB
> +	select BR2_PACKAGE_LIBGLIB2

You need to propagate the dbus-glib dependencies here:
    depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
    depends on BR2_USE_MMU # dbus
    select BR2_PACKAGE_DBUS_GLIB
    depends on BR2_USE_WCHAR # glib2

I am not sure we want to do all of that. Maybe just add instead:
    depend on BR2_PACKAGE_DBUS_GLIB

Peter, your opinion?

> +	select BR2_PACKAGE_XLIB_LIBX11

And the xlib_libX11 dependencies too:
    depends on BR2_PACKAGE_XORG7 # xlib_libX11

Note: for other patckages, we'd add a 'select BR2_PACKAGE_XORG7', but
as xorg is xonsidered a /huge/ package, we usualy use 'depends on' it.

> +	select BR2_PACKAGE_LIBXSLT
> +	select BR2_PACKAGE_LINUX_PAM

And dependencies of linux-pam:
    depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam

> +	select BR2_PACKAGE_POLKIT

And add dependencies for polkit:
    depends on BR2_USE_WCHAR # libglib2

[--SNIP--]
> diff --git a/package/consolekit/S35consolekit b/package/consolekit/S35consolekit
> new file mode 100755
> index 0000000..000f719
> --- /dev/null
> +++ b/package/consolekit/S35consolekit

Ditto: origin of this file?

> @@ -0,0 +1,26 @@
> +#!/bin/sh
> +#
> +# Start the ConsoleKit....
> +#
> +
> +case "$1" in
> +  start)
> + 	echo "Starting ConsoleKit daemon..."
> +	start-stop-daemon --start --pidfile /var/run/ConsoleKit/pid \
> +			  --exec /usr/sbin/console-kit-daemon --
> +	;;
> +  stop)
> +	echo -n "Stopping ConsoleKit daemon..."
> +	start-stop-daemon --stop --pidfile /var/run/ConsoleKit/pid
> +	;;
> +  restart|reload)
> +	"$0" stop
> +	"$0" start
> +	;;
> +  *)
> +	echo "Usage: $0 {start|stop|restart}"
> +	exit 1
> +esac
> +
> +exit $?

Hu? Unneeded, the shell will always exit with the last command's
error-code.

(Well, we have S40network that does that, but it's useless).

> diff --git a/package/consolekit/consolekit-cleanup_console_tags.patch b/package/consolekit/consolekit-cleanup_console_tags.patch
> new file mode 100644
> index 0000000..27e9cc3
> --- /dev/null
> +++ b/package/consolekit/consolekit-cleanup_console_tags.patch
[--SNIP--]

For your patches, can't you use:
    CONSOLEKIT_PATCHES = URL-of-patch-1 \
                         URL-of-patch-2 \
                         URL-of-patch-3

> diff --git a/package/consolekit/consolekit.mk b/package/consolekit/consolekit.mk
> new file mode 100644
> index 0000000..25b552c
> --- /dev/null
> +++ b/package/consolekit/consolekit.mk
> @@ -0,0 +1,40 @@
> +#############################################################
> +#
> +# ConsoleKit
> +#
> +#############################################################
> +
> +CONSOLEKIT_VERSION = 0.4.5
> +CONSOLEKIT_SOURCE = ConsoleKit-$(CONSOLEKIT_VERSION).tar.bz2
> +CONSOLEKIT_SITE = http://www.freedesktop.org/software/ConsoleKit/dist
> +CONSOLEKIT_DEPENDENCIES = dbus-glib libglib2 linux-pam polkit xlib_libX11 \
> +			  libxslt zlib

License ?

> +CONSOLEKIT_INSTALL_STAGING = YES
> +CONSOLEKIT_AUTORECONF = YES
> +CONSOLEKIT_CONF_OPT += --disable-static --localstatedir=/var \
> +			--libexecdir=/usr/lib/ConsoleKit \
> +			--enable-pam-module --disable-udev-acl \
> +			--with-dbus-services=/usr/share/dbus-1/services \
> +			--with-pam-module-dir=/lib/security
> +
> +define	CONSOLEKIT_POST_INSTALL

Space-damage: use a single space between 'define' and the variable name,
not a tab.

> +	# Append ConsoleKit Pam Module Configuration stuff to system-session
> +	cat package/consolekit/system-session >> \
> +	$(TARGET_DIR)/etc/pam.d/system-session

Indent with a secondleading tab on continuation lines, please.

> +	
   ^^^
No leading-tab on blank lines.

> +	# Helper script that creates a file in /var/run/console named as 
> +	# the currently logged in user and that contains the D-Bus address of 
> +	# the session
> +	$(INSTALL) -m 755 -D package/consolekit/pam-foreground-compat.ck \
> +	$(TARGET_DIR)/usr/lib/ConsoleKit/run-session.d/pam-foreground-compat.ck

Ditto: further indent continuation lines.

> +
> +

One single separator line, please.

> +	$(INSTALL) -D package/consolekit/90-consolekit $(TARGET_DIR)/etc/X11/xinit/xinitrc.d/90-consolekit
> +
> +	# We start right after dbus which is included as /etc/init.d/S30dbus in buildroot
> +	$(INSTALL) -m 755 -D package/consolekit/S35consolekit $(TARGET_DIR)/etc/init.d/S35consolekit

We have infrastructure to add startup scripts:
    http://buildroot.net/downloads/manual/manual.html#generic-package-reference

Excerpt:
    LIBFOO_INSTALL_INIT_SYSV and LIBFOO_INSTALL_INIT_SYSTEMD list the
    actions to install init scripts either for the systemV-like init
    systems (busybox, sysvinit, etc.) or for the systemd units.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
