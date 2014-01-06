From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 6 Jan 2014 17:07:31 +0100
Subject: [Buildroot] [PATCH] toolchain/external: fix wrapper by not
 passing conflicting flags
In-Reply-To: <1388967142-3456-1-git-send-email-yann.morin.1998@free.fr>
References: <1388967142-3456-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <CAGduivx4AZW3ic8HvVDtCwe7tdb4v-w7PEwVOPb_D6gSz82mtA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Mon, Jan 6, 2014 at 1:12 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> In our wrapper, we forcibly add the -march=, -mcpu= and-mtune= flags
> to the actual copmpiler, this in an attempt to always generate correct
> and optimised code for the target.
>
> But in some cases, the caller knows better than we do, and passes its
> own set, or subset of those flags. In this case, some may conflict with
> the ones we pass. The most prominent offender being the Linux kernel.
>
> For example, on the ARM Rapsberry Pi, the Linux kernel will set the
> -march=armv6 flag and no -mcpu= flag, but we pass -mcpu=arm1176jzf-s,
> which conflicts:
>
>     drivers/scsi/scsi_trace.c:1:0: warning: switch -mcpu=arm1176jzf-s
>     conflicts with -march=armv6 switch
>
> (and so for all the files the kernel compiles, pretty messy)
> (note: arm1176jzf-s is not an armv6, it is an armv6zk. Yeah...)
>
> To avoid this situation, we scan our commandline for any occurence of
> the possibly conflicting flags. If none is found, then we add our owns.
> If any is found, then we don't add any of our owns.
>
> The idea behind this is that we trust the caller to know better than
> we do what it is doing. Since the biggest, and sole so far, offender
> is the Linux kernel, then this is a rather safe bet.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  .../toolchain-external/ext-toolchain-wrapper.c     | 41 ++++++++++++++++------
>  1 file changed, 31 insertions(+), 10 deletions(-)
>
> diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
> index d54f1f5..dd84a5d 100644
> --- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
> +++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
> @@ -30,21 +30,17 @@ static char sysroot[PATH_MAX];
>   * that we only pass the predefined one to the real compiler if the inverse
>   * option isn't in the argument list.
>   * This specifies the worst case number of extra arguments we might pass
> + * Currently, we have:
> + *     -mfloat-abi=
> + *     -march=
> + *     -mtune=
> + *     -mcpu=
>   */
> -#define EXCLUSIVE_ARGS 1
> +#define EXCLUSIVE_ARGS 4
>
>  static char *predef_args[] = {
>         path,
>         "--sysroot", sysroot,
> -#ifdef BR_ARCH
> -       "-march=" BR_ARCH,
> -#endif /* BR_ARCH */
> -#ifdef BR_TUNE
> -       "-mtune=" BR_TUNE,
> -#endif /* BR_TUNE */
> -#ifdef BR_CPU
> -       "-mcpu=" BR_CPU,
> -#endif
>  #ifdef BR_ABI
>         "-mabi=" BR_ABI,
>  #endif
> @@ -157,6 +153,31 @@ int main(int argc, char **argv)
>                 *cur++ = "-mfloat-abi=" BR_FLOAT_ABI;
>  #endif
>
> +#if defined(BR2_ARCH) || \
> +    defined(BR2_TUNE) || \
> +    defined(BR2_CPU)
Shouldn't this be BR_* ?
> +       /* Add our -march/cpu/tune/abi flags, but only if none are
> +        * already specified on the commandline
> +        */
> +       for (i = 1; i < argc; i++) {
> +               if (!strncmp(argv[i], "-march=", strlen("-march=")) ||
> +                   !strncmp(argv[i], "-mtune=", strlen("-mtune=")) ||
> +                   !strncmp(argv[i], "-mcpu=",  strlen("-mcpu=" )))
> +                       break;
> +       }
> +       if (i == argc) {
> +#ifdef BR_ARCH
> +               *cur++ = "-march=" BR_ARCH;
> +#endif
> +#ifdef BR_TUNE
> +               *cur++ = "-mtune=" BR_TUNE;
> +#endif
> +#ifdef BR_CPU
> +               *cur++ = "-mcpu=" BR_CPU;
> +#endif
> +       }
> +#endif /* ARCH || TUNE || CPU */
> +
>         /* append forward args */
>         memcpy(cur, &argv[1], sizeof(char *) * (argc - 1));
>         cur += argc - 1;
> --
> 1.8.1.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

After modifying to use BR instead of BR2 variable, your patch did what
was intended.
It suppressed all theses pesky messages while building the kernel.

I am currently doing a full build, will report once it's done.
