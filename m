From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 17 Dec 2014 22:36:02 +0100
Subject: [Buildroot] [PATCH 1/3] bdwgc: add patch automatically
 detecting for NO_GETCONTEXT need
In-Reply-To: <1418492588-22122-1-git-send-email-s.martin49@gmail.com>
References: <1418492588-22122-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20141217213602.GC4293@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-12-13 18:43 +0100, Samuel Martin spake thusly:
> This patch is necessary to successfully build guile with toolchain
> missing its support.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  ...ac-add-check-for-NO_GETCONTEXT-definition.patch | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch
> 
> diff --git a/package/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch b/package/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch
> new file mode 100644
> index 0000000..912a659
> --- /dev/null
> +++ b/package/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch
> @@ -0,0 +1,38 @@
> +From e4448da044338f81548c13cb7eda2a49074156b3 Mon Sep 17 00:00:00 2001
> +From: Samuel Martin <s.martin49@gmail.com>
> +Date: Mon, 8 Dec 2014 21:17:10 +0100
> +Subject: [PATCH] configure.ac: add check for NO_GETCONTEXT definition
> +
> +Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> +---
> + configure.ac | 14 ++++++++++++++
> + 1 file changed, 14 insertions(+)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 6551cbd..c3a0454 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -365,6 +365,20 @@ if test "$GCC" = yes; then
> +   AC_MSG_RESULT($ac_cv_fno_strict_aliasing)
> + fi
> + 
> ++AC_MSG_CHECKING(for NO_GETCONTEXT need)
> ++AC_LINK_IFELSE([AC_LANG_PROGRAM([[
> ++    #include <ucontext.h>
> ++  ]],[[
> ++    getcontext(0);
> ++  ]])],[need_no_getcontext=no],[need_no_getcontext=yes])

The naming of the need_no_getcontext is relatively non obvious. Usually,
tests are used to check if the toolchain/system has a feature, so it
would be more appropriate to name that variable has_getcontext,
regardless of what action it will entail.

In proper English, you'd write:

  If the toolchain does not have getcontext, then I disable use of it.

==> has_getcontext    ;-)

Otherwise, I tried to find how others were checking for getcontext, and
it is very difficult o find a package that does.

The first I could find was GNU Pth (dead since 2006), and then ruby. And
they both use that:

    AC_CHECK_FUNCS([getcontext setcontext])

which would automatically define HAVE_getcontext and HAVE_setcontext if
they are available, but that's macro definitions, not available in
configure, so we could not do the following:

> ++AC_MSG_RESULT($need_no_getcontext)
> ++if test x$need_no_getcontext = xyes ; then
> ++  CFLAGS="$CFLAGS -DNO_GETCONTEXT"
> ++  CPPFLAGS="$CPPFLAGS -DNO_GETCONTEXT"
> ++fi
> ++AC_MSG_NOTICE([[CFLAGS=$CFLAGS]])
> ++AC_MSG_NOTICE([[CPPFLAGS=$CPPFLAGS]])

No need for those two notices.

I'm unsure what to do with that... Sure, it's not too complex, but what
would upstream say about that? Surely, we'd like to push it to them so
we do not have to maintain it...

Regards,
Yann E. MORIN.

> + case "$host" in
> + # While IRIX 6 has libdl for the O32 and N32 ABIs, it's missing for N64
> + # and unnecessary everywhere.
> +-- 
> +2.1.3
> +
> -- 
> 2.1.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
