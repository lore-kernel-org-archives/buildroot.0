From: Charles Turner <cturner@igalia.com>
Date: Thu, 12 Mar 2020 19:36:22 +0000
Subject: [Buildroot] [PATCH v2 1/1] package/cog: add option for platform
 DRM.
In-Reply-To: <20200312143613.178e96ae@windsurf>
References: <20200310112227.16175-1-cturner@igalia.com>
 <20200311103044.11422-1-cturner@igalia.com>
 <20200312120325.6e338f57@windsurf>
 <b1c360d0310f33edddef7a9da4a9e1789190a5d7.camel@igalia.com>
 <20200312143613.178e96ae@windsurf>
Message-ID: <2171440457cf0ed45ac0d8b7f1ca2f2022cabf3a.camel@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, 2020-03-12 at 14:36 +0100, Thomas Petazzoni wrote:
> On Thu, 12 Mar 2020 13:11:49 +0000
> Charles Turner <cturner@igalia.com> wrote:
> 
> > The libdrm package heavily depends on the target hardware for what
> > dependencies it has. In my case the dependencies of libdrm are
> > simply
> > BR2_aarch64 || BR2_arm because I'm using the VC4 driver on the
> > Raspberry Pi, but in general how can I replicate the "depends on"
> > in
> > cog, and should I really do that?
> 
> cog only needs libdrm itself to build, which specific DRM driver is
> needed is up to the user to figure out and we will certainly not
> replicate all the DRM drivers dependencies to the cog package.

In other words, the replication is only needed for the non-configurable 
parts of the dependent package?

> 
> The other packages that use libdrm mostly "select
> BR2_PACKAGE_LIBDRM".
> 
> > Cog also selects dbus, but I note that dbus' dependencies are not
> > replicated in Cog's .mk file either (e.g expat). Could select on
> > not
> > auto-update the dependencies of the selecting package with the
> > selected
> > package?
> 
> BR2_PACKAGE_EXPAT is selected by BR2_PACKAGE_DBUS, so this is not
> something you need to propagate to cog.

OK, *selected*, not depended on. Think I have it now.

> If the DRM platform does need the FDO platform, then indeed what you
> have done in keeping the FDO platform unconditionally enabled is
> fine.

What I mean (and why the naming is unfortunate) is that I can have one
of DRM or FDO "platform", but both rely on the `wpebackend-fdo`
package.

Another thing, the DRM platform needs libgbm, I'm not sure how to
encode this dependency. There could be multiple providers of GBM, so
selecting one like `select BR2_PACKAGE_MESA3D_GBM` is wrong. Cog also
needs EGL, which can be encoded regardless of the implementor using
`depends on BR2_PACKAGE_HAS_LIBEGL`. Do I need to add
`BR2_PACKAGE_HAS_LIBGBM` to encode the gbm dependency properly? Other
packages just `depends on BR2_PACKAGE_MESA3D_OPENGL_EGL` to declare
their dependency on GBM, because that transitively depends on
BR2_PACKAGE_MESA3D_GBM. However, it looks like we have at least one
other GBM implementation in the TI related targets
(BR2_PACKAGE_TI_SGX_LIBGBM), so I am unsure about this approach.

Coordination: I will be away till next Monday.

Thanks for your explanations, hopefully the dependency logic will be
tighter in the next iteration of the patch.

Best,
	Charlie.
