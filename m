From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Mar 2016 23:55:43 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain: wrap 'ld' so that a ld
 emulation can be specified
In-Reply-To: <1455960835-28709-1-git-send-email-heyleke@gmail.com>
References: <1455960835-28709-1-git-send-email-heyleke@gmail.com>
Message-ID: <56FC4B5F.1040204@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/20/16 10:33, Jan Heylen wrote:
> On some architectures, such as MIPS, the linker supports several 'ld
> emulation', and depending on which flavor of the architecture you're
> building for, one should be passing the proper -m <something> option
> to ld, otherwise ld defaults to the default emulation, which may not
> necessarily be compatible with the object files that are being
> linked.
>
>    So, we extend the toolchain wrapper to also wrap the ld linker, and
>    allow a BR_LD_EMULATION variable to be passed to it.

  Why this sudden indentation?

  I would split this off into a separate patch, i.e. patch 1 only adds the ld 
wrapper, patch 2 introduces LD_EMULATION.

>
> Based upon patch from Thomas Petazzoni:
> http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/60942
>
> Signed-off-by: Jan Heylen <heyleke@gmail.com>
> ---
>   arch/Config.in                                     |  3 +
>   toolchain/toolchain-external/toolchain-external.mk |  6 +-

  You only do this for the external toolchain, it should probably be done for 
the internal toolchain as well. However, that is more tricky...

1. Where should it be done? It's currently done as a post-install hook of 
host-gcc-initial and again for host-gcc-final. For the ld wrapper, it would make 
sense to do it as part of host-binutils. However, the wrapper itself is 
currently compiled in host-gcc-initial, which comes after host-binutils...

2. For external toolchains, gcc itself will call the unwrapped ld, because it 
refers directly to the ld path at installation time. However, for internal 
toolchains, it refers to the host dir so to the wrapped ld.

3. Do the workarounds that we (I) added for 
internal-toolchain-used-as-external-toolchain still work with the ld wrapper?

  Actually, it turns out that 2. is not valid: gcc will call 
host/usr/<tuple>/bin/ld, which is not the wrapped one. One less thing to worry 
about :-)

  Note that you can add the wrapper for the external and the internal toolchain 
in separate patches as well.


>   toolchain/toolchain-wrapper.c                      | 75 ++++++++++++++--------
>   3 files changed, 55 insertions(+), 29 deletions(-)
>
> diff --git a/arch/Config.in b/arch/Config.in
> index 401bd28..50816c6 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -266,6 +266,9 @@ config BR2_GCC_TARGET_CPU
>   config BR2_GCC_TARGET_CPU_REVISION
>   	string
>
> +config BR2_LD_TARGET_EMULATION
> +	string
> +
>   # The value of this option will be passed as --with-fpu=<value> when
>   # building gcc (internal backend) or -mfpu=<value> in the toolchain
>   # wrapper (external toolchain)
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index 6c3022a..9396377 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -182,6 +182,7 @@ CC_TARGET_ABI_ := $(call qstrip,$(BR2_GCC_TARGET_ABI))
>   CC_TARGET_FPU_ := $(call qstrip,$(BR2_GCC_TARGET_FPU))
>   CC_TARGET_FLOAT_ABI_ := $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
>   CC_TARGET_MODE_ := $(call qstrip,$(BR2_GCC_TARGET_MODE))
> +LD_TARGET_EMULATION_:=$(call qstrip,$(BR2_LD_TARGET_EMULATION))

  There should be a space before and after :=

  Also it should be = instead of :=, but since the other assignments don't do 
that, let's keep it.

