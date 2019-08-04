From: Romain Naour <romain.naour@smile.fr>
Date: Sun, 4 Aug 2019 12:44:58 +0200
Subject: [Buildroot] [WIP 1/2] toolchain/toolchain-external: copy gcc
 files needed to run clang on the host
In-Reply-To: <20190804074545.28841-1-romain.naour@smile.fr>
References: <20190804074545.28841-1-romain.naour@smile.fr>
Message-ID: <81b5a1ff-b251-d2f5-f958-802c212fe2bf@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Le 04/08/2019 ? 09:45, Romain Naour a ?crit?:
> To build libfuzzer package Matthew Weber noticed that (host) clang
> doesn't run on the host without "-B $(HOST_DIR)/opt/ext-toolchain"
> option. This option add a new search path for binaries and object
> files used implicitly.
> 
> Without -B clang fail to link due to missing crtbeging.o file and libgcc:
> output/host/bin/aarch64-linux-gnu-ld: cannot find crtbegin.o: No such file or directory
> output/host/bin/aarch64-linux-gnu-ld: cannot find -lgcc
> 
> Indeed, clang search path doesn't include the dafault cross-gcc's search paths:
> 
> $ output/host/bin/clang -print-search-dirs
> programs: = output/host/bin:output/host/bin:/..//bin
> libraries: = output/host/lib/clang/8.0.0:
>              output/host/bin/../lib64:
>              /lib/../lib64:
>              /usr/lib/../lib64:
>              output/host/bin/../lib:
>              /lib:/usr/lib
> 
> Here is the same command for cross-gcc:
> 
> $ output/host/bin/aarch64-linux-gnu-gcc -print-search-dirs
> install: output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/
> programs: = output/host/opt/ext-toolchain/bin/../libexec/gcc/aarch64-linux-gnu/8.3.0/:
>             output/host/opt/ext-toolchain/bin/../libexec/gcc/:
>             output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/aarch64-linux-gnu/8.3.0/:
>             output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/
> libraries: = output/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/:
>              output/host/opt/ext-toolchain/bin/../lib/gcc/:
>              output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/lib/aarch64-linux-gnu/8.3.0/:
>              output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/lib/../lib64/:
>              output/host/aarch64-buildroot-linux-gnu/sysroot/lib/aarch64-linux-gnu/8.3.0/:
>              output/host/aarch64-buildroot-linux-gnu/sysroot/lib/../lib64/:
>              output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/aarch64-linux-gnu/8.3.0/:
>              output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/../lib64/:
>              output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/lib/:
>              output/host/aarch64-buildroot-linux-gnu/sysroot/lib/:
>              output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/


@arnout, as you suggested I added the following line in clang.mk (only for the
external toolchain case)

HOST_CLANG_CONF_OPTS += -DGCC_INSTALL_PREFIX=$(TOOLCHAIN_EXTERNAL_INSTALL_DIR)

As expected by [1] it doesn't work since we provide a sysroot to clang compiler.

aarch64-linux-gnu-ld: cannot find crtbegin.o: No such file or directory
aarch64-linux-gnu-ld: cannot find -lgcc

But It has some effect on search path:

$ output/host/bin/clang++ -print-search-dirs
programs: = output/host/bin:

output/host/opt/ext-toolchain/lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin

libraries: = output/host/lib/clang/8.0.0:
             output/host/opt/ext-toolchain/lib/gcc/aarch64-linux-gnu/8.3.0:

output/host/opt/ext-toolchain/lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/lib/../lib64:

output/host/opt/ext-toolchain/lib/gcc/aarch64-linux-gnu/8.3.0/../../../../lib64:
             output/host/bin/../lib64:/lib/../lib64:/usr/lib/../lib64:

output/host/opt/ext-toolchain/lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/lib:
             output/host/opt/ext-toolchain/lib/gcc/aarch64-linux-gnu/8.3.0/../../..:
             output/host/bin/../lib:
             /lib:/usr/lib

[1]
https://github.com/llvm-mirror/clang/blob/master/lib/Driver/ToolChains/Gnu.cpp#L1739

Maybe we needs to start patching clang if we don't want to hack the toolchain infra.

Best regards,
Romain

