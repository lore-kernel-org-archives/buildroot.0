From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 9 Sep 2019 09:29:11 -0500
Subject: [Buildroot] [PATCH v2 07/12] package/busybox: fix applets
 runtime issue when building with clang cross-compiler
In-Reply-To: <20190907094027.9537-8-romain.naour@smile.fr>
References: <20190907094027.9537-1-romain.naour@smile.fr>
 <20190907094027.9537-8-romain.naour@smile.fr>
Message-ID: <CANQCQpYVyihp-KreDsTPD_Q6bcip3pGMeX9MMJTHNt4zRsQTGA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Sat, Sep 7, 2019 at 4:40 AM Romain Naour <romain.naour@smile.fr> wrote:
>
> Apply a patch contributed by Luis Marques on the Busybox mailing list [1]
> fixing a runtime issue (segfault) when busybox is compiled by Clang.
>
> The patch disable the compiler optimizations for Clang/LLVM only.
>
> Without this patch, busybox segfault with several applets
> (login on aarch64 using Clang 8.0.1, init on x86_64 using Clang 9.0.0rc3)
>
> [1] http://lists.busybox.net/pipermail/busybox/2019-June/087337.html
>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Luis Marques <luismarques@lowrisc.org>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>

Did a build time test using the qemu aarch64 configuration, selecting
the prebuilt external toolchain and enabling the Clang as
cross-compiler option.
I then booted this configuration in qemu and logged in.
# dmesg | grep clang
Linux version 4.19.16 (mlweber1 at fooobar) (clang version 8.0.1
(tags/RELEASE_801/final)) #1 SMP Mon Sep 9 09:25:19 CDT 2019
#

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>


> Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
> ---
> Note:
>  The Luis Marques's SoB line in the Busybox patch is missing.
>  The patch is still under review to avoid disabling optimizations.
> ---
>  ...use-BB_GLOBAL_CONST-where-applicable.patch | 173 ++++++++++++++++++
>  1 file changed, 173 insertions(+)
>  create mode 100644 package/busybox/0003-use-BB_GLOBAL_CONST-where-applicable.patch
>
> diff --git a/package/busybox/0003-use-BB_GLOBAL_CONST-where-applicable.patch b/package/busybox/0003-use-BB_GLOBAL_CONST-where-applicable.patch
> new file mode 100644
> index 0000000000..738a15b0de
> --- /dev/null
> +++ b/package/busybox/0003-use-BB_GLOBAL_CONST-where-applicable.patch
> @@ -0,0 +1,173 @@
> +From 6f53fa8303edff685aee3cc16a6c8967fae869db Mon Sep 17 00:00:00 2001
> +From: Luis Marques <luismarques@lowrisc.org>
> +Date: Wed, 4 Sep 2019 17:48:39 +0200
> +Subject: [PATCH] use BB_GLOBAL_CONST where applicable
> +
> +Signed-off-by: Romain Naour <romain.naour@smile.fr>
> +---
> + coreutils/test.c          |  3 +--
> + coreutils/test_ptr_hack.c |  2 +-
> + include/libbb.h           | 27 +++++++++++++++++++++++++--
> + libbb/lineedit.c          |  3 +--
> + libbb/lineedit_ptr_hack.c |  2 +-
> + libbb/ptr_to_globals.c    |  2 +-
> + shell/ash.c               | 13 -------------
> + shell/ash_ptr_hack.c      |  6 +++---
> + 8 files changed, 33 insertions(+), 25 deletions(-)
> +
> +diff --git a/coreutils/test.c b/coreutils/test.c
> +index 8d7dac025..e1d440106 100644
> +--- a/coreutils/test.c
> ++++ b/coreutils/test.c
> +@@ -400,8 +400,7 @@ struct test_statics {
> +       jmp_buf leaving;
> + };
> +
> +-/* See test_ptr_hack.c */
> +-extern struct test_statics *const test_ptr_to_statics;
> ++extern struct test_statics *BB_GLOBAL_CONST test_ptr_to_statics;
> +
> + #define S (*test_ptr_to_statics)
> + #define args            (S.args         )
> +diff --git a/coreutils/test_ptr_hack.c b/coreutils/test_ptr_hack.c
> +index 5ba9dcc68..6759b2144 100644
> +--- a/coreutils/test_ptr_hack.c
> ++++ b/coreutils/test_ptr_hack.c
> +@@ -18,6 +18,6 @@ struct test_statics *test_ptr_to_statics;
> + /* gcc -combine will see through and complain */
> + /* Using alternative method which is more likely to break
> +  * on weird architectures, compilers, linkers and so on */
> +-struct test_statics *const test_ptr_to_statics __attribute__ ((section (".data")));
> ++struct test_statics *BB_GLOBAL_CONST test_ptr_to_statics __attribute__ ((section (".data")));
> +
> + #endif
> +diff --git a/include/libbb.h b/include/libbb.h
> +index 021100db1..2523fd89c 100644
> +--- a/include/libbb.h
> ++++ b/include/libbb.h
> +@@ -338,10 +338,33 @@ struct BUG_off_t_size_is_misdetected {
> + #endif
> + #endif
> +
> ++/* We use a trick to have more optimized code (fewer pointer reloads). E.g.:
> ++ *  ash.c:   extern struct globals *const ash_ptr_to_globals;
> ++ *  ash_ptr_hack.c: struct globals *ash_ptr_to_globals;
> ++ * This way, compiler in ash.c knows the pointer cannot change.
> ++ *
> ++ * However, this relies on C undefined behavior, so we whitelist compilers
> ++ * where we know this isn't problematic, by using the the BB_GLOBAL_CONST
> ++ * preprocessor definition.
> ++ * If you are sure this trick also works with your toolchain you can add
> ++ * "-DBB_GLOBAL_CONST='const'" to CONFIG_EXTRA_CFLAGS or add your compiler to
> ++ * the whitelist below.
> ++ */
> ++
> ++#ifndef BB_GLOBAL_CONST
> ++# if defined(__clang__)
> ++#  define BB_GLOBAL_CONST
> ++# elif defined(__GNUC__)
> ++#  define BB_GLOBAL_CONST const
> ++# else
> ++#  define BB_GLOBAL_CONST
> ++# endif
> ++#endif
> ++
> + #if defined(__GLIBC__)
> + /* glibc uses __errno_location() to get a ptr to errno */
> + /* We can just memorize it once - no multithreading in busybox :) */
> +-extern int *const bb_errno;
> ++extern int *BB_GLOBAL_CONST bb_errno;
> + #undef errno
> + #define errno (*bb_errno)
> + #endif
> +@@ -2109,7 +2132,7 @@ struct globals;
> + /* '*const' ptr makes gcc optimize code much better.
> +  * Magic prevents ptr_to_globals from going into rodata.
> +  * If you want to assign a value, use SET_PTR_TO_GLOBALS(x) */
> +-extern struct globals *const ptr_to_globals;
> ++extern struct globals *BB_GLOBAL_CONST ptr_to_globals;
> + /* At least gcc 3.4.6 on mipsel system needs optimization barrier */
> + #define barrier() __asm__ __volatile__("":::"memory")
> + #define SET_PTR_TO_GLOBALS(x) do { \
> +diff --git a/libbb/lineedit.c b/libbb/lineedit.c
> +index fbabc6c12..b9e9719c5 100644
> +--- a/libbb/lineedit.c
> ++++ b/libbb/lineedit.c
> +@@ -180,8 +180,7 @@ struct lineedit_statics {
> + #endif
> + };
> +
> +-/* See lineedit_ptr_hack.c */
> +-extern struct lineedit_statics *const lineedit_ptr_to_statics;
> ++extern struct lineedit_statics *BB_GLOBAL_CONST lineedit_ptr_to_statics;
> +
> + #define S (*lineedit_ptr_to_statics)
> + #define state            (S.state           )
> +diff --git a/libbb/lineedit_ptr_hack.c b/libbb/lineedit_ptr_hack.c
> +index dc45855d5..ac33bd409 100644
> +--- a/libbb/lineedit_ptr_hack.c
> ++++ b/libbb/lineedit_ptr_hack.c
> +@@ -18,6 +18,6 @@ struct lineedit_statics *lineedit_ptr_to_statics;
> + /* gcc -combine will see through and complain */
> + /* Using alternative method which is more likely to break
> +  * on weird architectures, compilers, linkers and so on */
> +-struct lineedit_statics *const lineedit_ptr_to_statics __attribute__ ((section (".data")));
> ++struct lineedit_statics *BB_GLOBAL_CONST lineedit_ptr_to_statics __attribute__ ((section (".data")));
> +
> + #endif
> +diff --git a/libbb/ptr_to_globals.c b/libbb/ptr_to_globals.c
> +index 8ba9cd154..26d7b2042 100644
> +--- a/libbb/ptr_to_globals.c
> ++++ b/libbb/ptr_to_globals.c
> +@@ -25,7 +25,7 @@ int *bb_errno;
> + /* gcc -combine will see through and complain */
> + /* Using alternative method which is more likely to break
> +  * on weird architectures, compilers, linkers and so on */
> +-struct globals *const ptr_to_globals __attribute__ ((section (".data")));
> ++struct globals *BB_GLOBAL_CONST ptr_to_globals __attribute__ ((section (".data")));
> +
> + #ifdef __GLIBC__
> + int *const bb_errno __attribute__ ((section (".data")));
> +diff --git a/shell/ash.c b/shell/ash.c
> +index e3bbac9a0..3141f3812 100644
> +--- a/shell/ash.c
> ++++ b/shell/ash.c
> +@@ -288,19 +288,6 @@ typedef long arith_t;
> + # error "Do not even bother, ash will not run on NOMMU machine"
> + #endif
> +
> +-/* We use a trick to have more optimized code (fewer pointer reloads):
> +- *  ash.c:   extern struct globals *const ash_ptr_to_globals;
> +- *  ash_ptr_hack.c: struct globals *ash_ptr_to_globals;
> +- * This way, compiler in ash.c knows the pointer can not change.
> +- *
> +- * However, this may break on weird arches or toolchains. In this case,
> +- * set "-DBB_GLOBAL_CONST=''" in CONFIG_EXTRA_CFLAGS to disable
> +- * this optimization.
> +- */
> +-#ifndef BB_GLOBAL_CONST
> +-# define BB_GLOBAL_CONST const
> +-#endif
> +-
> +
> + /* ============ Hash table sizes. Configurable. */
> +
> +diff --git a/shell/ash_ptr_hack.c b/shell/ash_ptr_hack.c
> +index f69840825..af16cca27 100644
> +--- a/shell/ash_ptr_hack.c
> ++++ b/shell/ash_ptr_hack.c
> +@@ -22,8 +22,8 @@ struct globals_var      *ash_ptr_to_globals_var;
> + /* gcc -combine will see through and complain */
> + /* Using alternative method which is more likely to break
> +  * on weird architectures, compilers, linkers and so on */
> +-struct globals_misc     *const ash_ptr_to_globals_misc __attribute__ ((section (".data")));
> +-struct globals_memstack *const ash_ptr_to_globals_memstack __attribute__ ((section (".data")));
> +-struct globals_var      *const ash_ptr_to_globals_var __attribute__ ((section (".data")));
> ++struct globals_misc     *BB_GLOBAL_CONST ash_ptr_to_globals_misc __attribute__ ((section (".data")));
> ++struct globals_memstack *BB_GLOBAL_CONST ash_ptr_to_globals_memstack __attribute__ ((section (".data")));
> ++struct globals_var      *BB_GLOBAL_CONST ash_ptr_to_globals_var __attribute__ ((section (".data")));
> +
> + #endif
> +--
> +2.21.0
> +
> --
> 2.21.0
>


--

Matthew Weber | Associate Director Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.
