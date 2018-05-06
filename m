From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 6 May 2018 21:39:51 +0300
Subject: [Buildroot] [PATCH] dropbear: Do not build static binary
In-Reply-To: <06a47e87f804576dc13ab3c33a8f9239cc318d9e.camel@spectralink.com>
References: <20180503114701.9452-1-stefan.sorensen@spectralink.com>
 <20180503114701.9452-2-stefan.sorensen@spectralink.com>
 <20180503180853.2473u472dvxhvwkn@tarshish>
 <06a47e87f804576dc13ab3c33a8f9239cc318d9e.camel@spectralink.com>
Message-ID: <20180506183951.6ld7c2jipihhruyc@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi S?rensen,

On Fri, May 04, 2018 at 06:27:02AM +0000, S?rensen, Stefan wrote:
> On Thu, 2018-05-03 at 21:08 +0300, Baruch Siach wrote:
> > > -ifeq ($(BR2_STATIC_LIBS),y)
> > > -DROPBEAR_CONF_OPTS += --enable-static
> > > -endif
> > > +# The generic --enable-static flags is only intended for use when
> > > building
> > > +# libraries, but dropbear will be built as a static executeable
> > > with this
> > > +# flag, so we overide it here
> > > +DROPBEAR_CONF_OPTS += --disable-static
> > 
> > You add --disable-static unconditionally, but we do want to build
> > statically 
> > when BR2_STATIC_LIBS=y. So maybe add --disable-static only for 
> > BR2_SHARED_STATIC_LIBS=y to counter the effect of --enable-static
> > that Buildroot adds automatically. Would that work for you?
> 
> The --disable-static causes dropbear to do nothing, i.e. just do a
> normal link, so that will also work with BR2_STATIC_LIBS=y.

So if --disable-static is a NOP why do we need it at all?

As far as I can see, the only effect of --enable-static is to add -static to 
dropbear binaries link command line via LDFLAGS. This is the expected 
behaviour for BR2_STATIC_LIBS=y. Since BR2_STATIC_LIBS=y is sometimes used 
with external toolchains that provide both shared and static libraries, the 
-static link option is required to produce static binaries. Your patch seems 
to break this use case.

What is this patch meant to fix?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
