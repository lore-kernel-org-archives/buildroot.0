From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Oct 2014 22:27:10 +0200
Subject: [Buildroot] [PATCH v2 23/30] ffmpeg: use arch and cpu instead of
	tune
In-Reply-To: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1413923237-2861-24-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ffmpeg currently uses BR2_GCC_TARGET_TUNE as the --cpu option
value. However, there are multiple architectures for which
BR2_GCC_TARGET_TUNE is not used. After inspecting the ffmpeg configure
script, we concluded that using the BR2_GCC_TARGET_CPU value if
available, or the BR2_GCC_TARGET_ARCH value as a fallback was the
appropriate behavior.

This allows to remove the reference to BR2_GCC_TARGET_TUNE, which is
one step towards the removal of this option.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/ffmpeg/ffmpeg.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 0990f18..38eaaaa 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -334,6 +334,12 @@ endif
 
 FFMPEG_CONF_OPTS += $(call qstrip,$(BR2_PACKAGE_FFMPEG_EXTRACONF))
 
+ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU)),)
+FFMPEG_CONF_OPTS += --cpu=$(BR2_GCC_TARGET_CPU)
+else ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH),)
+FFMPEG_CONF_OPTS += --cpu=$(BR2_GCC_TARGET_ARCH)
+endif
+
 # Override FFMPEG_CONFIGURE_CMDS: FFmpeg does not support --target and others
 define FFMPEG_CONFIGURE_CMDS
 	(cd $(FFMPEG_SRCDIR) && rm -rf config.cache && \
@@ -349,7 +355,6 @@ define FFMPEG_CONFIGURE_CMDS
 		--target-os="linux" \
 		--disable-stripping \
 		--pkg-config="$(PKG_CONFIG_HOST_BINARY)" \
-		$(if $(BR2_GCC_TARGET_TUNE),--cpu=$(BR2_GCC_TARGET_TUNE)) \
 		$(SHARED_STATIC_LIBS_OPTS) \
 		$(FFMPEG_CONF_OPTS) \
 	)
-- 
2.0.0
