From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jul 2015 12:16:02 +0200
Subject: [Buildroot] [PATCH v7 20/22] squashfs: Add xattr support
In-Reply-To: <1433251718-3167-21-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1433251718-3167-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1433251718-3167-21-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <20150706121602.402373fc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Tue,  2 Jun 2015 08:28:36 -0500, Clayton Shotwell wrote:

> diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
> index 8ca9e2e..f44ef9f 100644
> --- a/package/squashfs/squashfs.mk
> +++ b/package/squashfs/squashfs.mk
> @@ -10,9 +10,6 @@ SQUASHFS_SITE = http://downloads.sourceforge.net/project/squashfs/squashfs/squas
>  SQUASHFS_LICENSE = GPLv2+
>  SQUASHFS_LICENSE_FILES = COPYING
>  
> -# no libattr in BR
> -SQUASHFS_MAKE_ARGS = XATTR_SUPPORT=0
> -
>  ifeq ($(BR2_PACKAGE_SQUASHFS_LZ4),y)
>  SQUASHFS_DEPENDENCIES += lz4
>  SQUASHFS_MAKE_ARGS += LZ4_SUPPORT=1 COMP_DEFAULT=lz4
> @@ -52,13 +49,20 @@ HOST_SQUASHFS_DEPENDENCIES = host-zlib host-lz4 host-lzo host-xz
>  
>  # no libattr/xz in BR
>  HOST_SQUASHFS_MAKE_ARGS = \
> -	XATTR_SUPPORT=0 \
>  	XZ_SUPPORT=1    \
>  	GZIP_SUPPORT=1  \
>  	LZ4_SUPPORT=1	\
>  	LZO_SUPPORT=1	\
>  	LZMA_XZ_SUPPORT=1
>  
> +ifeq ($(BR2_PACKAGE_ATTR),y)
> +	SQUASHFS_MAKE_ARGS += XATTR_SUPPORT=1
> +	HOST_SQUASHFS_MAKE_ARGS += XATTR_SUPPORT=1
> +else
> +	SQUASHFS_MAKE_ARGS += XATTR_SUPPORT=0
> +	HOST_SQUASHFS_MAKE_ARGS += XATTR_SUPPORT=0
> +endif

For the host package, this is clearly not correct.

BR2_PACKAGE_ATTR=y tells you that the *target* attr package has been
built. It does not tell you anything about the availability of the
*host* attr package. Do you can certainly do:

SQUASHFS_MAKE_ARGS += XATTR_SUPPORT=$(if $(BR2_PACKAGE_ATTR),1,0)

However, touching HOST_SQUASHFS_MAKE_ARGS depending on BR2_PACKAGE_ATTR
does not make sense. If you need xattr support in mksquashfs for the
host, then you will need to add a
BR2_PACKAGE_HOST_SQUASHFS_XATTR_SUPPORT Config.in.host option, and
enable XATTR_SUPPORT=1 when enabled, and add host-attr to the
dependencies.

Also, your patch is incorrect because it does not add the dependency on
the attr package, so nothing guarantees you that the attr package has
been built before squashfs.

I'll mark your patch as Changes Requested in patchwork.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
