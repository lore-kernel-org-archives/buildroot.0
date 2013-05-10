From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 10 May 2013 20:42:02 +0200
Subject: [Buildroot] [git commit] pulseaudio: link against json-c
Message-ID: <20130510184445.11A2499C3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2c1a1bb1cd9fd2bd46f2d32f98a8ffc6b536b983
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an upstream patch that makes Pulseaudio link against json-c
instead of json, so that it works with json-c 0.11, and doesn't cause
problems with libjson has been also installed in the system. Note that
this fix has been merged in Pulseaudio after the 3.0 release, so we
will have to keep this patch around when bumping to 3.0.

Fixes
http://autobuild.buildroot.org/results/91ffd3196092c48b88f59adb12741b3f93064dea/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../pulseaudio-compat-with-json-c-0.11.patch       |   26 ++++++++++++++++++++
 package/multimedia/pulseaudio/pulseaudio.mk        |    6 ++++
 2 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/pulseaudio/pulseaudio-compat-with-json-c-0.11.patch b/package/multimedia/pulseaudio/pulseaudio-compat-with-json-c-0.11.patch
new file mode 100644
index 0000000..86efdfd
--- /dev/null
+++ b/package/multimedia/pulseaudio/pulseaudio-compat-with-json-c-0.11.patch
@@ -0,0 +1,26 @@
+From 759c0bc6f990240287a14fa6dec029ecea581463 Mon Sep 17 00:00:00 2001
+From: Arun Raghavan <arun.raghavan@collabora.co.uk>
+Date: Sat, 27 Apr 2013 03:27:05 +0000
+Subject: build-sys: json-c changed everything :(
+
+json-c 0.11 ships a pkg-config file with a different name, and changes
+the name of its library as well.
+---
+(limited to 'configure.ac')
+
+diff --git a/configure.ac b/configure.ac
+index c8161a4..b1bd21a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -624,7 +624,8 @@ AM_CONDITIONAL([HAVE_TESTS], [test "x$HAVE_LIBCHECK" = x1])
+ 
+ #### json parsing ####
+ 
+-PKG_CHECK_MODULES(LIBJSON, [ json >= 0.9 ])
++PKG_CHECK_MODULES(LIBJSON, [ json-c >= 0.11 ], [],
++		  [PKG_CHECK_MODULES(LIBJSON, [ json >= 0.9 ])])
+ AC_SUBST(LIBJSON_CFLAGS)
+ AC_SUBST(LIBJSON_LIBS)
+ 
+--
+cgit v0.9.0.2-2-gbebe
diff --git a/package/multimedia/pulseaudio/pulseaudio.mk b/package/multimedia/pulseaudio/pulseaudio.mk
index 16df855..aa67592 100644
--- a/package/multimedia/pulseaudio/pulseaudio.mk
+++ b/package/multimedia/pulseaudio/pulseaudio.mk
@@ -32,6 +32,12 @@ PULSEAUDIO_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING),webrtc-audio-processing) \
 	$(if $(BR2_PACKAGE_SYSTEMD),systemd)
 
+# One patch touches configure.ac. We unconditionnally need libglib2
+# because configure.ac uses AM_GLIB_GNU_GETTEXT. This unconditionnal
+# dependency can be removed once the patch is removed.
+PULSEAUDIO_AUTORECONF = YES
+PULSEAUDIO_DEPENDENCIES += libglib2
+
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
 # The optional webrtc echo canceller is written in C++, causing auto* to want
 # to link module-echo-cancel.so with CXX even if webrtc ISN'T used.
