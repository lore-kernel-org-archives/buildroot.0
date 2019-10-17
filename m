From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu, 17 Oct 2019 16:29:20 +0100
Subject: [Buildroot] [RFC PATCH v2 21/30] package/ffmpeg: Add host package.
In-Reply-To: <20191017152929.49153-1-michael.drake@codethink.co.uk>
References: <20191017152929.49153-1-michael.drake@codethink.co.uk>
Message-ID: <20191017152929.49153-22-michael.drake@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/ffmpeg/ffmpeg.mk | 61 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 21fb24e597..cefeb0d5f5 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -56,6 +56,46 @@ FFMPEG_CONF_OPTS = \
 	--disable-symver \
 	--disable-doc
 
+HOST_FFMPEG_CONF_OPTS = \
+	--enable-avfilter \
+	--disable-version3 \
+	--enable-logging \
+	--enable-optimizations \
+	--disable-extra-warnings \
+	--enable-avdevice \
+	--enable-avcodec \
+	--enable-avformat \
+	--enable-network \
+	--disable-gray \
+	--enable-swscale-alpha \
+	--disable-small \
+	--enable-dct \
+	--enable-fft \
+	--enable-mdct \
+	--enable-rdft \
+	--disable-crystalhd \
+	--disable-dxva2 \
+	--enable-runtime-cpudetect \
+	--disable-hardcoded-tables \
+	--disable-mipsdsp \
+	--disable-mipsdspr2 \
+	--disable-msa \
+	--enable-hwaccels \
+	--disable-cuda \
+	--disable-cuvid \
+	--disable-nvenc \
+	--disable-avisynth \
+	--disable-frei0r \
+	--disable-libopencore-amrnb \
+	--disable-libopencore-amrwb \
+	--disable-libdc1394 \
+	--disable-libgsm \
+	--disable-libilbc \
+	--disable-libvo-amrwbenc \
+	--disable-libxcb \
+	--disable-symver \
+	--disable-doc
+
 FFMPEG_DEPENDENCIES += host-pkgconf
 
 ifeq ($(BR2_PACKAGE_FFMPEG_GPL),y)
@@ -406,9 +446,12 @@ endif
 ifeq ($(BR2_X86_CPU_HAS_MMX),y)
 FFMPEG_CONF_OPTS += --enable-x86asm
 FFMPEG_DEPENDENCIES += host-nasm
+HOST_FFMPEG_DEPENDENCIES += host-nasm
 else
 FFMPEG_CONF_OPTS += --disable-x86asm
 FFMPEG_CONF_OPTS += --disable-mmx
+HOST_FFMPEG_CONF_OPTS += --disable-x86asm
+HOST_FFMPEG_CONF_OPTS += --disable-mmx
 endif
 
 ifeq ($(BR2_X86_CPU_HAS_SSE),y)
@@ -553,9 +596,27 @@ define FFMPEG_CONFIGURE_CMDS
 	)
 endef
 
+HOST_FFMPEG_CONF_ENV += CFLAGS="$(HOST_FFMPEG_CFLAGS)"
+
+# Override HOST_FFMPEG_CONFIGURE_CMDS: FFmpeg does not support --target and others
+define HOST_FFMPEG_CONFIGURE_CMDS
+	(cd $(HOST_FFMPEG_SRCDIR) && rm -rf config.cache && \
+	$(HOST_CONFIGURE_OPTS) \
+	$(HOST_CONFIGURE_ARGS) \
+	$(HOST_FFMPEG_CONF_ENV) \
+	./configure \
+		--prefix="$(HOST_DIR)" \
+		--enable-shared --disable-static \
+		--disable-doc \
+		--disable-debug \
+		$(HOST_FFMPEG_CONF_OPTS) \
+	)
+endef
+
 define FFMPEG_REMOVE_EXAMPLE_SRC_FILES
 	rm -rf $(TARGET_DIR)/usr/share/ffmpeg/examples
 endef
 FFMPEG_POST_INSTALL_TARGET_HOOKS += FFMPEG_REMOVE_EXAMPLE_SRC_FILES
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.20.1
