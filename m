From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 May 2014 23:51:24 +0200
Subject: [Buildroot] [git commit] libsoxr: new package
Message-ID: <20140501215131.F2C149CAAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=705662b41d59558ad6ca11362c9611cf13f1d6fd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building tests fails mainly because of the cross-compilation, so they
are disabled for the moment.

Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in          |    1 +
 package/libsoxr/Config.in  |   15 +++++++++++++++
 package/libsoxr/libsoxr.mk |   25 +++++++++++++++++++++++++
 3 files changed, 41 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 8bdc1c2..4430241 100644
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
+	  sample-rate conversion???it may be used, for example, to
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
index 0000000..a8e432c
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
