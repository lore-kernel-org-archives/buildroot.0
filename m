From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 7 Aug 2014 22:54:19 +0200
Subject: [Buildroot] [PATCH v4 1/1] rpi-userland: Fix vcfiled startup
In-Reply-To: <1407425068-7820-1-git-send-email-benoit.thebaudeau@advansee.com>
References: <1407425068-7820-1-git-send-email-benoit.thebaudeau@advansee.com>
Message-ID: <CAHXCMM+GWFpNf35LjjeKXGdU0W2cLgX+onO+JftuOSTLn3sNzA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Benoit, Yann, all,

On Thu, Aug 7, 2014 at 5:24 PM, Beno?t Th?baudeau
<benoit.thebaudeau@advansee.com> wrote:
> The VideoCore file server daemon startup script installed from this package is
> not compatible with BuildRoot (because of its naming and other Debian
> dependencies), which prevented vcfiled from starting. Hence, prevent this
> package from installing its vcfiled startup script, and add a configuration
> option to install a vcfiled SysV init script suitable for BuildRoot.
>
> Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau@advansee.com>
>
> ---
>
> Changes in v4:
>  - Use /var/run/vcfiled.pid instead of /var/run/vcfiled/vcfiled for vcfiled's
>    PID file path.
>
> Changes in v3:
>  - Add a config option to start this daemon.
>
> Changes in v2:
>  - Indent .mk rules with tabs.
>  - Simplify the new vcfiled startup script.
>  - Rename S97vcfiled to S94vcfiled for a better integration with existing init
>    scripts.
> ---
>  package/rpi-userland/Config.in       |  7 ++++++
>  package/rpi-userland/S94vcfiled      | 47 ++++++++++++++++++++++++++++++++++++
>  package/rpi-userland/rpi-userland.mk | 13 +++++++++-
>  3 files changed, 66 insertions(+), 1 deletion(-)
>  create mode 100755 package/rpi-userland/S94vcfiled
>
> diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
> index aeee5e1..89e99e0 100644
> --- a/package/rpi-userland/Config.in
> +++ b/package/rpi-userland/Config.in
> @@ -31,6 +31,13 @@ config BR2_PACKAGE_PROVIDES_LIBOPENVG
>  config BR2_PACKAGE_PROVIDES_LIBOPENMAX
>         default "rpi-userland"
>
> +config BR2_PACKAGE_RPI_USERLAND_START_VCFILED
> +       bool "Start vcfiled"
> +       depends on BR2_INIT_SYSV || BR2_INIT_BUSYBOX
> +       help
> +         vcfiled is a daemon serving files to VideoCore from the host filing
> +         system.
> +
>  endif
>
>  comment "rpi-userland needs a toolchain w/ C++, largefile, threads"
> diff --git a/package/rpi-userland/S94vcfiled b/package/rpi-userland/S94vcfiled
> new file mode 100755
> index 0000000..9a3e523
> --- /dev/null
> +++ b/package/rpi-userland/S94vcfiled
> @@ -0,0 +1,47 @@
> +#!/bin/sh
> +
> +NAME=vcfiled
> +DESC="VideoCore file server daemon $NAME"
> +DAEMON="/usr/sbin/$NAME"
> +DAEMON_ARGS=""
> +CFGFILE="/etc/default/$NAME"
> +PIDFILE="/var/run/$NAME.pid"
> +
> +# Read configuration variable file if it is present
> +[ -r "$CFGFILE" ] && . "$CFGFILE"
> +
> +do_start()
> +{
> +       echo -n "Starting $DESC: "
> +       start-stop-daemon -S -q -p "$PIDFILE" -x "$DAEMON" -- $DAEMON_ARGS &&
> +                       echo "done" || echo "failed"
> +}
> +
> +do_stop()
> +{
> +       echo -n "Stopping $DESC: "
> +       if start-stop-daemon -K -q -R TERM/30/KILL/5 -p "$PIDFILE" -n "$NAME"; then
> +               # This daemon does not remove its PID file when it exits.
> +               rm -f "$PIDFILE"
> +               echo "done"
> +       else
> +               echo "failed"
> +       fi
> +}
> +
> +case "$1" in
> +       start)
> +               do_start
> +               ;;
> +       stop)
> +               do_stop
> +               ;;
> +       restart|reload)
> +               do_stop
> +               do_start
> +               ;;
> +       *)
> +               echo "Usage: $0 {start|stop|restart|reload}" >&2
> +               exit 1
> +               ;;
> +esac
> diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
> index 81ed95c..74a0056 100644
> --- a/package/rpi-userland/rpi-userland.mk
> +++ b/package/rpi-userland/rpi-userland.mk
> @@ -9,11 +9,22 @@ RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
>  RPI_USERLAND_LICENSE = BSD-3c
>  RPI_USERLAND_LICENSE_FILES = LICENCE
>  RPI_USERLAND_INSTALL_STAGING = YES
> -RPI_USERLAND_CONF_OPT = -DVMCS_INSTALL_PREFIX=/usr
> +RPI_USERLAND_CONF_OPT = -DVMCS_INSTALL_PREFIX=/usr \
> +       -DCMAKE_C_FLAGS="-DVCFILED_LOCKFILE=\\\"/var/run/vcfiled.pid\\\""

[only about the CMake part, on the Yann's request]
Reviewed-by: Samuel Martin <s.martin49@gmail.com>

For the record:
This kind of assignation can be fragile because the CMake code may
mess up with the variable (e.g. overriding it).
But here, it is ok because none of the toolchainfile.cmake generated
by BR, nor the rpi-userland CMake code override the CMAKE_C_FLAGS
variable, they just append or prepend stuff to it.

>
>  RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg
>
> +ifeq ($(BR2_PACKAGE_RPI_USERLAND_START_VCFILED),y)
> +define RPI_USERLAND_INSTALL_INIT_SYSV
> +       $(INSTALL) -m 0755 -D package/rpi-userland/S94vcfiled \
> +                       $(TARGET_DIR)/etc/init.d/S94vcfiled
> +endef
> +endif
> +
>  define RPI_USERLAND_POST_TARGET_CLEANUP
> +       rm -f $(TARGET_DIR)/etc/init.d/vcfiled
> +       rm -f $(TARGET_DIR)/usr/share/install/vcfiled
> +       rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share/install
>         rm -Rf $(TARGET_DIR)/usr/src
>  endef
>  RPI_USERLAND_POST_INSTALL_TARGET_HOOKS += RPI_USERLAND_POST_TARGET_CLEANUP
> --
> 1.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Cheers,

-- 
Samuel
