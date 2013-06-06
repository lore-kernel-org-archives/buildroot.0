From: Markos Chandras <hwoarang@gentoo.org>
Date: Thu, 6 Jun 2013 09:31:25 +0100
Subject: [Buildroot] [PATCH 1/2] toolchain: wrap 'ld' so that a ld
 emulation can be specified
In-Reply-To: <1370469543-20677-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1370469543-20677-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAG2jQ8jst0KgN9q5mEeGeeucctcr4g+-sCqQxaTguNFa7Mwh1Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 5 June 2013 22:59, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On some architectures, such as MIPS, the linker supports several 'ld
> emulation', and depending on which flavor of the architecture you're
> building for, one should be passing the proper -m <something> option
> to ld, otherwise ld defaults to the default emulation, which may not
> necessarily be compatible with the object files that are being
> linked. See for example the following build failure:
>
>   http://autobuild.buildroot.org/results/0e1/0e18e02e01148afb36acd2293b3fdc56c6bb8413/build-end.log
>
> So, we extend the toolchain wrapper to also wrap the ld linker, and
> allow a BR_LD_EMULATION variable to be passed to it.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  arch/Config.in                                     |  3 +++
>  toolchain/toolchain-external/ext-tool.mk           |  6 ++++-
>  .../toolchain-external/ext-toolchain-wrapper.c     | 26 +++++++++++++++++-----
>  3 files changed, 29 insertions(+), 6 deletions(-)
>
> diff --git a/arch/Config.in b/arch/Config.in
> index 5ca05cd..aab9922 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -192,6 +192,9 @@ config BR2_GCC_TARGET_CPU
>  config BR2_GCC_TARGET_CPU_REVISION
>         string
>
> +config BR2_LD_TARGET_EMULATION
> +       string
> +
>  # Set up target binary format
>  choice
>         prompt "Target Binary Format"
> diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
> index 93b3b15..c132e6a 100644
> --- a/toolchain/toolchain-external/ext-tool.mk
> +++ b/toolchain/toolchain-external/ext-tool.mk
> @@ -141,6 +141,7 @@ CC_TARGET_CPU_:=$(call qstrip,$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVISIO
>  endif
>  CC_TARGET_ARCH_:=$(call qstrip,$(BR2_GCC_TARGET_ARCH))
>  CC_TARGET_ABI_:=$(call qstrip,$(BR2_GCC_TARGET_ABI))
> +LD_TARGET_EMULATION_:=$(call qstrip,$(BR2_LD_TARGET_EMULATION))
>
>  # march/mtune/floating point mode needs to be passed to the external toolchain
>  # to select the right multilib variant
> @@ -164,6 +165,9 @@ ifneq ($(CC_TARGET_ABI_),)
>  TOOLCHAIN_EXTERNAL_CFLAGS += -mabi=$(CC_TARGET_ABI_)
>  TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_ABI='"$(CC_TARGET_ABI_)"'
>  endif
> +ifneq ($(LD_TARGET_EMULATION_),)
> +TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_LD_EMULATION='"$(LD_TARGET_EMULATION_)"'
> +endif
>  ifeq ($(BR2_BINFMT_FLAT),y)
>  TOOLCHAIN_EXTERNAL_CFLAGS += -Wl,-elf2flt
>  TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_BINFMT_FLAT
> @@ -468,7 +472,7 @@ $(HOST_DIR)/usr/bin/ext-toolchain-wrapper: $(STAMP_DIR)/ext-toolchain-installed
>         for i in $(TOOLCHAIN_EXTERNAL_CROSS)*; do \
>                 base=$${i##*/}; \
>                 case "$$base" in \
> -               *cc|*cc-*|*++|*++-*|*cpp) \
> +               *cc|*cc-*|*++|*++-*|*cpp|*ld) \
>                         ln -sf $(@F) $$base; \
>                         ;; \
>                 *) \
> diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
> index 9d79d68..e2b945e 100644
> --- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
> +++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
> @@ -23,7 +23,7 @@
>  static char path[PATH_MAX];
>  static char sysroot[PATH_MAX];
>
> -static char *predef_args[] = {
> +static char *gcc_predef_args[] = {
>         path,
>         "--sysroot", sysroot,
>  #ifdef BR_ARCH
> @@ -55,13 +55,21 @@ static char *predef_args[] = {
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
>  int main(int argc, char **argv)
>  {
>         char **args, **cur;
>         char *relbasedir, *absbasedir;
>         char *progpath = argv[0];
>         char *basename;
> -       int ret, i, count = 0;
> +       char **predef_args;
> +       int ret, i, predef_args_sz, count = 0;
>
>         /* Calculate the relative paths */
>         basename = strrchr(progpath, '/');
> @@ -113,15 +121,23 @@ int main(int argc, char **argv)
>                 return 3;
>         }
>
> -       cur = args = malloc(sizeof(predef_args) + (sizeof(char *) * argc));
> +       if (!strncmp("-ld", basename + strlen(basename) - 3, 3)) {
> +               predef_args_sz = sizeof(ld_predef_args);
> +               predef_args = ld_predef_args;
> +       } else {
> +               predef_args_sz = sizeof(gcc_predef_args);
> +               predef_args = gcc_predef_args;
> +       }
> +
> +       cur = args = malloc(predef_args_sz + (sizeof(char *) * argc));
>         if (args == NULL) {
>                 perror(__FILE__ ": malloc");
>                 return 2;
>         }
>
>         /* start with predefined args */
> -       memcpy(cur, predef_args, sizeof(predef_args));
> -       cur += sizeof(predef_args) / sizeof(predef_args[0]);
> +       memcpy(cur, predef_args, predef_args_sz);
> +       cur += predef_args_sz / sizeof(char *);
>
>         /* append forward args */
>         memcpy(cur, &argv[1], sizeof(char *) * (argc - 1));
> --
> 1.8.1.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Hi Thomas,

My understanding is that this is also a problem with buildroot
toolchains as well. So whilst your patch fixes the problem with
external
toolchains, MIPS64/n64 buildroot toolchains will still have the same problem.

--
Regards,
Markos Chandras - Gentoo Linux Developer
http://dev.gentoo.org/~hwoarang
