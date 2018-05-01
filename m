From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  1 May 2018 09:10:17 +0200
Subject: [Buildroot] [PATCH 4/4] package/mplayer: remove package
In-Reply-To: <20180501071017.14270-1-bernd.kuhls@t-online.de>
References: <20180501071017.14270-1-bernd.kuhls@t-online.de>
Message-ID: <20180501071017.14270-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package causes numerous build errors. During the last hackaton it
was decided to remove this package:
http://lists.busybox.net/pipermail/buildroot/2018-April/217514.html

Fixes
http://autobuild.buildroot.net/results/bda/bda461391c9e02e313fda887b75099e619527a7a/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy                                   |  18 +
 DEVELOPERS                                         |   1 -
 package/Config.in                                  |   1 -
 package/mplayer/0001-disable-install-strip.patch   |  23 --
 .../0002-mpdemux-live555-async-interface.patch     | 126 -------
 package/mplayer/0003-configure-armv8.patch         |  43 ---
 package/mplayer/0004-configure-zlib.patch          |  30 --
 package/mplayer/0005-tremor-ogg.patch              |  29 --
 package/mplayer/0006-musl-ldt.patch                |  22 --
 package/mplayer/0007-fixmmx.patch                  |  77 ----
 package/mplayer/Config.in                          |  42 ---
 package/mplayer/mplayer.hash                       |   4 -
 package/mplayer/mplayer.mk                         | 391 ---------------------
 13 files changed, 18 insertions(+), 789 deletions(-)
 delete mode 100644 package/mplayer/0001-disable-install-strip.patch
 delete mode 100644 package/mplayer/0002-mpdemux-live555-async-interface.patch
 delete mode 100644 package/mplayer/0003-configure-armv8.patch
 delete mode 100644 package/mplayer/0004-configure-zlib.patch
 delete mode 100644 package/mplayer/0005-tremor-ogg.patch
 delete mode 100644 package/mplayer/0006-musl-ldt.patch
 delete mode 100644 package/mplayer/0007-fixmmx.patch
 delete mode 100644 package/mplayer/Config.in
 delete mode 100644 package/mplayer/mplayer.hash
 delete mode 100644 package/mplayer/mplayer.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index e6b33db199..09ded814a0 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,24 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2018.05"
 
+config BR2_PACKAGE_MPLAYER
+	bool "mplayer package removed"
+	select BR2_LEGACY
+	help
+	  The mplayer package was removed.
+
+config BR2_PACKAGE_MPLAYER_MPLAYER
+	bool "mplayer package removed"
+	select BR2_LEGACY
+	help
+	  The mplayer package was removed.
+
+config BR2_PACKAGE_MPLAYER_MENCODER
+	bool "mplayer package removed"
+	select BR2_LEGACY
+	help
+	  The mplayer package was removed.
+
 config BR2_PACKAGE_LIBPLAYER_MPLAYER
 	bool "mplayer support in libplayer removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 8ef3a7c123..d036e32054 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -321,7 +321,6 @@ F:	package/libyuv/
 F:	package/mesa3d/
 F:	package/minidlna/
 F:	package/mjpg-streamer/
-F:	package/mplayer/
 F:	package/perl-crypt-openssl-random/
 F:	package/perl-crypt-openssl-rsa/
 F:	package/perl-digest-sha1/
diff --git a/package/Config.in b/package/Config.in
index d9762f17c1..0a4eed9df3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -37,7 +37,6 @@ menu "Audio and video applications"
 	source "package/mpd/Config.in"
 	source "package/mpd-mpc/Config.in"
 	source "package/mpg123/Config.in"
-	source "package/mplayer/Config.in"
 	source "package/mpv/Config.in"
 	source "package/multicat/Config.in"
 	source "package/musepack/Config.in"
