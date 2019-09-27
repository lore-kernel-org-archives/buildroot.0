From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 26 Sep 2019 20:26:10 -0700
Subject: [Buildroot] [PATCH] package/pkg-meson.mk: set Python
 sysconfigdata
In-Reply-To: <CAFSsvmo30O+h5ZUwVfGf91GxsTuGQiUH2CndBmgxY9hVyW08qQ@mail.gmail.com>
References: <20190804220503.13534-1-arnout@mind.be>
 <CAFSsvmo30O+h5ZUwVfGf91GxsTuGQiUH2CndBmgxY9hVyW08qQ@mail.gmail.com>
Message-ID: <CAFSsvmqZE3Gop3e_-rce-JEAkMiuTq9dpdbhW3XTviPHLHjP=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All;

Any update on this patch? Now that libglib 2.62.0 is in Buildroot, I
will need to submit a new patch set, which requires this patch.

Thanks!

Adam

On Mon, Sep 16, 2019 at 11:41 AM Adam Duskett <aduskett@gmail.com> wrote:
>
> All;
>
>
> On Sun, Aug 4, 2019 at 3:05 PM Arnout Vandecappelle (Essensium/Mind)
> <arnout@mind.be> wrote:
> >
> > meson has support for Python dependencies, to e.g. build Python modules.
> > It parses Python's sysconfig module to find the appropriate
> > configuration variables. However, the sysconfig module is the one for
> > the host, _not_ for the target. Therefore, wrong values may be set. Many
> > of them get overridden anyway by the cross-compilation.conf. One
> > particular one that is problematic is that it uses the python-XXX.pc
> > pkg-config file for the host instead of the target, because it
> > explicitly sets the PKG_CONFIG_LIBDIR found in sysconfig.
> >
> > Use the same trick as for python package: pass PYTHONPATH,
> > PYTHONNOUSERSITE and _PYTHON_SYSCONFIGDATA_NAME in the environment to
> > point to staging instead of host. This ensures the sysconfig from the
> > target is used instead of the one from the host.
> >
> > An alternative would be to patch meson to not use the PKG_CONFIG_LIBDIR
> > from sysconfig. However, it is likely that other problems will pop up at
> > some point because of using the wrong sysconfig.
> >
> > Note that this approach will still break things when meson needs to
> > build something for the host during a target build.
> >
> > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> > Cc: Adam Duskett <Aduskett@gmail.com>
> > Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> > Cc: Peter Seiderer <ps.report@gmx.net>
> > Cc: James Hilliard <james.hilliard1@gmail.com>
> > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> > ---
> > The setting of _PYTHON_SYSCONFIGDATA_NAME is different from the one in
> > pkg-python.mk. I don't understand how that definition could work: for
> > Python2, it is empty, so sysconfig tries to import a module with name
> > "". So apparently the call paths used by meson and by
> > setuptools/distutils are slightly different.
> > ---
> >  package/pkg-meson.mk | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> > index 0b811d1cc0..3f875c08ce 100644
> > --- a/package/pkg-meson.mk
> > +++ b/package/pkg-meson.mk
> > @@ -81,6 +81,9 @@ define $(2)_CONFIGURE_CMDS
> >             -e "s%@HOST_DIR@%$$(HOST_DIR)%g" \
> >             package/meson/cross-compilation.conf.in \
> >             > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
> > +       _PYTHON_SYSCONFIGDATA_NAME="$$(if $$(BR2_PACKAGE_PYTHON3),$$(PKG_PYTHON_SYSCONFIGDATA_NAME),_sysconfigdata)" \
> > +       PYTHONPATH="$$(if $$(BR2_PACKAGE_PYTHON3),$$(PYTHON3_PATH),$$(PYTHON_PATH))" \
> > +       PYTHONNOUSERSITE=1 \
> >         PATH=$$(BR_PATH) $$($$(PKG)_CONF_ENV) $$(MESON) \
> >                 --prefix=/usr \
> >                 --libdir=lib \
> > --
> > 2.21.0
> >
> Not only does this work, it also fixes cross-compiled python libraries names
> built by meson (such as the new versions of python-gobject)
>
> Tested-by: Adam Duskett <Aduskett@gmail.com>
