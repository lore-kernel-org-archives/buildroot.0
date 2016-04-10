From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Apr 2016 18:22:06 +0200
Subject: [Buildroot] [PATCH] package/kodi: optimise for RPi2
Message-ID: <1460305326-20532-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kodi has specific optimisation and configuration flags for RPi vs. RPi2.
Only configure for the RPi2 when we're sure (i.e. it is a cortex A7),
and fallback to con figuring for the RPi otherwise.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/kodi/kodi.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 94a8cd8..cd6cc2e 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -47,7 +47,14 @@ endif
 
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 KODI_DEPENDENCIES += rpi-userland
-KODI_CONF_OPTS += --with-platform=raspberry-pi --enable-player=omxplayer
+# Kodi has specific ocnfiguration flags for RPi/RPi2. Configure for a
+# RPi2 when we're sure, fallback to RPi otherwise.
+ifeq ($(BR2_cortex_a7),y)
+KODI_CONF_OPTS += --with-platform=raspberry-pi2
+else
+KODI_CONF_OPTS += --with-platform=raspberry-pi
+endif
+KODI_CONF_OPTS += --enable-player=omxplayer
 KODI_CONF_ENV += INCLUDES="-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads \
 	-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux" \
 	LIBS="-lvcos -lvchostif"
-- 
1.9.1
