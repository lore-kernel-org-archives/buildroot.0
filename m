From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 5 Sep 2018 06:59:54 +0300
Subject: [Buildroot] [PATCH v2 1/1] qemu: add support for python3
In-Reply-To: <CAFSsvmo00eY8yv5PmPQ31KJGprg4HSpM6mqB-hs=8Xn_r1Gz7w@mail.gmail.com>
References: <20180904183934.12291-1-aduskett@gmail.com>
 <87efe9cd6u.fsf@tkos.co.il>
 <CAFSsvmo00eY8yv5PmPQ31KJGprg4HSpM6mqB-hs=8Xn_r1Gz7w@mail.gmail.com>
Message-ID: <20180905035954.7sio4o56gviyyb5a@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

On Tue, Sep 04, 2018 at 03:09:26PM -0400, Adam Duskett wrote:
> I'm not sure;
> 
> We support Distributions as old as CentOS6, which have very very old
> versions of Python...

Buildroot requires Python version 2.6 or newer:

  https://buildroot.org/downloads/manual/manual.html#requirement-mandatory

Can Python 2.6 build qemu?

baruch

> On Tue, Sep 4, 2018 at 2:47 PM Baruch Siach <baruch@tkos.co.il> wrote:
> > Adam Duskett writes:
> > > qemu 2.12.0 now supports building against python3.
> > > see: https://wiki.qemu.org/ChangeLog/2.12#Build_Dependencies
> > >
> > > Signed-off-by: Adam Duskett <aduskett@gmail.com>
> > > ---
> > > Changes v1 -> v2:
> > >   - Split the python version check into two seperate checks for
> > >     readability, one for the target, one for the host.
> > >   - Fix location of the python version check for target and host.
> > >
> > >  package/qemu/qemu.mk | 27 ++++++++++++++++++++++-----
> > >  1 file changed, 22 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> > > index afb2aa92f6..6dd9ce4a62 100644
> > > --- a/package/qemu/qemu.mk
> > > +++ b/package/qemu/qemu.mk
> > > @@ -16,7 +16,7 @@ QEMU_LICENSE_FILES = COPYING COPYING.LIB
> > >  #-------------------------------------------------------------
> > >  # Target-qemu
> > >
> > > -QEMU_DEPENDENCIES = host-pkgconf host-python libglib2 zlib pixman
> > > +QEMU_DEPENDENCIES = host-pkgconf libglib2 zlib pixman
> > >
> > >  # Need the LIBS variable because librt and libm are
> > >  # not automatically pulled. :-(
> > > @@ -25,9 +25,19 @@ QEMU_LIBS = -lrt -lm
> > >  QEMU_OPTS =
> > >
> > >  QEMU_VARS = \
> > > -     LIBTOOL=$(HOST_DIR)/bin/libtool \
> > > -     PYTHON=$(HOST_DIR)/bin/python2 \
> > > +     LIBTOOL=$(HOST_DIR)/bin/libtool
> > > +
> > > +ifeq ($(BR2_PACKAGE_PYTHON3),y)
> > > +QEMU_DEPENDENCIES += host-python3
> > > +QEMU_VARS += \
> > > +     PYTHON=$(HOST_DIR)/bin/python3 \
> > > +     PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
> > > +else
> > > +QEMU_DEPENDENCIES += host-python
> > > +QEMU_VARS += \
> > > +     PYTHON=$(HOST_DIR)/bin/python \
> > >       PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
> > > +endif
> >
> > Can't we use the host installed python? Python is already a dependency
> > of Buildroot.
> >
> > baruch
> >
> > >  # If we want to specify only a subset of targets, we must still enable all
> > >  # of them, so that QEMU properly builds its list of default targets, from
> > > @@ -150,7 +160,7 @@ $(eval $(generic-package))
> > >  #-------------------------------------------------------------
> > >  # Host-qemu
> > >
> > > -HOST_QEMU_DEPENDENCIES = host-pkgconf host-python host-zlib host-libglib2 host-pixman
> > > +HOST_QEMU_DEPENDENCIES = host-pkgconf host-zlib host-libglib2 host-pixman
> > >
> > >  #       BR ARCH         qemu
> > >  #       -------         ----
> > > @@ -263,12 +273,19 @@ define HOST_QEMU_CONFIGURE_CMDS
> > >               --interp-prefix=$(STAGING_DIR) \
> > >               --cc="$(HOSTCC)" \
> > >               --host-cc="$(HOSTCC)" \
> > > -             --python=$(HOST_DIR)/bin/python2 \
> > >               --extra-cflags="$(HOST_CFLAGS)" \
> > >               --extra-ldflags="$(HOST_LDFLAGS)" \
> > >               $(HOST_QEMU_OPTS)
> > >  endef
> > >
> > > +ifeq ($(BR2_PACKAGE_PYTHON3),y)
> > > +HOST_QEMU_DEPENDENCIES += host-python3
> > > +HOST_QEMU_CONFIGURE_CMDS += --python=$(HOST_DIR)/bin/python3
> > > +else
> > > +HOST_QEMU_DEPENDENCIES += host-python
> > > +HOST_QEMU_CONFIGURE_CMDS += --python=$(HOST_DIR)/bin/python2
> > > +endif
> > > +
> > >  define HOST_QEMU_BUILD_CMDS
> > >       $(HOST_MAKE_ENV) $(MAKE) -C $(@D)
> > >  endef

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
