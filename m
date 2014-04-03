From: Paul Cercueil <paul@crapouillou.net>
Date: Thu,  3 Apr 2014 23:01:16 +0200
Subject: [Buildroot] [PATCH 06/11] libao: Remove OSS plugin when ALSA is
	enabled
In-Reply-To: <1396558881-29631-1-git-send-email-paul@crapouillou.net>
References: <1396558881-29631-1-git-send-email-paul@crapouillou.net>
Message-ID: <1396558881-29631-6-git-send-email-paul@crapouillou.net>
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
Acked-By: Paul Cercueil <paul@crapouillou.net>
---
 package/libao/libao.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/libao/libao.mk b/package/libao/libao.mk
index 8e9ee35..e6704f2 100644
--- a/package/libao/libao.mk
+++ b/package/libao/libao.mk
@@ -11,11 +11,16 @@ LIBAO_INSTALL_STAGING = YES
 LIBAO_LICENSE = GPLv2+
 LIBAO_LICENSE_FILES = COPYING
 LIBAO_CONF_OPT = --disable-esd --disable-wmm --disable-arts \
-			--disable-nas --disable-pulse
+			--disable-nas --disable-pulse --disable-broken-oss
+
+define LIBAO_REMOVE_OSS_PLUGIN
+	rm -f $(TARGET_DIR)/usr/lib/ao/plugins-4/liboss.so
+endef
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 LIBAO_DEPENDENCIES += alsa-lib
 LIBAO_CONF_OPT += --enable-alsa --enable-alsa-mmap
+LIBAO_POST_INSTALL_TARGET_HOOKS += LIBAO_REMOVE_OSS_PLUGIN
 else
 LIBAO_CONF_OPT += --disable-alsa
 endif
-- 
1.9.0
