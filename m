From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Sep 2011 22:36:13 +0200
Subject: [Buildroot] [git commit] package: add portaudio
Message-ID: <20110912211603.CBDF58D55B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a991e3e143408d573aa3d0a3090cabfac65a570e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

PortAudio is a free, cross-platform, open-source, audio I/O library.

[Peter: fix whitespace, dependencies, alsa-lib name]
Signed-off-by: Murat Demirten <mdemirten@yh.com.tr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
diff --git a/package/multimedia/portaudio/Config.in b/package/multimedia/portaudio/Config.in
new file mode 100644
index 0000000..f91acc0
--- /dev/null
+++ b/package/multimedia/portaudio/Config.in
@@ -0,0 +1,29 @@
+config BR2_PACKAGE_PORTAUDIO
+	bool "portaudio"
+	help
+	  PortAudio is a free, cross-platform, open-source,
+	  audio I/O library.
+
+	  http://www.portaudio.com/
+
+if BR2_PACKAGE_PORTAUDIO
+
+config BR2_PACKAGE_PORTAUDIO_ALSA
+	bool "alsa support"
+	select BR2_PACKAGE_ALSA_LIB
+	default y
+	help
+	  Compile with ALSA support.
+
+config BR2_PACKAGE_PORTAUDIO_OSS
+	bool "oss support"
+	help
+	  Compile with OSS support.
+
+config BR2_PACKAGE_PORTAUDIO_CXX
+	bool "C++ bindings"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Enables C++ bindings.
+
+endif # BR2_PACKAGE_PORTAUDIO
diff --git a/package/multimedia/portaudio/portaudio.mk b/package/multimedia/portaudio/portaudio.mk
new file mode 100644
index 0000000..67dfe36
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
+       $(if $(BR2_PACKAGE_PORTAUDIO_WITH_ALSA),alsa-lib)
+
+PORTAUDIO_CONF_OPT = \
+       $(if $(BR2_PACKAGE_PORTAUDIO_ALSA),--with-alsa,--without-alsa) \
+       $(if $(BR2_PACKAGE_PORTAUDIO_OSS),--with-oss,--without-oss) \
+       $(if $(BR2_PACKAGE_PORTAUDIO_CXX),--enable-cxx,--disable-cxx)
+
+$(eval $(call AUTOTARGETS,package/multimedia,portaudio))
-- 
1.7.3.4
