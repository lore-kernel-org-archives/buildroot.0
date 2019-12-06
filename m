From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 6 Dec 2019 10:54:13 +0100
Subject: [Buildroot] [PATCH] package/pkg-meson: ensure the global
 cross-compilation.conf file is correct
In-Reply-To: <3e183413-d866-dc02-c846-3948dc5cb34c@mind.be>
References: <20191204150225.33749-1-thomas.petazzoni@bootlin.com>
 <3e183413-d866-dc02-c846-3948dc5cb34c@mind.be>
Message-ID: <CAAXf6LU=3iCa5Sg4c6jgvT5dS5U6z-_h=oKK1CpQ7mbj37-o0Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Arnout for looping me in.

Needless to say, I am opposed to moving the meson file back from the
target-finalize step :-)
I think most of the reasoning was already mentioned in that commit,
but it seems I did not explain that we actually have HOST_DIR mounted
read-only on subsequent 'make' commands after the initial make,
exactly to verify that no-one is changing directories they shouldn't
be changing. After all, a 'make' after the initial make will only
normally do the target-finalize step.

Can this problem of incorrect paths not be handled in another way,
e.g. by explicitly requesting the 'final' path variables outside the
per-package staging, or by doing a fixup afterwards (but not in the
scope of target-finalize), or by only creating the
cross-compilation.conf file if it does not already exist?

Thanks,
Thomas

El jue., 5 dic. 2019 a las 23:13, Arnout Vandecappelle
(<arnout@mind.be>) escribi?:
>
>
>
> On 04/12/2019 16:02, Thomas Petazzoni wrote:
> > Currently, the cross-compilation.conf installed in
> > $(HOST_DIR)/etc/meson/cross-compilation.conf for use by the SDK is
> > generated in a post-install-staging hook of the toolchain package.
> >
> > With per-package directory support enabled, this means that the
> > generated cross-compilation.conf contains references to the
> > per-package directory of the toolchain/ package, which is not want we
> > want:
> >
> > [binaries]
> > c = '/home/thomas/projets/buildroot/output/per-package/toolchain/host/bin/arm-linux-gcc'
> > cpp = '/home/thomas/projets/buildroot/output/per-package/toolchain/host/bin/arm-linux-g++'
> > ar = '/home/thomas/projets/buildroot/output/per-package/toolchain/host/bin/arm-linux-ar'
> > strip = '/home/thomas/projets/buildroot/output/per-package/toolchain/host/bin/arm-linux-strip'
> > pkgconfig = '/home/thomas/projets/buildroot/output/per-package/toolchain/host/usr/bin/pkg-config'
> >
> > So instead, we generate this file in TOOLCHAIN_TARGET_FINALIZE_HOOKS,
> > so that the global paths are used:
> >
> > [binaries]
> > c = '/home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc'
> > cpp = '/home/thomas/projets/buildroot/output/host/bin/arm-linux-g++'
> > ar = '/home/thomas/projets/buildroot/output/host/bin/arm-linux-ar'
> > strip = '/home/thomas/projets/buildroot/output/host/bin/arm-linux-strip'
> > pkgconfig = '/home/thomas/projets/buildroot/output/host/usr/bin/pkg-config'
> >
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > ---
> >  package/pkg-meson.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> > index e7eea2aa58..085da219fe 100644
> > --- a/package/pkg-meson.mk
> > +++ b/package/pkg-meson.mk
> > @@ -205,4 +205,4 @@ define PKG_MESON_INSTALL_CROSS_CONF
> >           > $(HOST_DIR)/etc/meson/cross-compilation.conf
> >  endef
> >
> > -TOOLCHAIN_POST_INSTALL_STAGING_HOOKS += PKG_MESON_INSTALL_CROSS_CONF
> > +TOOLCHAIN_TARGET_FINALIZE_HOOKS += PKG_MESON_INSTALL_CROSS_CONF
>
>  Note that this essentially reverts [1].
>
>  The case for that patch was not terribly strong, so it should be OK. But then
> again, the case for this patch is not that strong either.
>
>  Note that pkg-cmake has the same issue. And a number of other packages as well,
> e.g. the Python sysconfig refers to the Python per-package dirs.
>
>  If we really want to do it fully correctly, we'd need to run something like the
> relocate-sdk.sh on every per-package copy...
>
>  Regards,
>  Arnout
>
> [1]
> https://git.buildroot.org/buildroot/commit/?id=ccc9e05990a44d8db5825c07ed61d405ebb40caa
>
