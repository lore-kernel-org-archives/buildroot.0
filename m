From: Jan Heylen <heyleke@gmail.com>
Date: Tue, 22 Mar 2016 17:19:44 +0100
Subject: [Buildroot] [PATCH 1/2] toolchain: wrap 'ld' so that a ld
	emulation can be specified
In-Reply-To: <1455960835-28709-1-git-send-email-heyleke@gmail.com>
References: <1455960835-28709-1-git-send-email-heyleke@gmail.com>
Message-ID: <CAGszK3hYQx9pUF=dUvEz=gPORdob2yT0+Frf3bo0P9G6j9+mkA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

it has been a month, I know the amount of patches in the queue is
high, but any luck at looking at this one, based upon a patch from
Thomas Petazzoni that was in the queue before, so should be ok ;-) ?

br,

Jan

On Sat, Feb 20, 2016 at 10:33 AM, Jan Heylen <heyleke@gmail.com> wrote:
> On some architectures, such as MIPS, the linker supports several 'ld
> emulation', and depending on which flavor of the architecture you're
> building for, one should be passing the proper -m <something> option
> to ld, otherwise ld defaults to the default emulation, which may not
> necessarily be compatible with the object files that are being
> linked.
>
>   So, we extend the toolchain wrapper to also wrap the ld linker, and
>   allow a BR_LD_EMULATION variable to be passed to it.
>
> Based upon patch from Thomas Petazzoni:
> http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/60942
>
> Signed-off-by: Jan Heylen <heyleke@gmail.com>
> ---
>  arch/Config.in                                     |  3 +
>  toolchain/toolchain-external/toolchain-external.mk |  6 +-
>  toolchain/toolchain-wrapper.c                      | 75 ++++++++++++++--------
>  3 files changed, 55 insertions(+), 29 deletions(-)
>
> diff --git a/arch/Config.in b/arch/Config.in
> index 401bd28..50816c6 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -266,6 +266,9 @@ config BR2_GCC_TARGET_CPU
>  config BR2_GCC_TARGET_CPU_REVISION
>         string
>
> +config BR2_LD_TARGET_EMULATION
> +       string
> +
>  # The value of this option will be passed as --with-fpu=<value> when
>  # building gcc (internal backend) or -mfpu=<value> in the toolchain
>  # wrapper (external toolchain)
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index 6c3022a..9396377 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -182,6 +182,7 @@ CC_TARGET_ABI_ := $(call qstrip,$(BR2_GCC_TARGET_ABI))
>  CC_TARGET_FPU_ := $(call qstrip,$(BR2_GCC_TARGET_FPU))
>  CC_TARGET_FLOAT_ABI_ := $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
>  CC_TARGET_MODE_ := $(call qstrip,$(BR2_GCC_TARGET_MODE))
> +LD_TARGET_EMULATION_:=$(call qstrip,$(BR2_LD_TARGET_EMULATION))
>
>  # march/mtune/floating point mode needs to be passed to the external toolchain
>  # to select the right multilib variant
> @@ -213,6 +214,9 @@ ifneq ($(CC_TARGET_MODE_),)
>  TOOLCHAIN_EXTERNAL_CFLAGS += -m$(CC_TARGET_MODE_)
>  TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_MODE='"$(CC_TARGET_MODE_)"'
>  endif
> +ifneq ($(LD_TARGET_EMULATION_),)
> +TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_LD_EMULATION='"$(LD_TARGET_EMULATION_)"'
> +endif
>  ifeq ($(BR2_BINFMT_FLAT),y)
>  TOOLCHAIN_EXTERNAL_CFLAGS += -Wl,-elf2flt
>  TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_BINFMT_FLAT
> @@ -711,7 +715,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
>                 *-ar|*-ranlib|*-nm) \
>                         ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
>                         ;; \
> -               *cc|*cc-*|*++|*++-*|*cpp) \
> +               *cc|*cc-*|*++|*++-*|*cpp|*ld) \
>                         ln -sf toolchain-wrapper $$base; \
>                         ;; \
>                 *gdb|*gdbtui) \
> diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
> index 887058f..25ce640 100644
> --- a/toolchain/toolchain-wrapper.c
> +++ b/toolchain/toolchain-wrapper.c
> @@ -42,7 +42,7 @@ static char sysroot[PATH_MAX];
>   */
>  #define EXCLUSIVE_ARGS 3
>
> -static char *predef_args[] = {
> +static char *gcc_predef_args[] = {
>  #ifdef BR_CCACHE
>         ccache_path,
>  #endif
> @@ -80,6 +80,13 @@ static char *predef_args[] = {
>  #endif
>  };
>
> +static char *ld_predef_args[] = {
> +       path,
> +#ifdef BR_LD_EMULATION
> +       "-m", BR_LD_EMULATION,
> +#endif
> +};
> +
>  static void check_unsafe_path(const char *path, int paranoid)
>  {
>         char **c;
> @@ -108,7 +115,8 @@ int main(int argc, char **argv)
>         char *env_debug;
>         char *paranoid_wrapper;
>         int paranoid;
> -       int ret, i, count = 0, debug;
> +       char **predef_args;
> +       int ret, i, predef_args_sz, count = 0, debug;
>
>         /* Calculate the relative paths */
>         basename = strrchr(progpath, '/');
> @@ -169,7 +177,15 @@ int main(int argc, char **argv)
>                 return 3;
>         }
>
> -       cur = args = malloc(sizeof(predef_args) +
> +       if (!strncmp("-ld", basename + strlen(basename) - 3, 3)) {
> +               predef_args_sz = sizeof(ld_predef_args);
> +               predef_args = ld_predef_args;
> +       } else {
> +               predef_args_sz = sizeof(gcc_predef_args);
> +               predef_args = gcc_predef_args;
> +       }
> +
> +       cur = args = malloc(predef_args_sz +
>                             (sizeof(char *) * (argc + EXCLUSIVE_ARGS)));
>         if (args == NULL) {
>                 perror(__FILE__ ": malloc");
> @@ -177,42 +193,45 @@ int main(int argc, char **argv)
>         }
>
>         /* start with predefined args */
> -       memcpy(cur, predef_args, sizeof(predef_args));
> -       cur += sizeof(predef_args) / sizeof(predef_args[0]);
> +       memcpy(cur, predef_args, predef_args_sz);
> +       cur += predef_args_sz / sizeof(char *);
>
> +       /* following extras should only happen for non-ld wrappers */
> +       if (predef_args != ld_predef_args) {
>  #ifdef BR_FLOAT_ABI
> -       /* add float abi if not overridden in args */
> -       for (i = 1; i < argc; i++) {
> -               if (!strncmp(argv[i], "-mfloat-abi=", strlen("-mfloat-abi=")) ||
> -                   !strcmp(argv[i], "-msoft-float") ||
> -                   !strcmp(argv[i], "-mhard-float"))
> -                       break;
> -       }
> +               /* add float abi if not overridden in args */
> +               for (i = 1; i < argc; i++) {
> +                       if (!strncmp(argv[i], "-mfloat-abi=", strlen("-mfloat-abi=")) ||
> +                                       !strcmp(argv[i], "-msoft-float") ||
> +                                       !strcmp(argv[i], "-mhard-float"))
> +                               break;
> +               }
>
> -       if (i == argc)
> -               *cur++ = "-mfloat-abi=" BR_FLOAT_ABI;
> +               if (i == argc)
> +                       *cur++ = "-mfloat-abi=" BR_FLOAT_ABI;
>  #endif
>
>  #if defined(BR_ARCH) || \
> -    defined(BR_CPU)
> -       /* Add our -march/cpu flags, but only if none of
> -        * -march/mtune/mcpu are already specified on the commandline
> -        */
> -       for (i = 1; i < argc; i++) {
> -               if (!strncmp(argv[i], "-march=", strlen("-march=")) ||
> -                   !strncmp(argv[i], "-mtune=", strlen("-mtune=")) ||
> -                   !strncmp(argv[i], "-mcpu=",  strlen("-mcpu=" )))
> -                       break;
> -       }
> -       if (i == argc) {
> +               defined(BR_CPU)
> +               /* Add our -march/cpu flags, but only if none of
> +                * -march/mtune/mcpu are already specified on the commandline
> +                */
> +               for (i = 1; i < argc; i++) {
> +                       if (!strncmp(argv[i], "-march=", strlen("-march=")) ||
> +                                       !strncmp(argv[i], "-mtune=", strlen("-mtune=")) ||
> +                                       !strncmp(argv[i], "-mcpu=",  strlen("-mcpu=" )))
> +                               break;
> +               }
> +               if (i == argc) {
>  #ifdef BR_ARCH
> -               *cur++ = "-march=" BR_ARCH;
> +                       *cur++ = "-march=" BR_ARCH;
>  #endif
>  #ifdef BR_CPU
> -               *cur++ = "-mcpu=" BR_CPU;
> +                       *cur++ = "-mcpu=" BR_CPU;
>  #endif
> -       }
> +               }
>  #endif /* ARCH || CPU */
> +       }
>
>         paranoid_wrapper = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
>         if (paranoid_wrapper && strlen(paranoid_wrapper) > 0)
> --
> 2.5.0
>
