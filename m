From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 17:15:13 +0200
Subject: [Buildroot] [git commit] package/pulseaudio: allow to build without
	C++11 support
Message-ID: <20160704151610.E627C807D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b153d059b38b7b5695bedc2006227cca2977cab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

C++11 support is only required for WebRTC optional support but
pulseaudio can still be built with toolchains based on gcc 4.7 or older
witch doesn't have it.

Add a patch to make C++11 support optional and explicitely check for
gnu++11. Also stop the build only if no C++11 support has been found
and WebRTC support has been resquested.

Fixes:
http://autobuild.buildroot.net/results/d89/d897a94a8b6a52eba03d04c24536f554a7643000

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-C-11-is-only-required-for-WebRTC-support.patch | 41 ++++++++++++++++++++++
 package/pulseaudio/pulseaudio.mk                   |  3 ++
 2 files changed, 44 insertions(+)

diff --git a/package/pulseaudio/0002-webrtc-C-11-is-only-required-for-WebRTC-support.patch b/package/pulseaudio/0002-webrtc-C-11-is-only-required-for-WebRTC-support.patch
new file mode 100644
index 0000000..b2c0651
--- /dev/null
+++ b/package/pulseaudio/0002-webrtc-C-11-is-only-required-for-WebRTC-support.patch
@@ -0,0 +1,41 @@
+From 7af6cbe74d48a9853b60b029d4ce38a963386138 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sun, 3 Jul 2016 20:19:48 +0200
+Subject: [PATCH] webrtc: C++11 is only required for WebRTC support
+
+Make C++11 support optional and explicitely check for gnu++11.
+
+Stop the build only if no C++11 support has been found and WebRTC
+support has been resquested.
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ configure.ac | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4edc8e0..fea93a9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -84,7 +84,7 @@ AM_PROG_CC_C_O
+ # Only required if you want the WebRTC canceller -- no runtime dep on
+ # libstdc++ otherwise
+ AC_PROG_CXX
+-AX_CXX_COMPILE_STDCXX_11
++AX_CXX_COMPILE_STDCXX_11([ext],[optional])
+ AC_PROG_GCC_TRADITIONAL
+ AC_USE_SYSTEM_EXTENSIONS
+ 
+@@ -1414,6 +1414,9 @@ fi
+ AC_ARG_ENABLE([webrtc-aec],
+     AS_HELP_STRING([--enable-webrtc-aec], [Enable the optional WebRTC-based echo canceller]))
+ 
++AS_IF([test "x$enable_webrtc_aec" = "xyes" && test "$HAVE_CXX11" = "0"],
++    [AC_MSG_ERROR([*** webrtc-audio-processing needs C++11 support])])
++
+ AS_IF([test "x$enable_webrtc_aec" != "xno"],
+     [PKG_CHECK_MODULES(WEBRTC, [ webrtc-audio-processing >= 0.2 ], [HAVE_WEBRTC=1], [HAVE_WEBRTC=0])],
+     [HAVE_WEBRTC=0])
+-- 
+2.5.5
+
diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index f50ea67..bc95d91 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -21,6 +21,9 @@ PULSEAUDIO_CONF_OPTS = \
 PULSE_AUDIO_CONF_ENV += \
 	ac_cv_header_atomic_ops_h=no
 
+# 0002-webrtc-C-11-is-only-required-for-WebRTC-support.patch
+PULSEAUDIO_AUTORECONF = YES
+
 PULSEAUDIO_DEPENDENCIES = \
 	host-pkgconf libtool json-c libsndfile speex host-intltool \
 	$(if $(BR2_PACKAGE_LIBSAMPLERATE),libsamplerate) \
