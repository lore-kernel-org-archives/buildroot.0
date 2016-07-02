From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Jul 2016 11:20:59 +0200
Subject: [Buildroot] [PATCH 03/12] reproducibility: generate
 SOURCE_DATE_EPOCH
In-Reply-To: <1465918277-30675-3-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160614152928.GH3060@hermes.click-hack.org>
 <1465918277-30675-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1465918277-30675-3-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <20160702092059.GC22343@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gilles, All,

On 2016-06-14 17:31 +0200, Gilles Chanteperdrix spake thusly:
> When reproducibility is requested, generate a global SOURCE_DATE_EPOCH
> environment variable which contains either the date of buildroot last
> commit if running from a git repository, or the latest release date.
> 
> This means that all packages embedding build dates will appear to
> have the same build date, so in case of new commit or release, all
> packages will appear to have been change, even though some of them
> may not have changed in fact.
> 
> The meaning of SOURCE_DATE_EPOCH is specified by the following
> specification:
> https://reproducible-builds.org/specs/source-date-epoch/
> 
> Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
> ---
>  Makefile | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 0217ff0..bba7f25 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -213,6 +213,11 @@ ifeq ($(BR2_REPRODUCIBLE),y)
>  export TZ=UTC
>  export LANG=C
>  export LC_ALL=C
> +SOURCE_DATE_GIT = $(shell GIT_DIR=$(TOPDIR)/.git $(GIT) log -1 --format=%at)
> +SOURCE_DATE_CHANGES = $(shell head -n 1 $(TOPDIR)/CHANGES | \
> +	sed 's/^.*Released \(.*\)$$/\1/;s/\(st\|nd\|rd\|th\),//' | \
> +	LANG=C LC_ALL=C TZ=UTC xargs -i date -d \{\} +%s)

Why do you need to set TZ, LANG and LC_ALL here, since they are exported
just the lines above?

However, we've just discussed that during the summer camp, and we've
come to the conlusion that parsing the CHANGES file is not the best
solution.

After all, what we need is a reproducible value. The one extracted from
CHANGES is not absolutely right (e.g. in case one grabs a tarball from a
random cset), but is close-enough to the real value that it is OK.

Yet, we think that we could just use the last second of the last minute
of the last hour of the first day of the mont of the last release. (wee!)
So we suggest we use the release version, which is already YYYY-MM (e.g.
in my local tree):

    $ make print-version
    2016.08-git-00009-g5173895

And it is then trivial to get it to look more like YYYY-MM-01T23:59:59

and the rest is easy to go by... ;-)

What's your opinion on this?

Regards,
Yann E. MORIN.

> +export SOURCE_DATE_EPOCH = $(if $(wildcard $(TOPDIR)/.git),$(SOURCE_DATE_GIT),$(SOURCE_DATE_CHANGES))
>  endif
>  
>  # To put more focus on warnings, be less verbose as default
> -- 
> 2.8.2
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
