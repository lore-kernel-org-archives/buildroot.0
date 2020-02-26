From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 26 Feb 2020 22:43:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5webengine: Fix building
 against system ffmpeg
In-Reply-To: <CAOgXH4fFSj279gUqOxW3z57h_NYoLfeMeeVjLObtuSLXg+H7uw@mail.gmail.com>
References: <CAOgXH4cKir4gopXC8vi0rENaamo4aw=Epv2dShmCgRv3wwNFQg@mail.gmail.com>
 <20200218143854.1cbe341e@gmx.net>
 <CAOgXH4fOzewfqw2JOK-R8O1QbzwFi6nT+ivFD7ZcN0H0tQ19mg@mail.gmail.com>
 <20200220095326.63f3783a@gmx.net>
 <CAOgXH4fFSj279gUqOxW3z57h_NYoLfeMeeVjLObtuSLXg+H7uw@mail.gmail.com>
Message-ID: <20200226224300.20f58968@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Nathan,

On Wed, 26 Feb 2020 14:30:04 -0500, Nathan Ford <nford@westpond.com> wrote:

> I was working on this patch when I realized a recent commit removed
> the option to do a legacy ( 5.6 ) build. Should I still submit it with
> legacy support, or just fix the minor issues and resubmit without?

Would prefer the patch with Qt-5.6.x handling as the fix is stuff although
for the buildroot long term support version (in case there will be another
2019.02.x release, somewhere stated 'maintained until March 2020') and
it is easier to drop the Qt-5.6.x support than to add it ;-), but
although no problem if your prefer to re-base your patch  on Peter Korsgaard
drop Qt-5.6.x patch set (or mention it is intended to be applied afterwards)...

Regards,
Peter

>
> --Nate
>
> On Thu, Feb 20, 2020 at 3:53 AM Peter Seiderer <ps.report@gmx.net> wrote:
> >
> > Hello Nathan,
> >
> > On Wed, 19 Feb 2020 15:04:24 -0500, Nathan Ford <nford@westpond.com> wrote:
> >
> > > Hello Peter,
> > >
> > > On Tue, Feb 18, 2020 at 8:38 AM Peter Seiderer <ps.report@gmx.net> wrote:
> > > >
> > > > Hello Nathan,
> > > >
> > > > thanks for taking care of bug 12416 and the provided patch!
> > > >
> > > > On Wed, 22 Jan 2020 11:19:22 -0500, Nathan Ford <nford@westpond.com> wrote:
> > > >
> > > > >  As of QT 5.10 the WEBENGINE_CONFIG options have been
> > > > >  removed in favor of configure command line options.
> > > > >  dist/changes-5.9.0 and dist/changes-5.10.0 document
> > > > >  this.
> > > >
> > > > No need for additional indent here...
> > > >
> > > > >
> > > > > qt5webengine also now requires webp mux support or the auto
> > > > > detection of ffmpeg will fail.
> > > > >
> > > > > This fixes bug 12416
> > > >
> > > > Your patch is based on the one provided in the bug report [1]
> > > > (plus the additional webp_mux and alsa changes)?
> > > >
> > > > If so mention it here ;-)
> > >
> > > My Bad. Will fix.
> >
> > And one more minor nitpick, can your change the commit title to (or
> > something similar):
> >
> >         package/qt5/qt5webengine: fix ffmpeg/alsa option handling for latest
> > >
> > > > >
> > > > > Signed-off-by: Nathan Ford <nford@westpond.com>
> > > > >
> > > > > diff --git a/package/qt5/qt5webengine/Config.in
> > > > > b/package/qt5/qt5webengine/Config.in
> > > > > index 0e776ec..18e4418 100644
> > > > > --- a/package/qt5/qt5webengine/Config.in
> > > > > +++ b/package/qt5/qt5webengine/Config.in
> > > > > @@ -42,6 +42,7 @@ config BR2_PACKAGE_QT5WEBENGINE
> > > > >         select BR2_PACKAGE_OPUS
> > > > >         select BR2_PACKAGE_WEBP
> > > > >         select BR2_PACKAGE_WEBP_DEMUX
> > > > > +       select BR2_PACKAGE_WEBP_MUX
> > > > >         select BR2_PACKAGE_QT5BASE_DBUS
> > > > >         select BR2_PACKAGE_QT5BASE_EGLFS
> > > > >         select BR2_PACKAGE_QT5BASE_FONTCONFIG
> > > > > diff --git a/package/qt5/qt5webengine/qt5webengine.mk
> > > > > b/package/qt5/qt5webengine/qt5webengine.mk
> > > > > index 1d5ee8d..5a2ca6d 100644
> > > > > --- a/package/qt5/qt5webengine/qt5webengine.mk
> > > > > +++ b/package/qt5/qt5webengine/qt5webengine.mk
> > > > > @@ -30,16 +30,16 @@ ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
> > > > >  QT5WEBENGINE_DEPENDENCIES += host-libpng host-libnss libnss
> > > > >  endif
> > > > >
> > > > > -QT5WEBENGINE_QMAKEFLAGS += WEBENGINE_CONFIG+=use_system_ffmpeg
> > > > > +QT5WEBENGINE_QMAKEFLAGS += -webengine-ffmpeg
> > > >
> > > > Buildroot still supports two qt versions, Qt-latest (5.12.7) and Qt-LTS
> > > > (5.6.x)..., so there is the need to support both configure methods (unless
> > > > the new one although works for 5.6.x)...
> > >
> > > Looks like 5.6.x pre-dates the changes. Would the best way to handle
> > > this be an outer conditional for the version, with the inner
> > > conditionals for the options?
> >
> > Or the other way round, would suggest (untested):
> >
> > --- a/package/qt5/qt5webengine/qt5webengine.mk
> > +++ b/package/qt5/qt5webengine/qt5webengine.mk
> > @@ -30,17 +30,29 @@ ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
> >  QT5WEBENGINE_DEPENDENCIES += host-libpng host-libnss libnss
> >  endif
> >
> > +ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
> > +QT5WEBENGINE_QMAKEOPTS += -webengine-ffmpeg
> > +else
> >  QT5WEBENGINE_QMAKEFLAGS += WEBENGINE_CONFIG+=use_system_ffmpeg
> > +endif
> >
> >  ifeq ($(BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS),y)
> > +ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
> > +QT5WEBENGINE_QMAKEOPTS += -webengine-proprietary-codecs
> > +else
> >  QT5WEBENGINE_QMAKEFLAGS += WEBENGINE_CONFIG+=use_proprietary_codecs
> >  endif
> > +endif
> >
> >  ifeq ($(BR2_PACKAGE_QT5WEBENGINE_ALSA),y)
> >  QT5WEBENGINE_DEPENDENCIES += alsa-lib
> >  else
> > +ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
> > +QT5WEBENGINE_QMAKEOPTS += -no-webengine-alsa
> > +else
> >  QT5WEBENGINE_QMAKEFLAGS += QT_CONFIG-=alsa
> >  endif
> > +endif
> >
> >  # QtWebengine's build system uses python, but only supports python2. We work
> >  # around this by forcing python2 early in the PATH, via a python->python2
> > @@ -64,7 +76,7 @@ QT5WEBENGINE_ENV += GN_PKG_CONFIG_HOST=$(@D)/host-bin/host-pkg-config
> >  endif
> >
> >  define QT5WEBENGINE_CONFIGURE_CMDS
> > -       (cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBENGINE_ENV) $(HOST_DIR)/bin/qmake $(QT5WEBENGINE_QMAKEFLAGS))
> > +       (cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBENGINE_ENV) $(HOST_DIR)/bin/qmake $(QT5WEBENGINE_QMAKEFLAGS) -- $(QT5WEBENGINE_QMAKEOPTS))
> >  endef
> >
> >  define QT5WEBENGINE_BUILD_CMDS
> >
> > >
> > > > >
> > > > >  ifeq ($(BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS),y)
> > > > > -QT5WEBENGINE_QMAKEFLAGS += WEBENGINE_CONFIG+=use_proprietary_codecs
> > > > > +QT5WEBENGINE_QMAKEFLAGS += -webengine-proprietary-codecs
> > > > >  endif
> > > > >
> > > > >  ifeq ($(BR2_PACKAGE_QT5WEBENGINE_ALSA),y)
> > > > >  QT5WEBENGINE_DEPENDENCIES += alsa-lib
> > > > >  else
> > > > > -QT5WEBENGINE_QMAKEFLAGS += QT_CONFIG-=alsa
> > > > > +QT5WEBENGINE_QMAKEFLAGS += -no-webengine-alsa
> > > > >  endif
> > > > >
> > > > >  # QtWebengine's build system uses python, but only supports python2. We work
> > > > > @@ -64,7 +64,7 @@ QT5WEBENGINE_ENV +=
> > > > > GN_PKG_CONFIG_HOST=$(@D)/host-bin/host-pkg-config
> > > > >  endif
> > > > >
> > > > >  define QT5WEBENGINE_CONFIGURE_CMDS
> > > > > -       (cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBENGINE_ENV)
> > > > > $(HOST_DIR)/bin/qmake $(QT5WEBENGINE_QMAKEFLAGS))
> > > > > +       (cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBENGINE_ENV)
> > > > > $(HOST_DIR)/bin/qmake -- $(QT5WEBENGINE_QMAKEFLAGS))
> > > > >  endef
> > > > >
> > > > >  define QT5WEBENGINE_BUILD_CMDS
> > > >
> > > > Your patch got somewhere garbled (see e.g. [2]), I get the
> > > > following errors while applying:
> > > >
> > > >         $ git am patch-qt5webengine-nathan-ford-001.diff
> > > > Applying: As of QT 5.10 the WEBENGINE_CONFIG options have been
> > > > error: git diff header lacks filename information when removing 1 leading pathname component (line 2)
> > > > Patch failed at 0001 As of QT 5.10 the WEBENGINE_CONFIG options have been
> > >
> > > I noticed that patchwork had trouble with it. Not sure what happened.
> > >
> > > > Checked your patch after applying manually, seems to work as expected with
> > > > the following buildroot config snippet:
> > > >
> > > > BR2_PACKAGE_QT5WEBENGINE=y
> > > > BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS=y
> > > > # BR2_PACKAGE_QT5WEBENGINE_ALSA is not set
> > > >
> > > >         $ diff -u build/qt5webengine-5.12.7_orig/config.summary build/qt5webengine-5.12.7/config.summary
> > > > --- build/qt5webengine-5.12.7_orig/config.summary       2020-02-18 12:21:02.354085462 +0100
> > > > +++ build/qt5webengine-5.12.7/config.summary    2020-02-18 13:21:59.772558050 +0100
> > > > @@ -3,7 +3,7 @@
> > > >    Full debug information ................. no
> > > >    Pepper Plugins ......................... no
> > > >    Printing and PDF ....................... no
> > > > -  Proprietary Codecs ..................... no
> > > > +  Proprietary Codecs ..................... yes
> > > >    Spellchecker ........................... yes
> > > >    Native Spellchecker .................... no
> > > >    WebRTC ................................. no
> > > > @@ -14,14 +14,14 @@
> > > >    Kerberos Authentication ................ no
> > > >    Support qpa-xcb ........................ no
> > > >    Building v8 snapshot supported ......... yes
> > > > -  Use ALSA ............................... yes
> > > > +  Use ALSA ............................... no
> > > >    Use PulseAudio ......................... no
> > > >    Optional system libraries used:
> > > >      re2 .................................. no
> > > >      icu .................................. no
> > > > -    libwebp, libwebpmux and libwebpdemux . no
> > > > +    libwebp, libwebpmux and libwebpdemux . yes
> > > >      opus ................................. yes
> > > > -    ffmpeg ............................... no
> > > > +    ffmpeg ............................... yes
> > > >      libvpx ............................... yes
> > > >      snappy ............................... no
> > > >      glib ................................. yes
> > > > @@ -49,5 +49,3 @@
> > > >      xcursor .............................. no
> > > >      xi ................................... no
> > > >      xtst ................................. no
> > > >
> > > >
> > > > Care to re-send (best using git format-patch/send-email, see [3])?
> > >
> > > Will do. I have some additional changes that I made after I submitted
> > > the patch. Specifically I added build deps for the packages that
> > > qtwebengine will auto detect and use if present ( otherwise building
> > > its own copy ). Should I include this in the V2, or should it be
> > > submitted separately?
> >
> > Preferred separately (easier to review)...
> >
> > >
> > > > One further question out of interest, on which hardware do you run
> > > > qtwebengine and how (or which buildroot config/defconfig do you use)?
> > > >
> > > > There is a report from one buildroot user not to be able to run
> > > > the minimal example on RaspberryPi Zero (see [4] and [5])...
> > >
> > > I use it on a few different pieces of hardware, some generic some
> > > custom, most of which are x86_64. One of them is armv7 ( Marvell Dove
> > > pj4 ). I have a qt application that wraps an instance of webengine.
> > > All of this is on eglfs. The config is custom, using an external
> > > toolchain. I was on gcc 6.3 ( x86_64 ) but now I am on gcc 8.3 (
> > > x86_64 and armv7 ). I looked at that email thread and I have not
> > > encountered the error they see.
> >
> > Thanks for the info...
> >
> > Regards,
> > Peter
> >
> > >
> > > > Regards,
> > > > Peter
> > > >
> > > >
> > > > [1] https://bugs.busybox.net/show_bug.cgi?id=12416
> > > > [2] https://patchwork.ozlabs.org/patch/1227357/
> > > > [3] https://buildroot.org/downloads/manual/manual.html#submitting-patches
> > > > [4] http://lists.busybox.net/pipermail/buildroot/2020-February/273320.html
> > > > [5] http://lists.busybox.net/pipermail/buildroot/2020-February/273329.html
> > > >
> > > > > _______________________________________________
> > > > > buildroot mailing list
> > > > > buildroot at busybox.net
> > > > > http://lists.busybox.net/mailman/listinfo/buildroot
> > > >
> > >
> > > --Nate
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot at busybox.net
> > > http://lists.busybox.net/mailman/listinfo/buildroot
> >
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
