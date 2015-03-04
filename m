From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Wed,  4 Mar 2015 19:37:22 +0100
Subject: [Buildroot] [PATCH] package/kodi: Use i.MX VPU (video codec) when
	available
Message-ID: <1425494242-17354-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Boibessot <julien.boibessot@armadeus.com>

Tested on i.MX6.

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
---
 package/kodi/Config.in |    5 +++++
 package/kodi/kodi.mk   |    5 +++++
 2 files changed, 10 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 1bc8b15..74aeb72 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -105,6 +105,11 @@ menuconfig BR2_PACKAGE_KODI
 
 	  http://kodi.tv
 
+	  To have hardware accelerated video decoding on following platforms,
+	  you will also have to select related package(s):
+	  * RPi: rpi-firmware
+	  * i.MX6: libfslvpuwrap
+
 if BR2_PACKAGE_KODI
 
 config BR2_PACKAGE_KODI_ALSA_LIB
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 01c7e80..956c3b6 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -54,6 +54,11 @@ KODI_CONF_ENV += INCLUDES="-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads
 	LIBS="-lvcos -lvchostif"
 endif
 
+ifeq ($(BR2_PACKAGE_LIBFSLVPUWRAP),y)
+KODI_DEPENDENCIES += libfslvpuwrap
+KODI_CONF_OPTS += --enable-codec=imxvpu
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 KODI_CONF_OPTS += --enable-libcap
 KODI_DEPENDENCIES += libcap
-- 
1.7.9.5
