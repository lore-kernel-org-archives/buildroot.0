From: Paul Cercueil <paul@crapouillou.net>
Date: Tue,  8 Apr 2014 19:45:07 +0200
Subject: [Buildroot] [PATCH 3/5] libao: Remove OSS plugin when ALSA is
	enabled
In-Reply-To: <1396979109-10691-1-git-send-email-paul@crapouillou.net>
References: <1396979109-10691-1-git-send-email-paul@crapouillou.net>
Message-ID: <1396979109-10691-3-git-send-email-paul@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maarten ter Huurne <maarten@treewalker.org>

At runtime, libao will load all plugins, even ones that will never be used.
Since libao will prefer ALSA over OSS by default anyway, it is pretty safe
to exclude the OSS plugin.

There is no configure option for disabling the OSS plugin, so we remove
the shared object in a post-install hook.

Signed-Off-By: Maarten ter Huurne <maarten@treewalker.org>
---
 package/libao/libao.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

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
-- 
1.9.1
