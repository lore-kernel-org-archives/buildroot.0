From: Murat Demirten <mdemirten@yh.com.tr>
Date: Sun, 7 Aug 2011 01:42:07 +0300
Subject: [Buildroot] New package: portaudio
Message-ID: <CA+pfegE9ba4aUw=r+e=Mp7=E7rGLsu-MzOQ_EGKHoUubrOgc8A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

PortAudio is a free, cross-platform, open-source, audio I/O library.

Signed-off-by: Murat Demirten <mdemirten@yh.com.tr>
---
 package/multimedia/Config.in              |    1 +
 package/multimedia/portaudio/Config.in    |   29 +++++++++++++++++++++++++++++
 package/multimedia/portaudio/portaudio.mk |   20 ++++++++++++++++++++
 3 files changed, 50 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/portaudio/Config.in
 create mode 100644 package/multimedia/portaudio/portaudio.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 79c601c..40760b7 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -37,6 +37,7 @@ source "package/multimedia/mpd/Config.in"
 source "package/multimedia/mpg123/Config.in"
 source "package/multimedia/mplayer/Config.in"
 source "package/multimedia/musepack/Config.in"
+source "package/multimedia/portaudio/Config.in"
 source "package/multimedia/python-mad/Config.in"
 source "package/multimedia/speex/Config.in"
 source "package/multimedia/swfdec/Config.in"
diff --git a/package/multimedia/portaudio/Config.in
b/package/multimedia/portaudio/Config.in
new file mode 100644
index 0000000..f94d405
--- /dev/null
+++ b/package/multimedia/portaudio/Config.in
@@ -0,0 +1,29 @@
+config BR2_PACKAGE_PORTAUDIO
+       bool "portaudio"
+       select BR2_PACKAGE_ALSA_LIB
+       help
+         PortAudio is a free, cross-platform, open-source,
+         audio I/O library.
+
+         http://www.portaudio.com/download.html
+
+config BR2_PACKAGE_PORTAUDIO_ALSA
+       bool "With ALSA support"
+       depends on BR2_PACKAGE_PORTAUDIO
+       default y
+       help
+         Compile with ALSA support.
+
+config BR2_PACKAGE_PORTAUDIO_OSS
+       bool "With OSS support"
+       depends on BR2_PACKAGE_PORTAUDIO
+       help
+         Compile with OSS support.
+
+config BR2_PACKAGE_PORTAUDIO_CXX
+       bool "Enable C++ bindings"
+       depends on BR2_PACKAGE_PORTAUDIO
+       default n
+       help
+         Enables C++ bindings.
+
diff --git a/package/multimedia/portaudio/portaudio.mk
b/package/multimedia/portaudio/portaudio.mk
new file mode 100644
index 0000000..5406e11
--- /dev/null
+++ b/package/multimedia/portaudio/portaudio.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# portaudio
+#
+################################################################################
+
+PORTAUDIO_VERSION = V19
+PORTAUDIO_SITE = http://www.portaudio.com/archives
+PORTAUDIO_SOURCE = pa_stable_v19_20110326.tgz
+PORTAUDIO_INSTALL_STAGING = YES
+
+PORTAUDIO_DEPENDENCIES = \
+       $(if $(BR2_PACKAGE_PORTAUDIO_WITH_ALSA),libalsa)
+
+PORTAUDIO_CONF_OPT = \
+       $(if $(BR2_PACKAGE_PORTAUDIO_ALSA),--with-alsa,--without-alsa) \
+       $(if $(BR2_PACKAGE_PORTAUDIO_OSS),--with-oss,--without-oss) \
+       $(if $(BR2_PACKAGE_PORTAUDIO_CXX),--enable-cxx,--disable-cxx)
+
+$(eval $(call AUTOTARGETS,package/multimedia,portaudio))
-- 
1.7.1