>
>   # march/mtune/floating point mode needs to be passed to the external toolchain
>   # to select the right multilib variant
> @@ -213,6 +214,9 @@ ifneq ($(CC_TARGET_MODE_),)
>   TOOLCHAIN_EXTERNAL_CFLAGS += -m$(CC_TARGET_MODE_)
>   TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_MODE='"$(CC_TARGET_MODE_)"'
>   endif
> +ifneq ($(LD_TARGET_EMULATION_),)
> +TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_LD_EMULATION='"$(LD_TARGET_EMULATION_)"'
> +endif
>   ifeq ($(BR2_BINFMT_FLAT),y)
>   TOOLCHAIN_EXTERNAL_CFLAGS += -Wl,-elf2flt
>   TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_BINFMT_FLAT
> @@ -711,7 +715,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
>   		*-ar|*-ranlib|*-nm) \
>   			ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
>   			;; \
> -		*cc|*cc-*|*++|*++-*|*cpp) \
> +		*cc|*cc-*|*++|*++-*|*cpp|*ld) \
>   			ln -sf toolchain-wrapper $$base; \
>   			;; \
>   		*gdb|*gdbtui) \
> diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
> index 887058f..25ce640 100644
> --- a/toolchain/toolchain-wrapper.c
> +++ b/toolchain/toolchain-wrapper.c
> @@ -42,7 +42,7 @@ static char sysroot[PATH_MAX];
>    */
>   #define EXCLUSIVE_ARGS	3
>
> -static char *predef_args[] = {
> +static char *gcc_predef_args[] = {
>   #ifdef BR_CCACHE
>   	ccache_path,
>   #endif
> @@ -80,6 +80,13 @@ static char *predef_args[] = {
>   #endif
>   };
>
> +static char *ld_predef_args[] = {
> +	path,
> +#ifdef BR_LD_EMULATION
> +	"-m", BR_LD_EMULATION,
> +#endif

  In addition to these, you should take over some more options from gcc:
BR_BINFMT_FLAT -> -elf2flt
BR_MIPS_TARGET_LITTLE_ENDIAN -> -EB
BR_MIPS/ARC_TARGET_BIG_ENDIAN -> -EL

  Probably also --sysroot, but I'm not sure what will happen if an external 
toolchain's binutils wasn't configured with --with-sysroot.

  Also we want to add BR2_TARGET_LDFLAGS as BR_ADDITIONAL_LDFLAGS, like we do 
for CFLAGS.

> +};
> +
>   static void check_unsafe_path(const char *path, int paranoid)
>   {
>   	char **c;
> @@ -108,7 +115,8 @@ int main(int argc, char **argv)
>   	char *env_debug;
>   	char *paranoid_wrapper;
>   	int paranoid;
> -	int ret, i, count = 0, debug;
> +	char **predef_args;
> +	int ret, i, predef_args_sz, count = 0, debug;

  Small nit: I consider it bad style to declare multiple variables in a single 
line (especially when one of them is initialised!), so let's not make that worse 
:-). I.e., put predef_args_sz on a separate line.

>
>   	/* Calculate the relative paths */
>   	basename = strrchr(progpath, '/');
> @@ -169,7 +177,15 @@ int main(int argc, char **argv)
>   		return 3;
>   	}
>
> -	cur = args = malloc(sizeof(predef_args) +
> +	if (!strncmp("-ld", basename + strlen(basename) - 3, 3)) {

  Actually, strcmp would be OK here, because it's at the end of the string. But 
explaining that takes more time than just adding the n :-)

  We will eventually also have gold, so don't match the -. That anyway also 
corresponds to the pattern you use to create the symlink to the wrapper.

> +		predef_args_sz = sizeof(ld_predef_args);
> +		predef_args = ld_predef_args;
> +	} else {
> +		predef_args_sz = sizeof(gcc_predef_args);
> +		predef_args = gcc_predef_args;
> +	}
> +
> +	cur = args = malloc(predef_args_sz +
>   			    (sizeof(char *) * (argc + EXCLUSIVE_ARGS)));
>   	if (args == NULL) {
>   		perror(__FILE__ ": malloc");
> @@ -177,42 +193,45 @@ int main(int argc, char **argv)
>   	}
>
>   	/* start with predefined args */
> -	memcpy(cur, predef_args, sizeof(predef_args));
> -	cur += sizeof(predef_args) / sizeof(predef_args[0]);
> +	memcpy(cur, predef_args, predef_args_sz);
> +	cur += predef_args_sz / sizeof(char *);
>
> +	/* following extras should only happen for non-ld wrappers */
> +	if (predef_args != ld_predef_args) {

  Since you have this condition, perhaps it's better to store the result of the 
strncmp in a bool and use a ?: in the one place where predef_args is used (in 
the memcpy). I think that would be more readable.

>   #ifdef BR_FLOAT_ABI
> -	/* add float abi if not overridden in args */
> -	for (i = 1; i < argc; i++) {
> -		if (!strncmp(argv[i], "-mfloat-abi=", strlen("-mfloat-abi=")) ||
> -		    !strcmp(argv[i], "-msoft-float") ||
> -		    !strcmp(argv[i], "-mhard-float"))
> -			break;
> -	}
> +		/* add float abi if not overridden in args */
> +		for (i = 1; i < argc; i++) {
> +			if (!strncmp(argv[i], "-mfloat-abi=", strlen("-mfloat-abi=")) ||
> +					!strcmp(argv[i], "-msoft-float") ||
> +					!strcmp(argv[i], "-mhard-float"))
> +				break;
> +		}
>
> -	if (i == argc)
> -		*cur++ = "-mfloat-abi=" BR_FLOAT_ABI;
> +		if (i == argc)
> +			*cur++ = "-mfloat-abi=" BR_FLOAT_ABI;
>   #endif
>
>   #if defined(BR_ARCH) || \
> -    defined(BR_CPU)
> -	/* Add our -march/cpu flags, but only if none of
> -	 * -march/mtune/mcpu are already specified on the commandline
> -	 */
> -	for (i = 1; i < argc; i++) {
> -		if (!strncmp(argv[i], "-march=", strlen("-march=")) ||
> -		    !strncmp(argv[i], "-mtune=", strlen("-mtune=")) ||
> -		    !strncmp(argv[i], "-mcpu=",  strlen("-mcpu=" )))
> -			break;
> -	}
> -	if (i == argc) {
> +		defined(BR_CPU)
> +		/* Add our -march/cpu flags, but only if none of
> +		 * -march/mtune/mcpu are already specified on the commandline
> +		 */
> +		for (i = 1; i < argc; i++) {
> +			if (!strncmp(argv[i], "-march=", strlen("-march=")) ||
> +					!strncmp(argv[i], "-mtune=", strlen("-mtune=")) ||
> +					!strncmp(argv[i], "-mcpu=",  strlen("-mcpu=" )))
> +				break;
> +		}
> +		if (i == argc) {
>   #ifdef BR_ARCH
> -		*cur++ = "-march=" BR_ARCH;
> +			*cur++ = "-march=" BR_ARCH;
>   #endif
>   #ifdef BR_CPU
> -		*cur++ = "-mcpu=" BR_CPU;
> +			*cur++ = "-mcpu=" BR_CPU;
>   #endif
> -	}
> +		}
>   #endif /* ARCH || CPU */
> +	}
>
>   	paranoid_wrapper = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
>   	if (paranoid_wrapper && strlen(paranoid_wrapper) > 0)
>

  BR_NO_CCACHE handling should also be skipped for ld, since ld_predef_args[0] 
is NOT ccache. Otherwise you'll get spectacular results when BR_NO_CCACHE is 
exported...

  Probably the other things under CCACHE ifdefs should not be done for ld 
either, though they don't really hurt.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
