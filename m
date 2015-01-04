From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Jan 2015 18:41:02 +0100
Subject: [Buildroot] [PATCH] janus-gateway: add a patch to use
 -Wunused-but-set-variable only when available
In-Reply-To: <1420392439-16055-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1420392439-16055-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150104174102.GB31970@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-01-04 18:27 +0100, Thomas Petazzoni spake thusly:
> Fixes:
> 
>   http://autobuild.buildroot.org/results/3f0/3f07574e6e4edda9e31fcb0de520a4dbabe6b94a/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> diff --git a/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch b/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch
> + AM_CFLAGS += -Wredundant-decls  # sophiasip also contains redundant declarations
[--SNIP--]
> +index 17870a7..ecd98e5 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -7,6 +7,13 @@ AM_SILENT_RULES([yes])
> + AC_GNU_SOURCE
> + 
> + AC_PROG_CC
> ++AX_CHECK_COMPILE_FLAG([-Wunused-but-set-variable])
> ++
> ++if test "${ax_cv_check_cflags___Wunused_but_set_variable}" = "yes" ; then
> ++   GCC_WARN_UNUSED_BUT_SET=-Wunused-but-set-variable
> ++fi

The canonical way to do if-blocks is with m4 macros:

    AS_IF([test "${ax_cv_check_cflags___Wunused_but_set_variable}" = "yes"],
          [GCC_WARN_UNUSED_BUT_SET=-Wunused-but-set-variable])

Because autoconf may expand that differently on different systems.

Granted, for us Buildroot, that has virtually zero-impact, because the
expanded code would be about the same you wrote. But if we want to
upstream anything, better be using the state-of-the-art solution. ;-)

But anyway, why don't you simply write:

    AX_CHECK_COMPILE_FLAG([-Wunused-but-set-variable],
        [GCC_WARN_UNUSED_BUT_SET=-Wunused-but-set-variable])
    AC_SUBST([GCC_WARN_UNUSED_BUT_SET])

Also, as discused on IRC: add a comment in the .mk stating that
AUTORECONF is needed because we also touch the autostuff.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
