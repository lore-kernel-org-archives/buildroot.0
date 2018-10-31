From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 31 Oct 2018 22:21:28 +0100
Subject: [Buildroot] [PATCH 1/2] package/f2fs-tools: add host package
In-Reply-To: <20181026200016.30856-2-grzegorz@blach.pl>
References: <20181026200016.30856-1-grzegorz@blach.pl>
 <20181026200016.30856-2-grzegorz@blach.pl>
Message-ID: <20181031212128.GM28575@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Grzegorz, All,

On 2018-10-26 22:00 +0200, Grzegorz Blach spake thusly:
> This package is useful to create f2fs filesystem during build process.

Indeed.

> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
> ---
[--SNIP--]
> diff --git a/package/f2fs-tools/f2fs-tools.mk b/package/f2fs-tools/f2fs-tools.mk
> index 119cef35cc..7973ebf570 100644
> --- a/package/f2fs-tools/f2fs-tools.mk
> +++ b/package/f2fs-tools/f2fs-tools.mk
> @@ -9,6 +9,7 @@ F2FS_TOOLS_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-to
>  F2FS_TOOLS_SITE_METHOD = git
>  F2FS_TOOLS_CONF_ENV = ac_cv_file__git=no
>  F2FS_TOOLS_DEPENDENCIES = host-pkgconf util-linux
> +HOST_F2FS_TOOLS_DEPENDENCIES = host-pkgconf host-util-linux
>  # GIT version, shipped without configure
>  F2FS_TOOLS_AUTORECONF = YES
>  F2FS_TOOLS_INSTALL_STAGING = YES
> @@ -30,3 +31,4 @@ F2FS_TOOLS_CONF_OPTS += --without-blkid
>  endif

I don't think that libblkid is needed for the host variant, so we should
probably explicitly disable it. On the other hand, libblkid is always
built by host-util-linux.

Whatever yuou choose, make that explicit.

Also, we do have host-libselinux, so wyou may want to also enable that
unconditionally.

    HOST_F2FS_TOOLS_DEPENDENCIES = \
        host-libselinux \
        host-pkgconf \
        host-util-linux

    HOST_F2FS_TOOLS_CONF_OPTS = --without-blkid --with-selinux

Regards,
Yann E. MORIN.

>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> -- 
> 2.17.2
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
