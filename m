From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jun 2012 11:48:27 +0200
Subject: [Buildroot] [PATCH] libnspr: fix build issue on ARM with certain
	toolchains
Message-ID: <1340185707-6285-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes issues like
http://autobuild.buildroot.org/results/aed444bf37b9e289866a9b6c754ed74a3cc0f3b2/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libnspr/libnspr-fix-flags.patch |   65 +++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 package/libnspr/libnspr-fix-flags.patch

diff --git a/package/libnspr/libnspr-fix-flags.patch b/package/libnspr/libnspr-fix-flags.patch
new file mode 100644
index 0000000..d5ad4fa
--- /dev/null
+++ b/package/libnspr/libnspr-fix-flags.patch
@@ -0,0 +1,65 @@
+Fix build issues on ARM with certain toolchains
+
+Some gcc/binutils combinations do not like having a space between
+"-Wa," and the following assembler option, so we simply remove those
+spaces.
+
+However, fixing the configure.in is not sufficient, because libnspr
+absolutely requires the prehistoric autoconf 2.13 to re-generate the
+configure script. So, since the patch to the configure script is not
+horrible, we also patch this script directly.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/mozilla/nsprpub/configure.in
+===================================================================
+--- a/mozilla/nsprpub/configure.in
++++ b/mozilla/nsprpub/configure.in
+@@ -925,8 +925,8 @@
+   case "$target_cpu" in
+     arm*)
+       if test "$GNU_CC"; then
+-        CFLAGS="$CFLAGS -march=armv7-a -mthumb -Wa, -march=armv7-a -Wa, -mthumb"
+-        CXXFLAGS="$CXXFLAGS -march=armv7-a -mthumb -Wa, -march=armv7-a -Wa, -mthumb"
++        CFLAGS="$CFLAGS -march=armv7-a -mthumb -Wa,-march=armv7-a -Wa,-mthumb"
++        CXXFLAGS="$CXXFLAGS -march=armv7-a -mthumb -Wa,-march=armv7-a -Wa,-mthumb"
+         ASFLAGS="$ASFLAGS -march=armv7-a -mthumb"
+       else
+         AC_MSG_ERROR([--enable-thumb2 is not supported for non-GNU toolchains])
+@@ -940,8 +940,8 @@
+   case "$target_cpu" in
+     arm*)
+       if test "$GNU_CC"; then
+-       CFLAGS="$CFLAGS -march=armv5te -mthumb-interwork -Wa, -march=armv5te -Wa, -mthumb-interwork"
+-        CXXFLAGS="$CXXFLAGS -march=armv5te -mthumb-interwork -Wa, -march=armv5te -Wa, -mthumb-interwork"
++       CFLAGS="$CFLAGS -march=armv5te -mthumb-interwork -Wa,-march=armv5te -Wa,-mthumb-interwork"
++        CXXFLAGS="$CXXFLAGS -march=armv5te -mthumb-interwork -Wa,-march=armv5te -Wa,-mthumb-interwork"
+         ASFLAGS="$ASFLAGS -march=armv5te -mthumb-interwork"
+       fi
+       ;;
+Index: b/mozilla/nsprpub/configure
+===================================================================
+--- a/mozilla/nsprpub/configure
++++ b/mozilla/nsprpub/configure
+@@ -3101,8 +3101,8 @@
+   case "$target_cpu" in
+     arm*)
+       if test "$GNU_CC"; then
+-        CFLAGS="$CFLAGS -march=armv7-a -mthumb -Wa, -march=armv7-a -Wa, -mthumb"
+-        CXXFLAGS="$CXXFLAGS -march=armv7-a -mthumb -Wa, -march=armv7-a -Wa, -mthumb"
++        CFLAGS="$CFLAGS -march=armv7-a -mthumb -Wa,-march=armv7-a -Wa,-mthumb"
++        CXXFLAGS="$CXXFLAGS -march=armv7-a -mthumb -Wa,-march=armv7-a -Wa,-mthumb"
+         ASFLAGS="$ASFLAGS -march=armv7-a -mthumb"
+       else
+         { echo "configure: error: --enable-thumb2 is not supported for non-GNU toolchains" 1>&2; exit 1; }
+@@ -3116,8 +3116,8 @@
+   case "$target_cpu" in
+     arm*)
+       if test "$GNU_CC"; then
+-       CFLAGS="$CFLAGS -march=armv5te -mthumb-interwork -Wa, -march=armv5te -Wa, -mthumb-interwork"
+-        CXXFLAGS="$CXXFLAGS -march=armv5te -mthumb-interwork -Wa, -march=armv5te -Wa, -mthumb-interwork"
++       CFLAGS="$CFLAGS -march=armv5te -mthumb-interwork -Wa,-march=armv5te -Wa,-mthumb-interwork"
++        CXXFLAGS="$CXXFLAGS -march=armv5te -mthumb-interwork -Wa,-march=armv5te -Wa,-mthumb-interwork"
+         ASFLAGS="$ASFLAGS -march=armv5te -mthumb-interwork"
+       fi
+       ;;
-- 
1.7.9.5
