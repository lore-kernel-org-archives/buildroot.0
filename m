From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Feb 2017 00:08:21 +0100
Subject: [Buildroot] [PATCH v3 01/38] package/libdvdcss: add
 Kodi-specific patches
In-Reply-To: <20170204114451.20935-2-bernd.kuhls@t-online.de>
References: <20170204114451.20935-1-bernd.kuhls@t-online.de>
 <20170204114451.20935-2-bernd.kuhls@t-online.de>
Message-ID: <20170204230821.GA3805@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2017-02-04 12:44 +0100, Bernd Kuhls spake thusly:
> The Kodi build system needs .a files to create
> usr/lib/kodi/system/players/VideoPlayer/libdvdcss-i486-linux.so

This is really nasty.

What happens if one does not have the .a library, but just the .so one
instead? Does the build really fail?

I've had a quick look at cmake/modules/FindLibDvd.cmake and it only
requires the .a files in the case that it compiles its own version.
Otherwise, it uses the standard find_library() :

    18       find_library(DVDCSS_LIBRARY NAMES dvdcss libdvdcss PATHS ${PC_DVD_libdvdcss_LIBDIR})

which to me does not require that the library be a static one.

So, could you double check if it really does not work with a shared
version?

Ditto for libdvdnav and libdvdread.

Regards,
Yann E. MORIN.

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...css-better-handle-partial-read-in-libc_re.patch | 49 ++++++++++++++++++++++
>  ...opy-value-psz_cache-to-dvdcss-psz_cachefi.patch | 33 +++++++++++++++
>  package/libdvdcss/libdvdcss.mk                     |  5 +++
>  3 files changed, 87 insertions(+)
>  create mode 100644 package/libdvdcss/0001-xbmc-libdvdcss-better-handle-partial-read-in-libc_re.patch
>  create mode 100644 package/libdvdcss/0002-libdvdcss-Copy-value-psz_cache-to-dvdcss-psz_cachefi.patch
> 
> diff --git a/package/libdvdcss/0001-xbmc-libdvdcss-better-handle-partial-read-in-libc_re.patch b/package/libdvdcss/0001-xbmc-libdvdcss-better-handle-partial-read-in-libc_re.patch
> new file mode 100644
> index 000000000..4d9820642
> --- /dev/null
> +++ b/package/libdvdcss/0001-xbmc-libdvdcss-better-handle-partial-read-in-libc_re.patch
> @@ -0,0 +1,49 @@
> +From d113ac14b45961f958f4aa927c66b3c367f4637c Mon Sep 17 00:00:00 2001
> +From: Voyager1 <voyager@xbmc.org>
> +Date: Sat, 13 Feb 2016 20:44:21 +0100
> +Subject: [PATCH 1/2] [xbmc] [libdvdcss] better handle partial read in
> + libc_read
> +
> +Downloaded from
> +https://github.com/xbmc/libdvdcss/commit/d113ac14b45961f958f4aa927c66b3c367f4637c
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +---
> + src/device.c | 20 ++++++++++++++------
> + 1 file changed, 14 insertions(+), 6 deletions(-)
> +
> +diff --git a/src/device.c b/src/device.c
> +index af735e0..1936b44 100644
> +--- a/src/device.c
> ++++ b/src/device.c
> +@@ -608,13 +608,21 @@ static int libc_read ( dvdcss_t dvdcss, void *p_buffer, int i_blocks )
> +     off_t i_size, i_ret, i_ret_blocks;
> + 
> +     i_size = (off_t)i_blocks * (off_t)DVDCSS_BLOCK_SIZE;
> +-    i_ret = read( dvdcss->i_fd, p_buffer, i_size );
> +-
> +-    if( i_ret < 0 )
> +-    {
> +-        print_error( dvdcss, "read error" );
> ++    i_ret = 0;
> ++    while (i_ret < i_size)
> ++    {
> ++      off_t i_r;
> ++      i_r = read(dvdcss->i_fd, ((char*)p_buffer) + i_ret, i_size - i_ret);
> ++      if (i_r < 0)
> ++      {
> ++        print_error(dvdcss, "read error");
> +         dvdcss->i_pos = -1;
> +-        return i_ret;
> ++        return i_r;
> ++      }
> ++      if (i_r == 0)
> ++        break;
> ++
> ++      i_ret += i_r;
> +     }
> + 
> +     i_ret_blocks = i_ret / DVDCSS_BLOCK_SIZE;
> +-- 
> +2.8.1
> +
> diff --git a/package/libdvdcss/0002-libdvdcss-Copy-value-psz_cache-to-dvdcss-psz_cachefi.patch b/package/libdvdcss/0002-libdvdcss-Copy-value-psz_cache-to-dvdcss-psz_cachefi.patch
> new file mode 100644
> index 000000000..4251eaf46
> --- /dev/null
> +++ b/package/libdvdcss/0002-libdvdcss-Copy-value-psz_cache-to-dvdcss-psz_cachefi.patch
> @@ -0,0 +1,33 @@
> +From 2f12236bc1c92f73c21e973363f79eb300de603f Mon Sep 17 00:00:00 2001
> +From: Anton Fedchin <anightik@gmail.com>
> +Date: Mon, 15 Feb 2016 16:09:35 +0300
> +Subject: [PATCH 2/2] [libdvdcss] Copy value psz_cache to dvdcss->psz_cachefile
> + if it exists.
> +
> +Downloaded from
> +https://github.com/xbmc/libdvdcss/commit/2f12236bc1c92f73c21e973363f79eb300de603f
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +---
> + src/libdvdcss.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/src/libdvdcss.c b/src/libdvdcss.c
> +index 2f78b78..d09d2b3 100644
> +--- a/src/libdvdcss.c
> ++++ b/src/libdvdcss.c
> +@@ -274,6 +274,11 @@ static int set_cache_directory( dvdcss_t dvdcss )
> +         }
> + #endif /* ! defined( _WIN32 ) */
> +     }
> ++    else
> ++    {
> ++      snprintf( dvdcss->psz_cachefile, PATH_MAX, "%s", psz_cache );
> ++      dvdcss->psz_cachefile[PATH_MAX - 1] = '\0';
> ++    }
> + 
> +     /* Check that there is enough space for the cache directory path and the
> +      * block filename. The +1s are path separators. */
> +-- 
> +2.8.1
> +
> diff --git a/package/libdvdcss/libdvdcss.mk b/package/libdvdcss/libdvdcss.mk
> index 8e1c92995..6b13f3f58 100644
> --- a/package/libdvdcss/libdvdcss.mk
> +++ b/package/libdvdcss/libdvdcss.mk
> @@ -11,4 +11,9 @@ LIBDVDCSS_INSTALL_STAGING = YES
>  LIBDVDCSS_LICENSE = GPLv2+
>  LIBDVDCSS_LICENSE_FILES = COPYING
>  
> +ifeq ($(BR2_PACKAGE_KODI),y)
> +LIBDVDCSS_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -fPIC"
> +LIBDVDCSS_CONF_OPTS = --enable-static
> +endif
> +
>  $(eval $(autotools-package))
> -- 
> 2.11.0
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
