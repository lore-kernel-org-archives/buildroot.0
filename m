From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 7 Feb 2014 21:17:08 +0100
Subject: [Buildroot] [PATCH v7 2/4] udev: convert to virtual package.
In-Reply-To: <1391779295-19140-3-git-send-email-eric.le.bihan.dev@free.fr>
References: <1391779295-19140-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1391779295-19140-3-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <CAAXf6LWN2F6YhoVHu3w-TcWnqBQ4G_gdV652xBD0kGbopfafWw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eric,

On Fri, Feb 7, 2014 at 2:21 PM, Eric Le Bihan <eric.le.bihan.dev@free.fr> wrote:
> This patch converts udev to a virtual package. For the moment, there is only
> one provider for the udev features: eudev.
>
> Packages meant to provide udev-like features must select the symbol
> BR2_PACKAGE_HAS_UDEV.
>
> Packages depending on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV or
> BR2_PACKAGE_UDEV have been converted to use the new symbol.
>
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  Config.in.legacy                                   |   55 ++++++++++++++++++++
>  docs/manual/adding-packages-directory.txt          |    3 +-
>  linux/linux.mk                                     |    2 -
>  package/ccid/ccid.mk                               |    2 +-
>  package/eudev/Config.in                            |    1 +
>  package/gpsd/gpsd.mk                               |    2 +-
>  package/libatasmart/Config.in                      |    4 +-
>  package/libcec/libcec.mk                           |    2 +-
>  package/libdrm/libdrm.mk                           |    2 +-
>  package/libmbim/Config.in                          |    5 +-
>  package/libusb/libusb.mk                           |    2 +-
>  package/modem-manager/Config.in                    |    6 +--
>  package/network-manager/Config.in                  |    8 ++-
>  package/ofono/ofono.mk                             |    2 +-
>  package/pcsc-lite/Config.in                        |    2 +-
>  package/pcsc-lite/pcsc-lite.mk                     |    2 +-
>  package/pulseaudio/pulseaudio.mk                   |    2 +-
>  package/systemd/Config.in                          |    6 +--
>  package/udev/Config.in                             |   51 ++----------------
>  package/udev/udev.mk                               |   49 ++++-------------
>  package/udisks/Config.in                           |   14 ++---
>  package/usbmount/Config.in                         |    4 +-
>  package/vlc/vlc.mk                                 |    2 +-
>  package/weston/Config.in                           |    4 +-
>  package/x11r7/xdriver_xf86-input-evdev/Config.in   |    4 +-
>  .../xserver_xorg-server/xserver_xorg-server.mk     |    2 +-
>  package/xenomai/xenomai.mk                         |    2 +-
>  system/Config.in                                   |   22 ++------
>  28 files changed, 112 insertions(+), 150 deletions(-)
>
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 2fe9cf9..6d594c6 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -101,6 +101,61 @@ endif
>  ###############################################################################
>  comment "Legacy options removed in 2014.02"
>
> +config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
> +       bool "/dev management by udev removed"
> +       select BR2_LEGACY
> +       help
> +         The 'udev' package has been converted to a virtual package.
> +         There is currently one provider for this feature: 'eudev'.
> +
> +         Therefore, you must choose 'Dynamic using eudev' in the
> +         '/dev management' menu to get the same behaviour as in your
> +          old configuration.
> +
> +         You must also check the packages depending on 'udev' are still
> +         selected.

Is there a particular reason why you don't automatically select the
suggested alternative?
This will make the transition easier for users...

