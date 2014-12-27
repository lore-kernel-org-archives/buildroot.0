From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 19:58:29 +0100
Subject: [Buildroot] [git commit] package/kodi-audioencoder-flac: New package
Message-ID: <20141227185849.A9A087FD02@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f9f3feb5c6a0b19c662f0a993ef8e61282ead5a5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: removed dependency on BR2_PACKAGE_KODI_OPTICALDRIVE from the
package Config.in, since it is already only included if
BR2_PACKAGE_KODI_OPTICALDRIVE is enabled.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-audioencoder-flac/Config.in           |    8 ++++++++
 .../kodi-audioencoder-flac.mk                      |   17 +++++++++++++++++
 package/kodi/Config.in                             |   10 +++++++++-
 3 files changed, 34 insertions(+), 1 deletions(-)

diff --git a/package/kodi-audioencoder-flac/Config.in b/package/kodi-audioencoder-flac/Config.in
new file mode 100644
index 0000000..799f9c5
--- /dev/null
+++ b/package/kodi-audioencoder-flac/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_KODI_AUDIOENCODER_FLAC
+	bool "kodi-audioencoder-flac"
+	select BR2_PACKAGE_FLAC
+	select BR2_PACKAGE_LIBOGG
+	help
+	  An audioencoder addon for Kodi
+
+	  https://github.com/xbmc/audioencoder.flac
diff --git a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
new file mode 100644
index 0000000..a200150
--- /dev/null
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-audioencoder-flac
+#
+################################################################################
+
+KODI_AUDIOENCODER_FLAC_VERSION = a960ebae64f4b66f580e70318fe6da97771cacba
+KODI_AUDIOENCODER_FLAC_SITE = $(call github,xbmc,audioencoder.flac,$(KODI_AUDIOENCODER_FLAC_VERSION))
+KODI_AUDIOENCODER_FLAC_LICENSE = GPLv2+
+KODI_AUDIOENCODER_FLAC_LICENSE_FILES = src/EncoderFlac.cpp
+KODI_AUDIOENCODER_FLAC_DEPENDENCIES = flac kodi libogg
+KODI_AUDIOENCODER_FLAC_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi \
+	-DFLAC_INCLUDE_DIRS=$(STAGING_DIR)/usr/include \
+	-DOGG_INCLUDE_DIRS=$(STAGING_DIR)/usr/include
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 22060b1..fa26f54 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -240,7 +240,15 @@ config BR2_PACKAGE_KODI_OPTICALDRIVE
 	help
 	  Enable support for optical drives
 
-comment "Kodi addons"
+if BR2_PACKAGE_KODI_OPTICALDRIVE
+
+comment "Kodi audioencoder addons"
+
+source "package/kodi-audioencoder-flac/Config.in"
+
+endif # BR2_PACKAGE_KODI_OPTICALDRIVE
+
+comment "Kodi PVR addons"
 
 source "package/kodi-addon-xvdr/Config.in"
 source "package/kodi-pvr-addons/Config.in"
