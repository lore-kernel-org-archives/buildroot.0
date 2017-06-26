From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 27 Jun 2017 00:08:39 +0200
Subject: [Buildroot] [PATCH v1] pulseaudio: bump version to 10.0
Message-ID: <20170626220839.17248-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- remove 0002-webrtc-C-11-is-only-required-for-WebRTC-support.patch
 (committed upstream, see [1])

[1] https://cgit.freedesktop.org/pulseaudio/pulseaudio/commit/configure.ac?id=a7231692e907ca5d4c7c30beb8629b5c49e95c09

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...-C-11-is-only-required-for-WebRTC-support.patch | 41 ----------------------
 1 file changed, 41 deletions(-)
 delete mode 100644 package/pulseaudio/0002-webrtc-C-11-is-only-required-for-WebRTC-support.patch

diff --git a/package/pulseaudio/0002-webrtc-C-11-is-only-required-for-WebRTC-support.patch b/package/pulseaudio/0002-webrtc-C-11-is-only-required-for-WebRTC-support.patch
deleted file mode 100644
index b2c065196b..0000000000
--- a/package/pulseaudio/0002-webrtc-C-11-is-only-required-for-WebRTC-support.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 7af6cbe74d48a9853b60b029d4ce38a963386138 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sun, 3 Jul 2016 20:19:48 +0200
-Subject: [PATCH] webrtc: C++11 is only required for WebRTC support
-
-Make C++11 support optional and explicitely check for gnu++11.
-
-Stop the build only if no C++11 support has been found and WebRTC
-support has been resquested.
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- configure.ac | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 4edc8e0..fea93a9 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -84,7 +84,7 @@ AM_PROG_CC_C_O
- # Only required if you want the WebRTC canceller -- no runtime dep on
- # libstdc++ otherwise
- AC_PROG_CXX
--AX_CXX_COMPILE_STDCXX_11
-+AX_CXX_COMPILE_STDCXX_11([ext],[optional])
- AC_PROG_GCC_TRADITIONAL
- AC_USE_SYSTEM_EXTENSIONS
- 
-@@ -1414,6 +1414,9 @@ fi
- AC_ARG_ENABLE([webrtc-aec],
-     AS_HELP_STRING([--enable-webrtc-aec], [Enable the optional WebRTC-based echo canceller]))
- 
-+AS_IF([test "x$enable_webrtc_aec" = "xyes" && test "$HAVE_CXX11" = "0"],
-+    [AC_MSG_ERROR([*** webrtc-audio-processing needs C++11 support])])
-+
- AS_IF([test "x$enable_webrtc_aec" != "xno"],
-     [PKG_CHECK_MODULES(WEBRTC, [ webrtc-audio-processing >= 0.2 ], [HAVE_WEBRTC=1], [HAVE_WEBRTC=0])],
-     [HAVE_WEBRTC=0])
--- 
-2.5.5
-
-- 
2.11.0
