From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Apr 2016 17:23:21 +0200
Subject: [Buildroot] [git commit] package/kodi: bump version to 16.1-Jarvis
Message-ID: <20160424152325.E8D52818DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=718137566961bc37339ccbce2216a55b2c470de8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch 0005, applied upstream, and renumbered the remaining
patches.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...artly-backport-of-PR-9231-to-fix-segfault.patch | 200 ---------------------
 ...xturePacker-fix-compilation-with-gcc-4.6.patch} |   0
 .../{0007-ffmpeg30.patch => 0006-ffmpeg30.patch}   |   0
 package/kodi/kodi.hash                             |   2 +-
 package/kodi/kodi.mk                               |   2 +-
 5 files changed, 2 insertions(+), 202 deletions(-)

diff --git a/package/kodi/0005-Jarvis-partly-backport-of-PR-9231-to-fix-segfault.patch b/package/kodi/0005-Jarvis-partly-backport-of-PR-9231-to-fix-segfault.patch
deleted file mode 100644
index 4cc2957..0000000
--- a/package/kodi/0005-Jarvis-partly-backport-of-PR-9231-to-fix-segfault.patch
+++ /dev/null
@@ -1,200 +0,0 @@
-From 6a9e2bf65a346a43caff06efbf6051318d11aa8e Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <berndkuhls@hotmail.com>
-Date: Sat, 19 Mar 2016 08:49:43 +0100
-Subject: [PATCH] [Jarvis] partly backport of PR 9231 to fix segfault
-
-This patch is a backport of
-https://github.com/xbmc/xbmc/commit/a81208e3b53b84763fb9f20d8642ffc7bc63c9a7
-to fix a segfault during playback of vaapi-accelerated mpeg2 content:
-
-terminate called after throwing an instance of 'std::logic_error'
-  what():  basic_string::_S_construct null not valid
-[New LWP 3743]
-
-Program received signal SIGABRT, Aborted.
-[Switching to LWP 3743]
-0xb5664a9b in raise () from /lib/libc.so.0
-(gdb) bt full
-#0  0xb5664a9b in raise () from /lib/libc.so.0
-No symbol table info available.
-#1  0xb5660520 in abort () from /lib/libc.so.0
-No symbol table info available.
-#2  0xb56e6536 in __gnu_cxx::__verbose_terminate_handler() () from /usr/lib/libstdc++.so.6
-No symbol table info available.
-#3  0xb56e4a1c in ?? () from /usr/lib/libstdc++.so.6
-No symbol table info available.
-#4  0xb56e4a80 in std::terminate() () from /usr/lib/libstdc++.so.6
-No symbol table info available.
-#5  0xb56e4cc9 in __cxa_throw () from /usr/lib/libstdc++.so.6
-No symbol table info available.
-#6  0xb5719d79 in std::__throw_logic_error(char const*) () from /usr/lib/libstdc++.so.6
-No symbol table info available.
-#7  0xb5722c41 in char* std::string::_S_construct<char const*>(char const*, char const*, std::allocator<char> const&, std::forward_iterator_tag) () from /usr/lib/libstdc++.so.6
-No symbol table info available.
-#8  0xb5722cc7 in std::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(char const*, std::allocator<char> const&) () from /usr/lib/libstdc++.so.6
-No symbol table info available.
-#9  0x0848fea3 in CDVDVideoCodec::IsCodecDisabled (map=0x9130420 <g_vaapi_available>, size=5, id=AV_CODEC_ID_MPEG4)
-    at DVDVideoCodec.cpp:75
-        index = <optimized out>
-#10 0x08499d04 in VAAPI::CDecoder::Open (this=0xd09e5e8, avctx=0xd6a2ec0, mainctx=0xd6a2ec0, fmt=AV_PIX_FMT_VAAPI_VLD,
-    surfaces=6) at VAAPI.cpp:503
-        gpuvendor = {static npos = <optimized out>,
-          _M_dataplus = {<std::allocator<char>> = {<__gnu_cxx::new_allocator<char>> = {<No data fields>}, <No data fields>}, _M_p = 0xceb267c "intel open source technology center"}}
-        profile = <optimized out>
-#11 0x08491bda in CDVDVideoCodecFFmpeg::GetFormat (avctx=0xd6a2ec0, fmt=0x986d9c0) at DVDVideoCodecFFmpeg.cpp:143
-        dec = 0xd09e5e8
-        ctx = <optimized out>
-        cur = 0x986d9c0
-#12 0xb61c8ced in ?? () from /usr/lib/libavcodec.so.56
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-Patch sent upstream: https://github.com/xbmc/xbmc/pull/9388
----
- .../cores/dvdplayer/DVDCodecs/Video/DVDVideoCodec.cpp | 18 +++++++-----------
- xbmc/cores/dvdplayer/DVDCodecs/Video/DVDVideoCodec.h  |  9 ++-------
- xbmc/cores/dvdplayer/DVDCodecs/Video/VAAPI.cpp        | 19 ++++++++-----------
- xbmc/cores/dvdplayer/DVDCodecs/Video/VDPAU.cpp        | 19 ++++++++-----------
- 4 files changed, 25 insertions(+), 40 deletions(-)
-
-diff --git a/xbmc/cores/dvdplayer/DVDCodecs/Video/DVDVideoCodec.cpp b/xbmc/cores/dvdplayer/DVDCodecs/Video/DVDVideoCodec.cpp
-index 2428696..43e8844 100644
---- a/xbmc/cores/dvdplayer/DVDCodecs/Video/DVDVideoCodec.cpp
-+++ b/xbmc/cores/dvdplayer/DVDCodecs/Video/DVDVideoCodec.cpp
-@@ -60,19 +60,15 @@ bool CDVDVideoCodec::IsSettingVisible(const std::string &condition, const std::s
-   return true;
- }
- 
--bool CDVDVideoCodec::IsCodecDisabled(DVDCodecAvailableType* map, unsigned int size, AVCodecID id)
-+bool CDVDVideoCodec::IsCodecDisabled(const std::map<AVCodecID, std::string> &map, AVCodecID id)
- {
--  int index = -1;
--  for (unsigned int i = 0; i < size; ++i)
-+  auto codec = map.find(id);
-+  if (codec != map.end())
-   {
--    if(map[i].codec == id)
--    {
--      index = (int) i;
--      break;
--    }
-+    return (!CSettings::GetInstance().GetBool(codec->second) ||
-+            !CDVDVideoCodec::IsSettingVisible("unused", "unused",
-+                                              CSettings::GetInstance().GetSetting(codec->second),
-+                                              NULL));
-   }
--  if(index > -1)
--    return (!CSettings::GetInstance().GetBool(map[index].setting) || !CDVDVideoCodec::IsSettingVisible("unused", "unused", CSettings::GetInstance().GetSetting(map[index].setting), NULL));
--
-   return false; //don't disable what we don't have
- }
-diff --git a/xbmc/cores/dvdplayer/DVDCodecs/Video/DVDVideoCodec.h b/xbmc/cores/dvdplayer/DVDCodecs/Video/DVDVideoCodec.h
-index c84bb70..68ada7d 100644
---- a/xbmc/cores/dvdplayer/DVDCodecs/Video/DVDVideoCodec.h
-+++ b/xbmc/cores/dvdplayer/DVDCodecs/Video/DVDVideoCodec.h
-@@ -24,6 +24,7 @@
- 
- #include <vector>
- #include <string>
-+#include <map>
- #include "cores/VideoRenderers/RenderFormats.h"
- 
- 
-@@ -34,12 +35,6 @@ extern "C" {
- 
- class CSetting;
- 
--struct DVDCodecAvailableType 
--{
--  AVCodecID codec;
--  const char* setting;
--};
--
- // when modifying these structures, make sure you update all codecs accordingly
- #define FRAME_TYPE_UNDEF 0
- #define FRAME_TYPE_I 1
-@@ -290,7 +285,7 @@ public:
-   /**
-   * Interact with user settings so that user disabled codecs are disabled
-   */
--  static bool IsCodecDisabled(DVDCodecAvailableType* map, unsigned int size, AVCodecID id);
-+  static bool IsCodecDisabled(const std::map<AVCodecID, std::string> &map, AVCodecID id);
- 
-    /* For calculation of dropping requirements player asks for some information.
-    *
-diff --git a/xbmc/cores/dvdplayer/DVDCodecs/Video/VAAPI.cpp b/xbmc/cores/dvdplayer/DVDCodecs/Video/VAAPI.cpp
-index 540f914..ff53dd5 100644
---- a/xbmc/cores/dvdplayer/DVDCodecs/Video/VAAPI.cpp
-+++ b/xbmc/cores/dvdplayer/DVDCodecs/Video/VAAPI.cpp
-@@ -451,16 +451,6 @@ bool CVideoSurfaces::HasRefs()
- // VAAPI
- //-----------------------------------------------------------------------------
- 
--// settings codecs mapping
--DVDCodecAvailableType g_vaapi_available[] = {
--  { AV_CODEC_ID_H263, CSettings::SETTING_VIDEOPLAYER_USEVAAPIMPEG4.c_str() },
--  { AV_CODEC_ID_MPEG4, CSettings::SETTING_VIDEOPLAYER_USEVAAPIMPEG4.c_str() },
--  { AV_CODEC_ID_WMV3, CSettings::SETTING_VIDEOPLAYER_USEVAAPIVC1.c_str() },
--  { AV_CODEC_ID_VC1, CSettings::SETTING_VIDEOPLAYER_USEVAAPIVC1.c_str() },
--  { AV_CODEC_ID_MPEG2VIDEO, CSettings::SETTING_VIDEOPLAYER_USEVAAPIMPEG2.c_str() },
--};
--const size_t settings_count = sizeof(g_vaapi_available) / sizeof(DVDCodecAvailableType);
--
- CDecoder::CDecoder() : m_vaapiOutput(&m_inMsgEvent)
- {
-   m_vaapiConfig.videoSurfaces = &m_videoSurfaces;
-@@ -500,7 +490,14 @@ bool CDecoder::Open(AVCodecContext* avctx, AVCodecContext* mainctx, const enum P
-   }
- 
-   // check if user wants to decode this format with VAAPI
--  if (CDVDVideoCodec::IsCodecDisabled(g_vaapi_available, settings_count, avctx->codec_id))
-+  std::map<AVCodecID, std::string> settings_map = {
-+    { AV_CODEC_ID_H263, CSettings::SETTING_VIDEOPLAYER_USEVAAPIMPEG4 },
-+    { AV_CODEC_ID_MPEG4, CSettings::SETTING_VIDEOPLAYER_USEVAAPIMPEG4 },
-+    { AV_CODEC_ID_WMV3, CSettings::SETTING_VIDEOPLAYER_USEVAAPIVC1 },
-+    { AV_CODEC_ID_VC1, CSettings::SETTING_VIDEOPLAYER_USEVAAPIVC1 },
-+    { AV_CODEC_ID_MPEG2VIDEO, CSettings::SETTING_VIDEOPLAYER_USEVAAPIMPEG2 },
-+  };
-+  if (CDVDVideoCodec::IsCodecDisabled(settings_map, avctx->codec_id))
-     return false;
- 
-   if (g_advancedSettings.CanLogComponent(LOGVIDEO))
-diff --git a/xbmc/cores/dvdplayer/DVDCodecs/Video/VDPAU.cpp b/xbmc/cores/dvdplayer/DVDCodecs/Video/VDPAU.cpp
-index 85d9295..4e995b6 100644
---- a/xbmc/cores/dvdplayer/DVDCodecs/Video/VDPAU.cpp
-+++ b/xbmc/cores/dvdplayer/DVDCodecs/Video/VDPAU.cpp
-@@ -45,16 +45,6 @@ using namespace VDPAU;
- 
- #define ARSIZE(x) (sizeof(x) / sizeof((x)[0]))
- 
--// settings codecs mapping
--DVDCodecAvailableType g_vdpau_available[] = {
--  { AV_CODEC_ID_H263, CSettings::SETTING_VIDEOPLAYER_USEVDPAUMPEG4.c_str() },
--  { AV_CODEC_ID_MPEG4, CSettings::SETTING_VIDEOPLAYER_USEVDPAUMPEG4.c_str() },
--  { AV_CODEC_ID_WMV3, CSettings::SETTING_VIDEOPLAYER_USEVDPAUVC1.c_str() },
--  { AV_CODEC_ID_VC1, CSettings::SETTING_VIDEOPLAYER_USEVDPAUVC1.c_str() },
--  { AV_CODEC_ID_MPEG2VIDEO, CSettings::SETTING_VIDEOPLAYER_USEVDPAUMPEG2.c_str() },
--};
--const size_t settings_count = sizeof(g_vdpau_available) / sizeof(DVDCodecAvailableType);
--
- CDecoder::Desc decoder_profiles[] = {
- {"MPEG1",        VDP_DECODER_PROFILE_MPEG1},
- {"MPEG2_SIMPLE", VDP_DECODER_PROFILE_MPEG2_SIMPLE},
-@@ -494,7 +484,14 @@ bool CDecoder::Open(AVCodecContext* avctx, AVCodecContext* mainctx, const enum P
-   // nvidia is whitelisted despite for mpeg-4 we need to query user settings
-   if ((gpuvendor.compare(0, 6, "nvidia") != 0)  || (avctx->codec_id == AV_CODEC_ID_MPEG4) || (avctx->codec_id == AV_CODEC_ID_H263))
-   {
--    if (CDVDVideoCodec::IsCodecDisabled(g_vdpau_available, settings_count, avctx->codec_id))
-+    std::map<AVCodecID, std::string> settings_map = {
-+      { AV_CODEC_ID_H263, CSettings::SETTING_VIDEOPLAYER_USEVDPAUMPEG4 },
-+      { AV_CODEC_ID_MPEG4, CSettings::SETTING_VIDEOPLAYER_USEVDPAUMPEG4 },
-+      { AV_CODEC_ID_WMV3, CSettings::SETTING_VIDEOPLAYER_USEVDPAUVC1 },
-+      { AV_CODEC_ID_VC1, CSettings::SETTING_VIDEOPLAYER_USEVDPAUVC1 },
-+      { AV_CODEC_ID_MPEG2VIDEO, CSettings::SETTING_VIDEOPLAYER_USEVDPAUMPEG2 },
-+    };
-+    if (CDVDVideoCodec::IsCodecDisabled(settings_map, avctx->codec_id))
-       return false;
-   }
- 
--- 
-2.7.0
-
diff --git a/package/kodi/0006-native-TexturePacker-fix-compilation-with-gcc-4.6.patch b/package/kodi/0005-native-TexturePacker-fix-compilation-with-gcc-4.6.patch
similarity index 100%
rename from package/kodi/0006-native-TexturePacker-fix-compilation-with-gcc-4.6.patch
rename to package/kodi/0005-native-TexturePacker-fix-compilation-with-gcc-4.6.patch
diff --git a/package/kodi/0007-ffmpeg30.patch b/package/kodi/0006-ffmpeg30.patch
similarity index 100%
rename from package/kodi/0007-ffmpeg30.patch
rename to package/kodi/0006-ffmpeg30.patch
diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
index 229446b..5aa580e 100644
--- a/package/kodi/kodi.hash
+++ b/package/kodi/kodi.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	0421ea1337cdee674f8a36d995f54152b5ddc4100e53410b3aeeb3b3f7d53946	kodi-16.0-Jarvis.tar.gz
+sha256	7d82c8aff2715c83deecdf10c566e26105bec0473af530a1356d4c747ebdfd10	kodi-16.1-Jarvis.tar.gz
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index ca1cae2..e812b50 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VERSION = 16.0-Jarvis
+KODI_VERSION = 16.1-Jarvis
 KODI_SITE = $(call github,xbmc,xbmc,$(KODI_VERSION))
 KODI_LICENSE = GPLv2
 KODI_LICENSE_FILES = LICENSE.GPL
