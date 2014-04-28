From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Mon, 28 Apr 2014 23:34:40 +0200
Subject: [Buildroot] [PATCH v2] libsoxr: new package
Message-ID: <1398720880-2424-1-git-send-email-hadrien.boutteville@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building tests fails mainly because of the cross-compilation, so they
are disabled for the moment.

Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
---
Changes v1 -> v2:
  - use qstrip to check BR2_ENDIAN variable (Thomas De Schampheleire)
  - use tarball instead of the Git repository (Thomas Petazzoni)
  - change LICENSE to LGPLv2.1+ (Thomas Petazzoni)
  - remove blank line
---
 package/Config.in          |  1 +
 package/libsoxr/Config.in  | 15 +++++++++++++++
 package/libsoxr/libsoxr.mk | 25 +++++++++++++++++++++++++
 3 files changed, 41 insertions(+)
 create mode 100644 package/libsoxr/Config.in
 create mode 100644 package/libsoxr/libsoxr.mk

diff --git a/package/Config.in b/package/Config.in
index 07fd166..2efbb25 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -506,6 +506,7 @@ source "package/libmpd/Config.in"
 source "package/libreplaygain/Config.in"
 source "package/libsamplerate/Config.in"
 source "package/libsndfile/Config.in"
+source "package/libsoxr/Config.in"
 source "package/libvorbis/Config.in"
 source "package/opus/Config.in"
 source "package/portaudio/Config.in"
diff --git a/package/libsoxr/Config.in b/package/libsoxr/Config.in
new file mode 100644
index 0000000..a218ae9
--- /dev/null
+++ b/package/libsoxr/Config.in
@@ -0,0 +1,15 @@
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
diff --git a/package/libsoxr/libsoxr.mk b/package/libsoxr/libsoxr.mk
new file mode 100644
index 0000000..0c01e9e
--- /dev/null
+++ b/package/libsoxr/libsoxr.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# libsoxr
+#
+################################################################################
+
+LIBSOXR_VERSION = 0.1.1
+LIBSOXR_SOURCE = soxr-$(LIBSOXR_VERSION)-Source.tar.xz
+LIBSOXR_SITE = http://downloads.sourceforge.net/project/soxr
+LIBSOXR_LICENSE = LGPLv2.1+
+LIBSOXR_LICENSE_FILES = LICENCE COPYING.LGPL
+LIBSOXR_INSTALL_STAGING = YES
+LIBSOXR_CONF_OPT = -DWITH_OPENMP:BOOL=OFF -DBUILD_TESTS:BOOL=OFF
+
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+LIBSOXR_CONF_OPT += -DBUILD_SHARED_LIBS:BOOL=OFF
+endif
+
+ifeq ($(call qstrip,$(BR2_ENDIAN)),BIG) 
+LIBSOXR_CONF_OPT += -DHAVE_WORDS_BIGENDIAN=1
+else
+LIBSOXR_CONF_OPT += -DHAVE_WORDS_BIGENDIAN=0
+endif
+
+$(eval $(cmake-package))
