From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 6 Mar 2016 15:15:19 +0200
Subject: [Buildroot] [PATCH] zsh: don't use host pcre-config
In-Reply-To: <20160306132313.17024d72@free-electrons.com>
References: <0f3d133b0082f11b75b9fad170d1b81211352dd6.1457041570.git.baruch@tkos.co.il>
 <20160306132313.17024d72@free-electrons.com>
Message-ID: <20160306131518.GF2877@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Mar 06, 2016 at 01:23:13PM +0100, Thomas Petazzoni wrote:
> On Thu,  3 Mar 2016 23:46:10 +0200, Baruch Siach wrote:
> > +diff --git a/configure.ac b/configure.ac
> > +index c3bd713c126a..9947b16066b6 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -925,7 +925,7 @@ fi
> > + if test x$enable_pcre = xyes; then
> > + dnl pcre-config should probably be employed here
> > + dnl AC_SEARCH_LIBS(pcre_compile, pcre)
> > +-  LIBS="`pcre-config --libs` $LIBS"
> > ++  LIBS="`$ac_cv_prog_PCRECONF --libs` $LIBS"
> 
> I think it is more correct to use the PRECONF variable rather than
> ac_cv_prog_PCRECONF. Indeed, you have:
> 
> AC_CHECK_PROG([PCRECONF], pcre-config, pcre-config)
> 
> The documentation of AC_CHECK_PROG (at [1]) says:
> 
> ? Macro: AC_CHECK_PROG (variable, prog-to-check-for, value-if-found, [value-if-not-found], [path = ?$PATH?], [reject])
> 
>    Check whether program prog-to-check-for exists in path. If it is
>    found, set <variable> to value-if-found, otherwise to
>    value-if-not-found, if given. Always pass over reject (an absolute
>    file name) even if it is the first found in the search path; in that
>    case, set <variable> using the absolute file name of the
>    prog-to-check-for found that is not reject. If <variable> was already
>    set, do nothing. Calls AC_SUBST for variable. The result of this
>    test can be overridden by setting the variable <variable> or the cache
>    variable ac_cv_prog_<variable>.
> 
> So to me, this means that the expected "output" of this macro is to set
> <variable>, which in your case is PRECONF.

Thanks for the information.

This patch is now upstream, so I'll send another one upstream changing 
$ac_cv_prog_PCRECONF to $PCRECONF. If upstream accepts that I'll send v2 with 
a combined patch.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
