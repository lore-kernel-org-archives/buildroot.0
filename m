From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Aug 2018 22:54:11 +0200
Subject: [Buildroot] [PATCH 1/1] mjpegtools: fix build on powerpc
 without altivec
In-Reply-To: <20180822203008.3249-1-fontaine.fabrice@gmail.com>
References: <20180822203008.3249-1-fontaine.fabrice@gmail.com>
Message-ID: <20180822205411.GH2404@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2018-08-22 22:30 +0200, Fabrice Fontaine spake thusly:
> mpjegtools fails to build on powerpc without altivec:
> 
> build_sub44_mests.c: In function 'build_sub44_mests_altivec':
> build_sub44_mests.c:268:9: internal compiler error: Segmentation fault
>      vr1 = vec_ld(rowstride, (unsigned char*)s44blk);
> 
> It seems mpjegtools is wrongly detecting altivec support:
> configure:   - PowerPC Optimizations:
> configure:     - AltiVec enabled             : true
> 
> Fix this by adding BR2_PACKAGE_MJPEGTOOLS_SIMD_SUPPORT and setting
> --enable-simd-accel / --disable-simd-accel
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/c9464712f43efb8954fd2e5460126ad193660353
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

But see a little comment below...

> ---
>  package/mjpegtools/Config.in     | 5 +++++
>  package/mjpegtools/mjpegtools.mk | 6 ++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/package/mjpegtools/Config.in b/package/mjpegtools/Config.in
> index c486361a87..968f9e7d65 100644
> --- a/package/mjpegtools/Config.in
> +++ b/package/mjpegtools/Config.in
> @@ -12,6 +12,11 @@ config BR2_PACKAGE_MJPEGTOOLS
>  
>  	  http://mjpeg.sourceforge.net
>  
> +config BR2_PACKAGE_MJPEGTOOLS_SIMD_SUPPORT
> +	bool
> +	default y if BR2_X86_CPU_HAS_MMX
> +	default y if BR2_POWERPC_CPU_HAS_ALTIVEC

The commit log should have said that mjpegtools will use
--enable-simd-accel only to enable x86's MMX or ppc's altivec,
and that it had no use for other archs.

Regards,
Yann E. MORIN.

>  comment "mjpegtools needs a toolchain w/ C++, threads"
>  	depends on BR2_USE_MMU
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/mjpegtools/mjpegtools.mk b/package/mjpegtools/mjpegtools.mk
> index c7392fa2b3..14713c868e 100644
> --- a/package/mjpegtools/mjpegtools.mk
> +++ b/package/mjpegtools/mjpegtools.mk
> @@ -10,6 +10,12 @@ MJPEGTOOLS_DEPENDENCIES = host-pkgconf jpeg
>  MJPEGTOOLS_LICENSE = GPL-2.0+
>  MJPEGTOOLS_LICENSE_FILES = COPYING
>  
> +ifeq ($(BR2_PACKAGE_MJPEGTOOLS_SIMD_SUPPORT),y)
> +MJPEGTOOLS_CONF_OPTS += --enable-simd-accel
> +else
> +MJPEGTOOLS_CONF_OPTS += --disable-simd-accel
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBPNG),y)
>  MJPEGTOOLS_CONF_OPTS += --with-libpng
>  MJPEGTOOLS_DEPENDENCIES += libpng
> -- 
> 2.14.1
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
