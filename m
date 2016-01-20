From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jan 2016 13:45:27 +0100
Subject: [Buildroot] [PATCH] package/radlib: New package
In-Reply-To: <1453291037.2933.40.camel@intel.com>
References: <1453220389.3109.32.camel@intel.com>
 <20160119174734.664e230c@free-electrons.com>
 <1453291037.2933.40.camel@intel.com>
Message-ID: <20160120134527.7b78d6a3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Jan 2016 11:57:17 +0000, Kinsella, Ray wrote:

> > There is an issue here with SoB line, it should include this mailto:
> > thing.
> 
> Apologies - Evolution is misbehaving. 

Just don't use your e-mail client to send patches, use "git
send-email".

> > This remains completely wrong. Contrary to what you do in your .mk
> > file, --prefix should *NOT* be $(STAGING_DIR)/usr or
> > $(TARGET_DIR)/usr.
> > It should be just "/usr". And therefore those -I$(prefix)/include and
> > -L$(prefix)/lib are totally wrong.
> 
> Ok - but if I don't do this, it picks up the headers/libs for its
> dependencies (libc, sqlite, mysql) from the host's /usr. I was using
> the prefix to keep these paths right.

Just remove -I$(prefix)/include everywhere from the Makefile.am of this
package, it is bogus.

> 
> > > +-if CROSSCOMPILE
> > > +-raddebug_LDFLAGS += $(prefix)/lib/crt1.o $(prefix)/lib/crti.o
> > > $(prefix)/lib/crtn.o
> > > +-endif
> > > ++#if CROSSCOMPILE
> > > ++#raddebug_LDFLAGS += $(prefix)/lib/crt1.o $(prefix)/lib/crti.o
> > > $(prefix)/lib/crtn.o
> > > ++#endif
> > 
> > Why ?
> 
> Ok - I can ask why these wherever explicitly passed to linker in the
> first instance. If I don't remove them - the linker fails complaining
> of duplicate symbols. (the patch should just remove, rather than
> comment these lines).  

Linking explicitly against crt1.o and crti.o seems wrong to me. gcc
will automatically take care of linking against crt1.o/crti.o when
needed.

> > > +diff -Naur a/debug/Makefile.in b/debug/Makefile.in
> > > +--- a/debug/Makefile.in        2016-01-12 14:33:24.655252603 +0000
> > > ++++ b/debug/Makefile.in        2016-01-12 14:34:05.062321796 +0000
> > Same.
> 
> As above - but I will remove this altogether and let the reconf take
> care of making the Makefile.in. 

Absolutely. Changing both Makefile.am and Makefile.in doesn't make much
sense.

> > > diff --git a/package/radlib/Config.in b/package/radlib/Config.in
> > > new file mode 100644
> > > index 0000000..2ca1617
> > > --- /dev/null
> > > +++ b/package/radlib/Config.in
> > > @@ -0,0 +1,22 @@
> > > +config BR2_PACKAGE_RADLIB
> > > +       bool "radlib"
> > > +       select BR2_PACKAGE_SQLITE
> > > +       select BR2_PACKAGE_SQLITE_NO_SYNC
> > 
> > Why do you force this NO_SYNC option ?
> 
> The sqlite db is staging area really - the data doesn't usually hang
> around on the embedded device - it is generally uploaded to the cloud
> etc. Might be more appropriate to trigger this wview instead of radlib.

It is really up to the user to decide this.

Remember that on the same system, sqlite can also be used for other
purposes. So assuming that fsync() is not needed because *your* package
doesn't need it is a wrong assumption. Maybe other applications using
sqlite on the same system need to have fsync() enabled.

> > Ditto. Also, if you select BR2_PACKAGE_MYSQL, you must replicate all
> > the "depends on" of BR2_PACKAGE_MYSQL. I would therefore rather
> > suggest
> > you to remove this option, and simply enable MySQL support in the .mk
> > file if BR2_PACKAGE_MYSQL=y.
> 
> ok this makes sense - but is less explicit.

Right, but it's "obvious" for the user: if you want MySQL support or
SQLite support in a package, it is kind of obvious that you need to
enable the MySQL / SQLite packages.

We normally only do sub-options for optional dependencies when it is
not obvious which other packages need to be enabled in order to benefit
for the optional dependency.

However, there are situations where this is not so clear-cut, so we
don't have a very strict rule about this.

> > > +RADLIB_CONF_OPTS += --enable-sqlite --prefix=$(STAGING_DIR)/usr
> > 
> > If --enable-sqlite exists, then presumably it means that the sqlite
> > support is optional, no? If it is, then please make it optional.
> 
> ok - in the same way as mysql then.

Yes.


> ok noted - that I shouldn't explicitly passing these, but it still
> doesn't fix my paths for dependencies.

See above: remove all the -I$(prefix)/include and -L$(prefix)/lib from
the Makefile.am.

Are you in contact with upstream ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
