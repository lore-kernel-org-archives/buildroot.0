From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 18 Feb 2020 14:38:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5webengine: Fix building
 against system ffmpeg
In-Reply-To: <CAOgXH4cKir4gopXC8vi0rENaamo4aw=Epv2dShmCgRv3wwNFQg@mail.gmail.com>
References: <CAOgXH4cKir4gopXC8vi0rENaamo4aw=Epv2dShmCgRv3wwNFQg@mail.gmail.com>
Message-ID: <20200218143854.1cbe341e@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Nathan,

thanks for taking care of bug 12416 and the provided patch!

On Wed, 22 Jan 2020 11:19:22 -0500, Nathan Ford <nford@westpond.com> wrote:

>  As of QT 5.10 the WEBENGINE_CONFIG options have been
>  removed in favor of configure command line options.
>  dist/changes-5.9.0 and dist/changes-5.10.0 document
>  this.

No need for additional indent here...

>
> qt5webengine also now requires webp mux support or the auto
> detection of ffmpeg will fail.
>
> This fixes bug 12416

Your patch is based on the one provided in the bug report [1]
(plus the additional webp_mux and alsa changes)?

If so mention it here ;-)

>
> Signed-off-by: Nathan Ford <nford@westpond.com>
>
> diff --git a/package/qt5/qt5webengine/Config.in
> b/package/qt5/qt5webengine/Config.in
> index 0e776ec..18e4418 100644
> --- a/package/qt5/qt5webengine/Config.in
> +++ b/package/qt5/qt5webengine/Config.in
> @@ -42,6 +42,7 @@ config BR2_PACKAGE_QT5WEBENGINE
>         select BR2_PACKAGE_OPUS
>         select BR2_PACKAGE_WEBP
>         select BR2_PACKAGE_WEBP_DEMUX
> +       select BR2_PACKAGE_WEBP_MUX
>         select BR2_PACKAGE_QT5BASE_DBUS
>         select BR2_PACKAGE_QT5BASE_EGLFS
>         select BR2_PACKAGE_QT5BASE_FONTCONFIG
> diff --git a/package/qt5/qt5webengine/qt5webengine.mk
> b/package/qt5/qt5webengine/qt5webengine.mk
> index 1d5ee8d..5a2ca6d 100644
> --- a/package/qt5/qt5webengine/qt5webengine.mk
> +++ b/package/qt5/qt5webengine/qt5webengine.mk
> @@ -30,16 +30,16 @@ ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
>  QT5WEBENGINE_DEPENDENCIES += host-libpng host-libnss libnss
>  endif
>
> -QT5WEBENGINE_QMAKEFLAGS += WEBENGINE_CONFIG+=use_system_ffmpeg
> +QT5WEBENGINE_QMAKEFLAGS += -webengine-ffmpeg

Buildroot still supports two qt versions, Qt-latest (5.12.7) and Qt-LTS
(5.6.x)..., so there is the need to support both configure methods (unless
the new one although works for 5.6.x)...

>
>  ifeq ($(BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS),y)
> -QT5WEBENGINE_QMAKEFLAGS += WEBENGINE_CONFIG+=use_proprietary_codecs
> +QT5WEBENGINE_QMAKEFLAGS += -webengine-proprietary-codecs
>  endif
>
>  ifeq ($(BR2_PACKAGE_QT5WEBENGINE_ALSA),y)
>  QT5WEBENGINE_DEPENDENCIES += alsa-lib
>  else
> -QT5WEBENGINE_QMAKEFLAGS += QT_CONFIG-=alsa
> +QT5WEBENGINE_QMAKEFLAGS += -no-webengine-alsa
>  endif
>
>  # QtWebengine's build system uses python, but only supports python2. We work
> @@ -64,7 +64,7 @@ QT5WEBENGINE_ENV +=
> GN_PKG_CONFIG_HOST=$(@D)/host-bin/host-pkg-config
>  endif
>
>  define QT5WEBENGINE_CONFIGURE_CMDS
> -       (cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBENGINE_ENV)
> $(HOST_DIR)/bin/qmake $(QT5WEBENGINE_QMAKEFLAGS))
> +       (cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBENGINE_ENV)
> $(HOST_DIR)/bin/qmake -- $(QT5WEBENGINE_QMAKEFLAGS))
>  endef
>
>  define QT5WEBENGINE_BUILD_CMDS

Your patch got somewhere garbled (see e.g. [2]), I get the
following errors while applying:

	$ git am patch-qt5webengine-nathan-ford-001.diff
Applying: As of QT 5.10 the WEBENGINE_CONFIG options have been
error: git diff header lacks filename information when removing 1 leading pathname component (line 2)
Patch failed at 0001 As of QT 5.10 the WEBENGINE_CONFIG options have been

Checked your patch after applying manually, seems to work as expected with
the following buildroot config snippet:

BR2_PACKAGE_QT5WEBENGINE=y
BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS=y
# BR2_PACKAGE_QT5WEBENGINE_ALSA is not set

	$ diff -u build/qt5webengine-5.12.7_orig/config.summary build/qt5webengine-5.12.7/config.summary
--- build/qt5webengine-5.12.7_orig/config.summary	2020-02-18 12:21:02.354085462 +0100
+++ build/qt5webengine-5.12.7/config.summary	2020-02-18 13:21:59.772558050 +0100
@@ -3,7 +3,7 @@
   Full debug information ................. no
   Pepper Plugins ......................... no
   Printing and PDF ....................... no
-  Proprietary Codecs ..................... no
+  Proprietary Codecs ..................... yes
   Spellchecker ........................... yes
   Native Spellchecker .................... no
   WebRTC ................................. no
@@ -14,14 +14,14 @@
   Kerberos Authentication ................ no
   Support qpa-xcb ........................ no
   Building v8 snapshot supported ......... yes
-  Use ALSA ............................... yes
+  Use ALSA ............................... no
   Use PulseAudio ......................... no
   Optional system libraries used:
     re2 .................................. no
     icu .................................. no
-    libwebp, libwebpmux and libwebpdemux . no
+    libwebp, libwebpmux and libwebpdemux . yes
     opus ................................. yes
-    ffmpeg ............................... no
+    ffmpeg ............................... yes
     libvpx ............................... yes
     snappy ............................... no
     glib ................................. yes
@@ -49,5 +49,3 @@
     xcursor .............................. no
     xi ................................... no
     xtst ................................. no


Care to re-send (best using git format-patch/send-email, see [3])?

One further question out of interest, on which hardware do you run
qtwebengine and how (or which buildroot config/defconfig do you use)?

There is a report from one buildroot user not to be able to run
the minimal example on RaspberryPi Zero (see [4] and [5])...

Regards,
Peter


[1] https://bugs.busybox.net/show_bug.cgi?id=12416
[2] https://patchwork.ozlabs.org/patch/1227357/
[3] https://buildroot.org/downloads/manual/manual.html#submitting-patches
[4] http://lists.busybox.net/pipermail/buildroot/2020-February/273320.html
[5] http://lists.busybox.net/pipermail/buildroot/2020-February/273329.html

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
