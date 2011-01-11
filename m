From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 Jan 2011 15:16:21 +0100
Subject: [Buildroot] [git commit master 1/1] libao: new package
Message-ID: <20110111141647.CF5E88A4A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7f8164267594c5ce8bed685192729c0fb0fd5056
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/Config.in       |    1 +
 package/multimedia/libao/Config.in |    7 +++++++
 package/multimedia/libao/libao.mk  |   21 +++++++++++++++++++++
 3 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/libao/Config.in
 create mode 100644 package/multimedia/libao/libao.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index da50dbb..5c1111d 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -10,6 +10,7 @@ source "package/multimedia/gst-plugins-base/Config.in"
 source "package/multimedia/gst-plugins-good/Config.in"
 source "package/multimedia/gst-plugins-bad/Config.in"
 source "package/multimedia/gst-plugins-ugly/Config.in"
+source "package/multimedia/libao/Config.in"
 source "package/multimedia/libcdaudio/Config.in"
 source "package/multimedia/libdvdread/Config.in"
 source "package/multimedia/libdvdnav/Config.in"
diff --git a/package/multimedia/libao/Config.in b/package/multimedia/libao/Config.in
new file mode 100644
index 0000000..3c99ab9
--- /dev/null
+++ b/package/multimedia/libao/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBAO
+	bool "libao"
+	help
+	  Libao is a cross-platform audio library that allows programs
+	  to output audio using a simple API on a wide variety of platforms.
+
+	  http://www.xiph.org/ao/
diff --git a/package/multimedia/libao/libao.mk b/package/multimedia/libao/libao.mk
new file mode 100644
index 0000000..ee02d18
--- /dev/null
+++ b/package/multimedia/libao/libao.mk
@@ -0,0 +1,21 @@
+#############################################################
+#
+# libao
+#
+#############################################################
+
+LIBAO_VERSION = 1.0.0
+LIBAO_SITE = http://downloads.xiph.org/releases/ao
+LIBAO_DEPENDENCIES = host-pkg-config
+LIBAO_INSTALL_STAGING = YES
+LIBAO_CONF_OPT = --disable-esd --disable-wmm --disable-arts \
+			--disable-nas --disable-pulse
+
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+LIBAO_DEPENDENCIES += alsa-lib
+LIBAO_CONF_OPT += --enable-alsa --enable-alsa-mmap
+else
+LIBAO_CONF_OPT += --disable-alsa
+endif
+
+$(eval $(call AUTOTARGETS,package/multimedia,libao))
-- 
1.7.2.2
