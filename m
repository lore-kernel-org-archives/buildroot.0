From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 19:58:29 +0100
Subject: [Buildroot] [git commit] package/kodi-audioencoder-vorbis: New
	package
Message-ID: <20141227185849.BCC167FD02@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=01d1c331489cbea59e39d9354908ffe228e62c08
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: removed dependency on BR2_PACKAGE_KODI_OPTICALDRIVE from the
package Config.in, since it is already only included if
BR2_PACKAGE_KODI_OPTICALDRIVE is enabled.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-audioencoder-vorbis/Config.in         |    8 ++++++++
 .../kodi-audioencoder-vorbis.mk                    |   18 ++++++++++++++++++
 package/kodi/Config.in                             |    1 +
 3 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/kodi-audioencoder-vorbis/Config.in b/package/kodi-audioencoder-vorbis/Config.in
new file mode 100644
index 0000000..ab8b4b3
--- /dev/null
+++ b/package/kodi-audioencoder-vorbis/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_KODI_AUDIOENCODER_VORBIS
+	bool "kodi-audioencoder-vorbis"
+	select BR2_PACKAGE_LIBOGG
+	select BR2_PACKAGE_LIBVORBIS
+	help
+	  An audioencoder addon for Kodi
+
+	  https://github.com/xbmc/audioencoder.vorbis
diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
new file mode 100644
index 0000000..901a7a1
--- /dev/null
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# kodi-audioencoder-vorbis
+#
+################################################################################
+
+KODI_AUDIOENCODER_VORBIS_VERSION = fa0de1562504253acf64ad39fbcb1e5d85676ae4
+KODI_AUDIOENCODER_VORBIS_SITE = $(call github,xbmc,audioencoder.vorbis,$(KODI_AUDIOENCODER_VORBIS_VERSION))
+KODI_AUDIOENCODER_VORBIS_LICENSE = GPLv2+
+KODI_AUDIOENCODER_VORBIS_LICENSE_FILES = src/EncoderVorbis.cpp
+KODI_AUDIOENCODER_VORBIS_DEPENDENCIES = kodi libogg libvorbis
+KODI_AUDIOENCODER_VORBIS_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi \
+	-DOGG_INCLUDE_DIRS=$(STAGING_DIR)/usr/include \
+	-DVORBIS_INCLUDE_DIRS=$(STAGING_DIR)/usr/include \
+	-DVORBISENC_INCLUDE_DIRS=$(STAGING_DIR)/usr/include
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 7f33642..486dfda 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -246,6 +246,7 @@ comment "Kodi audioencoder addons"
 
 source "package/kodi-audioencoder-flac/Config.in"
 source "package/kodi-audioencoder-lame/Config.in"
+source "package/kodi-audioencoder-vorbis/Config.in"
 
 endif # BR2_PACKAGE_KODI_OPTICALDRIVE
 
