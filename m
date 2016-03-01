From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 1 Mar 2016 20:15:24 +0200
Subject: [Buildroot] [PATCH] slang: fix static link with ncurses
In-Reply-To: <8760x6kv2w.fsf@dell.be.48ers.dk>
References: <4aa51349a8c68f15bfc5ba169eeea9c6e9959128.1456834855.git.baruch@tkos.co.il>
 <8760x6kv2w.fsf@dell.be.48ers.dk>
Message-ID: <20160301181524.GR2399@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Tue, Mar 01, 2016 at 05:43:19PM +0100, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
>  > slang does forgets ncurses that is a dependency of readline when linking the
>  > slsh binary. Correct this.
> 
>  > While at it, also make sure to use staging ncurses5-config script and not the
>  > host one.
> 
>  > Fixes:
>  > http://autobuild.buildroot.net/results/1dc/1dc52048254c32a24070fef1c1039cebb32e7ac1/
>  > http://autobuild.buildroot.net/results/c17/c176511cbb147c2d8cb0ec0ff3c1612ce8971cb8/
>  > http://autobuild.buildroot.net/results/78d/78dc2ba07b1d7f888aab94e223f3e0b1a1df3af5/
> 
>  > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>  > ---
>  >  package/slang/slang.mk | 4 ++++
>  >  1 file changed, 4 insertions(+)
> 
>  > diff --git a/package/slang/slang.mk b/package/slang/slang.mk
>  > index 1a7576afc363..464d92065112 100644
>  > --- a/package/slang/slang.mk
>  > +++ b/package/slang/slang.mk
>  > @@ -40,6 +40,10 @@ endif
>  
>  >  ifeq ($(BR2_PACKAGE_NCURSES),y)
>  >  SLANG_DEPENDENCIES += ncurses
>  > +SLANG_CONF_ENV += ac_cv_path_nc5config=$(STAGING_DIR)/usr/bin/ncurses5-config
>  > +ifeq ($(BR2_STATIC_LIBS),y)
>  > +SLANG_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs ncurses`"
>  > +endif
> 
> You forgot to add host-pkgconf as a dependency. Why is both needed,
> doesn't ncurses5-config return correct info?

It does. I'll change that in v2.

> Here they seem to be equivalent with a static build:
> 
> ./host/usr/bin/pkg-config --libs ncurses
> -lncurses
> ./staging/usr/bin/ncurses5-config --libs
> -L/home/peko/source/buildroot/output-test/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lncurses

slang does not link with ncurses. The only use for ncurses5-config in slang is 
to find the location of terminfo files at run-time. The output of host 
ncurses5-config doesn't make sense.

$ ./output/host/usr/bin/ncurses5-config --terminfo
/home/baruch/git/buildroot-fixes/output/host/usr/share/terminfo
$ ./output/staging/usr/bin/ncurses5-config --terminfo
/usr/share/terminfo

> Your commit message talks about readline, so perhaps the problem is
> really about readline? How does slang figure out how to link with readline?

slang configure script just hard codes LIB_READLINE=-lreadline when it gets 
--with-readline=gnu like we do. I'll move the BR2_STATIC_LIBS block under 
BR2_PACKAGE_READLINE above.

Thanks for reviewing.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
