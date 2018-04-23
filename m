From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Apr 2018 10:18:23 +0200
Subject: [Buildroot] [PATCH v3 6/6] squashfs: add zstd support
In-Reply-To: <20180416193953.19924-6-ps.report@gmx.net>
References: <20180416193953.19924-1-ps.report@gmx.net>
 <20180416193953.19924-6-ps.report@gmx.net>
Message-ID: <20180423081823.GN12688@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2018-04-16 21:39 +0200, Peter Seiderer spake thusly:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Changes v2 -> v3:
>   - move up the zstd section to keep gzip as default (suggested by
>     Yann E. MORIN)
> 
> Changes v1 -> v2:
>   - split off target zstd support (suggested by Yann E. MORIN)
> ---
>  package/squashfs/Config.in   | 6 ++++++
>  package/squashfs/squashfs.mk | 9 ++++++++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/package/squashfs/Config.in b/package/squashfs/Config.in
> index 70c0fc9808..c16ebbf27f 100644
> --- a/package/squashfs/Config.in
> +++ b/package/squashfs/Config.in
> @@ -41,6 +41,12 @@ config BR2_PACKAGE_SQUASHFS_XZ
>  	help
>  	  Support XZ compression algorithm
>  
> +config BR2_PACKAGE_SQUASHFS_ZSTD
> +	bool "zstd support"
> +	select BR2_PACKAGE_ZSTD
> +	help
> +	  Support ZSTD compression algorithm
> +
>  endif
>  
>  comment "squashfs needs a toolchain w/ threads"
> diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
> index 67025ac68a..7467342c48 100644
> --- a/package/squashfs/squashfs.mk
> +++ b/package/squashfs/squashfs.mk
> @@ -9,7 +9,7 @@ SQUASHFS_SITE = https://git.kernel.org/pub/scm/fs/squashfs/squashfs-tools.git
>  SQUASHFS_SITE_METHOD = git
>  SQUASHFS_LICENSE = GPL-2.0+
>  SQUASHFS_LICENSE_FILES = COPYING
> -SQUASHFS_MAKE_ARGS = XATTR_SUPPORT=1 ZSTD_SUPPORT=0
> +SQUASHFS_MAKE_ARGS = XATTR_SUPPORT=1
>  
>  ifeq ($(BR2_PACKAGE_SQUASHFS_LZ4),y)
>  SQUASHFS_DEPENDENCIES += lz4
> @@ -39,6 +39,13 @@ else
>  SQUASHFS_MAKE_ARGS += LZO_SUPPORT=0
>  endif
>  
> +ifeq ($(BR2_PACKAGE_SQUASHFS_ZSTD),y)
> +SQUASHFS_DEPENDENCIES += zstd
> +SQUASHFS_MAKE_ARGS += ZSTD_SUPPORT=1 COMP_DEFAULT=zstd
> +else
> +SQUASHFS_MAKE_ARGS += ZSTD_SUPPORT=0
> +endif
> +
>  ifeq ($(BR2_PACKAGE_SQUASHFS_GZIP),y)
>  SQUASHFS_DEPENDENCIES += zlib
>  SQUASHFS_MAKE_ARGS += GZIP_SUPPORT=1 COMP_DEFAULT=gzip
> -- 
> 2.16.3
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
