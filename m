From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Aug 2020 22:37:37 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/mtd: crypto support needs headers >= 4.12
In-Reply-To: <20200811151024.2261022-1-fontaine.fabrice@gmail.com>
References: <20200811151024.2261022-1-fontaine.fabrice@gmail.com>
Message-ID: <20200811223737.51d12a59@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 11 Aug 2020 17:10:24 +0200
Fabrice Fontaine via buildroot <buildroot@busybox.net> wrote:

> crypto support includes <linux/hash_info.h> since version 2.1.2 and
> https://github.com/sigma-star/mtd-utils/commit/a739b59efe7996e3bdcbe8b17743dc05ac7c110a
> 
> However, linux/hash_info.h is only exported since kernel 4.12:
> https://github.com/torvalds/linux/commit/fcc8487d477a3452a1d0ccbdd4c5e0e1e3cb8bed
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/dbaeed9e9e2af191166808d2d6d6d3c2e5051c2c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Replace wrong linux-headers dependency by headers >= 4.12
> 
>  package/mtd/mtd.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
> index 8220a5ace8..1186fa52d5 100644
> --- a/package/mtd/mtd.mk
> +++ b/package/mtd/mtd.mk
> @@ -21,7 +21,8 @@ endif
>  ifeq ($(BR2_PACKAGE_MTD_UBIFS_UTILS),y)
>  MTD_DEPENDENCIES += util-linux zlib lzo host-pkgconf
>  MTD_CONF_OPTS += --with-ubifs
> -ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +# crypto needs linux/hash_info.h
> +ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12)$(BR2_PACKAGE_OPENSSL),yy)
>  MTD_DEPENDENCIES += openssl
>  MTD_CONF_OPTS += --with-crypto
>  else



-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