diff --git a/package/mplayer/0001-disable-install-strip.patch b/package/mplayer/0001-disable-install-strip.patch
deleted file mode 100644
index 1bd1dc00ae..0000000000
--- a/package/mplayer/0001-disable-install-strip.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Disable stripping on installation
-
-Using the -s option of install does not work, as it uses the host
-strip instead of the cross strip. So, get rid of it, and let Buildroot
-handle the stripping.
-
-[Vincent: tweak patch for version 1.2]
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-diff -Nrua a/configure b/configure
---- a/configure	2015-10-02 21:29:04.000000000 +0100
-+++ b/configure	2015-10-06 13:28:37.245349592 +0100
-@@ -2780,7 +2780,7 @@
- 
- 
- # Checking for CFLAGS
--_install_strip="-s"
-+_install_strip=
- if test -z "$CFLAGS" || test "$_profile" != "" || test "$_debug" != ""; then
-   if test "$cc_vendor" = "intel" ; then
-     CFLAGS="-O2 $_march $_mcpu $_pipe -fomit-frame-pointer"
diff --git a/package/mplayer/0002-mpdemux-live555-async-interface.patch b/package/mplayer/0002-mpdemux-live555-async-interface.patch
deleted file mode 100644
index 5a62a18710..0000000000
--- a/package/mplayer/0002-mpdemux-live555-async-interface.patch
+++ /dev/null
@@ -1,126 +0,0 @@
-From d3195ea13f4a9aae546ff996e53681349a1a3cdb Mon Sep 17 00:00:00 2001
-From: sherpya <sherpya@netfarm.it>
-Date: Fri, 14 Jun 2013 05:25:38 +0200
-Subject: [PATCH 25/27] mpdemux: live555 async interface
-
-From: https://raw.github.com/sherpya/mplayer-be/master/patches/mp/0025-mpdemux-live555-async-interface.patch
-
-Adjust live555 interface code for modern versions of live555.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- libmpdemux/demux_rtp.cpp | 51 ++++++++++++++++++++++++++++++++----------------
- 2 files changed, 35 insertions(+), 22 deletions(-)
-
-diff --git a/libmpdemux/demux_rtp.cpp b/libmpdemux/demux_rtp.cpp
-index ad7a7f1..05d06e0 100644
---- a/libmpdemux/demux_rtp.cpp
-+++ b/libmpdemux/demux_rtp.cpp
-@@ -19,8 +19,6 @@
-  * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-  */
- 
--#define RTSPCLIENT_SYNCHRONOUS_INTERFACE 1
--
- extern "C" {
- // on MinGW, we must include windows.h before the things it conflicts
- #ifdef __MINGW32__    // with.  they are each protected from
-@@ -94,15 +92,6 @@ struct RTPState {
- 
- extern "C" char* network_username;
- extern "C" char* network_password;
--static char* openURL_rtsp(RTSPClient* client, char const* url) {
--  // If we were given a user name (and optional password), then use them:
--  if (network_username != NULL) {
--    char const* password = network_password == NULL ? "" : network_password;
--    return client->describeWithPassword(url, network_username, password);
--  } else {
--    return client->describeURL(url);
--  }
--}
- 
- static char* openURL_sip(SIPClient* client, char const* url) {
-   // If we were given a user name (and optional password), then use them:
-@@ -118,6 +107,19 @@ static char* openURL_sip(SIPClient* client, char const* url) {
- extern AVCodecContext *avcctx;
- #endif
- 
-+static char fWatchVariableForSyncInterface;
-+static char* fResultString;
-+static int fResultCode;
-+
-+static void responseHandlerForSyncInterface(RTSPClient* rtspClient, int responseCode, char* responseString) {
-+  // Set result values:
-+  fResultCode = responseCode;
-+  fResultString = responseString;
-+
-+  // Signal a break from the event loop (thereby returning from the blocking command):
-+  fWatchVariableForSyncInterface = ~0;
-+}
-+
- extern "C" int audio_id, video_id, dvdsub_id;
- extern "C" demuxer_t* demux_open_rtp(demuxer_t* demuxer) {
-   Boolean success = False;
-@@ -146,13 +148,19 @@ extern "C" demuxer_t* demux_open_rtp(demuxer_t* demuxer) {
- 	  rtsp_transport_http = demuxer->stream->streaming_ctrl->url->port;
- 	  rtsp_transport_tcp = 1;
- 	}
--	rtspClient = RTSPClient::createNew(*env, verbose, "MPlayer", rtsp_transport_http);
-+	rtspClient = RTSPClient::createNew(*env, url, verbose, "MPlayer", rtsp_transport_http);
- 	if (rtspClient == NULL) {
- 	  fprintf(stderr, "Failed to create RTSP client: %s\n",
- 		  env->getResultMsg());
- 	  break;
- 	}
--	sdpDescription = openURL_rtsp(rtspClient, url);
-+	fWatchVariableForSyncInterface = 0;
-+	rtspClient->sendDescribeCommand(responseHandlerForSyncInterface);
-+	env->taskScheduler().doEventLoop(&fWatchVariableForSyncInterface);
-+	if (fResultCode == 0)
-+	    sdpDescription = fResultString;
-+	else
-+	    delete[] fResultString;
-       } else { // SIP
- 	unsigned char desiredAudioType = 0; // PCMU (use 3 for GSM)
- 	sipClient = SIPClient::createNew(*env, desiredAudioType, NULL,
-@@ -236,8 +244,12 @@ extern "C" demuxer_t* demux_open_rtp(demuxer_t* demuxer) {
- 
- 	if (rtspClient != NULL) {
- 	  // Issue a RTSP "SETUP" command on the chosen subsession:
--	  if (!rtspClient->setupMediaSubsession(*subsession, False,
--						rtsp_transport_tcp)) break;
-+	  fWatchVariableForSyncInterface = 0;
-+	  rtspClient->sendSetupCommand(*subsession, responseHandlerForSyncInterface, False, rtsp_transport_tcp);
-+	  env->taskScheduler().doEventLoop(&fWatchVariableForSyncInterface);
-+	  delete[] fResultString;
-+	  if (fResultCode != 0) break;
-+
- 	  if (!strcmp(subsession->mediumName(), "audio"))
- 	    audiofound = 1;
- 	  if (!strcmp(subsession->mediumName(), "video"))
-@@ -248,7 +260,11 @@ extern "C" demuxer_t* demux_open_rtp(demuxer_t* demuxer) {
- 
-     if (rtspClient != NULL) {
-       // Issue a RTSP aggregate "PLAY" command on the whole session:
--      if (!rtspClient->playMediaSession(*mediaSession)) break;
-+      fWatchVariableForSyncInterface = 0;
-+      rtspClient->sendPlayCommand(*mediaSession, responseHandlerForSyncInterface);
-+      env->taskScheduler().doEventLoop(&fWatchVariableForSyncInterface);
-+      delete[] fResultString;
-+      if (fResultCode != 0) break;
-     } else if (sipClient != NULL) {
-       sipClient->sendACK(); // to start the stream flowing
-     }
-@@ -637,7 +653,8 @@ static void teardownRTSPorSIPSession(RTPState* rtpState) {
-   MediaSession* mediaSession = rtpState->mediaSession;
-   if (mediaSession == NULL) return;
-   if (rtpState->rtspClient != NULL) {
--    rtpState->rtspClient->teardownMediaSession(*mediaSession);
-+    fWatchVariableForSyncInterface = 0;
-+    rtpState->rtspClient->sendTeardownCommand(*mediaSession, NULL);
-   } else if (rtpState->sipClient != NULL) {
-     rtpState->sipClient->sendBYE();
-   }
--- 
-1.8.5.2
-
diff --git a/package/mplayer/0003-configure-armv8.patch b/package/mplayer/0003-configure-armv8.patch
deleted file mode 100644
index 98686433fb..0000000000
--- a/package/mplayer/0003-configure-armv8.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Fix aarch64 compile by adding HAVE_ARMV8 define
-
-Fixes build errors seen on the buildroot autobuilders:
-http://autobuild.buildroot.net/results/5f8/5f85c32eb89aac48ae8da892d9800bd13274cd3e/build-end.log
-
-libavutil/aarch64/cpu.c: In function 'ff_get_cpu_flags_aarch64':
-libavutil/aarch64/cpu.c:25:32: error: 'HAVE_ARMV8' undeclared (first use in this function)
-     return AV_CPU_FLAG_ARMV8 * HAVE_ARMV8 |
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-(patch sent upstream:
- http://lists.mplayerhq.hu/pipermail/mplayer-dev-eng/2016-May/073496.html)
-
-Index: configure
-===================================================================
---- a/configure	(revision 37871)
-+++ b/configure	(working copy)
-@@ -1445,6 +1445,8 @@
-   --disable-armv6) _armv6=no ;;
-   --enable-armv6t2) _armv6t2=yes ;;
-   --disable-armv6t2) _armv6t2=no ;;
-+  --enable-armv8) _armv8=yes ;;
-+  --disable-armv8) _armv8=no ;;
-   --enable-armvfp) _armvfp=yes ;;
-   --disable-armvfp) _armvfp=no ;;
-   --enable-vfpv3) vfpv3=yes ;;
-@@ -3261,7 +3263,7 @@
-   echores "$_iwmmxt"
- fi
- 
--cpuexts_all='ALTIVEC XOP AVX AVX2 FMA3 FMA4 MMX MMX2 MMXEXT AMD3DNOW AMD3DNOWEXT SSE SSE2 SSE3 SSSE3 SSE4 SSE42 FAST_CMOV I686 FAST_CLZ ARMV5TE ARMV6 ARMV6T2 VFP VFPV3 SETEND NEON IWMMXT MMI VIS MVI'
-+cpuexts_all='ALTIVEC XOP AVX AVX2 FMA3 FMA4 MMX MMX2 MMXEXT AMD3DNOW AMD3DNOWEXT SSE SSE2 SSE3 SSSE3 SSE4 SSE42 FAST_CMOV I686 FAST_CLZ ARMV5TE ARMV6 ARMV6T2 ARMV8 VFP VFPV3 SETEND NEON IWMMXT MMI VIS MVI'
- test "$_altivec"   = yes && cpuexts="ALTIVEC $cpuexts"
- test "$_mmx"       = yes && cpuexts="MMX $cpuexts"
- test "$_mmxext"    = yes && cpuexts="MMX2 $cpuexts"
-@@ -3285,6 +3287,7 @@
- test "$_armv5te"   = yes && cpuexts="ARMV5TE $cpuexts"
- test "$_armv6"     = yes && cpuexts="ARMV6 $cpuexts"
- test "$_armv6t2"   = yes && cpuexts="ARMV6T2 $cpuexts"
-+test "$_armv8"     = yes && cpuexts="ARMV8 $cpuexts"
- test "$_armvfp"    = yes && cpuexts="VFP $cpuexts"
- test "$vfpv3"      = yes && cpuexts="VFPV3 $cpuexts"
- test "$setend"     = yes && cpuexts="SETEND $cpuexts"
diff --git a/package/mplayer/0004-configure-zlib.patch b/package/mplayer/0004-configure-zlib.patch
deleted file mode 100644
index 7c1b2c8ec0..0000000000
--- a/package/mplayer/0004-configure-zlib.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-configure: Fix compilation when zlib is missing.
-
-Downloaded from upstream commit:
-
-$ LC_ALL=C svn log -r 37816
-------------------------------------------------------------------------
-r37816 | reimar | 2016-02-28 14:39:42 +0100 (Sun, 28 Feb 2016) | 3 lines
-
-configure: Fix compilation when zlib is missing.
-
-APNG and a few other decoders also cannot be enabled without it.
-------------------------------------------------------------------------
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-Index: configure
-===================================================================
---- a/configure	(revision 37795)
-+++ b/configure	(revision 37816)
-@@ -6464,8 +6464,8 @@
-   mplayer_encoders="$mplayer_encoders PNG_ENCODER"
- else
-   def_zlib='#define CONFIG_ZLIB 0'
--  libavdecoders=$(filter_out_component decoder 'FLASHSV FLASHSV2 PNG ZMBV ZLIB DXA EXR G2M TSCC ZEROCODEC')
--  libavencoders=$(filter_out_component encoder 'FLASHSV FLASHSV2 PNG ZMBV ZLIB')
-+  libavdecoders=$(filter_out_component decoder 'APNG FLASHSV FLASHSV2 PNG ZMBV ZLIB DXA EXR G2M RSCC SCREENPRESSO TDSC TSCC ZEROCODEC')
-+  libavencoders=$(filter_out_component encoder 'APNG FLASHSV FLASHSV2 PNG ZMBV ZLIB')
- fi
- echores "$_zlib"
- 
diff --git a/package/mplayer/0005-tremor-ogg.patch b/package/mplayer/0005-tremor-ogg.patch
deleted file mode 100644
index b4d65052a3..0000000000
--- a/package/mplayer/0005-tremor-ogg.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Fix static linking with tremor & libogg
-
-The order of the libraries needs to be changed to fix a bug during
-static linking caught by buildroot autobuilders:
-
-http://autobuild.buildroot.net/results/bc9/bc98fa585399b53ea181dbaf392b93424145911d/
-
-/home/test/autobuild/instance-3/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib/libvorbisidec.a(synthesis.o): In function `_vorbis_synthesis1':
-synthesis.c:(.text+0x90): undefined reference to `oggpack_readinit'
-synthesis.c:(.text+0x9c): undefined reference to `oggpack_read'
-[...]
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-(patch sent upstream:
- http://lists.mplayerhq.hu/pipermail/mplayer-dev-eng/2016-July/073501.html)
-
-Index: configure
-===================================================================
---- a/configure	(revision 37873)
-+++ b/configure	(working copy)
-@@ -6629,7 +6629,7 @@
-   def_tremor='#define CONFIG_TREMOR 1'
-   codecmodules="tremor $codecmodules"
-   res_comment="integer libvorbis"
--  extra_ldflags="$extra_ldflags -logg -lvorbisidec"
-+  extra_ldflags="$extra_ldflags -lvorbisidec -logg"
- elif test "$_libvorbis" = yes ; then
-   _vorbis=yes
-   def_vorbis='#define CONFIG_OGGVORBIS 1'
diff --git a/package/mplayer/0006-musl-ldt.patch b/package/mplayer/0006-musl-ldt.patch
deleted file mode 100644
index 8165f6f56a..0000000000
--- a/package/mplayer/0006-musl-ldt.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Fixes musl build error
-
-loader/ldt_keeper.o: In function `Setup_LDT_Keeper':
-ldt_keeper.c:(.text+0xab): undefined reference to `modify_ldt'
-
-Downloaded from
-https://github.com/dimkr/rlsd2/blob/master/rules/mplayer/musl.patch
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -rup MPlayer-1.1.1-orig/loader/ldt_keeper.c MPlayer-1.1.1/loader/ldt_keeper.c
---- MPlayer-1.1.1-orig/loader/ldt_keeper.c	2015-04-23 15:07:09.580805888 +0300
-+++ MPlayer-1.1.1/loader/ldt_keeper.c	2015-04-23 15:08:07.736807270 +0300
-@@ -47,7 +47,7 @@
- #if defined(__GLIBC__) &&  (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ == 0))
- _syscall3( int, modify_ldt, int, func, void *, ptr, unsigned long, bytecount );
- #else
--int modify_ldt(int func, void *ptr, unsigned long bytecount);
-+#define modify_ldt(func, ptr, bytecount) syscall(__NR_modify_ldt, func, ptr, bytecount)
- #endif
- #else
- #if defined(__NetBSD__) || defined(__FreeBSD__) || defined(__OpenBSD__) || defined(__DragonFly__)
diff --git a/package/mplayer/0007-fixmmx.patch b/package/mplayer/0007-fixmmx.patch
deleted file mode 100644
index 9634a3b667..0000000000
--- a/package/mplayer/0007-fixmmx.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-fix compilation failure with MMX
-
-Fixes
-libmpcodecs/vf_fspp.c: In function 'column_fidct_c':
-libmpcodecs/vf_fspp.c:750:5: error: unknown type name 'int_simd16_t'
-libmpcodecs/vf_fspp.c:751:5: error: unknown type name 'int_simd16_t'
-libmpcodecs/vf_fspp.c:752:5: error: unknown type name 'int_simd16_t'
-libmpcodecs/vf_fspp.c:753:5: error: unknown type name 'int_simd16_t'
-libmpcodecs/vf_fspp.c:789:18: error: 'FIX_0_707106781' undeclared (first use in this function)
-libmpcodecs/vf_fspp.c:789:18: note: each undeclared identifier is reported only once for each function it appears in
-libmpcodecs/vf_fspp.c:804:21: error: 'FIX_1_414213562_A' undeclared (first use in this function)
-libmpcodecs/vf_fspp.c:817:18: error: 'FIX_0_382683433' undeclared (first use in this function)
-libmpcodecs/vf_fspp.c:818:18: error: 'FIX_0_541196100' undeclared (first use in this function)
-libmpcodecs/vf_fspp.c:819:18: error: 'FIX_1_306562965' undeclared (first use in this function)
-libmpcodecs/vf_fspp.c:844:21: error: 'FIX_1_414213562' undeclared (first use in this function)
-libmpcodecs/vf_fspp.c:845:21: error: 'FIX_1_847759065' undeclared (first use in this function)
-libmpcodecs/vf_fspp.c:846:21: error: 'FIX_1_082392200' undeclared (first use in this function)
-libmpcodecs/vf_fspp.c:847:21: error: 'FIX_2_613125930' undeclared (first use in this function)
-
-found using this defconfig after fixing the original bug:
-http://autobuild.buildroot.net/results/642/6422adeef19ec547c7bc3f8ad3b0d51702015240/
-
-Downloaded from upstream mailinglist:
-http://lists.mplayerhq.hu/pipermail/mplayer-dev-eng/2016-May/073488.html
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr MPlayer-1.3.0.org/libmpcodecs/vf_fspp.c MPlayer-1.3.0/libmpcodecs/vf_fspp.c
---- MPlayer-1.3.0.org/libmpcodecs/vf_fspp.c	2015-10-17 21:44:31.000000000 +0200
-+++ MPlayer-1.3.0/libmpcodecs/vf_fspp.c	2017-04-10 21:26:57.771819064 +0200
-@@ -173,7 +173,6 @@
- #define store_slice_s store_slice_c
- #define store_slice2_s store_slice2_c
- #define mul_thrmat_s mul_thrmat_c
--#define column_fidct_s column_fidct_c
- #define row_idct_s row_idct_c
- #define row_fdct_s row_fdct_c
- 
-@@ -393,7 +392,6 @@
-         );
- }
- 
--static void column_fidct_mmx(int16_t* thr_adr,  int16_t *data,  int16_t *output,  int cnt);
- static void row_idct_mmx(int16_t* workspace,
-                          int16_t* output_adr,  int output_stride,  int cnt);
- static void row_fdct_mmx(int16_t *data,  const uint8_t *pixels,  int line_size,  int cnt);
-@@ -401,11 +399,18 @@
- #define store_slice_s store_slice_mmx
- #define store_slice2_s store_slice2_mmx
- #define mul_thrmat_s mul_thrmat_mmx
--#define column_fidct_s column_fidct_mmx
- #define row_idct_s row_idct_mmx
- #define row_fdct_s row_fdct_mmx
- #endif // HAVE_MMX_INLINE
- 
-+#if !HAVE_MMXEXT_INLINE
-+static void column_fidct_c(int16_t* thr_adr,  int16_t *data,  int16_t *output,  int cnt);
-+#define column_fidct_s column_fidct_c
-+#else
-+static void column_fidct_mmx(int16_t* thr_adr,  int16_t *data,  int16_t *output,  int cnt);
-+#define column_fidct_s column_fidct_mmx
-+#endif
-+
- static void filter(struct vf_priv_s *p, uint8_t *dst, uint8_t *src,
-                    int dst_stride, int src_stride,
-                    int width, int height,
-@@ -728,7 +733,9 @@
- DECLARE_ASM_CONST(8, uint64_t, MM_DESCALE_RND)=C64(4);
- DECLARE_ASM_CONST(8, uint64_t, MM_2)=C64(2);
- 
--#else /* !HAVE_MMXEXT_INLINE */
-+#endif /* !HAVE_MMX_INLINE */
-+
-+#if !HAVE_MMX_INLINE || !HAVE_MMXEXT_INLINE
- 
- typedef int32_t int_simd16_t;
- static const int16_t FIX_0_382683433=FIX(0.382683433, 14);
diff --git a/package/mplayer/Config.in b/package/mplayer/Config.in
deleted file mode 100644
index 4db1551ed4..0000000000
--- a/package/mplayer/Config.in
+++ /dev/null
@@ -1,42 +0,0 @@
-config BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
-	bool
-	default y
-	# Those architectures are not supported by MPlayer
-	depends on !(BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
-		|| BR2_m68k || BR2_microblaze || BR2_nios2 || BR2_or1k)
-	# Broken support for <ARMv5
-	depends on !BR2_ARM_CPU_ARMV4
-	# configure script barfs on the -Wl,-elf2flt we add in the toolchain
-	# wrapper, so just disable completely for FLAT
-	depends on !BR2_BINFMT_FLAT
-
-config BR2_PACKAGE_MPLAYER
-	bool "mplayer"
-	depends on BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	help
-	  MPlayer is a movie player which runs on many systems and
-	  supports many different file formats.
-
-	  http://www.mplayerhq.hu/
-
-comment "mplayer needs a toolchain w/ threads"
-	depends on BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-
-if BR2_PACKAGE_MPLAYER
-
-config BR2_PACKAGE_MPLAYER_MPLAYER
-	bool "Build and install mplayer"
-	default y
-	help
-	  This will install the video player.
-
-config BR2_PACKAGE_MPLAYER_MENCODER
-	bool "Build and install mencoder"
-	help
-	  This will install the video encoder.
-
-endif
diff --git a/package/mplayer/mplayer.hash b/package/mplayer/mplayer.hash
deleted file mode 100644
index e6b8842253..0000000000
--- a/package/mplayer/mplayer.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# From http://www.mplayerhq.hu/MPlayer/releases/MPlayer-1.3.0.tar.xz.md5
-md5 e8a4d77ad4f509e81dd5e13b51636c1d  MPlayer-1.3.0.tar.xz
-# From http://www.mplayerhq.hu/MPlayer/releases/MPlayer-1.3.0.tar.xz.sha1
-sha1 11db20434a4e1aabb9c52f7712241dae1b3730e3  MPlayer-1.3.0.tar.xz
diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
deleted file mode 100644
index 5313b3a5ef..0000000000
--- a/package/mplayer/mplayer.mk
+++ /dev/null
@@ -1,391 +0,0 @@
-################################################################################
-#
-# mplayer
-#
-################################################################################
-
-MPLAYER_VERSION = 1.3.0
-MPLAYER_SOURCE = MPlayer-$(MPLAYER_VERSION).tar.xz
-MPLAYER_SITE = http://www.mplayerhq.hu/MPlayer/releases
-MPLAYER_DEPENDENCIES = host-pkgconf
-MPLAYER_LICENSE = GPL-2.0
-MPLAYER_LICENSE_FILES = LICENSE Copyright
-MPLAYER_CFLAGS = $(TARGET_CFLAGS)
-MPLAYER_LDFLAGS = $(TARGET_LDFLAGS)
-
-# Adding $(STAGING_DIR)/usr/include in the header path is normally not
-# needed. Except that mplayer's configure script has a completely
-# brain-damaged way of looking for X11/Xlib.h (it parses extra-cflags
-# for -I options).
-MPLAYER_CFLAGS += -I$(STAGING_DIR)/usr/include
-
-# mplayer needs pcm+mixer support, but configure fails to check for it
-ifeq ($(BR2_PACKAGE_ALSA_LIB)$(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_PCM),yyy)
-MPLAYER_DEPENDENCIES += alsa-lib
-MPLAYER_CONF_OPTS += --enable-alsa
-else
-MPLAYER_CONF_OPTS += --disable-alsa
-endif
-
-ifeq ($(BR2_ENDIAN),"BIG")
-MPLAYER_CONF_OPTS += --enable-big-endian
-else
-MPLAYER_CONF_OPTS += --disable-big-endian
-endif
-
-ifeq ($(BR2_PACKAGE_ZLIB),y)
-MPLAYER_DEPENDENCIES += zlib
-MPLAYER_CONF_OPTS += \
-	--enable-decoder=apng \
-	--enable-encoder=apng \
-	--enable-decoder=tdsc
-else
-MPLAYER_CONF_OPTS += \
-	--disable-decoder=apng \
-	--disable-encoder=apng \
-	--disable-decoder=tdsc
-endif
-
-ifeq ($(BR2_PACKAGE_SDL),y)
-MPLAYER_CONF_OPTS += \
-	--enable-sdl \
-	--with-sdl-config=$(STAGING_DIR)/usr/bin/sdl-config
-MPLAYER_DEPENDENCIES += sdl
-else
-MPLAYER_CONF_OPTS += --disable-sdl
-endif
-
-ifeq ($(BR2_PACKAGE_FREETYPE),y)
-MPLAYER_CONF_OPTS += \
-	--enable-freetype \
-	--with-freetype-config=$(STAGING_DIR)/usr/bin/freetype-config
-MPLAYER_DEPENDENCIES += freetype
-else
-MPLAYER_CONF_OPTS += --disable-freetype
-endif
-
-# We intentionally don't pass --enable-fontconfig, to let the
-# autodetection find which library to link with.
-ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
-MPLAYER_DEPENDENCIES += fontconfig
-else
-MPLAYER_CONF_OPTS += --disable-fontconfig
-endif
-
-ifeq ($(BR2_PACKAGE_LIBENCA),y)
-MPLAYER_CONF_OPTS += --enable-enca
-MPLAYER_DEPENDENCIES += libenca
-else
-MPLAYER_CONF_OPTS += --disable-enca
-endif
-
-# We intentionally don't pass --enable-fribidi, to let the
-# autodetection find which library to link with.
-ifeq ($(BR2_PACKAGE_LIBFRIBIDI),y)
-MPLAYER_DEPENDENCIES += libfribidi
-else
-MPLAYER_CONF_OPTS += --disable-fribidi
-endif
-
-# We intentionally don't pass --enable-libiconv, to let the
-# autodetection find which library to link with.
-ifeq ($(BR2_PACKAGE_LIBICONV),y)
-MPLAYER_DEPENDENCIES += libiconv
-else
-MPLAYER_CONF_OPTS += --disable-iconv
-endif
-
-# We intentionally don't pass --enable-termcap, in order to let the
-# autodetection find with which library to link with. Otherwise, we
-# would have to pass it manually.
-ifeq ($(BR2_PACKAGE_NCURSES),y)
-MPLAYER_DEPENDENCIES += ncurses
-else
-MPLAYER_CONF_OPTS += --disable-termcap
-endif
-
-# mplayer doesn't pick up libsmbclient cflags
-ifeq ($(BR2_PACKAGE_SAMBA4),y)
-MPLAYER_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags smbclient`
-MPLAYER_CONF_OPTS += --enable-smb
-MPLAYER_DEPENDENCIES += samba4
-else
-MPLAYER_CONF_OPTS += --disable-smb
-endif
-
-ifeq ($(BR2_PACKAGE_LIBBLURAY),y)
-MPLAYER_CONF_OPTS += --enable-bluray
-MPLAYER_DEPENDENCIES += libbluray
-else
-MPLAYER_CONF_OPTS += --disable-bluray
-endif
-
-# cdio support is broken in buildroot atm due to missing libcdio-paranoia
-# package and this patch
-# https://github.com/pld-linux/mplayer/blob/master/mplayer-libcdio.patch
-MPLAYER_CONF_OPTS += --disable-libcdio
-
-# We intentionally don't pass --enable-dvdread, to let the
-# autodetection find which library to link with.
-ifeq ($(BR2_PACKAGE_LIBDVDREAD),y)
-MPLAYER_CONF_OPTS += \
-	--with-dvdread-config="$(PKG_CONFIG_HOST_BINARY) dvdread"
-MPLAYER_DEPENDENCIES += libdvdread
-endif
-
-# We intentionally don't pass --enable-dvdnav to let the autodetection
-# find which library to link with.
-ifeq ($(BR2_PACKAGE_LIBDVDNAV),y)
-MPLAYER_CONF_OPTS += \
-	--with-dvdnav-config="$(PKG_CONFIG_HOST_BINARY) dvdnav"
-MPLAYER_DEPENDENCIES += libdvdnav
-endif
-
-ifeq ($(BR2_PACKAGE_MPLAYER_MPLAYER),y)
-MPLAYER_CONF_OPTS += --enable-mplayer
-else
-MPLAYER_CONF_OPTS += --disable-mplayer
-endif
-
-ifeq ($(BR2_PACKAGE_MPLAYER_MENCODER),y)
-MPLAYER_CONF_OPTS += --enable-mencoder
-else
-MPLAYER_CONF_OPTS += --disable-mencoder
-endif
-
-ifeq ($(BR2_PACKAGE_FAAD2),y)
-MPLAYER_DEPENDENCIES += faad2
-MPLAYER_CONF_OPTS += --enable-faad
-else
-MPLAYER_CONF_OPTS += --disable-faad
-endif
-
-ifeq ($(BR2_PACKAGE_LAME),y)
-MPLAYER_DEPENDENCIES += lame
-MPLAYER_CONF_OPTS += --enable-mp3lame
-else
-MPLAYER_CONF_OPTS += --disable-mp3lame
-endif
-
-# We intentionally don't pass --disable-ass-internal --enable-ass and
-# let autodetection find which library to link with.
-ifeq ($(BR2_PACKAGE_LIBASS),y)
-MPLAYER_DEPENDENCIES += libass
-endif
-
-# We intentionally don't pass --enable-libmpeg2 and let autodetection
-# find which library to link with.
-ifeq ($(BR2_PACKAGE_LIBMPEG2),y)
-MPLAYER_DEPENDENCIES += libmpeg2
-MPLAYER_CONF_OPTS += --disable-libmpeg2-internal
-endif
-
-# We intentionally don't pass --enable-mpg123, to let the
-# autodetection find which library to link with.
-ifeq ($(BR2_PACKAGE_MPG123),y)
-MPLAYER_DEPENDENCIES += mpg123
-else
-MPLAYER_CONF_OPTS += --disable-mpg123
-endif
-
-ifeq ($(BR2_PACKAGE_TREMOR),y)
-MPLAYER_DEPENDENCIES += tremor
-MPLAYER_CONF_OPTS += --enable-tremor
-endif
-
-# We intentionally don't pass --enable-libvorbis, to let the
-# autodetection find which library to link with.
-ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
-MPLAYER_DEPENDENCIES += libvorbis
-endif
-
-ifeq ($(BR2_PACKAGE_LIBMAD),y)
-MPLAYER_DEPENDENCIES += libmad
-MPLAYER_CONF_OPTS += --enable-mad
-else
-MPLAYER_CONF_OPTS += --disable-mad
-endif
-
-ifeq ($(BR2_PACKAGE_LIVE555),y)
-MPLAYER_DEPENDENCIES += live555
-MPLAYER_CONF_OPTS += --enable-live
-MPLAYER_LIVE555 = liveMedia groupsock UsageEnvironment BasicUsageEnvironment
-MPLAYER_CFLAGS += \
-	$(addprefix -I$(STAGING_DIR)/usr/include/,$(MPLAYER_LIVE555))
-MPLAYER_LDFLAGS += $(addprefix -l,$(MPLAYER_LIVE555)) -lstdc++
-else
-MPLAYER_CONF_OPTS += --disable-live
-endif
-
-ifeq ($(BR2_PACKAGE_GIFLIB),y)
-MPLAYER_DEPENDENCIES += giflib
-MPLAYER_CONF_OPTS += --enable-gif
-else
-MPLAYER_CONF_OPTS += --disable-gif
-endif
-
-# We intentionally don't pass --enable-pulse, to let the
-# autodetection find which library to link with.
-ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
-MPLAYER_DEPENDENCIES += pulseaudio
-endif
-
-# We intentionally don't pass --enable-librtmp to let autodetection
-# find which library to link with.
-ifeq ($(BR2_PACKAGE_RTMPDUMP),y)
-MPLAYER_DEPENDENCIES += rtmpdump
-else
-MPLAYER_CONF_OPTS += --disable-librtmp
-endif
-
-ifeq ($(BR2_PACKAGE_SPEEX),y)
-MPLAYER_DEPENDENCIES += speex
-MPLAYER_CONF_OPTS += --enable-speex
-else
-MPLAYER_CONF_OPTS += --disable-speex
-endif
-
-ifeq ($(BR2_PACKAGE_LZO),y)
-MPLAYER_DEPENDENCIES += lzo
-MPLAYER_CONF_OPTS += --enable-liblzo
-else
-MPLAYER_CONF_OPTS += --disable-liblzo
-endif
-
-MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_BZIP2),bzip2)
-MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_HAS_LIBGL),libgl)
-MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBTHEORA),libtheora)
-MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBPNG),libpng)
-MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBVPX),libvpx)
-MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_JPEG),jpeg)
-MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_OPUS),opus)
-MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_XLIB_LIBX11),xlib_libX11)
-MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_XLIB_LIBXEXT),xlib_libXext)
-MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_XLIB_LIBXINERAMA),xlib_libXinerama)
-MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_XLIB_LIBXV),xlib_libXv)
-MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_XLIB_LIBXXF86VM),xlib_libXxf86vm)
-
-# ARM optimizations
-ifeq ($(BR2_ARM_CPU_ARMV5),y)
-MPLAYER_CONF_OPTS += --enable-armv5te
-endif
-
-ifeq ($(BR2_ARM_CPU_ARMV6)$(BR2_ARM_CPU_ARMV7A),y)
-MPLAYER_CONF_OPTS += --enable-armv6
-endif
-
-ifeq ($(BR2_aarch64),y)
-MPLAYER_CONF_OPTS += --enable-armv8
-endif
-
-ifeq ($(BR2_ARM_SOFT_FLOAT),)
-ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
-MPLAYER_CONF_OPTS += --enable-neon
-MPLAYER_CFLAGS += -mfpu=neon
-endif
-endif
-
-define MPLAYER_DISABLE_INLINE_ASM
-	$(SED) 's,#define HAVE_INLINE_ASM 1,#define HAVE_INLINE_ASM 0,g' \
-		$(@D)/config.h
-	$(SED) 's,#define HAVE_MMX_INLINE 1,#define HAVE_MMX_INLINE 0,g' \
-		$(@D)/config.h
-	$(SED) 's,#define HAVE_MMX_EXTERNAL 1,#define HAVE_MMX_EXTERNAL 0,g' \
-		$(@D)/config.h
-endef
-
-ifeq ($(BR2_i386),y)
-MPLAYER_POST_CONFIGURE_HOOKS += MPLAYER_DISABLE_INLINE_ASM
-endif
-
-ifeq ($(BR2_X86_CPU_HAS_MMX),y)
-MPLAYER_CONF_OPTS += \
-	--enable-mmx \
-	--yasm=$(HOST_DIR)/bin/yasm
-MPLAYER_DEPENDENCIES += host-yasm
-else
-MPLAYER_CONF_OPTS += \
-	--disable-mmx \
-	--yasm=''
-endif
-
-ifeq ($(BR2_X86_CPU_HAS_SSE),y)
-MPLAYER_CONF_OPTS += --enable-mmxext --enable-sse
-else
-MPLAYER_CONF_OPTS += --disable-mmxext --disable-sse
-endif
-
-ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
-MPLAYER_CONF_OPTS += --enable-sse2
-else
-MPLAYER_CONF_OPTS += --disable-sse2
-endif
-
-ifeq ($(BR2_X86_CPU_HAS_SSE3),y)
-MPLAYER_CONF_OPTS += --enable-sse3
-else
-MPLAYER_CONF_OPTS += --disable-sse3
-endif
-
-ifeq ($(BR2_X86_CPU_HAS_SSSE3),y)
-MPLAYER_CONF_OPTS += --enable-ssse3
-else
-MPLAYER_CONF_OPTS += --disable-ssse3
-endif
-
-ifeq ($(BR2_X86_CPU_HAS_SSE4),y)
-MPLAYER_CONF_OPTS += --enable-sse4
-else
-MPLAYER_CONF_OPTS += --disable-sse4
-endif
-
-ifeq ($(BR2_X86_CPU_HAS_SSE42),y)
-MPLAYER_CONF_OPTS += --enable-sse42
-else
-MPLAYER_CONF_OPTS += --disable-sse42
-endif
-
-ifeq ($(BR2_X86_CPU_HAS_AVX),y)
-MPLAYER_CONF_OPTS += --enable-avx
-else
-MPLAYER_CONF_OPTS += --disable-avx
-endif
-
-ifeq ($(BR2_X86_CPU_HAS_AVX2),y)
-MPLAYER_CONF_OPTS += --enable-avx2
-else
-MPLAYER_CONF_OPTS += --disable-avx2
-endif
-
-define MPLAYER_CONFIGURE_CMDS
-	(cd $(@D); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure \
-		--prefix=/usr \
-		--confdir=/etc \
-		--target=$(GNU_TARGET_NAME) \
-		--host-cc="$(HOSTCC)" \
-		--cc="$(TARGET_CC)" \
-		--as="$(TARGET_AS)" \
-		--charset=UTF-8 \
-		--extra-cflags="$(MPLAYER_CFLAGS)" \
-		--extra-ldflags="$(MPLAYER_LDFLAGS)" \
-		--enable-fbdev \
-		$(MPLAYER_CONF_OPTS) \
-		--enable-cross-compile \
-		--disable-ivtv \
-		--enable-dynamic-plugins \
-		--enable-inet6 \
-	)
-endef
-
-define MPLAYER_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define MPLAYER_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
-endef
-
-$(eval $(generic-package))
-- 
2.14.2
