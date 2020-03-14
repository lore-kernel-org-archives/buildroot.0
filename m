From: Carlos Santos <unixmania@gmail.com>
Date: Sat, 14 Mar 2020 09:13:54 -0300
Subject: [Buildroot] [PATCH v5 1/2] package/netdata: new package
In-Reply-To: <20200312160040.3416161-1-m.niestroj@grinn-global.com>
References: <20200312160040.3416161-1-m.niestroj@grinn-global.com>
Message-ID: <CAJ4jsade7E3qgdaFaTZq2fMgpxpE26nmrjzjU6Kzm8f7os7iZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 12, 2020 at 1:01 PM Marcin Niestroj
<m.niestroj@grinn-global.com> wrote:
>
> Always provide --disable-dbengine configuration option, because we do
> not support libjudy dependency that is required otherwise.
>
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
> changes v4 -> v5:
>  - use 1.20.0 instead of 1.19.0 version
>  - libuv is hard requirement now, so it was added to dependencies
>  - zlib is hard requirement as well, because it is needed to properly
>    compile project (missing uLong typedef otherwise)
>  - patch solving race condition during installation has been dropped,
>    because it is already part of 1.20.0
>
> changes v3 -> v4:
>  - use 1.19.0 instead of 1.18.1 version
>  - drop musl fix, which is now part of 1.19.0 netdata version
>  - use patch from upstream netdata (which will be part of next release) that
>    removes use of .keep files
>  - rebase on Builroot master
>
> changes v2 -> v3:
>  - add patch that removes installation of .keep files for /var/cache/netdata and
>    /var/log/netdata directories; this solves a race condition when installing
>    .keep file to the same directory (/tmp/netdata with default skeleton) from
>    multiple threads
>  - add S60netdata sysv-init script, which creates needed directories
>    (/var/cache/netdata and /var/log/netdata) (suggested by Matt)
>
> changes v1 -> v2:
>  - squash DEVELOPERS update (suggested by Arnout),
>  - reduce number of required dependencies and support them as optional:
>    - json-c: there are few custom JSON handling function if json-c library is
>      not provided,
>    - openssl: enable or disable https support based on its availability (and
>      solve openssl not being in netdata.mk file - suggested by Matt),
>  - add optional dependencies on cups, nfacct and zlib,
>  - enable or disable -flto based on BR2_GCC_ENABLE_LTO
>  - drop libuv and lz4 dependencies, because it is not required with
>    --disable-dbengine option,
>  - add comment about NETDATA_AUTORECONF (suggested by Matt),
>  - apply upstreamed patch to fix musl build (musl build was not failing with v1
>    patch but did with v2).
>
>  DEVELOPERS                   |  1 +
>  package/Config.in            |  1 +
>  package/netdata/Config.in    | 22 +++++++++++++++
>  package/netdata/S60netdata   | 41 +++++++++++++++++++++++++++
>  package/netdata/netdata.hash |  3 ++
>  package/netdata/netdata.mk   | 55 ++++++++++++++++++++++++++++++++++++
>  6 files changed, 123 insertions(+)
>  create mode 100644 package/netdata/Config.in
>  create mode 100644 package/netdata/S60netdata
>  create mode 100644 package/netdata/netdata.hash
>  create mode 100644 package/netdata/netdata.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 10768a19ee..3252d02e93 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1550,6 +1550,7 @@ F:        package/lua-flu/
>  F:     package/lua-stdlib/
>  F:     package/luaossl/
>  F:     package/murata-cyw-fw/
> +F:     package/netdata/
>  F:     package/rs485conf/
>  F:     package/turbolua/
>
> diff --git a/package/Config.in b/package/Config.in
> index 146fc1bbc3..17ba22a8ff 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1932,6 +1932,7 @@ menu "Miscellaneous"
>         source "package/linux-syscall-support/Config.in"
>         source "package/mcrypt/Config.in"
>         source "package/mobile-broadband-provider-info/Config.in"
> +       source "package/netdata/Config.in"
>         source "package/proj/Config.in"
>         source "package/qemu/Config.in"
>         source "package/qpdf/Config.in"
> diff --git a/package/netdata/Config.in b/package/netdata/Config.in
> new file mode 100644
> index 0000000000..88f88cb7ed
> --- /dev/null
> +++ b/package/netdata/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_PACKAGE_NETDATA
> +       bool "netdata"
> +       depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +       depends on BR2_USE_MMU # fork()
> +       depends on !BR2_STATIC_LIBS # libuv
> +       depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
> +       select BR2_PACKAGE_LIBUV
> +       select BR2_PACKAGE_UTIL_LINUX
> +       select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> +       select BR2_PACKAGE_ZLIB
> +       help
> +         Netdata is distributed, real-time, performance and health
> +         monitoring for systems and applications. It is a highly
> +         optimized monitoring agent you install on all your systems and
> +         containers.
> +
> +         https://github.com/netdata/netdata
> +
> +comment "netdata needs a toolchain w/ NPTL, dynamic library"
> +       depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
> +       depends on BR2_USE_MMU
> +       depends on BR2_TOOLCHAIN_HAS_SYNC_4
> diff --git a/package/netdata/S60netdata b/package/netdata/S60netdata
> new file mode 100644
> index 0000000000..20ce8a22e9
> --- /dev/null
> +++ b/package/netdata/S60netdata
> @@ -0,0 +1,41 @@
> +#!/bin/sh
> +#
> +# netdata        Starts netdata.
> +#
> +
> +# Create needed directories.
> +[ -d /var/cache/netdata ] || mkdir -p /var/cache/netdata
> +[ -d /var/lib/netdata ] || mkdir -p /var/lib/netdata
> +[ -d /var/log/netdata ] || mkdir -p /var/log/netdata
> +
> +start() {
> +       printf "Starting netdata: "
> +       /usr/sbin/netdata -u root
> +       echo "OK"
> +}
> +stop() {
> +       printf "Stopping netdata: "
> +       killall netdata
> +       echo "OK"
> +}
> +restart() {
> +       stop
> +       start
> +}
> +
> +case "$1" in
> +  start)
> +       start
> +       ;;
> +  stop)
> +       stop
> +       ;;
> +  restart|reload)
> +       restart
> +       ;;
> +  *)
> +       echo "Usage: $0 {start|stop|restart}"
> +       exit 1
> +esac
> +
> +exit $?
> diff --git a/package/netdata/netdata.hash b/package/netdata/netdata.hash
> new file mode 100644
> index 0000000000..6c79e97017
> --- /dev/null
> +++ b/package/netdata/netdata.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256 c739e0fa8d6d7f433c0c7c8016b763e8f70519d67f0b5e7eca9ee5318f210d90  netdata-1.20.0.tar.gz
> +sha256 0e5fd9d833efe9b79f784d1903281554af82d1b4261af67d35455728e5572aa6  LICENSE
> diff --git a/package/netdata/netdata.mk b/package/netdata/netdata.mk
> new file mode 100644
> index 0000000000..5ba94c7eda
> --- /dev/null
> +++ b/package/netdata/netdata.mk
> @@ -0,0 +1,55 @@
> +################################################################################
> +#
> +# netdata
> +#
> +################################################################################
> +
> +NETDATA_VERSION = 1.20.0
> +NETDATA_SITE = $(call github,netdata,netdata,v$(NETDATA_VERSION))
> +NETDATA_LICENSE = GPL-3.0
> +NETDATA_LICENSE_FILES = LICENSE
> +# netdata's source code is released without a generated configure script
> +NETDATA_AUTORECONF = YES
> +NETDATA_CONF_OPTS = --disable-dbengine
> +NETDATA_DEPENDENCIES = libuv util-linux zlib
> +
> +ifeq ($(BR2_GCC_ENABLE_LTO),y)
> +NETDATA_CONF_OPTS += --enable-lto
> +else
> +NETDATA_CONF_OPTS += --disable-lto
> +endif
> +
> +ifeq ($(BR2_PACKAGE_CUPS),y)
> +NETDATA_CONF_OPTS += --enable-plugin-cups
> +NETDATA_DEPENDENCIES += cups
> +else
> +NETDATA_CONF_OPTS += --disable-plugin-cups
> +endif
> +
> +ifeq ($(BR2_PACKAGE_JSON_C),y)
> +NETDATA_CONF_OPTS += --enable-jsonc
> +NETDATA_DEPENDENCIES += json-c
> +else
> +NETDATA_CONF_OPTS += --disable-jsonc
> +endif
> +
> +ifeq ($(BR2_PACKAGE_NFACCT),y)
> +NETDATA_CONF_OPTS += --enable-plugin-nfacct
> +NETDATA_DEPENDENCIES += nfacct
> +else
> +NETDATA_CONF_OPTS += --disable-plugin-nfacct
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +NETDATA_CONF_OPTS += --enable-https
> +NETDATA_DEPENDENCIES += openssl
> +else
> +NETDATA_CONF_OPTS += --disable-https
> +endif
> +
> +define NETDATA_INSTALL_INIT_SYSV
> +       $(INSTALL) -D -m 755 package/netdata/S60netdata \
> +               $(TARGET_DIR)/etc/init.d/S60netdata
> +endef
> +
> +$(eval $(autotools-package))
> --
> 2.25.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

We use start-stop-daemon in the init scripts. Please refer to
package/sysklogd/S01syslogd as a template.

Since netdata always damonizes but does not create a pid file, you can
use pidof, as made in package/irqbalance/S13irqbalance (which by the
way was not converted to the current template yet).

Finally, I saw that netdata provides a systemd unit file in
contrib/debian/netdata.service. It would be good to check if it works
and add NETDATA_INSTALL_INIT_SYSTEMD to netdata.mk. Notice that this
is just a suggestion, since it can be done it in a later patch.

--
Carlos Santos <unixmania@gmail.com>
