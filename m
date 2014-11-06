From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 Nov 2014 00:08:07 +0100
Subject: [Buildroot] [git commit] ffmpeg: use arch and cpu instead of tune
Message-ID: <20141106233447.0FA14B12A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ae2850b78c15c3c848bb01f723da439df8dfe68e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.mk |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 233797c..287f5e4 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -340,6 +340,12 @@ endif
 
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
@@ -355,7 +361,6 @@ define FFMPEG_CONFIGURE_CMDS
 		--target-os="linux" \
 		--disable-stripping \
 		--pkg-config="$(PKG_CONFIG_HOST_BINARY)" \
-		$(if $(BR2_GCC_TARGET_TUNE),--cpu=$(BR2_GCC_TARGET_TUNE)) \
 		$(SHARED_STATIC_LIBS_OPTS) \
 		$(FFMPEG_CONF_OPTS) \
 	)
