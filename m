From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Apr 2016 22:02:28 +0200
Subject: [Buildroot] [PATCH] m68k: add support for coldfire with qemu
 config
In-Reply-To: <20160427173655.GA4947@waldemar-brodkorb.de>
References: <20160427173655.GA4947@waldemar-brodkorb.de>
Message-ID: <20160427220228.11902bd7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Cool, some coldfire stuff!

On Wed, 27 Apr 2016 19:36:55 +0200, Waldemar Brodkorb wrote:
> There are four different possibilities for m68k
> architecture and cpu support:
> m68k with MMU f.e m68040
> m68k without MMU f.e. m68020 (without coprocessor)
> coldfire without MMU f.e. mcf5208
> coldfire with MMU f.e. mcf5475
> 
> This adds just support for mcf5208.
> 
> We need to enable multilib to gcc build to support coldfire.

Can you give more details as to why multilib is needed? That's a fairly
significant change, so we shouldn't do it lightly.

> Tested with Qemu and simple flat binaries.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> It is neither complete coldfire support nor bugfree.
> After login you can execute a command and then getty is
> respawning login. Maybe a busybox init problem.

Hum, not great :-/

> 
> It is a starting point for any coldfire users.
> 
> For BR2_BINFMT_FLAT_SEP_DATA mode we must somehow
> filter-out -msep-data from CFLAGS passed to gcc multilib
> compile.
> 
> ---
>  arch/Config.in                                 |    2 +-
>  arch/Config.in.m68k                            |   16 +
>  board/qemu/m68k-mcf5208/busybox-minimal.config | 1057 ++++++++++++++++++++++++

Is this minimal Busybox config significantly different than the one in
board/stmicroelectronics/busybox-minimal.config ? If not, then maybe
it's time to move it to package/busybox/.

>  board/qemu/m68k-mcf5208/linux-4.5.config       |   21 +
>  board/qemu/m68k-mcf5208/m68k-post-build.sh     |    4 +
>  board/qemu/m68k-mcf5208/readme.txt             |    7 +
>  configs/qemu_m68k_mcf5208_defconfig            |   32 +
>  package/gcc/4.8.5/891-fix-m68k-uclinux.patch   |   17 +
>  package/gcc/4.9.3/891-fix-m68k-uclinux.patch   |   17 +
>  package/gcc/5.3.0/891-fix-m68k-uclinux.patch   |   17 +
>  package/gcc/gcc-final/gcc-final.mk             |   16 +
>  package/gcc/gcc-initial/gcc-initial.mk         |    8 +
>  package/uclibc/uclibc.mk                       |   16 +
>  13 files changed, 1229 insertions(+), 1 deletion(-)

This whole thing should be split into more patches. At least split the:

 1/ Architecture + toolchain support
 2/ Defconfig stuff
 3/ Addition of the Busybox configuration in package/busybox

> diff --git a/arch/Config.in.m68k b/arch/Config.in.m68k
> index 94494c8..8eb7e7a 100644
> --- a/arch/Config.in.m68k
> +++ b/arch/Config.in.m68k
> @@ -4,6 +4,14 @@ config BR2_ARCH
>  config BR2_ENDIAN
>  	default "BIG"
>  
> +# symbols used to distinguish between m68k and coldfire
> +# for gcc multilib
> +config BR2_m68k_m68k
> +	bool
> +
> +config BR2_m68k_cf
> +	bool
> +
>  # coldfire variants will be added later
>  choice
>  	prompt "Target CPU"
> @@ -14,8 +22,16 @@ choice
>  
>  config BR2_m68k_68040
>  	bool "68040"
> +	select BR2_m68k_m68k
> +	select BR2_ARCH_HAS_MMU_OPTIONAL

We used to select BR2_ARCH_HAS_MMU_MANDATORY. Are you sure you can
effectively run Linux on a 68040 with the MMU disabled? If you're not
sure, just keep BR2_ARCH_HAS_MMU_MANDATORY.

