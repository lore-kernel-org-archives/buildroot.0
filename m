From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 26 Jan 2016 22:56:13 +0100
Subject: [Buildroot] [PATCH 1/1] package/gstreamer/gst-plugins-base: Fix
	build on x86 if emmintrin.h is available but can't be used
Message-ID: <1453845373-30154-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I stumbled across this error using a musl-based allyesconfig but I
doubt it is related to musl. The autobuilders did not catch this
problem yet but the patch I found fits my config (BR2_i386=y,
BR2_x86_i586=y) and it solved the problem right away.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gstreamer/gst-plugins-base/0002-sse.patch | 48 +++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/gstreamer/gst-plugins-base/0002-sse.patch

diff --git a/package/gstreamer/gst-plugins-base/0002-sse.patch b/package/gstreamer/gst-plugins-base/0002-sse.patch
new file mode 100644
index 0000000..8d134f1
--- /dev/null
+++ b/package/gstreamer/gst-plugins-base/0002-sse.patch
@@ -0,0 +1,48 @@
+Fix build error with a musl-based allyesconfig (BR2_x86_i586=y)
+
+Downloaded from
+http://git.alpinelinux.org/cgit/aports/plain/main/gst-plugins-base0.10/sse.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+
+From daa194b71ea6f9e8ee522ab02e8c56150b7e62b3 Mon Sep 17 00:00:00 2001
+From: Antoine Jacoutot <ajacoutot@gnome.org>
+Date: Mon, 20 Jan 2014 15:44:09 +0100
+Subject: audioresample: Fix build on x86 if emmintrin.h is available but can't
+ be used
+
+On i386, EMMINTRIN is defined but not usable without SSE so check for
+__SSE__ and __SSE2__ as well.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=670690
+
+From 4e3d101aa854cfee633a9689efeb75e5001baa5e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Mon, 20 Jan 2014 16:11:04 +0100
+Subject: audioresample: It's HAVE_EMMINTRIN_H, not HAVE_XMMINTRIN_H for SSE2
+
+
+diff --git a/gst/audioresample/resample.c b/gst/audioresample/resample.c
+index 98d006c..481fa01 100644
+--- a/gst/audioresample/resample.c
++++ b/gst/audioresample/resample.c
+@@ -77,13 +77,13 @@
+ #define EXPORT G_GNUC_INTERNAL
+ 
+ #ifdef _USE_SSE
+-#ifndef HAVE_XMMINTRIN_H
++#if !defined(__SSE__) || !defined(HAVE_XMMINTRIN_H)
+ #undef _USE_SSE
+ #endif
+ #endif
+ 
+ #ifdef _USE_SSE2
+-#ifndef HAVE_EMMINTRIN_H
++#if !defined(__SSE2__) || !defined(HAVE_EMMINTRIN_H)
+ #undef _USE_SSE2
+ #endif
+ #endif
+-- 
+cgit v0.10.2
+
-- 
2.7.0.rc3
