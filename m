From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Mar 2020 22:09:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/mediastreamer: speexdsp and
 portaudio needs speex
In-Reply-To: <20200310195838.2988-1-fontaine.fabrice@gmail.com>
References: <20200310195838.2988-1-fontaine.fabrice@gmail.com>
Message-ID: <20200322220948.74189c0d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 Mar 2020 20:58:38 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> -ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
> +# portaudio backend needs speex as well
> +ifeq ($(BR2_PACKAGE_PORTAUDIO)$(BR2_PACKAGE_SPEEX)$(BR2_PACKAGE_SPEEXDSP),yyy)

Does it needs speexdsp, or just speex ?

>  MEDIASTREAMER_CONF_OPTS += \
>  	-DENABLE_PORTAUDIO=ON \
>  	-DENABLE_SOUND=ON
> @@ -105,7 +106,7 @@ else
>  MEDIASTREAMER_CONF_OPTS += -DENABLE_SPEEX_CODEC=OFF
>  endif
>  
> -ifeq ($(BR2_PACKAGE_SPEEXDSP),y)
> +ifeq ($(BR2_PACKAGE_SPEEX)$(BR2_PACKAGE_SPEEXDSP),yy)
>  MEDIASTREAMER_CONF_OPTS += -DENABLE_SPEEX_DSP=ON

Are you sure about this one ? If you look at the build failure at
http://autobuild.buildroot.org/results/32d06517a5470f71d9b7dc99139f6c3071e7d77d,
it fails when building src/audiofilters/msresample.c. This file is
built when ENABLE_RESAMPLE=ON.

So strictly speaking, it's not the SPEEX_DSP support that needs SPEEX,
but it's the RESAMPLE support that needs both SPEEX and SPEEX_DSP. So
the following change:

diff --git a/package/mediastreamer/mediastreamer.mk b/package/mediastreamer/mediastreamer.mk
index dcec66dfcd..53024d2f07 100644
--- a/package/mediastreamer/mediastreamer.mk
+++ b/package/mediastreamer/mediastreamer.mk
@@ -112,6 +112,12 @@ else
 MEDIASTREAMER_CONF_OPTS += -DENABLE_SPEEX_DSP=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_SPEEX)$(BR2_PACKAGE_SPEEXDSP),yy)
+MEDIASTREAMER_CONF_OPTS += -DENABLE_RESAMPLE=ON
+else
+MEDIASTREAMER_CONF_OPTS += -DENABLE_RESAMPLE=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_FFMPEG_SWSCALE),y)
 MEDIASTREAMER_CONF_OPTS += -DENABLE_FFMPEG=ON
 MEDIASTREAMER_DEPENDENCIES += ffmpeg

Fixes the second build failure in a way that is more correct IMO.

Also, did you report these build issues upstream? They indicate that
the CMakeLists.txt doesn't have the appropriate logic.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
