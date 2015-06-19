From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 19 Jun 2015 07:34:21 +0300
Subject: [Buildroot] [PATCH] libxmlrpc: fix static build
In-Reply-To: <20150614230049.6ab5e979@free-electrons.com>
References: <5425b32256128e928f8ad22c596f91ab7ac5f9e8.1433859609.git.baruch@tkos.co.il>
 <20150612231307.690e22d0@free-electrons.com>
 <20150614190738.GE8165@tarshish>
 <20150614230049.6ab5e979@free-electrons.com>
Message-ID: <20150619043421.GU8165@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Jun 14, 2015 at 11:00:49PM +0200, Thomas Petazzoni wrote:
> On Sun, 14 Jun 2015 22:07:38 +0300, Baruch Siach wrote:
> > Unfortunately, these make variables are set explicitly in common.mk. So 
> > passing them in make environment has no effect.
> 
> Argh, ok.
> 
> > Now that I think about it, why don't we have a similar thing for MAKE_OPTS, 
> > say, $(PKG)_MAKE_VARS. Something like (untested, host packages missing):
> > 
> > diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> > index 1d694f0618fc..27ff16235f27 100644
> > --- a/package/pkg-autotools.mk
> > +++ b/package/pkg-autotools.mk
> > @@ -154,10 +154,10 @@ endif
> >  $(2)_CONF_ENV			?=
> >  $(2)_CONF_OPTS			?=
> >  $(2)_MAKE_ENV			?=
> > -$(2)_MAKE_OPTS			?=
> > -$(2)_INSTALL_OPTS                ?= install
> > -$(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install
> > -$(2)_INSTALL_TARGET_OPTS		?= DESTDIR=$$(TARGET_DIR)  install
> > +$(2)_MAKE_OPTS			?= $$($(2)_MAKE_VARS)
> > +$(2)_INSTALL_OPTS		?= $$($(2)_MAKE_VARS) install
> > +$(2)_INSTALL_STAGING_OPTS	?= $$($(2)_MAKE_VARS) DESTDIR=$$(STAGING_DIR) install
> > +$(2)_INSTALL_TARGET_OPTS	?= $$($(2)_MAKE_VARS) DESTDIR=$$(TARGET_DIR) install
> 
> Why not. Though I'd be more convinced if there is some evidence that it
> would also be useful for other packages.

I looked around and I found a few more packages that might benefit from 
_MAKE_VARS. But I thing the gain is not enough to worth the trouble. Adding 
$(2)_MAKE_VARS might also lead to confusion when a user sets both _MAKE_VARS 
and one or more other _OPTS, thus silently overriding _MAKE_VARS in a way that 
is not apparent to the reader.

So, I suggest to just apply the original patch.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
