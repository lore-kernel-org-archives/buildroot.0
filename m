From: Remi Pommarel <repk@triplefau.lt>
Date: Wed, 28 Oct 2015 09:16:24 +0100
Subject: [Buildroot] [PATCH 1/3] package/git: Add needed library for
 static compilation
In-Reply-To: <20151027053206.GH2229@tarshish>
References: <1445893962-13338-1-git-send-email-repk@triplefau.lt>
 <1445893962-13338-2-git-send-email-repk@triplefau.lt>
 <20151027053206.GH2229@tarshish>
Message-ID: <20151028081624.GA13534@cruxbox>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Tue, Oct 27, 2015 at 07:32:06AM +0200, Baruch Siach wrote:
> Hi Remi,
> 
> On Mon, Oct 26, 2015 at 10:12:40PM +0100, Remi Pommarel wrote:
> > Add missing ssl, zlib and gettext library for static compilation support.
> > 
> > A statically compiled libcurl need to be linked with some libraries to get all
> > its undefined symbols resolved. Indeed when libcurl supports openssl it needs
> > -lssl to satisfy all its dependencies, the same goes for gettext and zlib
> > symbols.
> > 
> > Signed-off-by: Remi Pommarel <repk@triplefau.lt>
> > ---
> >  package/git/git.mk | 15 +++++++++++++--
> >  1 file changed, 13 insertions(+), 2 deletions(-)
> > 
> > diff --git a/package/git/git.mk b/package/git/git.mk
> > index 2bd6a01..942f29f 100644
> > --- a/package/git/git.mk
> > +++ b/package/git/git.mk
> > @@ -14,7 +14,7 @@ GIT_DEPENDENCIES = zlib host-gettext
> >  ifeq ($(BR2_PACKAGE_OPENSSL),y)
> >  GIT_DEPENDENCIES += openssl
> >  GIT_CONF_OPTS += --with-openssl
> > -GIT_CONF_ENV_LIBS += $(if $(BR2_STATIC_LIBS),-lz)
> > +GIT_CONF_ENV_LIBS += $(if $(BR2_STATIC_LIBS),-lssl -lcrypto)
> 
> zlib is always selected. You should not remove it.

Ok will do, thanks.

> 
> Also, since you seem to fix the libcurl issue in later patches is this still 
> needed at all?
> 

There are two places the additional libraries are needed.  In the Makefile
in order to compile git binaries, the patches fix the issue here. And in the
configure when it compile test application to probe for features,
unfortunatly configure still need LIBS varibale to be set.

> >  else
> >  GIT_CONF_OPTS += --without-openssl
> >  endif
> > @@ -55,9 +55,20 @@ else
> >  GIT_CONF_OPTS += --without-tcltk
> >  endif
> >  
> > +ifeq ($(BR2_PACKAGE_GETTEXT),y)
> > +GIT_DEPENDENCIES += gettext
> > +GIT_CONF_ENV += ac_cv_lib_c_gettext=no
> > +endif
> 
> Are you sure this fixes a static build issue? If not, please make a separate 
> patch for this part.
> 

When statically compiled with gettext support libcurl need to be linked
with libintl, using ac_cv_lib_c_gettext does the job. So for me its
static linking related.

> > +ifeq ($(BR2_PACKAGE_ZLIB),y)
> > +GIT_DEPENDENCIES += zlib
> > +GIT_CONF_ENV_LIBS += -lz
> > +endif
> 
> This part should not be needed. zlib is already in GIT_DEPENDENCIES (above), 
> -lz should be in GIT_CONF_ENV_LIBS for static build, and BR2_PACKAGE_ZLIB is 
> always selected.
> 

Ok will remove this bit.

Thanks

-- 
R?mi
