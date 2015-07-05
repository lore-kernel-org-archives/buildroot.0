From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Jul 2015 18:49:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/vlc: Fix SSE support with gcc5
Message-ID: <1436114954-5766-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Compile fails

make[4]: Entering directory `/home/fli4l/br6_freeswitch/output/build/vlc-2.2.1/modules'
  CC       video_chroma/libi420_yuy2_sse2_plugin_la-i420_yuy2.lo
In file included from video_chroma/i420_yuy2.c:35:0:
video_chroma/i420_yuy2.c: In function 'I420_UYVY_Filter':
video_chroma/i420_yuy2.c:194:23: error: calling 'I420_UYVY.isra.2' with SSE caling convention without SSE/SSE2 enabled
 VIDEO_FILTER_WRAPPER( I420_UYVY )
                       ^
../include/vlc_filter.h:266:13: note: in definition of macro 'VIDEO_FILTER_WRAPPER'
             name( p_filter, p_pic, p_outpic );                          \

using this defconfig

BR2_x86_pentium2=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_GCC_VERSION_5_1_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_VLC=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vlc/vlc.mk |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 2a28eee..7030acc 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -67,6 +67,12 @@ else
 VLC_CONF_OPTS += --disable-altivec
 endif
 
+ifeq ($(BR2_X86_CPU_HAS_SSE),y)
+VLC_CONF_OPTS += --enable-sse
+else
+VLC_CONF_OPTS += --disable-sse
+endif
+
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 VLC_CONF_OPTS += --enable-alsa
 VLC_DEPENDENCIES += alsa-lib
-- 
1.7.10.4
