From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 17 Jun 2021 00:19:25 +0300
Subject: [Buildroot] [webkitgtk / cairo] Accelerated rendering on
 raspberry pi 4
In-Reply-To: <20210616202638.74242b4a@gmx.net>
References: <CANVomh-dtsmg-oDwP8=uMmPWqcKA9hm7ReZ=wMiZoEn=-pOmWw@mail.gmail.com>
 <20210616202638.74242b4a@gmx.net>
Message-ID: <20210617001925.GB58049@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi there,

On Wed, 16 Jun 2021 20:26:38 +0200 Peter Seiderer <ps.report@gmx.net> wrote:
> On Wed, 16 Jun 2021 10:54:19 +0000, C Larbi <pkl2000us@gmail.com> wrote:
> 
> > I am working on a personal project to build a digital kiosk on a pi 4
> > I am using webkitgtk on a wayland compositor.
> > 
> > So far I have got the system up and running.
> > 
> > But css and javascript effects produce poor performance (high latency and
> > probably low FPS)
> > 
> > I get garbled output on the display when I try to enforce hardware
> > acceleration through WebKitSettings or using environment variables.
> > 
> > This has left me suspecting an issue with cairo, open egl and es
> > 
> > I did some research and found out cairo has an --enable-egl configuration
> > parameter (which is not in the cairo.mk file).
> 
> From package/cairo/cairo.mk:
> 
>  91 # Can use GL or GLESv2 but not both
>  92 ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
>  93 CAIRO_CONF_OPTS += --enable-gl --disable-glesv2
>  94 CAIRO_DEPENDENCIES += libgl
>  95 else
>  96 ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
>  97 CAIRO_CONF_OPTS += --disable-gl --enable-glesv2
>  98 CAIRO_DEPENDENCIES += libgles
>  99 else
> 100 CAIRO_CONF_OPTS += --disable-gl --disable-glesv2
> 101 endif
> 102 endif

FWIW, WebKit does *not* use Cairo-GL at all, even if the support is built
into Cairo. To give a very quick summary, this is what WebKit does for
rendering:

  1. Page elements are assigned a render layer; there can be one or more.
  2. Each layer is divided in square tile.
  3. Each tile is rasterized using Cairo, in the CPU.
  4. Tiles are uploaded to the GPU as textures, then composited there.

That way only tiles of layers with changes need to be repainted and
re-uploaded. Operation that typically cause WebKit to put elements in
new layers are CSS transforms: when the transform is applied (or animated),
the corresponding layer can be manipulated entirely in the GPU (position,
rotation, scaling, etc.)

TL;DR: WebKit uses *both* software rendering and the GPU for compositing.

One caveat, though: accelerated compositing may not be triggered by all
web pages in WebKitGTK, but for example is always enabled in the WPE port.

A quick way of knowing whether WebKit (both GTK and WPE ports) are indeed
using the GPU is to load the ?poster circle? animation. It uses CSS 3D
transforms and without hardware acceleration is terribly slow, and butter
smooth (60 FPS, even on slow hardware) when the GPU is in use. You can find
a version here:

  https://people.igalia.com/aperez/poster-circle.html

Another way is opening the ?webkit://gpu? URL and checking whether the
OpenGL/GLES renderer is *not* one of Mesa's software renderers (swrast,
llvmpipe, or swr).

> > I applied this but still garbled output.
> > 
> > I have tried different combinations of vc4-fkms-v3d, vc4-kms-v3-pi4, but
> > still get the garbled output.
> 
> Hard to say without more information (config file, etc.), please provide a (minimal)
> config/defconfig and example (commands) how to reproduce your problem...
> 
> Which buildroot version?
> 
> > Will appreciate it if anyone can give me some pointers to a possible
> > solution.
> > 
> > NB: I was advised to switch to wpewebkit, but i had the same results when i
> > used cog to load my web page
> 
> 
> For hints on RPi4, cog and wpebkit see for example [1]...

It's possible to use also ?cog --platform=drm ...? with the Mesa vc4/v3d
drivers. In that case you will not need a Wayland compositor running, but
this option is not as battle tested.

I hope this helps.

Cheers,
-Adrian
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210617/befaebd5/attachment.asc>
