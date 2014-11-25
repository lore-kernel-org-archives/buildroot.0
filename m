From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 25 Nov 2014 18:42:14 +0200
Subject: [Buildroot] [PATCH] botan: fix static build
In-Reply-To: <1416932097-12474-1-git-send-email-francois.perrad@gadz.org>
References: <1416932097-12474-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20141125164214.GA4690@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Francois,

On Tue, Nov 25, 2014 at 05:14:57PM +0100, Francois Perrad wrote:
> see http://autobuild.buildroot.net/results/2d1/2d1563e253b669b45c9df449c5b3a750c04a43dc/

Please mention in the commit log that this reverts commit 
84047394ed6ad08adb9f59a9022553a327eef040. Elaborating a bit on --no-autoload 
would also be nice.

baruch

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/botan/Config.in | 5 ++---
>  package/botan/botan.mk  | 2 +-
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/botan/Config.in b/package/botan/Config.in
> index c82a77f..733dc89 100644
> --- a/package/botan/Config.in
> +++ b/package/botan/Config.in
> @@ -10,12 +10,11 @@ config BR2_PACKAGE_BOTAN
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
> -	depends on !BR2_PREFER_STATIC_LIB # dlfcn.h
>  	help
>  	  Botan is a crypto library for C++
>  
>  	  http://botan.randombit.net
>  
> -comment "botan needs a toolchain w/ C++, threads, dynamic library"
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || BR2_PREFER_STATIC_LIB
> +comment "botan needs a toolchain w/ C++, threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
> diff --git a/package/botan/botan.mk b/package/botan/botan.mk
> index ae0e02d..2e47eb6 100644
> --- a/package/botan/botan.mk
> +++ b/package/botan/botan.mk
> @@ -20,7 +20,7 @@ BOTAN_CONF_OPTS = \
>  	--cc-bin="$(TARGET_CXX)"
>  
>  ifeq ($(BR2_PREFER_STATIC_LIB),y)
> -	BOTAN_CONF_OPTS += --disable-shared
> +	BOTAN_CONF_OPTS += --disable-shared --no-autoload
>  endif
>  
>  ifeq ($(BR2_PACKAGE_BZIP2),y)

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
