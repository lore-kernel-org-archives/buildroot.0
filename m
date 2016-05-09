From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Mon, 9 May 2016 21:58:14 +0200
Subject: [Buildroot] [PATCH 21/34] hddtemp: add
In-Reply-To: <87futrn0kh.fsf@dell.be.48ers.dk>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1462002570-14706-21-git-send-email-gilles.chanteperdrix@xenomai.org>
 <87futrn0kh.fsf@dell.be.48ers.dk>
Message-ID: <20160509195814.GY13285@hermes.click-hack.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 09, 2016 at 09:38:06AM +0200, Peter Korsgaard wrote:
> >>>>> "Gilles" == Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org> writes:
> 
>  > ---
>  >  package/Config.in            |  1 +
>  >  package/hddtemp/Config.in    |  8 ++++++++
>  >  package/hddtemp/hddtemp.hash |  2 ++
>  >  package/hddtemp/hddtemp.mk   | 19 +++++++++++++++++++
>  >  4 files changed, 30 insertions(+)
>  >  create mode 100644 package/hddtemp/Config.in
>  >  create mode 100644 package/hddtemp/hddtemp.hash
>  >  create mode 100644 package/hddtemp/hddtemp.mk
> 
>  > diff --git a/package/Config.in b/package/Config.in
>  > index bdc3063..76665e6 100644
>  > --- a/package/Config.in
>  > +++ b/package/Config.in
>  > @@ -1458,6 +1458,7 @@ comment "Utilities"
>  >  	source "package/file/Config.in"
>  >  	source "package/gnupg/Config.in"
>  >  	source "package/gnupg2/Config.in"
>  > +	source "package/hddtemp/Config.in"
> 
> I think this should rather go under "Hardware handling" like
> smartmontools or hdparm.
> 
> 
>  >  	source "package/inotify-tools/Config.in"
>  >  	source "package/lockfile-progs/Config.in"
>  >  	source "package/logrotate/Config.in"
>  > diff --git a/package/hddtemp/Config.in b/package/hddtemp/Config.in
>  > new file mode 100644
>  > index 0000000..0d28250
>  > --- /dev/null
>  > +++ b/package/hddtemp/Config.in
>  > @@ -0,0 +1,8 @@
>  > +config BR2_PACKAGE_HDDTEMP
>  > +	bool "hddtemp"
>  > +	help
>  > +	  hddtemp is a small utility that gives you the temperature of your
>  > +	  hard drive by reading S.M.A.R.T. informations, for drives that
>  > +	  support this feature. 
> 
> It also uses iconv (to figure out how to print a degrees celsius sign,
> gaah), so you need to add:
> 
>        select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
> 
> And add it to HDDTEMP_DEPENDENCIES. A quick test shows that it forgets
> to link with it, so it needs some help:
> 
> ifeq ($(BR2_PACKAGE_LIBICONV),y)
> HDDTEMP_DEPENDENCIES += libiconv
> HDDTEMP_CONF_ENV += LIBS="-liconv"
> endif
> 
> It also needs a small patch to build without gettext as it
> unconditionally calls:
> 
>   setlocale (LC_ALL, "");
>   bindtextdomain (PACKAGE, LOCALEDIR);
>   textdomain (PACKAGE);
> 
> Those needs to be inside #ifdef ENABLE_NLS conditionals.
> 
> And finally there's code in backtrace.c that breaks when building with
> uClibc on i386 (as uClibc also defines __GLIBC__ for compatibility but
> doesn't provide backtrace functionality by default):
> 
> #if defined(__i386__) && defined(__GLIBC__)
> 
> These patches should preferably be upstreamed, but as the latest (beta!)
> release is 10 years old by now, the project seems pretty dead.

Ok, let us forget about this patch, as for the "high-availability"
patch, I did not expect to post this patch with the rest, it landed
here only because I posted the patch list, unsorted.

-- 
					    Gilles.
https://click-hack.org
