From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 18 Sep 2020 22:33:06 +0200
Subject: [Buildroot] [PATCH 3/3 v4] package/qt5/qt5webengine: fix build
 dependencies for autodetected packages
In-Reply-To: <20200918223027.74a2ea7c@gmx.net>
References: <cover.1600290685.git.yann.morin.1998@free.fr>
 <6efc39e9d97769fae93be2bcb91f56b050dda219.1600290685.git.yann.morin.1998@free.fr>
 <20200917205147.79d63fc9@windsurf.hq.k.grp>
 <20200918223027.74a2ea7c@gmx.net>
Message-ID: <20200918223306.04712ecc@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Re-add CC: Yann, buildroot

Sorry,
Peter

On Fri, 18 Sep 2020 22:30:27 +0200, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Thomas,
>
> On Thu, 17 Sep 2020 20:51:47 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
>
> > On Wed, 16 Sep 2020 23:11:34 +0200
> > "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> >
> > > +ifeq ($(BR2_PACKAGE_JSONCPP),y)
> > > +QT5WEBENGINE_DEPENDENCIES += jsoncpp
> > > +endif
> > > +
> > > +ifeq ($(BR2_PACKAGE_LCMS2),y)
> > > +QT5WEBENGINE_DEPENDENCIES += lcms2
> > > +endif
> > > +
> > > +ifeq ($(BR2_PACKAGE_LIBEVENT),y)
> > > +QT5WEBENGINE_DEPENDENCIES += libevent
> > > +endif
> > > +
> > > +ifeq ($(BR2_PACKAGE_LIBXML2),y)
> > > +QT5WEBENGINE_DEPENDENCIES += libxml2
> > > +endif
> > > +
> > > +ifeq ($(BR2_PACKAGE_LIBXSLT),y)
> > > +QT5WEBENGINE_DEPENDENCIES += libxslt
> > > +endif
> > > +
> > > +ifeq ($(BR2_PACKAGE_PROTOBUF),y)
> > > +QT5WEBENGINE_DEPENDENCIES += protobuf
> > > +endif
> > > +
> > > +ifeq ($(BR2_PACKAGE_SNAPPY),y)
> > > +QT5WEBENGINE_DEPENDENCIES += snappy
> > > +endif
> >
> > I am not 100% sure but I believe those dependencies do have options,
> > much like the -webengine-ffmpeg option that PATCH 1/3 is using. If you
> > look at ./src/core/configure.json in the qt5webengine sources, you can
> > see:
>
> Do not see options for jsoncpp, lcms2, libevent, libxml2, libxslt, protobuf
> or snappy...
>
> >
> >     "commandline": {
> >         "options": {
> >             "webengine-alsa": "boolean",
> >             "webengine-embedded-build": "boolean",
> >             "webengine-full-debug-info": "boolean",
> >             "webengine-icu": { "type": "enum", "name": "webengine-system-icu", "values": { "system": "yes", "qt": "no" } },
> >             "webengine-ffmpeg": { "type": "enum", "name": "webengine-system-ffmpeg", "values": { "system": "yes", "qt": "no" } },
> >             "webengine-opus": { "type": "enum", "name": "webengine-system-opus", "values": { "system": "yes", "qt": "no" } },
> >             "webengine-webp": { "type": "enum", "name": "webengine-system-libwebp", "values": { "system": "yes", "qt": "no" } },
> >             "webengine-pepper-plugins": "boolean",
> >             "webengine-printing-and-pdf": "boolean",
> >             "webengine-proprietary-codecs": "boolean",
> >             "webengine-pulseaudio": "boolean",
> >             "webengine-spellchecker": "boolean",
> >             "webengine-native-spellchecker": "boolean",
> >             "webengine-extensions": "boolean",
> >             "webengine-webrtc": "boolean",
> >             "webengine-geolocation": "boolean",
> >             "webengine-webchannel": "boolean",
> >             "webengine-kerberos": "boolean",
> >             "alsa": { "type": "boolean", "name": "webengine-alsa" },
> >             "pulseaudio": { "type": "boolean", "name": "webengine-pulseaudio" },
> >             "ffmpeg": { "type": "enum", "name": "webengine-system-ffmpeg", "values": { "system": "yes", "qt": "no" } },
> >             "opus": { "type": "enum", "name": "webengine-system-opus", "values": { "system": "yes", "qt": "no" } },
> >             "webp": { "type": "enum", "name": "webengine-system-libwebp", "values": { "system": "yes", "qt": "no" } },
> >             "pepper-plugins": { "type": "boolean", "name": "webengine-pepper-plugins" },
> >             "printing-and-pdf": { "type": "boolean", "name": "webengine-printing-and-pdf" },
> >             "proprietary-codecs": { "type": "boolean", "name": "webengine-proprietary-codecs" },
> >             "spellchecker": { "type": "boolean", "name": "webengine-spellchecker" },
> >             "extensions": { "type": "boolean", "name": "webengine-extensions" },
> >             "webrtc": { "type": "boolean", "name": "webengine-webrtc" }
> >         }
> >     },
> >
> > So it seems like if we have a -webengine-ffmpeg option, then we should
> > also have many other options to enable (and perhaps disable ?) other
> > optional features.
> >
> > However, I'm not sure to understand the difference between the
> > "webengine-<something>" option and the corresponding "<something>"
> > option.
>
> I believe the second one is an (short) alias for the first/long one...
>
> >
> > Also, it seems like some options such as webengine-ffmpeg or
> > webengine-icu can take multiple values: they are enums and not
> > booleans. should we use -webengine-ffmpeg=system for example ? Ditto
> > for the other dependencies;
>
> Or '-webengine-ffmpeg' means option enabled/yes --> use system one
> as the summary output (from the original submit, [1]) suggests:
>
>     According to build/qt5webengine-5.12.7/config.summary:
>
>       Optional system libraries used:
>     [...]
>        ffmpeg ............................... yes
>     [...]
>
>
> >
> > For the record, the qt5webengine source code bundles chromium in
> > ./src/3rdparty/, which itself bundles a bunch of things including
> > ffmpeg in ./src/3rdparty/chromium/third_party/ffmpeg/ (do you like when
> > a 3rdparty folder includes another third_party folder ?).
> >
> > Obviously, in the context of Buildroot, we'd prefer to use as few
> > bundled libraries as possible, and use as much as possible system
> > libraries.
>
> Still a lot of space for improvements....
>
> Regards,
> Peter
>
> [1] http://lists.busybox.net/pipermail/buildroot/2020-February/275313.html
>
> >
> > How is the configure.json above being parsed and used ?
> >
> > Thomas
>
