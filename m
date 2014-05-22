From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 May 2014 11:17:48 +0200
Subject: [Buildroot] [git commit] flite: fix static linking against alsa
Message-ID: <20140522095505.7097C9CD33@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=78271772e3dcb09fe7f9a249e896acd925e7fc79
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/3ff/3ff2217a4fccbddbdb2bc8ade68c88fc52848d36/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flite/flite-0002-fix-alsa-static.patch |   19 +++++++++++++++++++
 package/flite/flite.mk                         |    3 +++
 2 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/flite/flite-0002-fix-alsa-static.patch b/package/flite/flite-0002-fix-alsa-static.patch
new file mode 100644
index 0000000..7ed4899
--- /dev/null
+++ b/package/flite/flite-0002-fix-alsa-static.patch
@@ -0,0 +1,19 @@
+Use pkg-config to determine alsa link flags. This fixes static linking.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+
+diff -Nuar flite-1.4-release.orig/configure.in flite-1.4-release/configure.in
+--- flite-1.4-release.orig/configure.in	2009-08-14 23:46:38.000000000 +0300
++++ flite-1.4-release/configure.in	2014-04-30 18:52:33.253297236 +0300
+@@ -275,7 +275,10 @@
+                 #endif],
+               [AUDIODRIVER="alsa"
+ 	       AUDIODEFS=-DCST_AUDIO_ALSA
+-               AUDIOLIBS=-lasound])
++               AUDIOLIBS=`pkg-config --libs alsa`
++               if test "$shared" = false; then
++                   AUDIOLIBS=`pkg-config --libs --static alsa`
++               fi])
+ AC_CHECK_HEADER(mmsystem.h,
+ 	      [AUDIODRIVER="wince"
+ 	       AUDIODEFS=-DCST_AUDIO_WINCE
diff --git a/package/flite/flite.mk b/package/flite/flite.mk
index 08d2ce1..38aaebf 100644
--- a/package/flite/flite.mk
+++ b/package/flite/flite.mk
@@ -11,6 +11,9 @@ FLITE_LICENSE = BSD-4c
 FLITE_LICENSE_FILES = COPYING
 
 FLITE_INSTALL_STAGING = YES
+# Patching configure.in
+FLITE_AUTORECONF = YES
+FLITE_DEPENDENCIES = host-pkgconf
 
 # Sadly, Flite does not support parallel build, especially when building its
 # shared libraries.
