From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 1 May 2014 15:49:09 +0300
Subject: [Buildroot] host-pkgconf: use --static option for static builds
In-Reply-To: <20140408035851.GK4096@tarshish>
References: <1394021977-60055-1-git-send-email-Vincent.Riera@imgtec.com>
 <20140408035851.GK4096@tarshish>
Message-ID: <20140501124909.GX4531@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicente, Buildroot list,

On Tue, Apr 08, 2014 at 06:58:51AM +0300, Baruch Siach wrote:
> On Wed, Mar 05, 2014 at 12:19:37PM +0000, Vicente Olivert Riera wrote:
> > Detect when BR2_PREFER_STATIC_LIBS is selected and modify the host
> > pkg-config wrapper to append the --static option in that case.
> > 
> > Fixes:
> >    http://autobuild.buildroot.net/results/161/161446dde7e8e774773eb2b34fd555f5ac22dd02/
> > 
> > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> 
> Also fixes 
> http://autobuild.buildroot.net/results/e62/e62d35bcf7d6c98d0a0348532c2b159affb20e83/.
> 
> Tested-by: Baruch Siach <baruch@tkos.co.il>

Fixes also 
http://autobuild.buildroot.net/results/7e7/7e7b33266317ead92ef275fe10111e8e90bebc5a/.

Is there a reason not to apply this one? It should not break shared linking 
even for packages that are not static linking aware. Maybe only add some 
redundant NEEDED entries in the ELF dynamic section.

baruch

> > ---
> > package/pkgconf/pkg-config.in |    2 +-
> >  package/pkgconf/pkgconf.mk    |   14 ++++++++++++++
> >  2 files changed, 15 insertions(+), 1 deletions(-)
> > 
> > diff --git a/package/pkgconf/pkg-config.in b/package/pkgconf/pkg-config.in
> > index 25a536b..4dec487 100644
> > --- a/package/pkgconf/pkg-config.in
> > +++ b/package/pkgconf/pkg-config.in
> > @@ -1,2 +1,2 @@
> >  #!/bin/sh
> > -PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:- at PKG_CONFIG_LIBDIR@} PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:- at STAGING_DIR@} $(dirname $0)/pkgconf $@
> > +PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:- at PKG_CONFIG_LIBDIR@} PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:- at STAGING_DIR@} $(dirname $0)/pkgconf @STATIC@ $@
> > diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
> > index f3f6526..9641371 100644
> > --- a/package/pkgconf/pkgconf.mk
> > +++ b/package/pkgconf/pkgconf.mk
> > @@ -24,8 +24,22 @@ define HOST_PKGCONF_INSTALL_WRAPPER
> >  		$(HOST_DIR)/usr/bin/pkg-config
> >  endef
> >  
> > +define HOST_PKGCONF_STATIC
> > +	$(SED) 's, at STATIC@,--static,' $(HOST_DIR)/usr/bin/pkg-config
> > +endef
> > +
> > +define HOST_PKGCONF_SHARED
> > +	$(SED) 's, at STATIC@,,' $(HOST_DIR)/usr/bin/pkg-config
> > +endef
> > +
> >  PKGCONF_POST_INSTALL_TARGET_HOOKS += PKGCONF_LINK_PKGCONFIG
> >  HOST_PKGCONF_POST_INSTALL_HOOKS += HOST_PKGCONF_INSTALL_WRAPPER
> >  
> > +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> > +	HOST_PKGCONF_POST_INSTALL_HOOKS += HOST_PKGCONF_STATIC
> > +else
> > +	HOST_PKGCONF_POST_INSTALL_HOOKS += HOST_PKGCONF_SHARED
> > +endif
> > +
> >  $(eval $(autotools-package))
> >  $(eval $(host-autotools-package))

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
