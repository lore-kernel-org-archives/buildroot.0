From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 30 Apr 2019 10:27:09 +0200
Subject: [Buildroot] [PATCH 1/2] meson: add entry for libgcrypt-config
 in cross file
In-Reply-To: <6f5eef5542a44d775baa396c7fa7c01a2e6e2c4d.camel@embedded.rocks>
References: <20190403183202.19682-1-joerg.krause@embedded.rocks>
 <20190413182422.7e8f5f22@windsurf> <20190423232944.70aeddba@gmx.net>
 <6f5eef5542a44d775baa396c7fa7c01a2e6e2c4d.camel@embedded.rocks>
Message-ID: <trinity-a5fd1873-52f7-4d2a-9195-2a9713d0b83a-1556612829462@3c-app-gmx-bs70>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello J?rg,

> Gesendet: Dienstag, 30. April 2019 um 10:11 Uhr
> Von: "J?rg Krause" <joerg.krause@embedded.rocks>
> An: "Peter Seiderer" <ps.report@gmx.net>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> Cc: buildroot at buildroot.org
> Betreff: Re: [Buildroot] [PATCH 1/2] meson: add entry for libgcrypt-config in cross file
>
> Hi Peter,
> 
> On Tue, 2019-04-23 at 23:29 +0200, Peter Seiderer wrote:
> > Hello J?rg, Thomas,
> > 
> > On Sat, 13 Apr 2019 18:24:22 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> > 
> > > Hello J?rg,
> > > 
> > > +Peter Seiderer in Cc.
> > > 
> > > On Wed,  3 Apr 2019 20:32:01 +0200
> > > J?rg Krause <joerg.krause@embedded.rocks> wrote:
> > > 
> > > > Since version 0.49.0 the Meson build system has native support for
> > > > looking for `libgcrypt-config` if no pkg-config file is found. As the
> > > > latest version 1.8.4 of libgcrypt does not provide a .pc file, using
> > > > `libgcrypt-config` is the only way for detecting the required libraries
> > > > when linking agains libgrypt.
> > > > 
> > > > The `libgcrypt-config` entry is necessary for updating package mpd,
> > > > which switched from the Autotools to the Meson build system when bumping
> > > > from version 0.20 to 0.21.
> > > > 
> > > > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>  
> > > 
> > > As I said in my previous reply, I'm not too happy with this
> > > libgcrypt-config variable creeping into the global cross-compilation
> > > file. Can we instead look at extending what Peter Seiderer is doing in
> > > http://patchwork.ozlabs.org/patch/1081486/ and allow some per-package
> > > additions to the per-package cross-compilation file ? Peter's patch
> > > does it for CFLAGS/CXXFLAGS/LDFLAGS, we could perhaps do the same with
> > > arbitrary program paths ?
> > 
> > Something like the following (draft) should work:
> > 
> > diff --git a/package/meson/cross-compilation.conf.in b/package/meson/cross-compilation.conf.in
> > index 4056c2b2f4..7cd372128e 100644
> > --- a/package/meson/cross-compilation.conf.in
> > +++ b/package/meson/cross-compilation.conf.in
> > @@ -9,6 +9,7 @@ cpp = '@TARGET_CROSS at g++'
> >  ar = '@TARGET_CROSS at ar'
> >  strip = '@TARGET_CROSS at strip'
> >  pkgconfig = '@HOST_DIR@/usr/bin/pkg-config'
> > + at PKG_TARGET_BINARIES@
> >  
> >  [properties]
> >  needs_exe_wrapper = true
> > diff --git a/package/meson/meson.mk b/package/meson/meson.mk
> > index 70128f6bad..e550c80c9d 100644
> > --- a/package/meson/meson.mk
> > +++ b/package/meson/meson.mk
> > @@ -60,6 +60,7 @@ define HOST_MESON_INSTALL_CROSS_CONF
> >             -e "s%@TARGET_CFLAGS@%$(HOST_MESON_SED_CFLAGS)%g" \
> >             -e "s%@TARGET_LDFLAGS@%$(HOST_MESON_SED_LDFLAGS)%g" \
> >             -e "s%@TARGET_CXXFLAGS@%$(HOST_MESON_SED_CXXFLAGS)%g" \
> > +           -e "s%@PKG_TARGET_BINARIES@%%g" \
> >             -e "s%@PKG_TARGET_CFLAGS@%%g" \
> >             -e "s%@PKG_TARGET_LDFLAGS@%%g" \
> >             -e "s%@PKG_TARGET_CXXFLAGS@%%g" \
> > diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> > index 9974b1e513..93df43fe3e 100644
> > --- a/package/pkg-meson.mk
> > +++ b/package/pkg-meson.mk
> > @@ -74,6 +74,7 @@ define $(2)_CONFIGURE_CMDS
> >             -e "s%@TARGET_CFLAGS@%$$(HOST_MESON_SED_CFLAGS)%g" \
> >             -e "s%@TARGET_LDFLAGS@%$$(HOST_MESON_SED_LDFLAGS)%g" \
> >             -e "s%@TARGET_CXXFLAGS@%$$(HOST_MESON_SED_CXXFLAGS)%g" \
> > +           -e "s%@PKG_TARGET_BINARIES@%$$($$(PKG)_MESON_BINARIES)%g" \
> >             -e "s%@PKG_TARGET_CFLAGS@%$$($$(PKG)_MESON_SED_CFLAGS)%g" \
> >             -e "s%@PKG_TARGET_LDFLAGS@%$$($$(PKG)_MESON_SED_LDFLAGS)%g" \
> >             -e "s%@PKG_TARGET_CXXFLAGS@%$$($$(PKG)_MESON_SED_CXXFLAGS)%g" \
> > 
> > 
> > and with: 
> > 
> > MPD_MESON_BINARIES = libgcrypt-config = '$(STAGING_DIR)/usr/bin/libgcrypt-config'
> 
> I've just tested your draft. This still inserts libgcrypt-config in the
> global cross-compilation.conf.

Are you sure? The

+           -e "s%@PKG_TARGET_BINARIES@%%g"

in package/meson/meson.mk should not add anything to the global file...

Would have expected the trick/non-trivial thing to add more than one
binary entry (to get the newlines for the entries right)...

Regards,
Peter

> 
> I will send an updated version of the patch which does insert
> libgcrypt-config in the package cross file, but not in the global cross
> file.
> 
> Many thanks!
> 
> J?rg
> 
>
