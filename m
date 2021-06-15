From: Charles Hardin <ckhardin@gmail.com>
Date: Mon, 14 Jun 2021 17:59:23 -0700
Subject: [Buildroot] [PATCH 1/1] package/alsa-plugins: add new package
 alsa-plugins version 1.2.5
Message-ID: <20210615005923.51837-1-charles.hardin@chargepoint.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Charles Hardin <ckhardin@gmail.com>

During testing of bluez-alsa in particular, there is no compilation
dependency - but, some configurations against boards will request
the load of a particular plugin:

    ALSA lib dlmisc.c:337:(snd_dlobj_cache_get0) \
      Cannot open shared library libasound_module_rate_samplerate_best.so \
      (/usr/lib/alsa-lib/libasound_module_rate_samplerate_best.so: \
       cannot open shared object file: No such file or directory)

Adding in the alsa-plugins package will build the appropriate dlobject
for loading and configuration.

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
---
 package/Config.in                      |  1 +
 package/alsa-plugins/Config.in         |  8 ++++++++
 package/alsa-plugins/alsa-plugins.hash |  4 ++++
 package/alsa-plugins/alsa-plugins.mk   | 23 +++++++++++++++++++++++
 4 files changed, 36 insertions(+)
 create mode 100644 package/alsa-plugins/Config.in
 create mode 100644 package/alsa-plugins/alsa-plugins.hash
 create mode 100644 package/alsa-plugins/alsa-plugins.mk

diff --git a/package/Config.in b/package/Config.in
index e42f579494..26adcd53f2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1291,6 +1291,7 @@ menu "Libraries"
 
 menu "Audio/Sound"
 	source "package/alsa-lib/Config.in"
+	source "package/alsa-plugins/Config.in"
 	source "package/alure/Config.in"
 	source "package/aubio/Config.in"
 	source "package/bcg729/Config.in"
diff --git a/package/alsa-plugins/Config.in b/package/alsa-plugins/Config.in
new file mode 100644
index 0000000000..44aaa7997c
--- /dev/null
+++ b/package/alsa-plugins/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_ALSA_PLUGINS
+	bool "alsa-plugins"
+	depends on BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_LIBSAMPLERATE
+	help
+	  Advanced Linux Sound Architecture Plugins
+
+	  http://www.alsa-project.org/
diff --git a/package/alsa-plugins/alsa-plugins.hash b/package/alsa-plugins/alsa-plugins.hash
new file mode 100644
index 0000000000..8ecbd19965
--- /dev/null
+++ b/package/alsa-plugins/alsa-plugins.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  42eef98433d2c8d11f1deeeb459643619215a75aa5a5bbdd06a794e4c413df20  alsa-plugins-1.2.5.tar.bz2
+sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING.GPL
diff --git a/package/alsa-plugins/alsa-plugins.mk b/package/alsa-plugins/alsa-plugins.mk
new file mode 100644
index 0000000000..70d3cdb87c
--- /dev/null
+++ b/package/alsa-plugins/alsa-plugins.mk
@@ -0,0 +1,23 @@
+#############################################################
+#
+# alsa-plugins
+#
+#############################################################
+ALSA_PLUGINS_VERSION = 1.2.5
+ALSA_PLUGINS_SOURCE = alsa-plugins-$(ALSA_PLUGINS_VERSION).tar.bz2
+ALSA_PLUGINS_SITE = https://www.alsa-project.org/files/pub/plugins
+ALSA_PLUGINS_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (samplerate)
+ALSA_PLUGINS_LICENSE_FILES = COPYING COPYING.GPL
+ALSA_PLUGINS_INSTALL_STAGING = NO
+ALSA_PLUGINS_AUTORECONF = YES
+ALSA_PLUGINS_DEPENDENCIES = alsa-lib libsamplerate
+
+ALSA_PLUGINS_CONF_OPTS += \
+	--enable-samplerate \
+	--disable-jack \
+	--disable-usbstream \
+	--disable-pulseaudio \
+	--disable-avcodec \
+	--with-speex=builtin
+
+$(eval $(autotools-package))
-- 
2.30.1 (Apple Git-130)
