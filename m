From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Sep 2020 00:06:27 +0200
Subject: [Buildroot] [PATCH v2 5/6] package/uclibc: fix compilation
 errors
In-Reply-To: <20200908113324.1022230-6-damien.lemoal@wdc.com>
References: <20200908113324.1022230-1-damien.lemoal@wdc.com>
 <20200908113324.1022230-6-damien.lemoal@wdc.com>
Message-ID: <20200908220627.GH14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Damien, All,

+Petr in Cc.

Can you guys agree on a set of backports

On 2020-09-08 20:33 +0900, Damien Le Moal spake thusly:
> Add four patches to fix compilation errors when building static no MMU
> uclibc. The first two patches are upstream uclibc patches on top of
> version 1.0.35 tag. The following two patches are added here as
> additional fixes.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  ...evert-Fix-static-linking-with-GCC-10.patch |  43 ++++++++
>  ...0002-fix-static-builds-with-gcc-10.x.patch |  25 +++++
>  ...-utils-getconf-Fix-compilation-error.patch | 103 ++++++++++++++++++
>  .../0004-librt-avoid-compilation-error.patch  |  42 +++++++
>  4 files changed, 213 insertions(+)
>  create mode 100644 package/uclibc/0001-Revert-Fix-static-linking-with-GCC-10.patch
>  create mode 100644 package/uclibc/0002-fix-static-builds-with-gcc-10.x.patch
>  create mode 100644 package/uclibc/0003-utils-getconf-Fix-compilation-error.patch
>  create mode 100644 package/uclibc/0004-librt-avoid-compilation-error.patch
> 
> diff --git a/package/uclibc/0001-Revert-Fix-static-linking-with-GCC-10.patch b/package/uclibc/0001-Revert-Fix-static-linking-with-GCC-10.patch
> new file mode 100644
> index 0000000000..6adc827308
> --- /dev/null
> +++ b/package/uclibc/0001-Revert-Fix-static-linking-with-GCC-10.patch
> @@ -0,0 +1,43 @@
> +From e80384786d7b7f895c97f2447d4b91af8eb5f0f4 Mon Sep 17 00:00:00 2001
> +From: Waldemar Brodkorb <wbx@openadk.org>
> +Date: Wed, 2 Sep 2020 09:45:17 +0200
> +Subject: [PATCH 1/4] Revert "Fix static linking with GCC-10"
> +
> +This reverts commit 5b58a1ebd89a4f05778441814e81817c82193fa3.
> +
> +This breaks all static builds earlier to gcc 10 :(
> +Bad testing on my side.

We need that the patches you backport carry your own sob-line, as well
as an pointer to upstream:

    [Damien: backport from https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=e80384786d7b7f895c97f2447d4b91af8eb5f0f4]
    Signed-off-by: Your NAME <your@email>

Applies to the secon backported patch as well.

[--SNIP--]
> diff --git a/package/uclibc/0003-utils-getconf-Fix-compilation-error.patch b/package/uclibc/0003-utils-getconf-Fix-compilation-error.patch
> new file mode 100644
> index 0000000000..2fc86d6161
> --- /dev/null
> +++ b/package/uclibc/0003-utils-getconf-Fix-compilation-error.patch
> @@ -0,0 +1,103 @@
> +From 684b80c97a38033cf0065537783ecf29bc2251ee Mon Sep 17 00:00:00 2001
> +From: Damien Le Moal <damien.lemoal@wdc.com>
> +Date: Mon, 7 Sep 2020 15:12:39 +0900
> +Subject: [PATCH 3/4] utils/getconf: Fix compilation error

I would honestly prefer if you had split this Buildroot patch in two:

  - one commit that backports the upstream uClibc-ng changes by
    Waldemar,

 - one commit that adds your two new changes.

Applying backported patches is a pretty trivial affair (I tend to just
verify that the referenced commit does exist, and this is very fast as I
have a lot of git trees on my local machine].

But applying non-upstream commits usually undergo quite some more
scrutiny.

> +Avoid "warning: statement will never be executed" compilation error if
> +none of the cases are defined.
> +
> +Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>

I know Thomas suggested those to be sent upstream and you agreed. So
don't forget to do so! ;-)

If already done, then a pointer to the upstream bugzilla or mailing list
thread would be good:

    [upstream: pending review: https://some/mailing/list/message.html]

Regards,
Yann E. MORIN.

> +---
> + utils/getconf.c | 20 +++++++++++++++++---
> + 1 file changed, 17 insertions(+), 3 deletions(-)
> +
> +diff --git a/utils/getconf.c b/utils/getconf.c
> +index 3dd3d75d9..b8d00f90f 100644
> +--- a/utils/getconf.c
> ++++ b/utils/getconf.c
> +@@ -1154,7 +1154,6 @@ environment SPEC.\n\n");
> + 
> +   const char *spec = NULL;
> +   char buf[sizeof "POSIX_V6_LPBIG_OFFBIG"];
> +-  char *argv0 = argv[0];
> +   if (argc > 1 && strncmp (argv[1], "-v", 2) == 0)
> +     {
> +       if (argv[1][2] == '\0')
> +@@ -1199,42 +1198,56 @@ environment SPEC.\n\n");
> + 
> +       switch (specs[i].num)
> + 	{
> ++#undef DO_GETCONF_NAME
> + #if !defined(_XBS5_ILP32_OFF32) && defined(_SC_XBS5_ILP32_OFF32)
> ++#define DO_GETCONF_NAME
> + 	case _SC_XBS5_ILP32_OFF32:
> + #endif
> + #if !defined(_XBS5_ILP32_OFFBIG) && defined(_SC_XBS5_ILP32_OFFBIG)
> ++#define DO_GETCONF_NAME
> + 	case _SC_XBS5_ILP32_OFFBIG:
> + #endif
> + #if !defined(_XBS5_LP64_OFF64) && defined(_SC_XBS5_LP64_OFF64)
> ++#define DO_GETCONF_NAME
> + 	case _SC_XBS5_LP64_OFF64:
> + #endif
> + #if !defined(_XBS5_LPBIG_OFFBIG) && defined(_SC_XBS5_LPBIG_OFFBIG)
> ++#define DO_GETCONF_NAME
> + 	case _SC_XBS5_LPBIG_OFFBIG:
> + #endif
> + #if !defined(_POSIX_V6_ILP32_OFF32) && defined(_SC_V6_ILP32_OFF32)
> ++#define DO_GETCONF_NAME
> + 	case _SC_V6_ILP32_OFF32:
> + #endif
> + #if !defined(_POSIX_V6_ILP32_OFFBIG) && defined(_SC_V6_ILP32_OFFBIG)
> ++#define DO_GETCONF_NAME
> + 	case _SC_V6_ILP32_OFFBIG:
> + #endif
> + #if !defined(_POSIX_V6_LP64_OFF64) && defined(_SC_V6_LP64_OFF64)
> ++#define DO_GETCONF_NAME
> + 	case _SC_V6_LP64_OFF64:
> + #endif
> + #if !defined(_POSIX_V6_LPBIG_OFFBIG) && defined(_SC_V6_LPBIG_OFFBIG)
> ++#define DO_GETCONF_NAME
> + 	case _SC_V6_LPBIG_OFFBIG:
> + #endif
> + #if !defined(_POSIX_V7_ILP32_OFF32) && defined(_SC_V7_ILP32_OFF32)
> ++#define DO_GETCONF_NAME
> + 	case _SC_V7_ILP32_OFF32:
> + #endif
> + #if !defined(_POSIX_V7_ILP32_OFFBIG) && defined(_SC_V7_ILP32_OFFBIG)
> ++#define DO_GETCONF_NAME
> + 	case _SC_V7_ILP32_OFFBIG:
> + #endif
> + #if !defined(_POSIX_V7_LP64_OFF64) && defined(_SC_V7_LP64_OFF64)
> ++#define DO_GETCONF_NAME
> + 	case _SC_V7_LP64_OFF64:
> + #endif
> + #if !defined(_POSIX_V7_LPBIG_OFFBIG) && defined(_SC_V7_LPBIG_OFFBIG)
> ++#define DO_GETCONF_NAME
> + 	case _SC_V7_LPBIG_OFFBIG:
> + #endif
> ++#ifdef DO_GETCONF_NAME
> + 	    {
> + 	      const char *args[argc + 3];
> + 	      size_t spec_len = strlen (spec);
> +@@ -1242,14 +1255,15 @@ environment SPEC.\n\n");
> + 	      memcpy (mempcpy (mempcpy (getconf_name, getconf_dir,
> + 					getconf_dirlen),
> + 			       "/", 1), spec, spec_len + 1);
> +-	      args[0] = argv0;
> ++	      args[0] = argv[0];
> + 	      args[1] = "-v";
> + 	      args[2] = spec;
> + 	      memcpy (&args[3], &argv[1], argc * sizeof (argv[1]));
> + 	      execv (getconf_name, (char * const *) args);
> + 	      error (4, errno, _("Couldn't execute %s"), getconf_name);
> + 	    }
> +-	  default:
> ++#endif
> ++	default:
> + 	    break;
> + 	}
> +     }
> +-- 
> +2.26.2
> +
> diff --git a/package/uclibc/0004-librt-avoid-compilation-error.patch b/package/uclibc/0004-librt-avoid-compilation-error.patch
> new file mode 100644
> index 0000000000..c0b7177f58
> --- /dev/null
> +++ b/package/uclibc/0004-librt-avoid-compilation-error.patch
> @@ -0,0 +1,42 @@
> +From 4f7150086ffc2936d2c0f44e136984fcb232f7c7 Mon Sep 17 00:00:00 2001
> +From: Damien Le Moal <damien.lemoal@wdc.com>
> +Date: Mon, 7 Sep 2020 16:51:09 +0900
> +Subject: [PATCH 4/4] librt: avoid compilation error
> +
> +For no MMU builds, LIBC_CANCEL_ASYNC and LIBC_CANCEL_RESET are not
> +defined. Prevent these to by visible by the compiler in
> +clock_nanosleep() by replacing "if (SINGLE_THREAD_P) {" with the
> +pre-compiler directive "#if defined(SINGLE_THREAD_P)".
> +
> +Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> +---
> + librt/clock_nanosleep.c | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/librt/clock_nanosleep.c b/librt/clock_nanosleep.c
> +index 4cf1e06b4..1515cf5b0 100644
> +--- a/librt/clock_nanosleep.c
> ++++ b/librt/clock_nanosleep.c
> +@@ -36,9 +36,9 @@ clock_nanosleep (clockid_t clock_id, int flags, const struct timespec *req,
> +   if (clock_id == CLOCK_PROCESS_CPUTIME_ID)
> +     clock_id = MAKE_PROCESS_CPUCLOCK (0, CPUCLOCK_SCHED);
> + 
> +-  if (SINGLE_THREAD_P)
> ++#if defined(SINGLE_THREAD_P)
> +     r = INTERNAL_SYSCALL (clock_nanosleep, err, 4, clock_id, flags, req, rem);
> +-  else
> ++#else
> +     {
> +       int oldstate = LIBC_CANCEL_ASYNC ();
> + 
> +@@ -47,6 +47,7 @@ clock_nanosleep (clockid_t clock_id, int flags, const struct timespec *req,
> + 
> +       LIBC_CANCEL_RESET (oldstate);
> +     }
> ++#endif
> + 
> +   return (INTERNAL_SYSCALL_ERROR_P (r, err)
> + 	  ? INTERNAL_SYSCALL_ERRNO (r, err) : 0);
> +-- 
> +2.26.2
> +
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
