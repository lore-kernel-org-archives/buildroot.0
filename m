From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 14 Jun 2015 22:07:38 +0300
Subject: [Buildroot] [PATCH] libxmlrpc: fix static build
In-Reply-To: <20150612231307.690e22d0@free-electrons.com>
References: <5425b32256128e928f8ad22c596f91ab7ac5f9e8.1433859609.git.baruch@tkos.co.il>
 <20150612231307.690e22d0@free-electrons.com>
Message-ID: <20150614190738.GE8165@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Jun 12, 2015 at 11:13:07PM +0200, Thomas Petazzoni wrote:
> On Tue,  9 Jun 2015 17:20:09 +0300, Baruch Siach wrote:
> > Fixes:
> > http://autobuild.buildroot.net/results/16d/16de14ace7b4e089f56b9cb173542e487cae3a9d/
> > 
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> >  package/libxmlrpc/libxmlrpc.mk | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
> > index c3788d6c3f36..a6137e07b828 100644
> > --- a/package/libxmlrpc/libxmlrpc.mk
> > +++ b/package/libxmlrpc/libxmlrpc.mk
> > @@ -35,4 +35,14 @@ LIBXMLRPC_MAKE_ENV = \
> >  	CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
> >  	LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)"
> >  
> > +ifeq ($(BR2_STATIC_LIBS),y)
> > +LIBXMLRPC_STATIC_OPTS = SHARED_LIB_TYPE=NONE MUST_BUILD_SHLIB=N
> > +endif
> > +
> > +LIBXMLRPC_MAKE_OPTS = $(LIBXMLRPC_STATIC_OPTS)
> > +LIBXMLRPC_INSTALL_STAGING_OPTS = $(LIBXMLRPC_STATIC_OPTS) \
> > +	DESTDIR=$(STAGING_DIR) install
> > +LIBXMLRPC_INSTALL_TARGET_OPTS = $(LIBXMLRPC_STATIC_OPTS) \
> > +	DESTDIR=$(TARGET_DIR) install
> > +
> >  $(eval $(autotools-package))
> 
> Can you try instead something like:
> 
> ifeq ($(BR2_STATIC_LIBS),y)
> LIBXMLRPC_MAKE_ENV += SHARED_LIB_TYPE=NONE MUST_BUILD_SHLIB=N
> endif

Unfortunately, these make variables are set explicitly in common.mk. So 
passing them in make environment has no effect.

> The advantage is that LIBXMLRPC_MAKE_ENV is passed to the build,
> install staging and install target steps.

Now that I think about it, why don't we have a similar thing for MAKE_OPTS, 
say, $(PKG)_MAKE_VARS. Something like (untested, host packages missing):

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 1d694f0618fc..27ff16235f27 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -154,10 +154,10 @@ endif
 $(2)_CONF_ENV			?=
 $(2)_CONF_OPTS			?=
 $(2)_MAKE_ENV			?=
-$(2)_MAKE_OPTS			?=
-$(2)_INSTALL_OPTS                ?= install
-$(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install
-$(2)_INSTALL_TARGET_OPTS		?= DESTDIR=$$(TARGET_DIR)  install
+$(2)_MAKE_OPTS			?= $$($(2)_MAKE_VARS)
+$(2)_INSTALL_OPTS		?= $$($(2)_MAKE_VARS) install
+$(2)_INSTALL_STAGING_OPTS	?= $$($(2)_MAKE_VARS) DESTDIR=$$(STAGING_DIR) install
+$(2)_INSTALL_TARGET_OPTS	?= $$($(2)_MAKE_VARS) DESTDIR=$$(TARGET_DIR) install
 
 # This must be repeated from inner-generic-package, otherwise we get an empty
 # _DEPENDENCIES if _AUTORECONF is YES.  Also filter the result of _AUTORECONF

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