> 
> We can see that gcc default search path contains
> "output/host/opt/ext-toolchain" directory where the external toolchain
> has been extracted.
> 
> Since we want to use clang without additional option like -B,
> add some hook to copy crt*.o files in the clang default patch
> (output/host/lib/clang/8.0.0) and libgcc.a to STAGING_DIR.
> 
> Doing so allow to build fuzzme program without
> "-B $(HOST_DIR)/opt/ext-toolchain"
> 
> We fix this issue only the external toolchain backend, similar hooks
> are needed for internal toolchain backend.
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> This patch duplicate some functions from helpers.mk, but this allow
> to show what we need to do to fix this issue.
> 
> The compiler-rt series from Matt needs to be applied first:
> http://patchwork.ozlabs.org/patch/1093806/
> http://patchwork.ozlabs.org/patch/1093808/
> http://patchwork.ozlabs.org/patch/1093805/
> ---
>  .../pkg-toolchain-external.mk                 | 42 ++++++++++++++++++-
>  1 file changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> index c3ddff263f..33c732c9ae 100644
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -150,6 +150,45 @@ endif
>  
>  TOOLCHAIN_EXTERNAL_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS))
>  
> +# host clang needs "crt*.o" objects in it's default search path.
> +define TOOLCHAIN_EXTERNAL_INSTALL_GCC_OBJS_FOR_CLANG
> +	DESTDIR="lib/clang/$(HOST_CLANG_VERSION)/" ; \
> +	mkdir -p $(HOST_DIR)/$${DESTDIR} ; \
> +	LIBPATHS=`find $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/lib/gcc/ -name "crt*.o" 2>/dev/null` ; \
> +	for LIBPATH in  $${LIBPATHS} ; do \
> +		while true ; do \
> +			LIBNAME=`basename $${LIBPATH}`; \
> +			rm -fr $(HOST_DIR)/$${DESTDIR}/$${LIBNAME}; \
> +			if test -f $${LIBPATH}; then \
> +				$(INSTALL) -D -m0755 $${LIBPATH} $(HOST_DIR)/$${DESTDIR}/$${LIBNAME}; \
> +				break ; \
> +			else \
> +				exit -1; \
> +			fi; \
> +		done; \
> +	done
> +endef
> +
> +# host clang needs libgcc.a in STAGING_DIR
> +# opt/ext-toolchain/lib/gcc/aarch64-linux-gnu/8.3.0/libgcc.a
> +define TOOLCHAIN_EXTERNAL_INSTALL_GCC_LIBS_FOR_CLANG
> +	LIBPATHS=`find $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/lib/gcc/ -name "libgcc.a" 2>/dev/null` ; \
> +	ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
> +	for LIBPATH in $${LIBPATHS} ; do \
> +		while true ; do \
> +			LIBNAME=`basename $${LIBPATH}`; \
> +			DESTDIR=$${ARCH_LIB_DIR} ; \
> +			mkdir -p $(STAGING_DIR)/$${DESTDIR}; \
> +			rm -fr $(STAGING_DIR)/$${DESTDIR}/$${LIBNAME}; \
> +			if test -f $${LIBPATH}; then \
> +				$(INSTALL) -D -m0755 $${LIBPATH} $(STAGING_DIR)/$${DESTDIR}/$${LIBNAME}; \
> +				break ; \
> +			else \
> +				exit -1; \
> +			fi; \
> +		done; \
> +	done
> +endef
>  
>  #
>  # Definition of the CFLAGS to use with the external toolchain, as well as the
> @@ -490,7 +529,6 @@ define TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO
>  	fi
>  endef
>  
> -
>  ################################################################################
>  # inner-toolchain-external-package -- defines the generic installation rules
>  # for external toolchain packages
> @@ -569,6 +607,8 @@ define $(2)_INSTALL_STAGING_CMDS
>  	$$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS)
>  	$$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
>  	$$(TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
> +	$$(TOOLCHAIN_EXTERNAL_INSTALL_GCC_OBJS_FOR_CLANG)
> +	$$(TOOLCHAIN_EXTERNAL_INSTALL_GCC_LIBS_FOR_CLANG)
>  endef
>  
>  # Even though we're installing things in both the staging, the host
> 