> +config BR2_m68k_cf5208
> +	bool "5208"
> +	select BR2_m68k_cf
> +	select BR2_SOFT_FLOAT
>  
>  endchoice
>  
>  config BR2_GCC_TARGET_CPU
>  	default "68040"		if BR2_m68k_68040
> +	default "5208"		if BR2_m68k_cf5208

You also want to add:

config BR2_GCC_TARGET_ARCH
	default "m68k" if BR2_m68k_m68k
	default "cf" if BR2_m68k_cf

this will allow to remove some stuff later on.

> +rm -f ${TARGET_DIR}/etc/init.d/S20urandom

Why ?


> +# mdev does not work correctly
> +BR2_ROOTFS_DEVICE_CREATION_STATIC=y

The default is not to use mdev, but to use devtmpfs only. Do you have
issues with this?

> diff --git a/package/gcc/4.8.5/891-fix-m68k-uclinux.patch b/package/gcc/4.8.5/891-fix-m68k-uclinux.patch
> new file mode 100644
> index 0000000..13bf0d9
> --- /dev/null
> +++ b/package/gcc/4.8.5/891-fix-m68k-uclinux.patch
> @@ -0,0 +1,17 @@
> +See here:
> +https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53833

Giving a link is good, but it's still good to add a quick description
of the patch nonetheless.


> diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
> index 69fdc0c..f07d4a0 100644
> --- a/package/gcc/gcc-final/gcc-final.mk
> +++ b/package/gcc/gcc-final/gcc-final.mk
> @@ -74,6 +74,14 @@ HOST_GCC_FINAL_CONF_OPTS += "--with-multilib-list=m4a,m4a-nofpu"
>  HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib/!m4*
>  endif
>  
> +# m68k/coldfire needs special configure options
> +ifeq ($(BR2_m68k_m68k),y)
> +HOST_GCC_INITIAL_CONF_OPTS += --with-arch=m68k --enable-multilib --with-system-zlib

You're in gcc-final, so touching HOST_GCC_INITIAL_CONF_OPTS looks weird.

You can remove the --with-arch part, is it already passed by
package/gcc/gcc.mk:

ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),)
HOST_GCC_COMMON_CONF_OPTS += --with-arch=$(BR2_GCC_TARGET_ARCH)
endif

Also, if you need to pass options to both the gcc-initial and
gcc-final, you should do it in package/gcc/gcc.mk, by appending to
HOST_GCC_COMMON_CONF_OPTS.

It would be good to have a better justification than "m68k/coldfire
needs special configure options" to explain why --enable-multilib
--with-system-zlib are needed.

> +# coldfire is not working without removing these object files from libgcc.a
> +ifeq ($(BR2_m68k_cf),y)
> +define HOST_GCC_FINAL_M68K_LIBGCC_FIXUP
> +	find $(STAGING_DIR) -name libgcc.a -print | while read t; do $(GNU_TARGET_NAME)-ar dv "$t" _ctors.o; done

Yerk, this looks really ugly. Is this a known problem in upstream gcc?


> +# m68k/coldfire needs special configure options
> +ifeq ($(BR2_m68k_m68k),y)
> +HOST_GCC_INITIAL_CONF_OPTS += --with-arch=m68k --enable-multilib --with-system-zlib
> +endif
> +ifeq ($(BR2_m68k_cf),y)
> +HOST_GCC_INITIAL_CONF_OPTS += --with-arch=cf --enable-multilib --with-system-zlib
> +endif

Same comments as above.


>  #
> +# m68k/coldfire definitions
> +#
> +
> +ifeq ($(UCLIBC_TARGET_ARCH),m68k)
> +
> +# disable DOPIC for flat without separate data
> +ifeq ($(BR2_BINFMT_FLAT_ONE),y)
> +define UCLIBC_M68K_BINFMT_FLAT
> +	$(call KCONFIG_DISABLE_OPT,DOPIC,$(@D)/.config)
> +endef
> +endif

In the end, isn't the removal of DOPIC necessary for all architectures
when binfmt_flat is used? We did the same thing for ARMv7-M, so I'm
wondering if we shouldn't make that generic.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
