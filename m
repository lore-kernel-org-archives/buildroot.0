From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 May 2014 22:25:35 +0200
Subject: [Buildroot] [git commit] libao: Remove OSS plugin when ALSA is
	enabled
Message-ID: <20140503202811.32ECF9CAD1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a889c72cc833d0f9042a3fa74c14f488d665ce5c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

At runtime, libao will load all plugins, even ones that will never be used.
Since libao will prefer ALSA over OSS by default anyway, it is pretty safe
to exclude the OSS plugin.

There is no configure option for disabling the OSS plugin, so we remove
the shared object in a post-install hook.

Also disable alsa oss emulation workaround as it no longer will be used with
alsa.

[Peter: explain why --disable-broken-oss is passed]
Signed-Off-By: Maarten ter Huurne <maarten@treewalker.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libao/libao.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/libao/libao.mk b/package/libao/libao.mk
index 8e9ee35..3f7d166 100644
--- a/package/libao/libao.mk
+++ b/package/libao/libao.mk
@@ -11,11 +11,17 @@ LIBAO_INSTALL_STAGING = YES
 LIBAO_LICENSE = GPLv2+
 LIBAO_LICENSE_FILES = COPYING
 LIBAO_CONF_OPT = --disable-esd --disable-wmm --disable-arts \
-			--disable-nas --disable-pulse
+			--disable-nas --disable-pulse --disable-broken-oss
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 LIBAO_DEPENDENCIES += alsa-lib
 LIBAO_CONF_OPT += --enable-alsa --enable-alsa-mmap
+
+# Remove the OSS plugin if ALSA is enabled, as libao will prefer ALSA anyway
+define LIBAO_REMOVE_OSS_PLUGIN
+	rm -f $(TARGET_DIR)/usr/lib/ao/plugins-4/liboss.so
+endef
+LIBAO_POST_INSTALL_TARGET_HOOKS += LIBAO_REMOVE_OSS_PLUGIN
 else
 LIBAO_CONF_OPT += --disable-alsa
 endif
