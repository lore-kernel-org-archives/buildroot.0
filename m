From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Sat, 19 Apr 2014 02:32:33 +0200
Subject: [Buildroot] [PATCH 1/1] libsoxr: new package
Message-ID: <1397867553-7107-1-git-send-email-hadrien.boutteville@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building tests fails mainly because of the cross-compilation, so they
are disabled for the moment.

Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
---
 package/Config.in          |  1 +
 package/libsoxr/Config.in  | 16 ++++++++++++++++
 package/libsoxr/libsoxr.mk | 24 ++++++++++++++++++++++++
 3 files changed, 41 insertions(+)
 create mode 100644 package/libsoxr/Config.in
 create mode 100644 package/libsoxr/libsoxr.mk

diff --git a/package/Config.in b/package/Config.in
index 748d28e..f04e422 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -505,6 +505,7 @@ source "package/libmpd/Config.in"
 source "package/libreplaygain/Config.in"
 source "package/libsamplerate/Config.in"
 source "package/libsndfile/Config.in"
+source "package/libsoxr/Config.in"
 source "package/libvorbis/Config.in"
 source "package/opus/Config.in"
 source "package/portaudio/Config.in"
diff --git a/package/libsoxr/Config.in b/package/libsoxr/Config.in
new file mode 100644
index 0000000..ad6f8dd
--- /dev/null
+++ b/package/libsoxr/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_LIBSOXR
+	bool "libsoxr"
+	help
+	  The SoX Resampler library `libsoxr' performs one-dimensional
+	  sample-rate conversion?it may be used, for example, to
+	  resample PCM-encoded audio.
+
+	  It aims to give fast and high quality results for any constant
+	  (rational or irrational) resampling ratio. Phase-response,
+	  preserved bandwidth, aliasing, and rejection level parameters
+	  are all configurable; alternatively, simple `preset'
+	  configurations may be selected. An experimental, variable-rate
+	  resampling mode of operation is also included.
+
+	  http://sourceforge.net/projects/soxr/
+
diff --git a/package/libsoxr/libsoxr.mk b/package/libsoxr/libsoxr.mk
new file mode 100644
index 0000000..c0fb72b
--- /dev/null
+++ b/package/libsoxr/libsoxr.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# libsoxr
+#
+################################################################################
+
+LIBSOXR_VERSION = 0.1.1
+LIBSOXR_SITE = git://git.code.sf.net/p/soxr/code
+LIBSOXR_LICENSE = LGPLv2.1
+LIBSOXR_LICENSE_FILES = LICENCE COPYING.LGPL
+LIBSOXR_INSTALL_STAGING = YES
+LIBSOXR_CONF_OPT = -DWITH_OPENMP:BOOL=OFF -DBUILD_TESTS:BOOL=OFF
+
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+LIBSOXR_CONF_OPT += -DBUILD_SHARED_LIBS:BOOL=OFF
+endif
+
+ifeq ($(BR2_ENDIAN),"BIG")
+LIBSOXR_CONF_OPT += -DHAVE_WORDS_BIGENDIAN=1
+else
+LIBSOXR_CONF_OPT += -DHAVE_WORDS_BIGENDIAN=0
+endif
+
+$(eval $(cmake-package))
