From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  1 May 2014 06:17:28 +0300
Subject: [Buildroot] [PATCH 2/2] flite: fix static linking against alsa
In-Reply-To: <fe00d46b244bd6b6023e6a8f87307b136938cf70.1398914248.git.baruch@tkos.co.il>
References: <fe00d46b244bd6b6023e6a8f87307b136938cf70.1398914248.git.baruch@tkos.co.il>
Message-ID: <9de46632bda63213596b0df8c278edf32a232daa.1398914248.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/3ff/3ff2217a4fccbddbdb2bc8ade68c88fc52848d36/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/flite/flite-0002-fix-alsa-static.patch | 19 +++++++++++++++++++
 package/flite/flite.mk                         |  3 +++
 2 files changed, 22 insertions(+)
 create mode 100644 package/flite/flite-0002-fix-alsa-static.patch

diff --git a/package/flite/flite-0002-fix-alsa-static.patch b/package/flite/flite-0002-fix-alsa-static.patch
new file mode 100644
index 000000000000..7ed4899cc4f7
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
index 08d2ce1622f9..38aaebf51782 100644
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
-- 
1.9.2
