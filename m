From: Steven Noonan <steven@uplinklabs.net>
Date: Wed, 18 Mar 2015 15:01:11 -0700
Subject: [Buildroot] [PATCH 3/3] packages: add AVX/AVX2 support to
	ffmpeg/opencv
In-Reply-To: <1426716071-27570-1-git-send-email-steven@uplinklabs.net>
References: <1426716071-27570-1-git-send-email-steven@uplinklabs.net>
Message-ID: <1426716071-27570-4-git-send-email-steven@uplinklabs.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
---
 package/ffmpeg/ffmpeg.mk | 12 ++++++++++++
 package/opencv/opencv.mk |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 68a28a2..47372df 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -301,6 +301,18 @@ else
 FFMPEG_CONF_OPTS += --disable-sse42
 endif
 
+ifeq ($(BR2_X86_CPU_HAS_AVX),y)
+FFMPEG_CONF_OPTS += --enable-avx
+else
+FFMPEG_CONF_OPTS += --disable-avx
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_AVX2),y)
+FFMPEG_CONF_OPTS += --enable-avx2
+else
+FFMPEG_CONF_OPTS += --disable-avx2
+endif
+
 # Explicitly disable everything that doesn't match for ARM
 # FFMPEG "autodetects" by compiling an extended instruction via AS
 # This works on compilers that aren't built for generic by default
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 61f529e..ee84312 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -77,6 +77,8 @@ OPENCV_CONF_OPTS += \
 	-DENABLE_SSE3=$(if $(BR2_X86_CPU_HAS_SSE3),ON,OFF)   \
 	-DENABLE_SSE41=$(if $(BR2_X86_CPU_HAS_SSE4),ON,OFF)  \
 	-DENABLE_SSE42=$(if $(BR2_X86_CPU_HAS_SSE42),ON,OFF) \
+	-DENABLE_AVX=$(if $(BR2_X86_CPU_HAS_AVX),ON,OFF) \
+	-DENABLE_AVX2=$(if $(BR2_X86_CPU_HAS_AVX2),ON,OFF) \
 	-DENABLE_SSSE3=$(if $(BR2_X86_CPU_HAS_SSSE3),ON,OFF)
 
 # Cuda stuff
-- 
2.3.3
