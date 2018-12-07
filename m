From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 7 Dec 2018 20:24:32 +0100
Subject: [Buildroot] [PATCH] squashfs: do not force gzip support if
 lz4/xz/zstd is selected
In-Reply-To: <20181207131356.14366-1-peter@korsgaard.com>
References: <20181207131356.14366-1-peter@korsgaard.com>
Message-ID: <20181207202432.76868c40@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Fri,  7 Dec 2018 14:13:55 +0100, Peter Korsgaard <peter@korsgaard.com> wrote:

> The logic to ensure at least one compression backend is selected was not
> updated when lz4, xz and zstd were introduced -  Fix that.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/squashfs/Config.in | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/package/squashfs/Config.in b/package/squashfs/Config.in
> index c16ebbf27f..fdd8833060 100644
> --- a/package/squashfs/Config.in
> +++ b/package/squashfs/Config.in
> @@ -2,7 +2,12 @@ config BR2_PACKAGE_SQUASHFS
>  	bool "squashfs"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_USE_MMU # fork()

Nitpick: maybe a short comment here is helpful (I missed the line while
adding zstd support)?

  # ensure at least on compression backend (defaults to gzip)

> -	select BR2_PACKAGE_SQUASHFS_GZIP if !(BR2_PACKAGE_SQUASHFS_LZMA || BR2_PACKAGE_SQUASHFS_LZO)
> +	select BR2_PACKAGE_SQUASHFS_GZIP if !( \
> +	       BR2_PACKAGE_SQUASHFS_LZ4 || \
> +	       BR2_PACKAGE_SQUASHFS_LZMA || \
> +	       BR2_PACKAGE_SQUASHFS_LZO || \
> +	       BR2_PACKAGE_SQUASHFS_XZ || \
> +	       BR2_PACKAGE_SQUASHFS_ZSTD)
>  	help
>  	  Tools to generate SquashFS filesystems.
>  

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter
