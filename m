From: =?UTF-8?B?0JDQu9C10LrRgdC10Lkg0JHRgNC+0LTQutC40L0=?= <alexey.brodkin@gmail.com>
Date: Thu, 14 Mar 2013 23:46:26 +0400
Subject: [Buildroot] vlc: new package
Message-ID: <CAML3pwX2xxx56p=xgHO=jP1oe4wL3DG9qyhHv+rR4dPJyXcpJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ismael,

I saw your patch for addition of vlc in Buildroot you posted back in
July 2012 here http://patchwork.ozlabs.org/patch/171335/
Since then there were no changes done so patch was not accepted.

I've done some minor changes for it to build successfully vlc in
buildroot from latest git.
You may find my changes in-lined below.

And at this point I'm wondering on how to proceed to get vlc support
in buildroot finally.
I see these options:

1. You may incorporate my changes in your patch and post v7 in mailing list.
2. I may do this re-spin and post v7 on your behalf.
3. Or I may start from scratch based on your patch, split changes on
small parts (as was suggested by Thomas earlier) and post them
one-by-one.

Please let me know if you're still interested in the subject and which
way is preferable to you.

Regards,
Alexey


My changes:
==================
diff --git a/package/multimedia/vlc/Config.in b/package/multimedia/vlc/Config.in
index cdeb751..bf81d5b 100644
--- a/package/multimedia/vlc/Config.in
+++ b/package/multimedia/vlc/Config.in
@@ -1,5 +1,8 @@
 menuconfig BR2_PACKAGE_VLC
  bool "vlc"
+ select BR2_PACKAGE_ZLIB
+ depends on BR2_INSTALL_LIBSTDCPP
+ depends on BR2_USE_WCHAR
  help
   VLC is a free and open source cross-platform multimedia player and
   framework that plays most multimedia files as well as DVD, Audio CD,
@@ -111,6 +114,8 @@ config BR2_PACKAGE_VLC_TREMOR

 config BR2_PACKAGE_VLC_AVCODEC
        bool "FFmpeg (Many codecs)"
+       depends on BR2_LARGEFILE
+       depends on BR2_INET_IPV6
        select BR2_PACKAGE_FFMPEG
        help
          There is a large number of codecs in FFmpeg/libavcodec.
diff --git a/package/multimedia/vlc/vlc.mk b/package/multimedia/vlc/vlc.mk
index 6a2a529..1caf709 100644
--- a/package/multimedia/vlc/vlc.mk
+++ b/package/multimedia/vlc/vlc.mk
@@ -24,6 +24,10 @@ VLC_CONF_OPT += --disable-rpath --enable-run-as-root \
  --disable-dc1394 \
  --disable-bluray

+VLC_CFLAGS = $(TARGET_CFLAGS)
+VLC_CFLAGS += -std=gnu99
+
+
 ifeq ($(BR2_PACKAGE_VLC_ALSA),y)
 VLC_DEPENDENCIES += alsa-lib
 VLC_CONF_OPT += --enable-alsa
@@ -363,4 +367,4 @@ define VLC_FIX_LA_FILES
 endef
 VLC_POST_BUILD_HOOKS += VLC_FIX_LA_FILES

-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
==================
