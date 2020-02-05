From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Feb 2020 10:37:05 +0100
Subject: [Buildroot] [PATCH v1 2/2] package/mesa3d: update vc4 help text
In-Reply-To: <20200204225534.6369f87e@gmx.net>
References: <20200204144412.6666-1-ps.report@gmx.net>
 <20200204144412.6666-3-ps.report@gmx.net>
 <20200204210300.GC6335@scaer> <20200204225534.6369f87e@gmx.net>
Message-ID: <20200205093705.GC3131@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-02-04 22:55 +0100, Peter Seiderer spake thusly:
> On Tue, 4 Feb 2020 22:03:00 +0100, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> >
> > On 2020-02-04 15:44 +0100, Peter Seiderer spake thusly:
> > > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > > ---
> > >  package/mesa3d/Config.in | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> > > index 1351d1cd97..9389a6132e 100644
> > > --- a/package/mesa3d/Config.in
> > > +++ b/package/mesa3d/Config.in
> > > @@ -244,8 +244,10 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
> > >  	select BR2_PACKAGE_LIBDRM_VC4
> > >  	select BR2_PACKAGE_MESA3D_OPENGL_EGL
> > >  	help
> > > -	  Driver for Broadcom VC4 (rpi2/3) GPUs.
> > > -	  It requires a vanilla 4.5+ kernel with drm vc4 (open) support.
> > > +	  Driver for Broadcom VC4 (rpi2/3/4) GPUs (needs kmsro).
> > > +	  It requires a recent enough mainline/raspberrypi kernel with
> > > +	  drm vc4 (CONFIG_DRM_VC4) support enabled, for rpi4 additional
> > > +	  v3d support is required.
> >
> > This is all very confusing...
> I wanted to emphasize that no longer a vanilla/mainlain kernel is needed
> as the official raspberry provided one gained the DRM VC4 support...

The problem is not about the mainline vs. fork distinction, but about
dropping the exact version for a hazy definition.

> > First, you add rpi4 as supported by the vc4 driver, but the v3d driver
> Not exactly supported, but needed for the rpi4 case...

See my other reply, this goes along the same lines.

> > is also supposed to cover the rpi4. Are both needed? Is the v3d driver
> > a supperset, a subset, a complement to vc4? If so, why doesn't the v3d
> > driver select the vc4 driver (although it selects the vc4 drm backend)?
> Because no one of the selecting BR2_PACKAGE_MESA3D_GALLIUM_KMSRO drivers
> selects BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO...

s I already said:: if you say 'need foo', then you must select foo
instead. Otherwise, it means 'foo' is not really needed.

> > Or is it possible to use just the vc4 driver on rpi4?
> For the RPi3 the vc4 (and kmsro) is sufficient, for the RPi4 all three
> (v3d, vc4, kmsro) are needed...

Then select everything that is needed.

> Did not test if mesa3d-v3d compiles without libdrm vc4 (but checked it links
> the same way against libdrm as mesa3d-vc4)...

Note that, as you said, there are two symbols about vc4: the libdrm
option (which you correctly select from the mesa3d v3d driver (yes,
v3d)), and the mesa3d v4c driver, which you say is needed, but not
selected.

> Will try to come up with an better commit log...

Thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
