From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 20 Aug 2018 18:35:08 -0500
Subject: [Buildroot] [RFC 1/3] toolchain/toolchain-wrapper: add linker
 wrapper
In-Reply-To: <1534220803-26737-2-git-send-email-matthew.weber@rockwellcollins.com>
References: <1534220803-26737-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1534220803-26737-2-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <CANQCQpa1RkFHF++U252PLFERFqa-fZ-m+pGgYJh40D=Tn6+StA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,
On Mon, Aug 13, 2018 at 11:26 PM Matt Weber
<matthew.weber@rockwellcollins.com> wrote:
>
>  - Updates symlink creation int/ext toolchain
>  - Adds new source file for link wrapper with build/install
>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/gcc/gcc.mk                                 |   7 +
>  .../toolchain-external/pkg-toolchain-external.mk   |   3 +
>  toolchain/toolchain-wrapper-ld.c                   | 252 +++++++++++++++++++++
>  toolchain/toolchain-wrapper.mk                     |  10 +
>  4 files changed, 272 insertions(+)
>  create mode 100644 toolchain/toolchain-wrapper-ld.c
>
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index 1ae9b7e..a380004 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -334,6 +334,13 @@ define HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
>                         ln -sf toolchain-wrapper $(ARCH)-linux$${i##$(GNU_TARGET_NAME)}; \
>                         ln -snf $$i.br_real $(ARCH)-linux$${i##$(GNU_TARGET_NAME)}.br_real; \
>                         ;; \
> +               *ld) \
> +                       rm -f $$i.br_real; \
> +                       mv $$i $$i.br_real; \
> +                       ln -sf toolchain-wrapper-ld $$i; \
> +                       ln -sf toolchain-wrapper-ld $(ARCH)-linux$${i##$(GNU_TARGET_NAME)}; \
> +                       ln -snf $$i.br_real $(ARCH)-linux$${i##$(GNU_TARGET_NAME)}.br_real; \
> +                       ;; \
>                 *) \
>                         ln -snf $$i $(ARCH)-linux$${i##$(GNU_TARGET_NAME)}; \
>                         ;; \
> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> index 8b2c283..e4288bd 100644
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -274,6 +274,9 @@ define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
>                                 ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%..%') .; \
>                         fi \
>                         ;; \
> +               *ld) \
> +                       ln -sf toolchain-wrapper-ld $$base; \
> +                       ;; \
>                 *) \
>                         ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%..%') .; \
>                         ;; \
> diff --git a/toolchain/toolchain-wrapper-ld.c b/toolchain/toolchain-wrapper-ld.c
> new file mode 100644
> index 0000000..384c571
> --- /dev/null
> +++ b/toolchain/toolchain-wrapper-ld.c
> @@ -0,0 +1,252 @@
> +/**
> + * Buildroot wrapper for toolchains. This simply executes the real toolchain
> + * with a number of arguments hardcoded, to ensure the toolchain uses the
> + * correct configuration.
> +
> + * This file is based on the original wrapper code but updated for the linker.
> + *
> + * (C) 2011 Peter Korsgaard <jacmet@sunsite.dk>
> + * (C) 2011 Daniel Nystr?m <daniel.nystrom@timeterminal.se>
> + * (C) 2012 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> + * (C) 2013 Spenser Gilliland <spenser@gillilanding.com>
> + *
> + * This file is licensed under the terms of the GNU General Public License
> + * version 2.  This program is licensed "as is" without any warranty of any
> + * kind, whether express or implied.
> + */
> +
> +#define _GNU_SOURCE
> +#include <stdio.h>
> +#include <string.h>
> +#include <limits.h>
> +#include <unistd.h>
> +#include <stdlib.h>
> +#include <errno.h>
> +#include <time.h>
> +#include <stdbool.h>
> +
> +static char path[PATH_MAX];
> +
> +/**
> + * GCC linker errors out with certain combinations of arguments (examples are
> + * static/shared/r/pie, so we have to ensure that we only pass the predefined
> + * one to the real compiler if the inverse option isn't in the argument list.
> + * This specifies the worst case number of extra arguments we might pass
> + * Currently, we may have:
> + *     -pie
> + */
> +#define EXCLUSIVE_ARGS 1
> +
> +
> +/* A {string,length} tuple, to avoid computing strlen() on constants.
> + *  - str must be a \0-terminated string
> + *  - len does not account for the terminating '\0'
> + */
> +struct str_len_s {
> +       const char *str;
> +       size_t     len;
> +};
> +
> +/* Define a {string,length} tuple. Takes an unquoted constant string as
> + * parameter. sizeof() on a string literal includes the terminating \0,
> + * but we don't want to count it.
> + */
> +#define STR_LEN(s) { #s, sizeof(#s)-1 }
> +
> +/* List of paths considered unsafe for cross-compilation.
> + *
> + * An unsafe path is one that points to a directory with libraries or
> + * headers for the build machine, which are not suitable for the target.
> + */
> +static const struct str_len_s unsafe_paths[] = {
> +       STR_LEN(/lib),
> +       STR_LEN(/usr/include),
> +       STR_LEN(/usr/lib),
> +       STR_LEN(/usr/local/include),
> +       STR_LEN(/usr/local/lib),
> +       { NULL, 0 },
> +};
> +
> +/* Unsafe options are options that specify a potentialy unsafe path,
> + * that will be checked by check_unsafe_path(), below.
> + */
> +static const struct str_len_s unsafe_opts[] = {
> +       STR_LEN(-I),
> +       STR_LEN(-idirafter),
> +       STR_LEN(-iquote),
> +       STR_LEN(-isystem),
> +       STR_LEN(-L),
> +       { NULL, 0 },
> +};
> +
> +/* Check if path is unsafe for cross-compilation. Unsafe paths are those
> + * pointing to the standard native include or library paths.
> + *
> + * We print the arguments leading to the failure. For some options, gcc
> + * accepts the path to be concatenated to the argument (e.g. -I/foo/bar)
> + * or separated (e.g. -I /foo/bar). In the first case, we need only print
> + * the argument as it already contains the path (arg_has_path), while in
> + * the second case we need to print both (!arg_has_path).
> + *
> + * If paranoid, exit in error instead of just printing a warning.
> + */
> +static void check_unsafe_path(const char *arg,
> +                             const char *path,
> +                             int paranoid,
> +                             int arg_has_path)

I left unsafe path checking in as I assumed the -L searchdir could
still be specified when the linker is invoked.

Matt
