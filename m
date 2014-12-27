From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 19:58:29 +0100
Subject: [Buildroot] [git commit] package/kodi-audioencoder-lame: New package
Message-ID: <20141227185849.B3FDF7FD02@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c9338f16a4a9741775c4c5a492aa8961bbdf1e3e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: removed dependency on BR2_PACKAGE_KODI_OPTICALDRIVE from the
package Config.in, since it is already only included if
BR2_PACKAGE_KODI_OPTICALDRIVE is enabled.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-audioencoder-lame/Config.in           |    7 +++++++
 .../kodi-audioencoder-lame.mk                      |   16 ++++++++++++++++
 package/kodi/Config.in                             |    1 +
 3 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/kodi-audioencoder-lame/Config.in b/package/kodi-audioencoder-lame/Config.in
new file mode 100644
index 0000000..be00296
--- /dev/null
+++ b/package/kodi-audioencoder-lame/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_AUDIOENCODER_LAME
+	bool "kodi-audioencoder-lame"
+	select BR2_PACKAGE_LAME
+	help
+	  An audioencoder addon for Kodi
+
+	  https://github.com/xbmc/audioencoder.lame
diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
new file mode 100644
index 0000000..a890f64
--- /dev/null
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# kodi-audioencoder-lame
+#
+################################################################################
+
+KODI_AUDIOENCODER_LAME_VERSION = 6f8384f0d003faf7b91dcd38357ea0ecf9030cce
+KODI_AUDIOENCODER_LAME_SITE = $(call github,xbmc,audioencoder.lame,$(KODI_AUDIOENCODER_LAME_VERSION))
+KODI_AUDIOENCODER_LAME_LICENSE = GPLv2+
+KODI_AUDIOENCODER_LAME_LICENSE_FILES = src/EncoderLame.cpp
+KODI_AUDIOENCODER_LAME_DEPENDENCIES = kodi lame
+KODI_AUDIOENCODER_LAME_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi \
+	-DLAME_INCLUDE_DIRS=$(STAGING_DIR)/usr/include
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index fa26f54..7f33642 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -245,6 +245,7 @@ if BR2_PACKAGE_KODI_OPTICALDRIVE
 comment "Kodi audioencoder addons"
 
 source "package/kodi-audioencoder-flac/Config.in"
+source "package/kodi-audioencoder-lame/Config.in"
 
 endif # BR2_PACKAGE_KODI_OPTICALDRIVE
 
