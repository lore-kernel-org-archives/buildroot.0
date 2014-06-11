From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Jun 2014 18:42:55 +0200
Subject: [Buildroot] [PATCH v12 15/32] mesa3d: dri2 does not need udev
 support
In-Reply-To: <1402144292-27837-16-git-send-email-bernd.kuhls@t-online.de>
References: <1402144292-27837-1-git-send-email-bernd.kuhls@t-online.de>
 <1402144292-27837-16-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140611164255.GA3472@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-06-07 14:31 +0200, Bernd Kuhls spake thusly:
> http://cgit.freedesktop.org/mesa/mesa/commit/configure.ac?id=b959fd9674938e127a34d42d34b903e3a9ae7ad9
> "The loader infrastructure for everything but DRI2 requires that udev be present"
> 
> Check for udev only for dri3.

The git-tree of mesa3d requires that either libudev or sysfs be present:
    http://cgit.freedesktop.org/mesa/mesa/commit/?id=85b6f36ca5238dd3fec7c5fcacb8b7074ce53c8e

So it is now possible to use --enable-sysfs instead of requiring
libudev.so.

That's a pity this is not in mesa-10.2.1, and the patch is a bit too
large to back-port, IMHO.

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../mesa3d-0002-dri2-does-not-need-udev.patch      |   25 ++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 package/mesa3d/mesa3d-0002-dri2-does-not-need-udev.patch
> 
> diff --git a/package/mesa3d/mesa3d-0002-dri2-does-not-need-udev.patch b/package/mesa3d/mesa3d-0002-dri2-does-not-need-udev.patch
> new file mode 100644
> index 0000000..88c6861
> --- /dev/null
> +++ b/package/mesa3d/mesa3d-0002-dri2-does-not-need-udev.patch
> @@ -0,0 +1,25 @@
> +http://cgit.freedesktop.org/mesa/mesa/commit/configure.ac?id=b959fd9674938e127a34d42d34b903e3a9ae7ad9
> +"The loader infrastructure for everything but DRI2 requires that udev be present"
> +
> +Check for udev only for dri3.
> +
> +Patch sent upstream: https://bugs.freedesktop.org/show_bug.cgi?id=75212#c5

Unfortunately, upstream is not too keen on applying this patch.

So, I think we should revisit your libudev package. I'll go comment
there.

Regards,
Yann E. MORIN.

> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +
> +diff -uNr Mesa-10.2.0-rc1.org/configure.ac Mesa-10.2.0-rc1/configure.ac
> +--- Mesa-10.2.0-rc1.org/configure.ac	2014-05-03 02:17:23.000000000 +0200
> ++++ Mesa-10.2.0-rc1/configure.ac	2014-05-07 19:51:54.187921825 +0200
> +@@ -998,11 +998,11 @@
> +         DEFINES="$DEFINES -DHAVE_ALIAS"
> +         if test "x$enable_dri3" = xyes; then
> +             DEFINES="$DEFINES -DHAVE_DRI3"
> +-        fi
> + 
> +         if test "x$have_libudev" != xyes; then
> +             AC_MSG_ERROR([libudev-dev required for building DRI])
> +         fi
> ++        fi
> + 
> +         case "$host_cpu" in
> +         powerpc* | sparc*)
> -- 
> 1.7.10.4
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
