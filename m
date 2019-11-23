From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 Nov 2019 11:30:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/ntp: remove host shell check
In-Reply-To: <0102016e898693a5-82db32f2-a59d-42c1-996b-97661b367c25-000000@eu-west-1.amazonses.com>
References: <0102016e898693a5-82db32f2-a59d-42c1-996b-97661b367c25-000000@eu-west-1.amazonses.com>
Message-ID: <20191123103011.GQ32494@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2019-11-20 15:55 +0000, James Byrne spake thusly:
> This adds a patch which removes the autoconf check for which shell is
> installed on the host and fixes the shell as '/bin/sh'. Since we are
> cross-compiling, we cannot assume that the target uses the same shell.
> Also, it can prevent builds being reproducible because a different host
> environment will result in a different target binary.
> 
> Signed-off-by: James Byrne <james.byrne@origamienergy.com>
> ---
>  package/ntp/0003-force-sh.patch | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/ntp/0003-force-sh.patch
> 
> diff --git a/package/ntp/0003-force-sh.patch b/package/ntp/0003-force-sh.patch
> new file mode 100644
> index 0000000000..4c2628e04a
> --- /dev/null
> +++ b/package/ntp/0003-force-sh.patch
> @@ -0,0 +1,30 @@
> +We're cross compiling, don't use the presence of shells on the host to decide
> +anything about the target...
> +
> +diff --git a/sntp/libopts/m4/libopts.m4 b/sntp/libopts/m4/libopts.m4
> +--- a/sntp/libopts/m4/libopts.m4
> ++++ b/sntp/libopts/m4/libopts.m4
> +@@ -112,22 +112,7 @@
> +   AC_CHECK_FUNCS([mmap canonicalize_file_name snprintf strdup strchr \
> +                  strrchr strsignal fchmod fstat chmod])
> +   AC_PROG_SED
> +-  [while :
> +-  do
> +-      POSIX_SHELL=`which bash`
> +-      test -x "$POSIX_SHELL" && break
> +-      POSIX_SHELL=`which dash`
> +-      test -x "$POSIX_SHELL" && break
> +-      POSIX_SHELL=/usr/xpg4/bin/sh
> +-      test -x "$POSIX_SHELL" && break
> +-      POSIX_SHELL=`/bin/sh -c '
> +-          exec 2>/dev/null
> +-          if ! true ; then exit 1 ; fi
> +-          echo /bin/sh'`
> +-      test -x "$POSIX_SHELL" && break
> +-      ]AC_MSG_ERROR([cannot locate a working POSIX shell])[
> +-  done]
> +-  AC_DEFINE_UNQUOTED([POSIX_SHELL], ["${POSIX_SHELL}"],
> ++  AC_DEFINE_UNQUOTED([POSIX_SHELL], ["/bin/sh"],

This is not nice, as this patch can't be upstreamed, and we'll have tio
live with it for the eons to come.

What about using AC_CACHE_CHECK [0] to do the check, which can be
overriden on the command line. For example:

    [
    AC_CACHE_CHECK([for a posix-compliant shell], [ntp_ac_cv_posix_shell],
    [while :
    do
        blablabla
    done
    ])
    AC_DEFINE_UNQUOTED([POSIX_SHELL], ["${ntp_ac_cv_posix_shell}"],
      [define to a working POSIX compliant shell])
    ]

And then in ntp.mk we could do (in addition to the existing one, of
course):

    NTP_CONF_ENV = ntp_ac_cv_posix_shell=/bin/sh

And such a patch will probably be more acceptable for upstream.

[0] https://www.gnu.org/savannah-checkouts/gnu/autoconf/manual/autoconf-2.69/autoconf.html#Caching-Results

Regards,
Yann E. MORIN.

> +            [define to a working POSIX compliant shell])
> +   AC_SUBST([POSIX_SHELL])
> + ])
> -- 
> 2.24.0
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
