From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Sep 2018 22:06:32 +0200
Subject: [Buildroot] [PATCH v2 4/6] arch: add support for RISC-V 64-bit
 (riscv64) architecture
In-Reply-To: <20180912102256.3164-5-mark.corbin@embecosm.com>
References: <20180912102256.3164-1-mark.corbin@embecosm.com>
 <20180912102256.3164-5-mark.corbin@embecosm.com>
Message-ID: <20180925220632.337de029@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Sep 2018 11:22:54 +0100, Mark Corbin wrote:
> This enables a riscv64 system to be built with a Buildroot generated
> toolchain (gcc >= 7.x, binutils >= 2.30, glibc only).
> 
> This configuration has been used to successfully build a qemu-bootable
> riscv-linux-4.15 kernel (https://github.com/riscv/riscv-linux.git).
> 
> Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>

I have applied this commit, after doing a few changes, see below.


> +ifeq ($(BR2_riscv),y)
> +
> +ifeq ($(BR2_ARCH_IS_64),y)
> +RISCV_GCC_ARCH = rv64i
> +endif
> +
> +ifeq ($(BR2_RISCV_ISA_RVM),y)
> +RISCV_GCC_ARCH := $(RISCV_GCC_ARCH)m
> +endif
> +ifeq ($(BR2_RISCV_ISA_RVA),y)
> +RISCV_GCC_ARCH := $(RISCV_GCC_ARCH)a
> +endif
> +ifeq ($(BR2_RISCV_ISA_RVF),y)
> +RISCV_GCC_ARCH := $(RISCV_GCC_ARCH)f
> +endif
> +ifeq ($(BR2_RISCV_ISA_RVD),y)
> +RISCV_GCC_ARCH := $(RISCV_GCC_ARCH)d
> +endif
> +ifeq ($(BR2_RISCV_ISA_RVC),y)
> +RISCV_GCC_ARCH := $(RISCV_GCC_ARCH)c
> +endif
> +
> +GCC_TARGET_ARCH := $(RISCV_GCC_ARCH)

In this file, I didn't see the point of the intermediate
RISCV_GCC_ARCH variable. So I've changed to use GCC_TARGET_ARCH
directly.

> +GLIBC_CONF_OPTS = \
> +		--with-pkgversion="Buildroot" \
> +		--without-cvs \
> +		--disable-profile \
> +		--without-gd \
> +		--enable-obsolete-rpc \
> +		--enable-kernel=$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)) \
> +		--with-headers=$(STAGING_DIR)/usr/include
> +
> +ifeq ($(BR2_x86_64),y)
> +GLIBC_CONF_OPTS += --enable-lock-elision
> +endif
> +
> +# Override the default library locations of /lib64/<abi> and
> +# /usr/lib64/<abi>/ for RISC-V.
> +ifeq ($(BR2_riscv),y)
> +GLIBC_CONF_OPTS += libc_cv_slibdir=/lib64 libc_cv_rtlddir=/lib
> +endif
> +
>  define GLIBC_CONFIGURE_CMDS
>  	mkdir -p $(@D)/build
>  	# Do the configuration
> @@ -98,14 +118,8 @@ define GLIBC_CONFIGURE_CMDS
>  		--build=$(GNU_HOST_NAME) \
>  		--prefix=/usr \
>  		--enable-shared \
> -		$(if $(BR2_x86_64),--enable-lock-elision) \
> -		--with-pkgversion="Buildroot" \
> -		--without-cvs \
> -		--disable-profile \
> -		--without-gd \
> -		--enable-obsolete-rpc \
> -		--enable-kernel=$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)) \
> -		--with-headers=$(STAGING_DIR)/usr/include)
> +		$(GLIBC_CONF_OPTS) \
> +	)

As I commented in an earlier review, libc_cv_* should be passed in the
environment, like other autoconf cache variables. So I did a
preliminary commit that creates a GLIBC_CONF_ENV variable, passed in
the glibc ./configure script environment, and that contains the
existing autoconf cache variables we were passing.

Then I adjusted your commit to simply add those libc_cv_* variables to
GLIBC_CONF_ENV:

+# Override the default library locations of /lib64/<abi> and
+# /usr/lib64/<abi>/ for RISC-V.
+ifeq ($(BR2_riscv),y)
+GLIBC_CONF_ENV += libc_cv_slibdir=/lib64 libc_cv_rtlddir=/lib
+endif

Thanks a lot for this contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
