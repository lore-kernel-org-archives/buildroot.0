From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 May 2015 00:21:38 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/autoconf-archive: fix ax_tls
 syntax error
In-Reply-To: <1430690664-32637-1-git-send-email-romain.naour@openwide.fr>
References: <1430690664-32637-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150503222138.GD4154@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-05-04 00:04 +0200, Romain Naour spake thusly:
> The ax_tls.m4 serial 11 procude a syntax error
> in configure scripts.
> 
> Fixes:
> http://autobuild.buildroot.net/results/619/619339810617212a667fe72278ec727ee992ffbf/
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
> v2: remove the [] on the third part of AS_IF (Yann E. MORIN)
> 
>  .../0001-AX_TLS-fix-syntax-error.patch             | 46 ++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 package/autoconf-archive/0001-AX_TLS-fix-syntax-error.patch
> 
> diff --git a/package/autoconf-archive/0001-AX_TLS-fix-syntax-error.patch b/package/autoconf-archive/0001-AX_TLS-fix-syntax-error.patch
> new file mode 100644
> index 0000000..6d345d3
> --- /dev/null
> +++ b/package/autoconf-archive/0001-AX_TLS-fix-syntax-error.patch
> @@ -0,0 +1,46 @@
> +From 1870301013d79be781ead2b0e62fc08f91715ca9 Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@openwide.fr>
> +Date: Sun, 3 May 2015 23:02:34 +0200
> +Subject: [PATCH] AX_TLS: fix syntax error
> +
> +The commit e012eb17b3d67f31dee477592328207437206c33 introduce
> +a syntax error due to an empty "else" statement.
> +
> +confifure:

"confifure"? Did you mean confiture? Or maybe configure? ;-)

> +if test "$ac_cv_tls" != "none"; then :
> +cat >>confdefs.h <<_ACEOF
> +_ACEOF
> +else
> +
> +fi
> +
> +Remove the [] on the third part of AS_IF.
> +
> +Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> +---
> + m4/ax_tls.m4 | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/m4/ax_tls.m4 b/m4/ax_tls.m4
> +index 809b761..2135dd2 100644
> +--- a/m4/ax_tls.m4
> ++++ b/m4/ax_tls.m4
> +@@ -44,7 +44,7 @@
> + #   modified version of the Autoconf Macro, you may extend this special
> + #   exception to the GPL to apply to your modified version as well.
> + 
> +-#serial 11
> ++#serial 12
> + 
> + AC_DEFUN([AX_TLS], [
> +   AC_MSG_CHECKING([for thread local storage (TLS) class])
> +@@ -70,5 +70,5 @@ AC_DEFUN([AX_TLS], [
> +   AS_IF([test "$ac_cv_tls" != "none"],
> +     [AC_DEFINE_UNQUOTED([TLS],[$ac_cv_tls],[If the compiler supports a TLS storage class define it to that here])
> +      m4_ifnblank([$1],[$1])],
> +-    [m4_ifnblank([$2],[$2])])
> ++    m4_ifnblank([$2],[$2]))

Those m4 quoting rules just always make me nervous... So I've had a look
about everywhere in autoconf-archive, and the least we can say it's
they're not uniform... :-(  I could see that level of quotation in other
parts of autoconf-archive, so Ok.

Anyway, this restores the code to the working states it was in before
the bad changeset, and fixes the issue.

So, given the above;

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> + ])
> +-- 
> +1.9.3
> +
> -- 
> 1.9.3
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
