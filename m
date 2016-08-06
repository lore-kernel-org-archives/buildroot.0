From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  6 Aug 2016 12:02:45 +0200
Subject: [Buildroot] [PATCH 2/2] webrtc-audio-processing: fix build with musl
In-Reply-To: <1470477765-9014-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470477765-9014-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1470477765-9014-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

webrtc-audio-processing assumes that execinfo.h is available when
__UCLIBC__ is not defined, which is an incorrect assumption, and
specifically not valid for musl.

This commit adds a patch that moves to autoconf based checks for
cxxabi.h and execinfo.h, which solves the problem.

Fixes:

  http://autobuild.buildroot.net/results/480f529a53b321344e499f958be8e5d1d0f58646/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...oper-detection-of-cxxabi.h-and-execinfo.h.patch | 63 ++++++++++++++++++++++
 .../webrtc-audio-processing.mk                     |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 package/webrtc-audio-processing/0002-Proper-detection-of-cxxabi.h-and-execinfo.h.patch

diff --git a/package/webrtc-audio-processing/0002-Proper-detection-of-cxxabi.h-and-execinfo.h.patch b/package/webrtc-audio-processing/0002-Proper-detection-of-cxxabi.h-and-execinfo.h.patch
new file mode 100644
index 0000000..a0332db
--- /dev/null
+++ b/package/webrtc-audio-processing/0002-Proper-detection-of-cxxabi.h-and-execinfo.h.patch
@@ -0,0 +1,63 @@
+From b7a166acaddc4c78afa2b653e25114d9114699f3 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 6 Aug 2016 11:24:50 +0200
+Subject: [PATCH] Proper detection of cxxabi.h and execinfo.h
+
+The current code in webrtc/base/checks.cc assumes that if __GLIBCXX__ is
+defined and __UCLIBC__ is not defined, then both cxxabi.h and execinfo.h
+will be available.
+
+Unfortunately, this is not correct with the musl C library:
+
+ - It defines __GLIBCXX__
+ - It does not define __UCLIBC__ (it's not uClibc after all!)
+ - But it also doesn't provide execinfo.h
+
+Therefore, in order to make things work properly, we switch to proper
+autoconf checks for cxxabi.h and execinfo.h, and only use the backtrace
+functionality if both are provided.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac          | 2 ++
+ webrtc/base/checks.cc | 4 ++--
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index acbb3e2..ff4c752 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -45,6 +45,8 @@ AC_SUBST(GNUSTL_CFLAGS)
+ # Borrowed from gst-plugins-bad
+ AC_CHECK_HEADER(MobileCoreServices/MobileCoreServices.h, HAVE_IOS="yes", HAVE_IOS="no", [-])
+ 
++AC_CHECK_HEADERS([cxxabi.h execinfo.h])
++
+ # Based on gst-plugins-bad configure.ac and defines in
+ # <chromium source>/build/config/BUILDCONFIG.gn and
+ # webrtc/BUILD.gn
+diff --git a/webrtc/base/checks.cc b/webrtc/base/checks.cc
+index 49a31f2..05d23a6 100644
+--- a/webrtc/base/checks.cc
++++ b/webrtc/base/checks.cc
+@@ -16,7 +16,7 @@
+ #include <cstdio>
+ #include <cstdlib>
+ 
+-#if defined(__GLIBCXX__) && !defined(__UCLIBC__)
++#if defined(HAVE_CXX_ABI_H) && defined(HAVE_EXECINFO_H)
+ #include <cxxabi.h>
+ #include <execinfo.h>
+ #endif
+@@ -55,7 +55,7 @@ void PrintError(const char* format, ...) {
+ // to get usable symbols on Linux. This is copied from V8. Chromium has a more
+ // advanced stace trace system; also more difficult to copy.
+ void DumpBacktrace() {
+-#if defined(__GLIBCXX__) && !defined(__UCLIBC__)
++#if defined(HAVE_CXX_ABI_H) && defined(HAVE_EXECINFO_H)
+   void* trace[100];
+   int size = backtrace(trace, sizeof(trace) / sizeof(*trace));
+   char** symbols = backtrace_symbols(trace, size);
+-- 
+2.7.4
+
diff --git a/package/webrtc-audio-processing/webrtc-audio-processing.mk b/package/webrtc-audio-processing/webrtc-audio-processing.mk
index 5a5d1ce..75e3c88 100644
--- a/package/webrtc-audio-processing/webrtc-audio-processing.mk
+++ b/package/webrtc-audio-processing/webrtc-audio-processing.mk
@@ -11,6 +11,7 @@ WEBRTC_AUDIO_PROCESSING_INSTALL_STAGING = YES
 WEBRTC_AUDIO_PROCESSING_LICENSE = BSD-3c
 WEBRTC_AUDIO_PROCESSING_LICENSE_FILES = COPYING
 # 0001-configure.ac-fix-architecture-detection.patch
+# 0002-Proper-detection-of-cxxabi.h-and-execinfo.h.patch
 WEBRTC_AUDIO_PROCESSING_AUTORECONF = YES
 
 ifeq ($(BR2_SOFT_FLOAT),y)
-- 
2.7.4
