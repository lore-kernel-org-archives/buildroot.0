From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 28 Feb 2020 20:24:31 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/qt5/qt5webengine: fix build
 dependencies for autodetected packages
In-Reply-To: <CAOgXH4cBXrFSnbz4fdnqBUTLSXF2f25So9wURCqUb6kLDgsxwg@mail.gmail.com>
References: <1582900755-10044-1-git-send-email-nford@westpond.com>
 <1582900755-10044-2-git-send-email-nford@westpond.com>
 <20200228165645.734b6390@gmx.net> <20200228165925.5dc5355e@gmx.net>
 <CAOgXH4cBXrFSnbz4fdnqBUTLSXF2f25So9wURCqUb6kLDgsxwg@mail.gmail.com>
Message-ID: <20200228202431.5dd7c4e5@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Nate,

On Fri, 28 Feb 2020 12:37:22 -0500, Nathan Ford <nford@westpond.com> wrote:

> I ran into a linker error when I tried to enable minizip, so I omitted it.

That is sad...., but is not solved by omitting the dependency (but maybe
hidden due to build order....on the cost of reproducibility)..., but
there is no option to disable minizip support (only detected by pkg-config
and the minizip.pc file provided by minizip-2.9.1, but the version
seems to be not compatible)...

> 
> Did you re-compile qt5base after selecting png / jpeg / harfbuzz?
> qt5webengine enables them via the qt build system.

Yes, full re-build ;-)

But see no direct enabling through qt5webengine options/select, maybe
indirect?

The jpeg test failes with:

> main.cpp:12:5: error: ?jpeg_crop_scanline? was not declared in this scope; did you mean ?jpeg_read_scanlines??
>    12 |     jpeg_crop_scanline(nullptr, &dummy, &dummy);
>       |     ^~~~~~~~~~~~~~~~~~
>       |     jpeg_read_scanlines
> main.cpp:13:5: error: ?jpeg_skip_scanlines? was not declared in this scope; did you mean ?jpeg_read_scanlines??
>    13 |     jpeg_skip_scanlines(nullptr, dummy);
>       |     ^~~~~~~~~~~~~~~~~~~
>       |     jpeg_read_scanlines

Maybe incompatible version?

> 
> icu needs to be enabled explicitly similar to ffmpeg. Don't remember
> why I omitted it. I'm compiling now to see if there was an issue.

Did take a look at build/qt5webengine-5.12.7/config_help.txt:

WebEngine options:

  -webengine-alsa ................ Enable ALSA support [auto] (Linux only)
  -webengine-pulseaudio .......... Enable PulseAudio support [auto]
                                   (Linux only)
  -webengine-embedded-build ...... Enable Linux embedded build [auto]
                                   (Linux only)
  -webengine-icu ................. Use system ICU libraries [system/qt]
                                   (Linux only)
  -webengine-ffmpeg .............. Use system FFmpeg libraries [system/qt]
                                   (Linux only)
  -webengine-opus ................ Use system Opus libraries [system/qt]
                                   (Linux only)
  -webengine-webp ................ Use system WebP libraries [system/qt]
                                   (Linux only)
  -webengine-pepper-plugins ...... Enable use of Pepper Flash and Widevine
                                   plugins [auto]
  -webengine-printing-and-pdf .... Enable use of printing and output to PDF
                                   [auto]
  -webengine-proprietary-codecs .. Enable support for proprietary codecs [no]
  -webengine-spellchecker ........ Enable support for spellchecker [yes]
  -webengine-native-spellchecker . Enable support for native spellchecker [no]
                                   (macOS only)
  -webengine-webrtc .............. Enable support for WebRTC [auto]

There are more 'auto' options, e.g. '-webengine-pulseaudio' which should
be properly supported including the dependencies by the qt5webengine
package (or explicitly disabled)...
 
> 
> If libxml2/libxslt is checked, qt5webengine will skip them because
> libxml2 is not built with ICU support. libxml2 needs a configure
> switch to explicitly enable it. I have a patch that does this if ICU
> is enabled, but I don't know if implicitly enabling it would have
> ramifications, otherwise why is it not auto detected?

The libxml2/libxslt test simply fails with:

> xml2.cpp:31:2: error: #error "libxml icu not enabled"
>    31 | #error "libxml icu not enabled"
>       |  ^~~~~

Regards,
Peter

