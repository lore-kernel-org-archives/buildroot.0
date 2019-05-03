From: Norbert Lange <nolange79@gmail.com>
Date: Fri, 3 May 2019 21:21:57 +0200
Subject: [Buildroot] [PATCH 1/2] allow build infrastructure to pick up
 installed meson tool
In-Reply-To: <20190503185721.18b2c3a4@gmx.net>
References: <20190503131851.12315-1-norbert.lange@andritz.com>
 <20190503185721.18b2c3a4@gmx.net>
Message-ID: <CADYdroM0HzKf1yNcgPbjpa37Px5THjs9Aynm49hCDUxmjvRVUQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fr., 3. Mai 2019 um 18:57 Uhr schrieb Peter Seiderer <ps.report@gmx.net>:
>
> Hello Norbert,
>
> appreciating every patch which speeds up the buildroot build process ;-),
> but some nits, one minor comments and one major concern, see below...
>
> On Fri,  3 May 2019 15:18:50 +0200, Norbert Lange <nolange79@gmail.com> wrote:
>
> > From: Norbert Lange <nolange79@gmail.com>
> >
> > Automatically check for an available meson tool,
> > and use it aslond the version is fitting.
>
> s/aslond/as long/

Ack

> >
> > Some concerns are about being able to figure out the
> > correct version for all available packages in buildroot.
> > The min version could be set to version 1.0 to postpone the
>
> You mean 1.0 to disable host meson usage?

Yes, so meson is always built like it is now,
if this is too critical to enable by default.

> > problem, but still have the infrastructure in place
> > to allow users to override the version.
> >
> > Currently host-ninja will still be always built.
> >
> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
> > ---
> >  package/meson/meson.mk                   |  1 -
> >  package/pkg-meson.mk                     |  4 +--
> >  support/dependencies/check-host-meson.mk | 16 +++++++++
> >  support/dependencies/check-host-meson.sh | 45 ++++++++++++++++++++++++
> >  4 files changed, 63 insertions(+), 3 deletions(-)
> >  create mode 100644 support/dependencies/check-host-meson.mk
> >  create mode 100755 support/dependencies/check-host-meson.sh
> >
> > diff --git a/package/meson/meson.mk b/package/meson/meson.mk
> > index cf62b0ddde..2ce7a26ab5 100644
> > --- a/package/meson/meson.mk
> > +++ b/package/meson/meson.mk
> > @@ -10,7 +10,6 @@ MESON_LICENSE = Apache-2.0
> >  MESON_LICENSE_FILES = COPYING
> >  MESON_SETUP_TYPE = setuptools
> >
> > -HOST_MESON_DEPENDENCIES = host-ninja
> >  HOST_MESON_NEEDS_HOST_PYTHON = python3
> >
> >  HOST_MESON_TARGET_ENDIAN = $(call LOWERCASE,$(BR2_ENDIAN))
> > diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> > index 7f1838c09a..25e9bb814e 100644
> > --- a/package/pkg-meson.mk
> > +++ b/package/pkg-meson.mk
> > @@ -25,7 +25,7 @@
> >  # $(HOST_DIR)/bin/python3 will not look for Meson modules in
> >  # $HOME/.local/lib/python3.x/site-packages
> >  #
> > -MESON                = PYTHONNOUSERSITE=y $(HOST_DIR)/bin/meson
> > +MESON                = PYTHONNOUSERSITE=y $(BR2_MESON)
> >  NINJA                = PYTHONNOUSERSITE=y $(HOST_DIR)/bin/ninja
> >  NINJA_OPTS   = $(if $(VERBOSE),-v) -j$(PARALLEL_JOBS)
> >
> > @@ -105,7 +105,7 @@ endef
> >  endif
> >  endif
> >
> > -$(2)_DEPENDENCIES += host-meson
> > +$(2)_DEPENDENCIES += $(BR2_MESON_HOST_DEPENDENCY)
> >
> >  #
> >  # Build step. Only define it if not already defined by the package .mk
> > diff --git a/support/dependencies/check-host-meson.mk b/support/dependencies/check-host-meson.mk
> > new file mode 100644
> > index 0000000000..6c779b3e6d
> > --- /dev/null
> > +++ b/support/dependencies/check-host-meson.mk
> > @@ -0,0 +1,16 @@
> > +# Set this to either 0.49 or higher, depending on the highest minimum
> > +# version required by any of the packages bundled in Buildroot. If a
> > +# package is bumped or a new one added, and it requires a higher
> > +# version, our meson infra will catch it and build its own.
> > +#
> > +BR2_MESON_VERSION_MIN = 0.49
>
> Needs support for third version number, see latest meson bump to 0.50 and revert, but
> 0.50.1 worked ([1], [2], [3])...

There is support for up to 3 version components in
support/dependencies/check-host-meson.sh

>
> The major concern is no distribution will ship meson with the still needed
> buildroot patch, see [4]...

Ok, news to me.
Whats the practical effect though, does rpath even work if you
relocated buildroot?
Is it necessary if you set LD_LIBRARY_PATH?
(From my personal experience I was never happy with RPATH).

>
> Regards,
> Peter

Regards, Norbert
