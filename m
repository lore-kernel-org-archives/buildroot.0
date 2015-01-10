From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 10 Jan 2015 22:30:42 +0100
Subject: [Buildroot] [PATCH] squid: fix automake breakage
References: <1420679367-24134-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <XnsA41EE500996DEberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo Zacarias <gustavo@zacarias.com.ar> wrote in 
news:1420679367-24134-1-git-send-email-gustavo at zacarias.com.ar:

> Squid bundles a copy of libltdl (from libtool) which autoreconfigures on
> its own.
> For some odd reason when automake was bumped to version 1.15 and if the 
host
> system has another automake version, for example 1.14, the ACLOCAL and
> AUTOMAKE variables don't expand properly when the internal autoreconf is
> triggered hence calling the missing handler which in turn tries to use
> an incorrect automake version.
> The solution is to pass unexpanded ACLOCAL and AUTOMAKE variables that
> defer the evaluation to a later moment and avoid the issue.
> 
> Fixes:
> http://autobuild.buildroot.net/results/73f/73fcffafbea320f8c64378bbe8a969
22b5e7c6b5/
> 
> Signed-off-by: Gustavo Zacarias <gustavo-
qnBm8nLGbSGH0oMTQjrRWA@public.gmane.org>
> ---
>  package/squid/squid.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/squid/squid.mk b/package/squid/squid.mk
> index e9e821d..403818a 100644
> --- a/package/squid/squid.mk
> +++ b/package/squid/squid.mk
> @@ -20,7 +20,9 @@ SQUID_CONF_ENV = \
>       ac_cv_func_va_copy=yes \
>       ac_cv_func___va_copy=yes \
>       ac_cv_func_strnstr=no \
> -     ac_cv_have_squid=yes
> +     ac_cv_have_squid=yes \
> +     ACLOCAL="$(ACLOCAL)" \
> +     AUTOMAKE="$(AUTOMAKE)"
>  SQUID_CONF_OPTS = \
>       --enable-async-io=8 \
>       --enable-linux-netfilter \

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Only compile-tested.