> 
> --Nate
> 
> 
> 
> On Fri, Feb 28, 2020 at 10:59 AM Peter Seiderer <ps.report@gmx.net> wrote:
> >
> > Re-add CC: Nathan Ford <nford@westpond.com>
> >
> > On Fri, 28 Feb 2020 16:56:45 +0100, Peter Seiderer <ps.report@gmx.net> wrote:
> >  
> > > Hello Nathan,
> > >
> > > On Fri, 28 Feb 2020 09:39:15 -0500, Nathan Ford <nford@westpond.com> wrote:
> > >  
> > > > Signed-off-by: Nathan Ford <nford@westpond.com>
> > > > ---
> > > >  package/qt5/qt5webengine/qt5webengine.mk | 28 ++++++++++++++++++++++++++++
> > > >  1 file changed, 28 insertions(+)
> > > >
> > > > diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
> > > > index 3824738..e5f8421 100644
> > > > --- a/package/qt5/qt5webengine/qt5webengine.mk
> > > > +++ b/package/qt5/qt5webengine/qt5webengine.mk
> > > > @@ -60,6 +60,34 @@ QT5WEBENGINE_QMAKEFLAGS += QT_CONFIG-=alsa
> > > >  endif
> > > >  endif
> > > >
> > > > +ifeq ($(BR2_PACKAGE_JSONCPP),y)
> > > > +QT5WEBENGINE_DEPENDENCIES += jsoncpp
> > > > +endif
> > > > +
> > > > +ifeq ($(BR2_PACKAGE_LCMS2),y)
> > > > +QT5WEBENGINE_DEPENDENCIES += lcms2
> > > > +endif
> > > > +
> > > > +ifeq ($(BR2_PACKAGE_LIBEVENT),y)
> > > > +QT5WEBENGINE_DEPENDENCIES += libevent
> > > > +endif
> > > > +
> > > > +ifeq ($(BR2_PACKAGE_LIBXML2),y)
> > > > +QT5WEBENGINE_DEPENDENCIES += libxml2
> > > > +endif
> > > > +
> > > > +ifeq ($(BR2_PACKAGE_LIBXSLT),y)
> > > > +QT5WEBENGINE_DEPENDENCIES += libxslt
> > > > +endif
> > > > +
> > > > +ifeq ($(BR2_PACKAGE_PROTOBUF),y)
> > > > +QT5WEBENGINE_DEPENDENCIES += protobuf
> > > > +endif
> > > > +
> > > > +ifeq ($(BR2_PACKAGE_SNAPPY),y)
> > > > +QT5WEBENGINE_DEPENDENCIES += snappy
> > > > +endif
> > > > +  
> > >
> > > According to build/qt5webengine-5.12.7/config.summary:
> > >
> > >   Optional system libraries used:
> > >     re2 .................................. no   ---> not in buildroot
> > >     icu .................................. no   ---> handled by select BR2_PACKAGE_QT5BASE_ICU but not found (version mismatch)?
> > >     libwebp, libwebpmux and libwebpdemux . yes  ---> already handled and fixed by your previous patch
> > >     opus ................................. yes  ---> already handled
> > >     ffmpeg ............................... yes  ---> already handled
> > >     libvpx ............................... yes  ---> already handled
> > >     snappy ............................... yes  ---> handled by our patch
> > >     glib ................................. yes  ---> already handled
> > >     zlib ................................. yes  ---> handled by qt5base
> > >     minizip .............................. no
> > >     libevent ............................. no   ---> handled by our patch
> > >     jsoncpp .............................. no   ---> handled by our patch
> > >     protobuf ............................. no   ---> handled by our patch
> > >     libxml2 and libxslt .................. no   ---> handled by our patch
> > >     lcms2 ................................ no   ---> handled by our patch
> > >     png .................................. yes  ---> handled by qt5base (only in case BR2_PACKAGE_QT5BASE_PNG is set)?
> > >     JPEG ................................. no   ---> handled by qt5base (only in case BR2_PACKAGE_QT5BASE_JPEG is set)? In my config
> > >                                                      BR2_PACKAGE_QT5BASE_JPEG is set but not found?
> > >     harfbuzz ............................. yes  ---> handled by qt5base (only in case BR2_PACKAGE_QT5BASE_HARFBUZZ and BR2_TOOLCHAIN_HAS_SYNC_4 is set)?
> > >     freetype ............................. yes  ---> handled by qt5base
> > >
> > > So your patch is definitely an improvement and you can add my
> > >
> > > Reviewed-by: Peter Seiderer <ps.report@gmx.net>
> > >
> > > Care to take a look if the buildroot package minizip is sufficient for qt5webengine?
> > >
> > > Leaving icu, png, jpeg and harfbuzz for more research....
> > >
> > > Regards,
> > > Peter
> > >  
> > > >  # QtWebengine's build system uses python, but only supports python2. We work
> > > >  # around this by forcing python2 early in the PATH, via a python->python2
> > > >  # symlink.  
> > >  
> >  
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
