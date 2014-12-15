From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Dec 2014 18:37:26 +0100
Subject: [Buildroot] [PATCH] snappy: add dependency on host-pkgconf
In-Reply-To: <201412151344.14441.ste@junkomatic.net>
References: <201412151344.14441.ste@junkomatic.net>
Message-ID: <20141215173726.GA4075@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Steve, All,

On 2014-12-15 13:44 +0000, Steve James spake thusly:
> Signed-off-by: Steve James <ste@junkomatic.net>
> 
> ---
> Hello all. First Buildroot patch :-)

Great, glad to see your contribution! :-)

> (This was discovered when adding leveldb which requires snappy. This missing
> dependency is exposed when selection of this package is the only non-default
> configuration choice ie you're not getting host-pkgconf via some other non-
> default choice.)

This:

> Snappy doesn't configure without host pkg-config. The diagnostic from autoconf
> is totally unhelpful, so for the benefit of others who might need this
> prerequisite, when autoconf says this...
> 
>   configure.ac:42: error: possibly undefined macro: AC_DEFINE
>         If this token and others are legitimate, please use m4_pattern_allow.
>         See the Autoconf documentation.
>   configure.ac:44: error: possibly undefined macro: AC_MSG_FAILURE

... up until here should have been part of the ommit log itself, that
is, above the --- line. All that is below the --- line is "forgotten"
by git when it applies a patch.

Basically, a commit log should contain:

    topic: a short description

    A paragraphe with one (or more as needed) sentences explaining
    the problem, possibly with excerpts of the failure.

    A paragraph explaining the reason for the failure.

    A paragraph explaining the solution.

    Signed-off-by: Real NAME <email-address>

Of course, for very trivial patches, it is possible to shorten the
commit log. So for this patch, the commit log could have been something
like:

    package/snappy: needs host-pkconf

    Snappy doesn't configure without host pkg-config. The diagnostic
    from autoconf is totally unhelpful:

        configure.ac:42: error: possibly undefined macro: AC_DEFINE
            If this token and others are legitimate, please use m4_pattern_allow.
            See the Autoconf documentation.
        configure.ac:44: error: possibly undefined macro: AC_MSG_FAILURE

    So, add host-pkgconf to the dependencies.

    Signed-off-by: Steve James <ste@junkomatic.net>

> The solution is (probably) to add host-pkgconf to the packages's DEPENDENCIES
> list.
> 
> 
>  package/snappy/snappy.mk |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
> index fd89325..6bda7ce 100644
> --- a/package/snappy/snappy.mk
> +++ b/package/snappy/snappy.mk
> @@ -10,6 +10,7 @@ SNAPPY_LICENSE = BSD-3c
>  SNAPPY_LICENSE_FILES = COPYING
>  # from git
>  SNAPPY_AUTORECONF = YES
> +SNAPPY_DEPENDENCIES = host-pkgconf

Indeed, snappy makes use of PKG_CHECK_MODULES().

With the commit log rewritten, you can add my:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Thank you for this patch! :-)

Regards,
Yann E. MORIN.

>  SNAPPY_INSTALL_STAGING = YES
>  
>  $(eval $(autotools-package))
> -- 
> 1.7.10.4
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
