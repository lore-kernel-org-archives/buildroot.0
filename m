From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Feb 2016 22:19:02 +0100
Subject: [Buildroot] [git commit] package/gstreamer/gst-plugins-base: Fix
	build on x86 if emmintrin.h is available but can't be used
Message-ID: <20160201224713.E9ACA7F8C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=291c3c77cbc745a953c753651031a4f85e0edc8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

I stumbled across this error using a musl-based allyesconfig but I
doubt it is related to musl. The autobuilders did not catch this
problem yet but the patch I found fits my config (BR2_i386=y,
BR2_x86_i586=y) and it solved the problem right away.

[Peter: pick patches from upstream git instead of downloading from alphine]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...le-Fix-build-on-x86-if-emmintrin.h-is-ava.patch | 38 ++++++++++++++++++++++
 ...le-It-s-HAVE_EMMINTRIN_H-not-HAVE_XMMINTR.patch | 27 +++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/package/gstreamer/gst-plugins-base/0002-audioresample-Fix-build-on-x86-if-emmintrin.h-is-ava.patch b/package/gstreamer/gst-plugins-base/0002-audioresample-Fix-build-on-x86-if-emmintrin.h-is-ava.patch
new file mode 100644
index 0000000..eabea4f
--- /dev/null
+++ b/package/gstreamer/gst-plugins-base/0002-audioresample-Fix-build-on-x86-if-emmintrin.h-is-ava.patch
@@ -0,0 +1,38 @@
+From daa194b71ea6f9e8ee522ab02e8c56150b7e62b3 Mon Sep 17 00:00:00 2001
+From: Antoine Jacoutot <ajacoutot@gnome.org>
+Date: Mon, 20 Jan 2014 15:44:09 +0100
+Subject: [PATCH] audioresample: Fix build on x86 if emmintrin.h is available
+ but can't be used
+
+On i386, EMMINTRIN is defined but not usable without SSE so check for
+__SSE__ and __SSE2__ as well.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=670690
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ gst/audioresample/resample.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
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
++#if !defined(__SSE2__) || !defined(HAVE_XMMINTRIN_H)
+ #undef _USE_SSE2
+ #endif
+ #endif
+-- 
+2.1.4
+
diff --git a/package/gstreamer/gst-plugins-base/0003-audioresample-It-s-HAVE_EMMINTRIN_H-not-HAVE_XMMINTR.patch b/package/gstreamer/gst-plugins-base/0003-audioresample-It-s-HAVE_EMMINTRIN_H-not-HAVE_XMMINTR.patch
new file mode 100644
index 0000000..e67531d
--- /dev/null
+++ b/package/gstreamer/gst-plugins-base/0003-audioresample-It-s-HAVE_EMMINTRIN_H-not-HAVE_XMMINTR.patch
@@ -0,0 +1,27 @@
+From 4e3d101aa854cfee633a9689efeb75e5001baa5e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Mon, 20 Jan 2014 16:11:04 +0100
+Subject: [PATCH] audioresample: It's HAVE_EMMINTRIN_H, not HAVE_XMMINTRIN_H
+ for SSE2
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ gst/audioresample/resample.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gst/audioresample/resample.c b/gst/audioresample/resample.c
+index 481fa01..4410bdd 100644
+--- a/gst/audioresample/resample.c
++++ b/gst/audioresample/resample.c
+@@ -83,7 +83,7 @@
+ #endif
+ 
+ #ifdef _USE_SSE2
+-#if !defined(__SSE2__) || !defined(HAVE_XMMINTRIN_H)
++#if !defined(__SSE2__) || !defined(HAVE_EMMINTRIN_H)
+ #undef _USE_SSE2
+ #endif
+ #endif
+-- 
+2.1.4
+
