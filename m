From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 19 Jul 2015 12:33:00 +0300
Subject: [Buildroot] [PATCH] package/glibc: enable lock elision on
 x86_64 hosts
In-Reply-To: <20150719112314.2d733eaf@free-electrons.com>
References: <1426716071-27570-1-git-send-email-steven@uplinklabs.net>
 <1426716071-27570-2-git-send-email-steven@uplinklabs.net>
 <20150719112314.2d733eaf@free-electrons.com>
Message-ID: <20150719093300.GG13027@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Jul 19, 2015 at 11:23:14AM +0200, Thomas Petazzoni wrote:
> On Wed, 18 Mar 2015 15:01:09 -0700, Steven Noonan wrote:
> > Signed-off-by: Steven Noonan <steven@uplinklabs.net>
> > ---
> >  package/glibc/glibc.mk | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> > index 0a37bb3..651711a 100644
> > --- a/package/glibc/glibc.mk
> > +++ b/package/glibc/glibc.mk
> > @@ -90,6 +90,7 @@ define GLIBC_CONFIGURE_CMDS
> >  		--prefix=/usr \
> >  		--enable-shared \
> >  		$(if $(BR2_SOFT_FLOAT),--without-fp,--with-fp) \
> > +		$(if $(BR2_x86_64),--enable-lock-elision,) \
> 
> What happens on x86-64 processors that don't have the HW support needed
> for lock elision ? Does glibc gracefully falls back at runtime to
> "normal" locks ?

According to the code at sysdeps/unix/sysv/linux/x86/elision-conf.c, 
__elision_available is initialized from HAS_RTM which is evaluated at run-time 
(sysdeps/x86_64/multiarch/init-arch.h).

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
