From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 5 Jan 2018 23:54:59 +0100
Subject: [Buildroot] [PATCH v2] tvheadend: add dependency on udev
In-Reply-To: <20180105093501.5793-1-daggs@gmx.com>
References: <20180105093501.5793-1-daggs@gmx.com>
Message-ID: <20180105225459.GC3673@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dagg, All,

On 2018-01-05 11:35 +0200, Dagg Stompler spake thusly:
> udev is needed in order to detect usb based DVB cards.
> reference for none SystemD systems can be found at https://github.com/tvheadend/tvheadend/blob/master/debian/tvheadend.init

We do not use this startup script in Buildroot, since we have our own:
    https://git.buildroot.org/buildroot/tree/package/tvheadend/S99tvheadend

So I fail to see why their init script calling udevadm is a reason to
force a dependency on udev.

Besides, our own udev startup does an udevadm settle, and it is called
before the tvheadend startup script (S10 vs. S99):
    https://git.buildroot.org/buildroot/tree/package/eudev/S10udev

Furthermore, last time udev was mentioned in the tvheadend repository was
in 2014, commit 517af478ab20, where Adam said:
    "... I've given up on using udev (for various reasons)."

The previous mention of udev was the commit that added the call to
udevadm in 2010, commit 5e20573581f0.

And personal experience has shown that my setup was working OK without
udev as well, at a time _after_ those two commits.

So I still believe we should not add a dependency on udev at all,
because as far as I understand, you claim it is only needed for USB
devices. Other devices seem to be working fine without udev, and it
is perfectly valid to have a setup with a non-USB device and no udev.

So, still no from me...

We may however add a blurb in the help text that states that using
certain devices may require use of udev or another manager of /dev.

Regards,
Yann E. MORIN.

> Signed-off-by: Dagg Stompler <daggs@gmx.com>
> ---
> v1 -> v2:
>  - use BR2_PACKAGE_HAS_UDEV instead of ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV (Thomas)
>  - add BR2_PACKAGE_HAS_UDEV dependecy to comment
> 
>  package/tvheadend/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
> index 44a69a27ba..75bb7d0b62 100644
> --- a/package/tvheadend/Config.in
> +++ b/package/tvheadend/Config.in
> @@ -1,6 +1,7 @@
> -comment "tvheadend needs a toolchain w/ NPTL, headers >= 3.2, dynamic library"
> +comment "tvheadend needs a toolchain w/ NPTL, headers >= 3.2, dynamic library, udev /dev management"
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
> -		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2 || BR2_STATIC_LIBS
> +		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2 || BR2_STATIC_LIBS || \
> +		!BR2_PACKAGE_HAS_UDEV
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  
>  config BR2_PACKAGE_TVHEADEND
> @@ -9,6 +10,7 @@ config BR2_PACKAGE_TVHEADEND
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +	depends on BR2_PACKAGE_HAS_UDEV
>  	select BR2_PACKAGE_DTV_SCAN_TABLES
>  	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
>  	select BR2_PACKAGE_OPENSSL
> -- 
> 2.15.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
