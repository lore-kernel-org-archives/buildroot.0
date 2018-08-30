From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 29 Aug 2018 22:20:17 -0500
Subject: [Buildroot] [PATCH 2/5] toolchain/toolchain-wrapper: add
 BR2_RELRO_FULL support
In-Reply-To: <1535577655-9583-3-git-send-email-matthew.weber@rockwellcollins.com>
References: <1535577655-9583-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1535577655-9583-3-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <CANQCQpaqvNZB1p-ytHCa8J4xHQ8DPLohtQK-MNXQnqzAFiBrRw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Wed, Aug 29, 2018 at 4:20 PM Matt Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/Makefile.in                  |  5 +++--
>  toolchain/toolchain-wrapper-linker.c | 22 +++++++++++++++++++-
>  toolchain/toolchain-wrapper.c        | 40 +++++++++++++++++++++++++++++++++++-
>  toolchain/toolchain-wrapper.mk       |  4 ++++
>  4 files changed, 67 insertions(+), 4 deletions(-)
>
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 14b3bbd..2e885bf 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -158,8 +158,9 @@ ifeq ($(BR2_RELRO_PARTIAL),y)
>  TARGET_HARDENED += $(TARGET_CFLAGS_RELRO)
>  TARGET_LDFLAGS += $(TARGET_CFLAGS_RELRO)
>  else ifeq ($(BR2_RELRO_FULL),y)
> -TARGET_HARDENED += -fPIE $(TARGET_CFLAGS_RELRO_FULL)
> -TARGET_LDFLAGS += -pie $(TARGET_CFLAGS_RELRO_FULL)
> +TARGET_HARDENED += $(TARGET_CFLAGS_RELRO_FULL)
> +# -DBR_SET_PIE is used by the GCC wrapper to tell when linking
> +TARGET_LDFLAGS += $(TARGET_CFLAGS_RELRO_FULL) -DBR_SET_PIE
>  endif
>
>  ifeq ($(BR2_FORTIFY_SOURCE_1),y)
> diff --git a/toolchain/toolchain-wrapper-linker.c b/toolchain/toolchain-wrapper-linker.c
> index b587fea..5e94e11 100644
> --- a/toolchain/toolchain-wrapper-linker.c
> +++ b/toolchain/toolchain-wrapper-linker.c
> @@ -33,8 +33,10 @@ static char path[PATH_MAX];
>   * one to the real compiler if the inverse option isn't in the argument list.
>   * This specifies the worst case number of extra arguments we might pass
>   * Currently, we may have:
> + *     -pie
> + *     -shared
>   */
> -#define EXCLUSIVE_ARGS 0
> +#define EXCLUSIVE_ARGS 2
>
>  static char *predef_args[] = {
>         path
> @@ -185,6 +187,24 @@ int main(int argc, char **argv)
>         memcpy(cur, predef_args, sizeof(predef_args));
>         cur += sizeof(predef_args) / sizeof(predef_args[0]);
>
> +#ifdef BR2_RELRO_FULL
> +       for (i = 1; i < argc; i++) {
> +               if (!strcmp(argv[i], "-static") ||
> +                   !strcmp(argv[i], "-r"))
> +                       break;
> +
> +               if( !strcmp(argv[i], "-shared") ) {
> +                    /* Setting the value to something so that the compiler
> +                       doesn't error on a empty '' when -share is removed */
> +                   argv[i] = "-DBR_moved_shared_before_pie";
> +                    *cur++ = "-shared";
> +                }

This logic for handling shared only works if there is a single shared.
Will send a v2 with both the linker and cc wrapper updated to scrub
multiple pie and shared args before rebuilding the string.

Matt
