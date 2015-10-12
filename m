From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 12 Oct 2015 23:30:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/vlc: Add optional dependency to
 libtaglib
In-Reply-To: <1444669674-23736-1-git-send-email-bernd.kuhls@t-online.de>
References: <1444669674-23736-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151012213019.GI3735@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-10-12 19:07 +0200, Bernd Kuhls spake thusly:
> taglib is an optional dependency to vlc:
> http://git.videolan.org/gitweb.cgi?p=vlc.git;a=blob;f=configure.ac;h=b9bd76a829da8ee8b8ea69a141827abd87c47cb2;hb=HEAD#l4020
> 
> $ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a
>   output/target/usr/lib/vlc/plugins/meta_engine/libtaglib_plugin.so
>   | grep NEEDED
>  0x00000001 (NEEDED)                     Shared library: [libvlccore.so.8]
>  0x00000001 (NEEDED)                     Shared library: [librt.so.1]
>  0x00000001 (NEEDED)                     Shared library: [libpthread.so.1]
>  0x00000001 (NEEDED)                     Shared library: [libdl.so.1]
>  0x00000001 (NEEDED)                     Shared library: [libtag.so.1]
>  0x00000001 (NEEDED)                     Shared library: [libz.so.1]
>  0x00000001 (NEEDED)                     Shared library: [libstdc++.so.6]
>  0x00000001 (NEEDED)                     Shared library: [libm.so.1]
>  0x00000001 (NEEDED)                     Shared library: [libc.so.1]
>  0x00000001 (NEEDED)                     Shared library: [libgcc_s.so.1]
> 
> Add it to vlc.mk to get reproducable builds.
> 
> For taglib itself zlib is only an optional dependency
> http://git.buildroot.net/buildroot/tree/package/taglib/taglib.mk#n13
> 
> But taglib support in vlc depends on zlib:
> http://git.videolan.org/gitweb.cgi?p=vlc.git;a=blob;f=modules/meta_engine/Makefile.am;h=003d292cdc9a80762a6515e0ced77552f13b5120;hb=HEAD#l10
> so we select BR2_PACKAGE_ZLIB if BR2_PACKAGE_TAGLIB is selected.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/vlc/Config.in | 1 +
>  package/vlc/vlc.mk    | 7 +++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/package/vlc/Config.in b/package/vlc/Config.in
> index 71e4f34..e2b8da9 100644
> --- a/package/vlc/Config.in
> +++ b/package/vlc/Config.in
> @@ -13,6 +13,7 @@ config BR2_PACKAGE_VLC
>  	select BR2_PACKAGE_LIBVORBIS if BR2_PACKAGE_OPUS
>  	select BR2_PACKAGE_VLC_OPENCV_BACKEND if BR2_PACKAGE_OPENCV
>  	select BR2_PACKAGE_VLC_OPENCV3_BACKEND if BR2_PACKAGE_OPENCV3
> +	select BR2_PACKAGE_ZLIB if BR2_PACKAGE_TAGLIB
>  	help
>  	  VLC is a free and open source cross-platform multimedia player
>  	  and framework that plays most multimedia files as well as DVD,
> diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
> index 4e84b12..ca1f09c 100644
> --- a/package/vlc/vlc.mk
> +++ b/package/vlc/vlc.mk
> @@ -326,6 +326,13 @@ else
>  VLC_CONF_OPTS += --disable-speex
>  endif
>  
> +ifeq ($(BR2_PACKAGE_TAGLIB),y)
> +VLC_CONF_OPTS += --enable-taglib
> +VLC_DEPENDENCIES += taglib

Did you forget to add zlib as a dependency here as well?

Form vlc's configure.ac:

    dnl
    dnl Check for zlib.h and -lz along with system -lminizip if available
    dnl
    AC_CHECK_HEADERS(zlib.h, [ have_zlib=yes ], [ have_zlib=no ])
    AM_CONDITIONAL(HAVE_ZLIB, [ test "${have_zlib}" = "yes" ])

So, we should add an optional dependency to zlib (in its own ifeq-endif
block, not inside the taglib block).

Regards,
Yann E. MORIN.

> +else
> +VLC_CONF_OPTS += --disable-taglib
> +endif
> +
>  ifeq ($(BR2_PACKAGE_TREMOR),y)
>  VLC_CONF_OPTS += --enable-tremor
>  VLC_DEPENDENCIES += tremor
> -- 
> 2.6.1
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
