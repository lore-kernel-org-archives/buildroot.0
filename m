From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 04 Dec 2013 23:20:30 +0100
Subject: [Buildroot] [PATCH] udev: disable on avr32
In-Reply-To: <1386167330-21261-1-git-send-email-spdawson@gmail.com>
References: <1386167330-21261-1-git-send-email-spdawson@gmail.com>
Message-ID: <529FAAAE.6030107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/12/13 15:28, spdawson at gmail.com wrote:
> From: Simon Dawson <spdawson@gmail.com>
>
> udev requires the epoll_create1 system call, which is not available on avr32.
>
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> ---
>   package/network-manager/Config.in | 2 ++
>   package/udev/Config.in            | 2 ++
>   package/udisks/Config.in          | 2 ++

  I think you're missing one in system/Config.in. Don't forget to update 
the comment there as well.

  Regards,
  Arnout

>   3 files changed, 6 insertions(+)
>
> diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
> index 1e2a876..5513c01 100644
> --- a/package/network-manager/Config.in
> +++ b/package/network-manager/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_NETWORK_MANAGER
>   	bool "NetworkManager"
> +	depends on !BR2_avr32 # udev
>   	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
>   	select BR2_PACKAGE_DBUS
>   	depends on BR2_INET_IPV6
> @@ -28,6 +29,7 @@ config BR2_PACKAGE_NETWORK_MANAGER
>   	  http://projects.gnome.org/NetworkManager/
>
>   comment "NetworkManager needs a toolchain w/ IPv6, largefile, wchar, threads"
> +	depends on !BR2_avr32
>   	depends on BR2_USE_MMU
>   	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || !BR2_USE_WCHAR || \
>   		!BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/udev/Config.in b/package/udev/Config.in
> index c8aedd0..374a7bf 100644
> --- a/package/udev/Config.in
> +++ b/package/udev/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_UDEV
>   	bool "udev"
> +	depends on !BR2_avr32 # no epoll_create1
>   	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
>   	depends on BR2_LARGEFILE # util-linux
>   	depends on BR2_USE_WCHAR # util-linux
> @@ -40,4 +41,5 @@ comment "enabling all extras needs a toolchain w/ wchar, threads"
>   endif
>
>   comment "udev requires /dev mgmnt set to udev under System configuration"
> +	depends on !BR2_avr32
>   	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
> diff --git a/package/udisks/Config.in b/package/udisks/Config.in
> index 09070b4..e9539a3 100644
> --- a/package/udisks/Config.in
> +++ b/package/udisks/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_UDISKS
>   	bool "udisks"
> +	depends on !BR2_avr32 # udev
>   	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-glib -> glib2
>   	depends on BR2_USE_MMU # lvm2
> @@ -36,6 +37,7 @@ config BR2_PACKAGE_UDISKS_LVM2
>   endif
>
>   comment "udisks needs udev /dev management and a toolchain w/ wchar, threads"
> +	depends on !BR2_avr32
>   	depends on BR2_USE_MMU
>   	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV || \
>   		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
