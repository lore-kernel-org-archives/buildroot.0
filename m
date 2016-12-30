From: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
Date: Fri, 30 Dec 2016 11:40:17 -0200
Subject: [Buildroot] [PATCH] package/upower: new package
In-Reply-To: <20161229202907.12217-1-romain.naour@gmail.com>
References: <20161229202907.12217-1-romain.naour@gmail.com>
Message-ID: <CAPdpN3C9Pq8uF5GQxshw2xSe0MmZ925OgqCFORF2_D7JJfHFbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 29, 2016 at 6:29 PM, Romain Naour <romain.naour@gmail.com> wrote:
> Backport an upstream patch.
>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
> ---
>  package/Config.in                                  |  1 +
>  .../0001-daemon-fix-get_critical_action.patch      | 34 ++++++++++++++++++++++
>  package/upower/Config.in                           | 26 +++++++++++++++++
>  package/upower/upower.hash                         |  2 ++
>  package/upower/upower.mk                           | 25 ++++++++++++++++
>  5 files changed, 88 insertions(+)
>  create mode 100644 package/upower/0001-daemon-fix-get_critical_action.patch
>  create mode 100644 package/upower/Config.in
>  create mode 100644 package/upower/upower.hash
>  create mode 100644 package/upower/upower.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 18818fa..da9715c 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -474,6 +474,7 @@ endmenu
>         source "package/ubus/Config.in"
>         source "package/udev/Config.in"
>         source "package/udisks/Config.in"
> +       source "package/upower/Config.in"
>         source "package/usb_modeswitch/Config.in"
>         source "package/usb_modeswitch_data/Config.in"
>         source "package/usbmount/Config.in"
> diff --git a/package/upower/0001-daemon-fix-get_critical_action.patch b/package/upower/0001-daemon-fix-get_critical_action.patch
> new file mode 100644
> index 0000000..02fc55c
> --- /dev/null
> +++ b/package/upower/0001-daemon-fix-get_critical_action.patch
> @@ -0,0 +1,34 @@
> +From 28cee8e2845b094488c337c4ecfa84ada0b6be60 Mon Sep 17 00:00:00 2001
> +From: Martin Pitt <martin.pitt@ubuntu.com>
> +Date: Tue, 23 Feb 2016 09:51:07 +0100
> +Subject: [PATCH] daemon: fix get_critical_action()
> +
> +Fix copy&paste error from e7e9156f that called the wrong _complete_ function
> +for up_daemon_get_critical_action().
> +
> +https://bugs.freedesktop.org/show_bug.cgi?id=94262
> +
> +[rebase on 0.99.4]
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>

Reviewed-by: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>

> +---
> + src/up-daemon.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/up-daemon.c b/src/up-daemon.c
> +index be14cbe..e95f904 100644
> +--- a/src/up-daemon.c
> ++++ b/src/up-daemon.c
> +@@ -435,8 +435,8 @@ up_daemon_get_critical_action (UpExportedDaemon *skeleton,
> +                              GDBusMethodInvocation *invocation,
> +                              UpDaemon *daemon)
> + {
> +-      up_exported_daemon_complete_get_display_device (skeleton, invocation,
> +-                                                      up_backend_get_critical_action (daemon->priv->backend));
> ++      up_exported_daemon_complete_get_critical_action (skeleton, invocation,
> ++                                                       up_backend_get_critical_action (daemon->priv->backend));
> +       return TRUE;
> + }
> +
> +--
> +2.9.3
> +
> diff --git a/package/upower/Config.in b/package/upower/Config.in
> new file mode 100644
> index 0000000..8d9e84e
> --- /dev/null
> +++ b/package/upower/Config.in
> @@ -0,0 +1,26 @@
> +config BR2_PACKAGE_UPOWER
> +       bool "upower"
> +       depends on BR2_PACKAGE_HAS_UDEV
> +       depends on BR2_TOOLCHAIN_HAS_THREADS # libgudev, libusb
> +       depends on BR2_USE_MMU # libgudev
> +       depends on BR2_USE_WCHAR # libgudev
> +       select BR2_PACKAGE_LIBGUDEV
> +       select BR2_PACKAGE_LIBUSB
> +       help
> +         UPower is an abstraction for enumerating power devices, listening
> +         to device events and querying history and statistics. Any
> +         application or service on the system can access the
> +         org.freedesktop.UPower service via the system message bus.
> +
> +         Note: upowerd require CONFIG_TIMER_STATS enabled in the Linux
> +         kernel.
> +
> +         https://upower.freedesktop.org/
> +
> +comment "upower needs udev /dev management"
> +       depends on BR2_USE_MMU
> +       depends on !BR2_PACKAGE_HAS_UDEV
> +
> +comment "upower needs a toolchain w/ threads, wchar"
> +       depends on BR2_USE_MMU
> +       depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/upower/upower.hash b/package/upower/upower.hash
> new file mode 100644
> index 0000000..0df67b4
> --- /dev/null
> +++ b/package/upower/upower.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256 9ca325a6ccef505529b268ebbbd9becd0ce65a65f6ac7ee31e2e5b17648037b0  upower-0.99.4.tar.xz
> diff --git a/package/upower/upower.mk b/package/upower/upower.mk
> new file mode 100644
> index 0000000..471eb41
> --- /dev/null
> +++ b/package/upower/upower.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# upower
> +#
> +################################################################################
> +
> +UPOWER_VERSION = 0.99.4
> +UPOWER_SOURCE = upower-$(UPOWER_VERSION).tar.xz
> +UPOWER_SITE = https://upower.freedesktop.org/releases
> +UPOWER_LICENSE = GPLv2+
> +UPOWER_LICENSE_FILES = COPYING
> +
> +# libupower-glib.so
> +UPOWER_INSTALL_STAGING = YES
> +
> +UPOWER_DEPENDENCIES = \
> +       host-intltool \
> +       host-pkgconf \
> +       libgudev \
> +       libusb \
> +       udev
> +
> +UPOWER_CONF_OPTS = --disable-man-pages --disable-tests
> +
> +$(eval $(autotools-package))
> --
> 2.9.3
>



-- 
Gustavo Sverzut Barbieri
http://profusion.mobi embedded systems
--------------------------------------
MSN, GTalk, FaceTime: barbieri at gmail.com
Skype: gsbarbieri
Mobile: +55 (16) 99354-9890
