From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Wed, 11 Feb 2015 14:39:39 -0600
Subject: [Buildroot] [PATCH 05/11 v7] package/eudev: align comments to
 the ones in eudev /dev management
In-Reply-To: <529257cc88c99e285bb474760702aa4fa0dd6882.1423317174.git.yann.morin.1998@free.fr>
References: <cover.1423317174.git.yann.morin.1998@free.fr>
 <529257cc88c99e285bb474760702aa4fa0dd6882.1423317174.git.yann.morin.1998@free.fr>
Message-ID: <CAMQcK5LO7ppP_pmTAhtJ-GLHJzAKixbn4ToCqPnB4BvFAEtHHA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sat, Feb 7, 2015 at 7:53 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> eudev will soon be selectable even when it does not handle /dev
> management, to provide just libudev.
>
> As such, we must reproduce the same dependencies and comment as we have
> in the /dev management entry.
>
> Also, point to a better home.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/eudev/Config.in | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/package/eudev/Config.in b/package/eudev/Config.in
> index a822b9e..7915f4b 100644
> --- a/package/eudev/Config.in
> +++ b/package/eudev/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_EUDEV
>         bool "eudev"
> +       depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
>         depends on !BR2_avr32 # no epoll_create1
>         depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
>         depends on BR2_USE_MMU # uses fork()
> @@ -15,10 +16,10 @@ config BR2_PACKAGE_EUDEV
>           Userspace device daemon. This is a standalone version,
>           independent of systemd. It is a fork maintained by Gentoo.
>
> -         eudev requires a Linux kernel >= 2.6.34: it relies on devtmpfs
> +         eudev requires a Linux kernel >= 3.9: it relies on devtmpfs
>           and inotify.

According to Peter K's commit:

http://git.buildroot.net/buildroot/commit/system/Config.in?id=14af550d5eb50222196ece3042d2f1e2a9466cf6

It appears that the reason it needs the 3.9 kernel is because of btrfs
dependency. Should update the requirement comment accordingly.

> -         http://dev.gentoo.org/~blueness/eudev
> +         http://www.gentoo.org/proj/en/eudev/
>
>  if BR2_PACKAGE_EUDEV
>
> @@ -40,7 +41,8 @@ comment "eudev needs eudev /dev management"
>         depends on BR2_USE_MMU
>         depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
>
> -comment "eudev needs a toolchain w/ largefile, wchar, dynamic library"
> +comment "eudev needs a toolchain w/ largefile, wchar, dynamic library, headers >= 3.9"
>         depends on !BR2_avr32
>         depends on BR2_USE_MMU
> -       depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_STATIC_LIBS
> +       depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_STATIC_LIBS \
> +               || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
> --

Otherwise you add this:

Reviewed-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>

Thanks,
-Ryan

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
