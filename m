From: Scott Fan <fancp2007@gmail.com>
Date: Fri, 31 Jul 2015 08:59:42 +0800
Subject: [Buildroot] [PATCH v2] xdriver_xf86-video-fbturbo: new package
In-Reply-To: <20150730215709.GF3744@free.fr>
References: <1438092910-31618-1-git-send-email-fancp2007@gmail.com>
 <20150730215709.GF3744@free.fr>
Message-ID: <CAFkzVZYK=cnK9Vw=R2bwYdMWJsenuzGxZ2X=Xz6mPZBFM0KoQg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

> No need to resend it, I'll be taking care of it carying this patch in
> my tree now.
Ok, to you, please.

Thanks!

Scott Fan

On Fri, Jul 31, 2015 at 5:57 AM, Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> Scott, All,
>
> On 2015-07-28 22:15 +0800, Scott Fan spake thusly:
> > Add the fbturbo video driver, which is based on xf86-video-fbdev (with
> > none of the original features stripped), primarily optimized for the
> > devices powered by the Allwinner SoC (A10, A13, A20).
> >
> > https://github.com/ssvb/xf86-video-fbturbo/
> >
> > Signed-off-by: Scott Fan <fancp2007@gmail.com>
>
> I've tried to build this package, and all by itself, it is OK.
>
> However, we do have a dependency issue in how we handle DRI2 in our Xorg
> stack, which is triggered by this patch.
>
> So, before we can integrate that patch, we need to fix the DRI2 stuff.
> I have a series in my tree handling that dependency fix, so I'll drag
> this fbturbo in my series.
>
> In the meantime, I'm marking this patch as "Deferred" in our Patchwork.
>
> No need to resend it, I'll be taking care of it carying this patch in
> my tree now.
>
> Thanks! :-)
>
> Regards,
> Yann E. MORIN.
>
> > ---
> > Changes v1 -> v2:
> >   - wrap lines at 72 characters.
> >
> > Signed-off-by: Scott Fan <fancp2007@gmail.com>
> > ---
> >  package/x11r7/Config.in                            |  1 +
> >  package/x11r7/xdriver_xf86-video-fbturbo/Config.in | 60
> ++++++++++++++++++++++
> >  .../xdriver_xf86-video-fbturbo.mk                  | 21 ++++++++
> >  3 files changed, 82 insertions(+)
> >  create mode 100644 package/x11r7/xdriver_xf86-video-fbturbo/Config.in
> >  create mode 100644 package/x11r7/xdriver_xf86-video-fbturbo/
> xdriver_xf86-video-fbturbo.mk
> >
> > diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
> > index 859e895..4e996fc 100644
> > --- a/package/x11r7/Config.in
> > +++ b/package/x11r7/Config.in
> > @@ -162,6 +162,7 @@ if BR2_PACKAGE_XORG7
> >               source package/x11r7/xdriver_xf86-video-cirrus/Config.in
> >               source package/x11r7/xdriver_xf86-video-dummy/Config.in
> >               source package/x11r7/xdriver_xf86-video-fbdev/Config.in
> > +             source package/x11r7/xdriver_xf86-video-fbturbo/Config.in
> >               source package/x11r7/xdriver_xf86-video-geode/Config.in
> >               source package/x11r7/xdriver_xf86-video-glide/Config.in
> >               source package/x11r7/xdriver_xf86-video-glint/Config.in
> > diff --git a/package/x11r7/xdriver_xf86-video-fbturbo/Config.in
> b/package/x11r7/xdriver_xf86-video-fbturbo/Config.in
> > new file mode 100644
> > index 0000000..c260cf7
> > --- /dev/null
> > +++ b/package/x11r7/xdriver_xf86-video-fbturbo/Config.in
> > @@ -0,0 +1,60 @@
> > +config BR2_PACKAGE_XDRIVER_XF86_VIDEO_FBTURBO
> > +     bool "xf86-video-fbturbo"
> > +     select BR2_PACKAGE_LIBDRI2
> > +     select BR2_PACKAGE_XPROTO_FONTSPROTO
> > +     select BR2_PACKAGE_XPROTO_RANDRPROTO
> > +     select BR2_PACKAGE_XPROTO_RENDERPROTO
> > +     select BR2_PACKAGE_XPROTO_VIDEOPROTO
> > +     select BR2_PACKAGE_XPROTO_XPROTO
> > +     select BR2_PACKAGE_XPROTO_XF86DRIPROTO
> > +     help
> > +       video driver, primarily optimized for the devices powered
> > +       by the Allwinner SoC (A10, A13, A20). It can use some of
> > +       the 2D/3D hardware acceleration features.
> > +
> > +       And because this driver is based on xf86-video-fbdev (with none
> > +       of the original features stripped), it actually supports all the
> > +       same hardware as xf86-video-fbdev. Essentially,
> xf86-video-fbturbo
> > +       can be just used as a drop-in replacement and run on practically
> > +       any Linux system. There will be no real difference on x86, but
> any
> > +       ARM based system should see better performance thanks to some
> > +       additional optimizations (the elimination of ShadowFB layer,
> > +       ARM NEON/VFP code for dealing with uncached framebuffer reads,
> > +       automatic backing store management for faster window moves).
> > +
> > +       == 2D graphics acceleration features ==
> > +
> > +       Hardware accelerated window moving/scrolling on Allwinner A10/A20
> > +       (using the G2D Mixer Processor).
> > +
> > +       Hardware accelerated window moving/scrolling on Raspberry Pi
> (using
> > +       the BCM2835 DMA Controller)
> > +
> > +       == 3D graphics acceleration features ==
> > +
> > +       First a disclaimer to prevent any possible misunderstanding. The
> > +       Xorg DDX drivers (neither this one, nor the others) do not do any
> > +       actual 3D acceleration by themselves. They are nothing else but
> > +       just a glue between the 3D drivers and the X11 window system.
> Still
> > +       a poorly implemented glue can easily become the source of major
> > +       performance problems. So it's important to do it right.
> > +
> > +       This DDX driver provides integration for Mali 400 GPU into Xorg.
> > +       Any device with Mali 400 should have a properly working OpenGL ES
> > +       2.0 acceleration if it has Mali/UMP modules in the Linux kernel
> and
> > +       libMali.so proprietary binary blob installed in the system.
> > +       Additionally, the hardware overlay feature of Allwinner
> A10/A13/A20
> > +       display controller allows to support zero-copy OpenGL ES buffer
> > +       flipping without tearing. The rest of the devices with Mali 400
> > +       hardware (Exynos4, Rockchip, ...) are expected to have roughly
> the
> > +       same 3D performance as when using the reference vendor provided
> > +       Xorg DDX driver xf86-video-mali.
> > +
> > +       == Video acceleration features ==
> > +
> > +       XV overlay is supported on Allwinner A10/A13/A20.
> > +
> > +       == Installation instructions ==
> > +
> > +       https://github.com/ssvb/xf86-video-fbturbo/wiki/Installation
> > +
> > diff --git a/package/x11r7/xdriver_xf86-video-fbturbo/
> xdriver_xf86-video-fbturbo.mk b/package/x11r7/xdriver_xf86-video-fbturbo/
> xdriver_xf86-video-fbturbo.mk
> > new file mode 100644
> > index 0000000..18f80d5
> > --- /dev/null
> > +++ b/package/x11r7/xdriver_xf86-video-fbturbo/
> xdriver_xf86-video-fbturbo.mk
> > @@ -0,0 +1,21 @@
> >
> +################################################################################
> > +#
> > +# xdriver_xf86-video-fbturbo
> > +#
> >
> +################################################################################
> > +
> > +XDRIVER_XF86_VIDEO_FBTURBO_VERSION = 0.4.0
> > +XDRIVER_XF86_VIDEO_FBTURBO_SITE = $(call
> github,ssvb,xf86-video-fbturbo,$(XDRIVER_XF86_VIDEO_FBTURBO_VERSION))
> > +XDRIVER_XF86_VIDEO_FBTURBO_LICENSE = MIT
> > +XDRIVER_XF86_VIDEO_FBTURBO_LICENSE_FILES = COPYING
> > +XDRIVER_XF86_VIDEO_FBTURBO_DEPENDENCIES = xserver_xorg-server
> xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto
> xproto_xproto
> > +
> > +XDRIVER_XF86_VIDEO_FBTURBO_DEPENDENCIES += xproto_xf86driproto libdri2
> > +
> > +define XDRIVER_XF86_VIDEO_FBTURBO_INSTALL_CONF_FILE
> > +        $(INSTALL) -m 0644 -D $(@D)/xorg.conf
> $(TARGET_DIR)/etc/X11/xorg.conf
> > +endef
> > +
> > +XDRIVER_XF86_VIDEO_FBTURBO_POST_INSTALL_TARGET_HOOKS +=
> XDRIVER_XF86_VIDEO_FBTURBO_INSTALL_CONF_FILE
> > +
> > +$(eval $(autotools-package))
> > --
> > 2.5.0
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There
> is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150731/a7c37832/attachment.html>
