From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 1 May 2019 22:44:01 +0200
Subject: [Buildroot] [DRAFT v1 0/7] gstreamer1: convert to meson build
In-Reply-To: <20190429230249.1d054154@gmx.net>
References: <20190429194534.25743-1-ps.report@gmx.net>
 <CAFSsvmpoZzfSVu4SP7356B0UWu8eDVFMNoQsiXe=tmQidbydng@mail.gmail.com>
 <20190429230249.1d054154@gmx.net>
Message-ID: <20190501224401.5f906d01@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

On Mon, 29 Apr 2019 23:02:49 +0200, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Adam,
>
> On Mon, 29 Apr 2019 15:55:17 -0400, Adam Duskett <aduskett@gmail.com> wrote:
>
> > Hey Peter;
> >
> > I happen to have a gstreamer-meson branch on my own personal fork, I
> > wasn't able to get a static-only-build working.
> >
> > Mind if you take a look?
> >
> > https://gitlab.com/aduskett/buildroot/tree/goi-meson/package/gstreamer1
>
> Thanks for the hint, will take a look and test a static only configuration...

For the static build I get the following errors:

gstinfo.c:(.text+0x315c): undefined reference to `__gst_printf_pointer_extension_set_func'
gstinfo.c:(.text+0x3c18): undefined reference to `__gst_vasprintf'
[...]

This are all symbols provided by gstreamer intermediate/private static libarary gstprintf
(see gstreamer-1.16.0/gst/printf) linked into libgstreamer-1.0.so in the shared
case but missing in the static case (see [2] for detailed description and meson
bug report)...

Regards,
Peter

[2] https://github.com/mesonbuild/meson/issues/5343

>
> Regards,
> Peter
>
> >
> > On Mon, Apr 29, 2019 at 3:45 PM Peter Seiderer <ps.report@gmx.net> wrote:
> > >
> > > Early first draft version of gstreamer1 packages convert to meson
> > > build, depends on the bump to version 1.16.0 (see [1] and ff.).
> > >
> > > Notes:
> > >  - still some ToDo and or commented out code about
> > >    unkown/legacy options
> > >  - some commented out/not yet converted code about
> > >    extra compile flags setting
> > >  - still some patch description missing
> > >
> > > Not (yet) converted:
> > >  - gstreamer1-editing-services: GTK2/3 handling missing
> > >  - gst1-libav: libav options missing
> > >  - gst1-validate: meson build files missing from tar file
> > >
> > > [1] https://patchwork.ozlabs.org/patch/1090466/
> > >
> > > Peter Seiderer (7):
> > >   package/gstreamer1: convert to meson build
> > >   package/gst1-plugins-base: convert to meson build
> > >   package/gst1-plugins-good: convert to meson build
> > >   package/gst1-plugins-bad: convert to meson build
> > >   package/gst1-plugins-ugly: convert to meson build
> > >   package/gst1-vaapi: convert to meson build
> > >   package/gst1-rtsp-server: convert to meson build
> > >
> > >  .../gst1-plugins-bad/gst1-plugins-bad.mk      | 606 ++++++++++--------
> > >  .../gst1-plugins-base/gst1-plugins-base.mk    | 243 +++----
> > >  .../gst1-plugins-good/gst1-plugins-good.mk    | 399 ++++++------
> > >  .../gst1-plugins-ugly/gst1-plugins-ugly.mk    |  69 +-
> > >  .../gst1-rtsp-server/gst1-rtsp-server.mk      |  11 +-
> > >  package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   |  19 +-
> > >  package/gstreamer1/gstreamer1/gstreamer1.mk   |  28 +-
> > >  7 files changed, 725 insertions(+), 650 deletions(-)
> > >
> > > --
> > > 2.21.0
> > >
>