> +
> +config BR2_PACKAGE_UDEV
> +       bool "udev is now a virtual package"
> +       select BR2_LEGACY
> +       select BR2_PACKAGE_HAS_UDEV
> +       help
> +         The 'udev' package has been converted to a virtual package.
> +         There is currently one provider for this feature: 'eudev'.
> +
> +         Your old configuration refers to packages depending on 'udev',
> +         either for build or at runtime.
> +
> +         Check that a 'udev' provider is selected, i.e. that 'eudev' is
> +         selected, which is the case if '/dev management' is set to
> +         'Dynamic using eudev'.
> +
> +config BR2_PACKAGE_UDEV_RULES_GEN
> +       bool "udev rules generation handled by eudev"
> +       select BR2_LEGACY
> +       select BR2_PACKAGE_EUDEV
> +       select BR2_PACKAGE_EUDEV_RULES_GEN
> +       help
> +         The 'udev' package has been converted to a virtual package.
> +         There is currently one provider for this feature: 'eudev'.
> +
> +         udev rules generation will now be handled by 'eudev'.
> +
> +         Check that '/dev management' is set to 'Dynamic using eudev'
> +         to get the same behaviour as in your old configuration.
> +
> +config BR2_PACKAGE_UDEV_ALL_EXTRAS
> +       bool "udev extras removed"
> +       select BR2_LEGACY
> +       help
> +         The 'udev' package has been converted to a virtual package.
> +         There is currently one provider for this feature: 'eudev'.
> +
> +         The option to enable the extra features of 'udev' (gudev, ...)
> +         has been removed. These features are automatically enabled in
> +         the 'udev' providers if the dependencies are selected. For
> +         example, selecting 'libglib2' will trigger the build of gudev.
> +
>  config BR2_sh2
>         bool "sh2 support removed"
>         help
[..]
> diff --git a/package/libatasmart/Config.in b/package/libatasmart/Config.in
> index a3e44f8..534e7c1 100644
> --- a/package/libatasmart/Config.in
> +++ b/package/libatasmart/Config.in
> @@ -1,6 +1,6 @@
>  config BR2_PACKAGE_LIBATASMART
>         bool "libatasmart"
> -       depends on BR2_PACKAGE_UDEV # libudev is configure dependency
> +       depends on BR2_PACKAGE_HAS_UDEV # libudev is configure dependency
>         help
>           The libatasmart package is a disk reporting library.
>           It only supports a subset of the ATA S.M.A.R.T. functionality.
> @@ -8,4 +8,4 @@ config BR2_PACKAGE_LIBATASMART
>           http://www.linuxfromscratch.org/blfs/view/svn/general/libatasmart.html
>
>  comment "libatasmart requires udev to be enabled"
> -       depends on !BR2_PACKAGE_UDEV
> +       depends on !BR2_PACKAGE_HAS_UDEV

Finally we should also line up all the udev comments, but this can be
done in a separate patch.

[..]

> diff --git a/package/udev/Config.in b/package/udev/Config.in
> index 7aa79c4..5cd4051 100644
> --- a/package/udev/Config.in
> +++ b/package/udev/Config.in
> @@ -1,47 +1,6 @@
> -config BR2_PACKAGE_UDEV
> -       bool "udev"
> -       depends on !BR2_avr32 # no epoll_create1
> -       depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
> -       depends on BR2_LARGEFILE # util-linux
> -       depends on BR2_USE_WCHAR # util-linux
> -       depends on !BR2_PREFER_STATIC_LIB # kmod
> -       select BR2_PACKAGE_UTIL_LINUX
> -       select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> -       select BR2_PACKAGE_KMOD
> +config BR2_PACKAGE_HAS_UDEV
> +       bool
>         help
> -         Userspace device daemon.
> -
> -         udev requires a Linux kernel >= 2.6.34: it relies on devtmpfs
> -         and inotify.
> -
> -         ftp://ftp.kernel.org/pub/linux/utils/kernel/hotplug/
> -
> -if BR2_PACKAGE_UDEV
> -
> -config BR2_PACKAGE_UDEV_RULES_GEN
> -       bool "enable rules generator"
> -       help
> -         Enable persistant rules generator
> -
> -config BR2_PACKAGE_UDEV_ALL_EXTRAS
> -       bool "enable all extras"
> -       select BR2_PACKAGE_ACL
> -       select BR2_PACKAGE_HWDATA
> -       select BR2_PACKAGE_LIBGLIB2
> -       depends on BR2_USE_WCHAR # libglib2
> -       depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> -       depends on BR2_USE_MMU # libglib2
> -       help
> -         Enable all extras with external dependencies like
> -         libacl, hwdata and libglib2
> -
> -comment "enabling all extras needs a toolchain w/ wchar, threads"
> -       depends on BR2_USE_MMU
> -       depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> -
> -endif
> -
> -comment "udev needs udev /dev management and a toolchain w/ largefile, wchar, dynamic library"
> -       depends on !BR2_avr32
> -       depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV || \
> -               !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
> +         udev is now a virtual package.
> +         Packages requiring udevd at run time or libudev/gudev at build time
> +         should select it.

Does it make sense to adding a help option on a hidden option? Can the
user ever make it visible?

[..]

Best regards,
Thomas
