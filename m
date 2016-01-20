From: Kinsella, Ray <ray.kinsella@intel.com>
Date: Wed, 20 Jan 2016 11:57:17 +0000
Subject: [Buildroot] [PATCH] package/radlib: New package
In-Reply-To: <20160119174734.664e230c@free-electrons.com>
References: <1453220389.3109.32.camel@intel.com>
 <20160119174734.664e230c@free-electrons.com>
Message-ID: <1453291037.2933.40.camel@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, 

Please see my responses below. 

On Tue, 2016-01-19 at 17:47 +0100, Thomas Petazzoni wrote:

> > Signed-off-by: Ray Kinsella <ray.kinsella@intel.com<mailto:
> > ray.kinsella at intel.com>>
> 
> There is an issue here with SoB line, it should include this mailto:
> thing.
> 

Apologies - Evolution is misbehaving. 


> All patches should have a description + Signed-off-by line.

Ok  - I will take care of it.

> > @@ -0,0 +1,163 @@
> > +diff -Naur a/debug/Makefile.am b/debug/Makefile.am
> > +--- a/debug/Makefile.am        2016-01-12 14:33:24.655252603 +0000
> > ++++ b/debug/Makefile.am        2016-01-12 14:33:37.858601971 +0000
> > +@@ -27,8 +27,8 @@
> > + endif
> > +
> > + # define library directories
> > +-raddebug_LDFLAGS = -L../src/.libs -L$(prefix)/lib -L/usr/lib
> > +-INCLUDES         += -I$(prefix)/include -I/usr/include
> > ++raddebug_LDFLAGS = -L../src/.libs -L$(prefix)/lib
> > ++INCLUDES         += -I$(prefix)/include
> 
> This remains completely wrong. Contrary to what you do in your .mk
> file, --prefix should *NOT* be $(STAGING_DIR)/usr or
> $(TARGET_DIR)/usr.
> It should be just "/usr". And therefore those -I$(prefix)/include and
> -L$(prefix)/lib are totally wrong.

Ok - but if I don't do this, it picks up the headers/libs for its
dependencies (libc, sqlite, mysql) from the host's /usr. I was using
the prefix to keep these paths right.

> > +-if CROSSCOMPILE
> > +-raddebug_LDFLAGS += $(prefix)/lib/crt1.o $(prefix)/lib/crti.o
> > $(prefix)/lib/crtn.o
> > +-endif
> > ++#if CROSSCOMPILE
> > ++#raddebug_LDFLAGS += $(prefix)/lib/crt1.o $(prefix)/lib/crti.o
> > $(prefix)/lib/crtn.o
> > ++#endif
> 
> Why ?

Ok - I can ask why these wherever explicitly passed to linker in the
first instance. If I don't remove them - the linker fails complaining
of duplicate symbols. (the patch should just remove, rather than
comment these lines).  

> > +diff -Naur a/debug/Makefile.in b/debug/Makefile.in
> > +--- a/debug/Makefile.in        2016-01-12 14:33:24.655252603 +0000
> > ++++ b/debug/Makefile.in        2016-01-12 14:34:05.062321796 +0000
> Same.

As above - but I will remove this altogether and let the reconf take
care of making the Makefile.in. 

> 
> > diff --git a/package/radlib/Config.in b/package/radlib/Config.in
> > new file mode 100644
> > index 0000000..2ca1617
> > --- /dev/null
> > +++ b/package/radlib/Config.in
> > @@ -0,0 +1,22 @@
> > +config BR2_PACKAGE_RADLIB
> > +       bool "radlib"
> > +       select BR2_PACKAGE_SQLITE
> > +       select BR2_PACKAGE_SQLITE_NO_SYNC
> 
> Why do you force this NO_SYNC option ?

The sqlite db is staging area really - the data doesn't usually hang
around on the embedded device - it is generally uploaded to the cloud
etc. Might be more appropriate to trigger this wview instead of radlib.

> > +       bool "Enable MYSQL support in Radlib"
> > +       select BR2_PACKAGE_MYSQL
> > +       help$
> 
> Ditto. Also, if you select BR2_PACKAGE_MYSQL, you must replicate all
> the "depends on" of BR2_PACKAGE_MYSQL. I would therefore rather
> suggest
> you to remove this option, and simply enable MySQL support in the .mk
> file if BR2_PACKAGE_MYSQL=y.

ok this makes sense - but is less explicit.

> > +
> > +RADLIB_CONF_OPTS += --enable-sqlite --prefix=$(STAGING_DIR)/usr
> 
> If --enable-sqlite exists, then presumably it means that the sqlite
> support is optional, no? If it is, then please make it optional.

ok - in the same way as mysql then.

> Also, as said above --prefix=$(STAGING_DIR)/usr is completely wrong.
> --prefix must be /usr, and it is already set to this value by the
> autotools-package infrastructure, so you have nothing to do here.
> 
> "prefix" denotes where the software will be found while running on
> the
> target. Certainly $(STAGING_DIR) doesn't exist once running on the
> target!
> 
> So you must always use --prefix=/usr, and at installation time, pass
> DESTDIR=$(TARGET_DIR) or DESTDIR=$(STAGING_DIR) to have things
> installed not in /usr, but in $(TARGET_DIR)/usr or $(STAGING_DIR)/usr
> respectively. All of this is done automatically for you by the
> autotools-package infrastructure.

ok noted - that I shouldn't explicitly passing these, but it still
doesn't fix my paths for dependencies.


> So, together with my suggestion of removing the
> BR2_PACKAGE_RADLIB_MYSQL option, this would give:
> 
> ifeq ($(BR2_PACKAGE_MYSQL),y)
> RADLIB_CONF_OPTS += --enable-mysql
> RADLIB_DEPENDENCIES += mysql
> else
> RADLIB_CONF_OPTS += --disable-mysql
> endif
> 
> This is the fairly canonical way of handling optional dependencies in
> Buildroot packages. We use this construct all over the place.

ok - will do.

> > +
> > +$(eval $(autotools-package))
> > +$(eval $(host-autotools-package))
> 
> Why do you call host-autotools-package here? For which reason do you
> need a host variant of this package ?

Will remove host-autotools.

Thanks,

Ray K
