From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 23 Apr 2017 11:06:40 +0300
Subject: [Buildroot] [PATCH] lvm2: allow build since uclibc 1.0.24
In-Reply-To: <20170423071104.GA28568@waldemar-brodkorb.de>
References: <20170423071104.GA28568@waldemar-brodkorb.de>
Message-ID: <20170423080640.dtzx2zxvbhiplkmo@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

On Sun, Apr 23, 2017 at 09:11:04AM +0200, Waldemar Brodkorb wrote:
> uClibc-ng 1.0.24 allows to use long double wrappers for
> every architecture.

Please revert commit 66f136a9f64b (lvm2: disable build with uClibc-ng). That 
would also revert the propagation of the !BR2_TOOLCHAIN_USES_UCLIBC 
dependency.

baruch

> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/lvm2/Config.in | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
> index b28b197..c1287dd 100644
> --- a/package/lvm2/Config.in
> +++ b/package/lvm2/Config.in
> @@ -5,7 +5,6 @@ config BR2_PACKAGE_LVM2
>  	depends on !BR2_STATIC_LIBS # It fails to build statically
>  	# http://lists.busybox.net/pipermail/buildroot/2016-August/170592.html
>  	depends on !BR2_TOOLCHAIN_USES_MUSL
> -	depends on !BR2_TOOLCHAIN_USES_UCLIBC # missing floorl(), nearbyintl()
>  	help
>  	  This is LVM2, the rewrite of The Linux Logical Volume Manager.
>  	  LVM supports enterprise level volume management of disk and disk
> @@ -39,7 +38,7 @@ config BR2_PACKAGE_LVM2_APP_LIBRARY
>  
>  endif
>  
> -comment "lvm2 needs a glibc toolchain w/ threads, dynamic library"
> +comment "lvm2 needs a glibc or uClibc toolchain w/ threads, dynamic library"
>  	depends on BR2_USE_MMU
>  	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS \
> -		|| BR2_TOOLCHAIN_USES_MUSL || BR2_TOOLCHAIN_USES_UCLIBC
> +		|| BR2_TOOLCHAIN_USES_MUSL

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
