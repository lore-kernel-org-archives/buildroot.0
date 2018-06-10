From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 10 Jun 2018 07:08:45 +0300
Subject: [Buildroot] [PATCH 1/1] pixiewps: fix static linking with
 uclibc-ng
In-Reply-To: <20180609135820.2002-1-fontaine.fabrice@gmail.com>
References: <20180609135820.2002-1-fontaine.fabrice@gmail.com>
Message-ID: <20180610040845.64npfwieiobvyxgy@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice, Thomas,

On Sat, Jun 09, 2018 at 03:58:20PM +0200, Fabrice Fontaine wrote:
> Fixes following linking error with uClibc-ng:
> /home/peko/autobuild/instance-0/output/host/lib/gcc/powerpc-buildroot-linux-uclibc/7.3.0/libgcc.a(unwind-dw2-fde-dip.o):
> In function `_Unwind_Find_FDE':
> /home/peko/autobuild/instance-0/output/build/host-gcc-final-7.3.0/build/powerpc-buildroot-linux-uclibc/libgcc/../../../libgcc/unwind-dw2-fde-dip.c:469:
> undefined reference to `dl_iterate_phdr'
> collect2: error: ld returned 1 exit status
> 
> Since uClibc-ng 1.0.18 a circular dependency between libc and libgcc
> exist, when static linking is used. It can be resolved by the compiler
> when -static is correctly passed in the linking step.
> 
> So rework a little bit how variables are passed by using
> PIXIEWPS_MAKE_OPTS and TARGET_CONFIGURE_OPTS
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/d9f0311538c8db1196839e36af3f6ef4e403be2b

Here is an example where uClibc also requires -static, even though the 
toolchain is static only. So musl in not alone here, cfr. bug #10996.

This also means that the lm-sensors RFC fix is correct:

  http://patchwork.ozlabs.org/patch/883243/

baruch

> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/pixiewps/pixiewps.mk | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/package/pixiewps/pixiewps.mk b/package/pixiewps/pixiewps.mk
> index 95a253ab83..56d15a0bbf 100644
> --- a/package/pixiewps/pixiewps.mk
> +++ b/package/pixiewps/pixiewps.mk
> @@ -9,13 +9,17 @@ PIXIEWPS_SITE = $(call github,wiire-a,pixiewps,$(PIXIEWPS_VERSION))
>  PIXIEWPS_LICENSE = GPL-3.0+
>  PIXIEWPS_LICENSE_FILES = LICENSE.md
>  
> +PIXIEWPS_MAKE_OPTS = \
> +	$(TARGET_CONFIGURE_OPTS) \
> +	PREFIX=/usr
> +
>  define PIXIEWPS_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) CC=$(TARGET_CC) -C $(@D)
> +	$(TARGET_MAKE_ENV) $(MAKE) $(PIXIEWPS_MAKE_OPTS) -C $(@D)
>  endef
>  
>  define PIXIEWPS_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) \
> -		PREFIX=/usr -C $(@D) install
> +	$(TARGET_MAKE_ENV) $(MAKE) $(PIXIEWPS_MAKE_OPTS) -C $(@D) \
> +		DESTDIR=$(TARGET_DIR) install
>  endef
>  
>  $(eval $(generic-package))

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
