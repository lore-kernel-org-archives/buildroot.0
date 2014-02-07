From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 7 Feb 2014 23:00:00 +0100
Subject: [Buildroot] [PATCH v7 3/4] systemd: bump to v207.
In-Reply-To: <1391779295-19140-4-git-send-email-eric.le.bihan.dev@free.fr>
References: <1391779295-19140-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1391779295-19140-4-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <CAHXCMM+rLYDjzBcixCHhXeu0A3jFMBxEEsGRaD-0D2KnLe8GyA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eric,

On Fri, Feb 7, 2014 at 2:21 PM, Eric Le Bihan <eric.le.bihan.dev@free.fr> wrote:

[...]

> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 500e623..e3ea433 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -1,11 +1,21 @@
>  config BR2_PACKAGE_SYSTEMD
>         bool "systemd"
> -       depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
> +       depends on BR2_INIT_SYSTEMD
> +       depends on !BR2_avr32 # no epoll_create1
> +       depends on BR2_LARGEFILE # util-linux
> +       depends on BR2_USE_WCHAR # util-linux
>         depends on BR2_INET_IPV6
> +       depends on !BR2_PREFER_STATIC_LIB # kmod
>         depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
>         depends on BR2_USE_MMU # dbus
> +       select BR2_PACKAGE_HAS_UDEV
>         select BR2_PACKAGE_DBUS
>         select BR2_PACKAGE_LIBCAP
> +       select BR2_PACKAGE_UTIL_LINUX
> +       select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> +       select BR2_PACKAGE_KMOD
> +       select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # kmod-tools
> +       select BR2_PACKAGE_KMOD_TOOLS
>         help
>           systemd is a system and service manager for Linux, compatible with
>           SysV and LSB init scripts. systemd provides aggressive parallelization
> @@ -16,9 +26,36 @@ config BR2_PACKAGE_SYSTEMD
>           elaborate transactional dependency-based service control logic.
>           It can work as a drop-in replacement for sysvinit.
>
> +         Systemd requires a Linux kernel >= 3.0, with inotify, devtmpfs,
> +         tmpfs vfs and tmpfs POSIX ACL enabled.

Linux >= 3.0, really? IIRC systemd requires devtmpfs (available for a long
time), and cgroup which has been available since linux-2.6.36 (though the
patch to make them available on older kernel is easy to backport on older
kernel).

> +
> +         Systemd also provides udev, the userspace device daemon.
> +
> +         The selection of other packages will enable some features:
> +
> +         - libglib2 package will add support for gudev.
> +         - acl package will add support for multi-seat.
> +
>           http://freedesktop.org/wiki/Software/systemd
>
> -comment "systemd needs eudev /dev management and a toolchain w/ IPv6, threads"
> -       depends on BR2_USE_MMU
> -       depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV || !BR2_INET_IPV6 || \\
> -               !BR2_TOOLCHAIN_HAS_THREADS
> +if BR2_PACKAGE_SYSTEMD
> +
> +config BR2_PACKAGE_SYSTEMD_ALL_EXTRAS
> +       bool "enable all extras"
> +       select BR2_PACKAGE_XZ
> +       select BR2_PACKAGE_LIBGCRYPT
> +       help
> +         Enable extra features for Systemd: journal compression and
> +         signing.
> +
> +config BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY
> +       bool "HTTP server for journal events"
> +       select BR2_PACKAGE_LIBMICROHTTPD
> +       help
> +         systemd-journal-gatewayd serves journal events over the
> +         network. Clients must connect using HTTP. The server
> +         listens on port 19531 by default.
> +
> +         http://www.freedesktop.org/software/systemd/man/systemd-journal-gatewayd.service.html
> +
> +endif

[...]

> diff --git a/system/Config.in b/system/Config.in
> index 34726b0..30d8efe 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -87,20 +87,19 @@ config BR2_INIT_SYSV
>
>  config BR2_INIT_SYSTEMD
>         bool "systemd"
> +       depends on !BR2_avr32 # no epoll_create1
> +       depends on BR2_TOOLCHAIN_USES_GLIBC
>         depends on BR2_LARGEFILE
>         depends on BR2_USE_WCHAR
>         depends on BR2_INET_IPV6
> -       depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
>         depends on BR2_TOOLCHAIN_HAS_THREADS
> +       depends on BR2_TOOLCHAIN_HAS_SSP
>         depends on BR2_USE_MMU
> -       select BR2_PACKAGE_DBUS
> +       depends on !BR2_PREFER_STATIC_LIB
>         select BR2_PACKAGE_SYSTEMD

How does this play with kconfig?
Does not kconfig complain about some circular dependencies here, because
you have BR2_INIT_SYSTEMD selecting BR2_PACAKGE_SYSTEMD, while
BR2_PACKAGE_SYSTEMD depends on BR2_INIT_SYSTEMD?

>
> -comment 'systemd needs eudev /dev management and a toolchain w/ largefile, wchar, IPv6, threads'
> -       depends on BR2_USE_MMU
> -       depends on !(BR2_LARGEFILE && BR2_USE_WCHAR && \
> -                    BR2_INET_IPV6 && BR2_TOOLCHAIN_HAS_THREADS && \
> -                    BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV)
> +comment 'systemd needs an (e)glibc toolchain'
> +       depends on !BR2_TOOLCHAIN_USES_GLIBC
>
>  config BR2_INIT_NONE
>         bool "None"
> @@ -108,7 +107,7 @@ config BR2_INIT_NONE
>  endchoice
>
>  choice
> -       prompt "/dev management"
> +       prompt "/dev management" if !BR2_INIT_SYSTEMD
>         default BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS
>
>  config BR2_ROOTFS_DEVICE_CREATION_STATIC
> @@ -135,6 +134,9 @@ comment "eudev needs a toolchain w/ largefile, wchar, dynamic library"
>
>  endchoice
>
> +comment "/dev management using udev (from systemd)"
> +       depends on BR2_INIT_SYSTEMD
> +
>  config BR2_ROOTFS_DEVICE_TABLE
>         string "Path to the permission tables"
>         default "system/device_table.txt"
> --
> 1.7.9.5
>

Regards,

-- 
Samuel
