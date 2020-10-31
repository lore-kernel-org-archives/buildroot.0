From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 31 Oct 2020 18:38:23 +0100
Subject: [Buildroot] [PATCH 1/1] package/libfuse3: fix build with sshfs
 3.7.0
In-Reply-To: <20201029131159.237077-1-fontaine.fabrice@gmail.com>
References: <20201029131159.237077-1-fontaine.fabrice@gmail.com>
Message-ID: <20201031173823.GA2887157@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-10-29 14:11 +0100, Fabrice Fontaine spake thusly:
> Fixes:
>  - http://autobuild.buildroot.org/results/f93972515ad09ab2ccbdc4cd976ed60702c5974a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

However, we still have a libfuse3 build failure on microblazeel, where
the build fails with "symver is only supported on ELF platforms" at
build time, although the test at configure time did succeed...
Anyway, this is not a new failure, and already happens on master.

Now, sshfs only fails for configurations using the old Sourcery ARM
toolchain, because this usesgcc-4.8, which defaults to C89, while sshfs
uses C99 constructs. Again, not a regression with this patch.

Regards,
Yann E. MORIN.

> ---
>  .../0001-remove-old-uclibc-hack.patch         | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/libfuse3/0001-remove-old-uclibc-hack.patch
> 
> diff --git a/package/libfuse3/0001-remove-old-uclibc-hack.patch b/package/libfuse3/0001-remove-old-uclibc-hack.patch
> new file mode 100644
> index 0000000000..79b2f8c65e
> --- /dev/null
> +++ b/package/libfuse3/0001-remove-old-uclibc-hack.patch
> @@ -0,0 +1,34 @@
> +From 4ebb018e78b53a8afe0368e7cd7a17a67c52e3df Mon Sep 17 00:00:00 2001
> +From: Rosen Penev <rosenp@gmail.com>
> +Date: Wed, 28 Oct 2020 19:20:35 -0700
> +Subject: [PATCH] remove old uclibc hack
> +
> +This actually prevents sshfs linking to it as fuse_new becomes
> +unavailable.
> +
> +According to the git history, this seems to predate 2006.
> +
> +Signed-off-by: Rosen Penev <rosenp@gmail.com>
> +[Retrieved from:
> +https://github.com/libfuse/libfuse/commit/4ebb018e78b53a8afe0368e7cd7a17a67c52e3df]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + lib/fuse_misc.h | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/lib/fuse_misc.h b/lib/fuse_misc.h
> +index a8b59617..f384aeab 100644
> +--- a/lib/fuse_misc.h
> ++++ b/lib/fuse_misc.h
> +@@ -10,10 +10,9 @@
> + 
> + /*
> +   Versioned symbols cannot be used in some cases because it
> +-    - confuse the dynamic linker in uClibc
> +     - not supported on MacOSX (in MachO binary format)
> + */
> +-#if (!defined(__UCLIBC__) && !defined(__APPLE__))
> ++#ifndef __APPLE__
> + # if HAVE_SYMVER_ATTRIBUTE
> + #  define FUSE_SYMVER(sym1, sym2) __attribute__ ((symver (sym2)))
> + # else
> -- 
> 2.28.0
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
