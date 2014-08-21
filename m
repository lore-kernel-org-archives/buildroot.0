From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Aug 2014 15:34:47 +0200
Subject: [Buildroot] [git commit] package/lbreakout2: fix linking with intl
Message-ID: <20140821133500.D8D4C9D4E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=56ed21e726b72bd7d38f0b444fb41d53a30fdc96
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lbreakout2 doen't build with (e)glibc toolchain when gettext package is selected.

With (e)glibc libintl is provided by the libc whereas with uClibc it's provided by gettext.

Linking with intl is only needed if the toolchain needs gettext and locale is set.

Fixes:
http://autobuild.buildroot.net/results/a77/a77dd3e18cc4a5e8300ab33eb532cc03d0156f7f/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lbreakout2/lbreakout2.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lbreakout2/lbreakout2.mk b/package/lbreakout2/lbreakout2.mk
index 8f4e27d..6087ca6 100644
--- a/package/lbreakout2/lbreakout2.mk
+++ b/package/lbreakout2/lbreakout2.mk
@@ -14,7 +14,7 @@ LBREAKOUT2_DEPENDENCIES = sdl libpng
 LBREAKOUT2_CONF_ENV = \
 	SDL_CONFIG="$(STAGING_DIR)/usr/bin/sdl-config"
 
-ifeq ($(BR2_PACKAGE_GETTEXT),y)
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 LBREAKOUT2_DEPENDENCIES += gettext
 LBREAKOUT2_CONF_ENV += LIBS=-lintl
 endif
