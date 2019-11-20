From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Nov 2019 14:49:54 +0100
Subject: [Buildroot] [PATCH] glibc: install glibc utils to target
In-Reply-To: <20191120121643.21943-1-Nikita.Sobolev@synopsys.com>
References: <20191120121643.21943-1-Nikita.Sobolev@synopsys.com>
Message-ID: <20191120144954.449964c6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Nikita,

Thanks for the patch!

On Wed, 20 Nov 2019 15:16:43 +0300
Nikita Sobolev <Nikita.Sobolev@synopsys.com> wrote:

> diff --git a/package/glibc/Config.in b/package/glibc/Config.in
> index 7821251087..43d6445177 100644
> --- a/package/glibc/Config.in
> +++ b/package/glibc/Config.in
> @@ -8,3 +8,18 @@ config BR2_PACKAGE_GLIBC
>  	help
>  	  https://www.gnu.org/software/libc/
>  endif
> +
> +if BR2_TOOLCHAIN_BUILDROOT_GLIBC

This condition is redundant, since glibc/Config.in already starts with:

if BR2_TOOLCHAIN_BUILDROOT_GLIBC


> +config BR2_PACKAGE_GLIBC_UTILS
> +	bool "Compile and install glibc utilities"

Just:

	bool "Install glibc utilities"

> +	depends on BR2_PACKAGE_GLIBC

This is not needed.

> +	depends on BR2_PACKAGE_BASH
> +	help
> +	  Enabling this option will compile and install the getconf,
> +	  ldconfig and ldd glibc utilities for the target.
> +
> +comment "Glibc utilities need bash"

Glibc -> glibc

> +	depends on !BR2_PACKAGE_BASH
> +
> +endif
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 68c6670007..db82792c2e 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -143,10 +143,17 @@ ifeq ($(BR2_PACKAGE_GDB),y)
>  GLIBC_LIBS_LIB += libthread_db.so.*
>  endif
>  
> +ifeq ($(BR2_PACKAGE_GLIBC_UTILS),y)
> +GLIBC_TARGET_UTILS_BIN = /build/posix/getconf /build/elf/ldconfig /build/elf/ldd

Drop the leading slash in each entry, and maybe the build/ as well, so:

GLIBC_TARGET_UTILS_BIN = posix/getconf elf/ldconfig elf/ldd

> +endif
> +
>  define GLIBC_INSTALL_TARGET_CMDS
>  	for libpattern in $(GLIBC_LIBS_LIB); do \
>  		$(call copy_toolchain_lib_root,$$libpattern) ; \
>  	done
> +	for util in $(GLIBC_TARGET_UTILS_BIN); do \
> +		$(INSTALL) -D -m 0755 $(@D)/$$util $(TARGET_DIR)/bin/ ;\
> +	done

Please use a make foreach loop instead, and a full destination path for
the target:

	$(foreach util,$(GLIBC_TARGET_UTILS_BIN), \
		$(INSTALL) -D -m 0755 $(@D)/build/$(util) $(TARGET_DIR)/bin/$(notdir $(util))
	)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
