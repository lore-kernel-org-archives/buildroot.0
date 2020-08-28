From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 19:51:49 +0200
Subject: [Buildroot] [git commit branch/2020.05.x]
 package/x11r7/xserver_xorg-server: security bump version to 1.20.9
Message-ID: <20200828174515.42412818F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=519da68035e9ba28a04fd61ebd41e672923d8060
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Fixes CVE-2020-14345, CVE-2020-14346, CVE-2020-14361 & CVE-2020-1436:
https://lists.x.org/archives/xorg-announce/2020-August/003058.html

Removed patch 0002, not needed anymore due to upstream commit
https://cgit.freedesktop.org/xorg/xserver/commit/configure.ac?h=server-1.20-branch&id=c601c8faf54ff9e3bcbc653421828d71042deef7

Build-tested with wayland:
checking for a useful monotonic clock ......
checking whether CLOCK_MONOTONIC is declared... yes
guessing yes

Removed patch 0007, included in upstream release.

Rebased and renumbered remaining patches.

Reformatted license hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b7f0ee878ca605c8b819bd3cdb3b5c2aaa45db47)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...onfigure.ac-Fix-check-for-CLOCK_MONOTONIC.patch | 66 ----------------------
 .../1.20.8/0007-fix-for-ZDI-11426.patch            | 36 ------------
 .../0001-modesettings-needs-dri2.patch             |  2 +-
 .../0002-Remove-check-for-useSIGIO-option.patch}   |  2 +-
 .../0003-include-misc.h-fix-uClibc-build.patch}    |  0
 ...ayland-Makefile.am-fix-build-without-glx.patch} |  0
 ...-common-xf86Init.c-fix-build-without-glx.patch} |  4 +-
 package/x11r7/xserver_xorg-server/Config.in        |  4 +-
 .../xserver_xorg-server/xserver_xorg-server.hash   | 14 ++---
 .../xserver_xorg-server/xserver_xorg-server.mk     |  5 --
 10 files changed, 13 insertions(+), 120 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/1.20.8/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch b/package/x11r7/xserver_xorg-server/1.20.8/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
deleted file mode 100644
index c5f04bf251..0000000000
--- a/package/x11r7/xserver_xorg-server/1.20.8/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-Discover monotonic clock using compile-time check
-
-monotonic clock check does not work when cross-compiling.
-
-Upstream-Status: Denied [Does not work on OpenBSD]
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-
-
-
-Original patch follows:
-
-When xorg-xserver is being cross-compiled, there is currently no way
-for us to detect whether the monotonic clock is available on the
-target system, because we aren't able to run a test program on the host
-system. Currently, in this situation, we default to not use the
-monotonic clock. One problem with this situation is that the user will
-be treated as idle when the date is updated.
-
-To fix this situation, we now use a compile-time check to detect whether the
-monotonic clock is available. This check can run just fine when we are
-cross-compiling.
-
-Signed-off-by: David James <davidjames@google.com>
-
-Downloaded from
-https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- configure.ac | 17 +++++++----------
- 1 file changed, 7 insertions(+), 10 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index f7ab48c..26e85cd 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1048,19 +1048,16 @@ if ! test "x$have_clock_gettime" = xno; then
-         CPPFLAGS="$CPPFLAGS -D_POSIX_C_SOURCE=200112L"
-     fi
- 
--    AC_RUN_IFELSE([AC_LANG_SOURCE([
-+    AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
- #include <time.h>
--
--int main(int argc, char *argv[[]]) {
--    struct timespec tp;
--
--    if (clock_gettime(CLOCK_MONOTONIC, &tp) == 0)
-+#include <unistd.h>
-+int main() {
-+#if !(defined(_POSIX_MONOTONIC_CLOCK) && _POSIX_MONOTONIC_CLOCK >= 0 && defined(CLOCK_MONOTONIC))
-+        #error No monotonic clock
-+#endif
-         return 0;
--    else
--        return 1;
- }
--    ])], [MONOTONIC_CLOCK=yes], [MONOTONIC_CLOCK=no],
--       [MONOTONIC_CLOCK="cross compiling"])
-+]])],[MONOTONIC_CLOCK=yes], [MONOTONIC_CLOCK=no])
- 
-     LIBS="$LIBS_SAVE"
-     CPPFLAGS="$CPPFLAGS_SAVE"
--- 
-2.1.4
-
diff --git a/package/x11r7/xserver_xorg-server/1.20.8/0007-fix-for-ZDI-11426.patch b/package/x11r7/xserver_xorg-server/1.20.8/0007-fix-for-ZDI-11426.patch
deleted file mode 100644
index ce623b24cb..0000000000
--- a/package/x11r7/xserver_xorg-server/1.20.8/0007-fix-for-ZDI-11426.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From aac28e162e5108510065ad4c323affd6deffd816 Mon Sep 17 00:00:00 2001
-From: Matthieu Herrb <matthieu@herrb.eu>
-Date: Sat, 25 Jul 2020 19:33:50 +0200
-Subject: [PATCH] fix for ZDI-11426
-
-Avoid leaking un-initalized memory to clients by zeroing the
-whole pixmap on initial allocation.
-
-This vulnerability was discovered by:
-Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
-
-Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
-Reviewed-by: Alan Coopersmith <alan.coopersmith@oracle.com>
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[downloaded from upstream commit
- https://gitlab.freedesktop.org/xorg/xserver/-/commit/aac28e162e5108510065ad4c323affd6deffd816]
----
- dix/pixmap.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/dix/pixmap.c b/dix/pixmap.c
-index 1186d7dbbf..5a0146bbb6 100644
---- a/dix/pixmap.c
-+++ b/dix/pixmap.c
-@@ -116,7 +116,7 @@ AllocatePixmap(ScreenPtr pScreen, int pixDataSize)
-     if (pScreen->totalPixmapSize > ((size_t) - 1) - pixDataSize)
-         return NullPixmap;
- 
--    pPixmap = malloc(pScreen->totalPixmapSize + pixDataSize);
-+    pPixmap = calloc(1, pScreen->totalPixmapSize + pixDataSize);
-     if (!pPixmap)
-         return NullPixmap;
- 
--- 
-GitLab
-
diff --git a/package/x11r7/xserver_xorg-server/1.20.8/0001-modesettings-needs-dri2.patch b/package/x11r7/xserver_xorg-server/1.20.9/0001-modesettings-needs-dri2.patch
similarity index 97%
rename from package/x11r7/xserver_xorg-server/1.20.8/0001-modesettings-needs-dri2.patch
rename to package/x11r7/xserver_xorg-server/1.20.9/0001-modesettings-needs-dri2.patch
index 97ec29d044..74917720cb 100644
--- a/package/x11r7/xserver_xorg-server/1.20.8/0001-modesettings-needs-dri2.patch
+++ b/package/x11r7/xserver_xorg-server/1.20.9/0001-modesettings-needs-dri2.patch
@@ -9,7 +9,7 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 diff -uNr xorg-server-1.17.2.org/configure.ac xorg-server-1.17.2/configure.ac
 --- xorg-server-1.17.2.org/configure.ac	2015-06-16 17:42:40.000000000 +0200
 +++ xorg-server-1.17.2/configure.ac	2015-08-08 10:44:59.702382624 +0200
-@@ -2036,7 +2036,7 @@
+@@ -1962,7 +1962,7 @@
  	        XORG_SYS_LIBS="$XORG_SYS_LIBS $XORG_MODULES_LIBS"
  	fi
  
diff --git a/package/x11r7/xserver_xorg-server/1.20.8/0003-Remove-check-for-useSIGIO-option.patch b/package/x11r7/xserver_xorg-server/1.20.9/0002-Remove-check-for-useSIGIO-option.patch
similarity index 96%
rename from package/x11r7/xserver_xorg-server/1.20.8/0003-Remove-check-for-useSIGIO-option.patch
rename to package/x11r7/xserver_xorg-server/1.20.9/0002-Remove-check-for-useSIGIO-option.patch
index d4f0cca67e..68a9d7fc75 100644
--- a/package/x11r7/xserver_xorg-server/1.20.8/0003-Remove-check-for-useSIGIO-option.patch
+++ b/package/x11r7/xserver_xorg-server/1.20.9/0002-Remove-check-for-useSIGIO-option.patch
@@ -38,7 +38,7 @@ index 884a71c..be76498 100644
      for (i = 0; i < MAX_FUNCS; i++) {
          if (!xf86SigIOFuncs[i].f) {
              if (xf86IsPipe(fd))
-@@ -256,9 +253,6 @@ xf86RemoveSIGIOHandler(int fd)
+@@ -257,9 +256,6 @@ xf86RemoveSIGIOHandler(int fd)
      int max;
      int ret;
  
diff --git a/package/x11r7/xserver_xorg-server/1.20.8/0004-include-misc.h-fix-uClibc-build.patch b/package/x11r7/xserver_xorg-server/1.20.9/0003-include-misc.h-fix-uClibc-build.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.20.8/0004-include-misc.h-fix-uClibc-build.patch
rename to package/x11r7/xserver_xorg-server/1.20.9/0003-include-misc.h-fix-uClibc-build.patch
diff --git a/package/x11r7/xserver_xorg-server/1.20.8/0005-hw-xwayland-Makefile.am-fix-build-without-glx.patch b/package/x11r7/xserver_xorg-server/1.20.9/0004-hw-xwayland-Makefile.am-fix-build-without-glx.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.20.8/0005-hw-xwayland-Makefile.am-fix-build-without-glx.patch
rename to package/x11r7/xserver_xorg-server/1.20.9/0004-hw-xwayland-Makefile.am-fix-build-without-glx.patch
diff --git a/package/x11r7/xserver_xorg-server/1.20.8/0006-hw-xfree86-common-xf86Init.c-fix-build-without-glx.patch b/package/x11r7/xserver_xorg-server/1.20.9/0005-hw-xfree86-common-xf86Init.c-fix-build-without-glx.patch
similarity index 97%
rename from package/x11r7/xserver_xorg-server/1.20.8/0006-hw-xfree86-common-xf86Init.c-fix-build-without-glx.patch
rename to package/x11r7/xserver_xorg-server/1.20.9/0005-hw-xfree86-common-xf86Init.c-fix-build-without-glx.patch
index f1fdfe3e37..de086fb665 100644
--- a/package/x11r7/xserver_xorg-server/1.20.8/0006-hw-xfree86-common-xf86Init.c-fix-build-without-glx.patch
+++ b/package/x11r7/xserver_xorg-server/1.20.9/0005-hw-xfree86-common-xf86Init.c-fix-build-without-glx.patch
@@ -32,8 +32,8 @@ diff --git a/hw/xfree86/common/xf86Init.c b/hw/xfree86/common/xf86Init.c
 index 0631c7237..e6fb11398 100644
 --- a/hw/xfree86/common/xf86Init.c
 +++ b/hw/xfree86/common/xf86Init.c
-@@ -74,7 +74,6 @@
- #include "xf86Crtc.h"
+@@ -78,7 +78,6 @@
+ #include "xf86InPriv.h"
  #include "picturestr.h"
  #include "randrstr.h"
 -#include "glxvndabi.h"
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 79968ea979..87f1b37daf 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -61,7 +61,7 @@ choice
 	bool "X Window System server version"
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_20
-	bool "1.20.8"
+	bool "1.20.9"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_24
 	select BR2_PACKAGE_XLIB_LIBXFONT2
 
@@ -79,7 +79,7 @@ endchoice
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VERSION
 	string
-	default "1.20.8" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_20
+	default "1.20.9" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_20
 	default "1.17.4" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
 	default "1.14.7" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14
 
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index f7b1bc14bf..930900c5ea 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,11 +1,11 @@
 # From http://lists.x.org/archives/xorg-announce/2014-June/002440.html
-sha1   7a95765e56b124758fcd7b609589e65b8870880b                                xorg-server-1.14.7.tar.bz2
-sha256 fcf66fa6ad86227613d2d3e8ae13ded297e2a1e947e9060a083eaf80d323451f        xorg-server-1.14.7.tar.bz2
+sha1  7a95765e56b124758fcd7b609589e65b8870880b  xorg-server-1.14.7.tar.bz2
+sha256  fcf66fa6ad86227613d2d3e8ae13ded297e2a1e947e9060a083eaf80d323451f  xorg-server-1.14.7.tar.bz2
 # From https://lists.x.org/archives/xorg-announce/2015-October/002650.html
-sha256 0c4b45c116a812a996eb432d8508cf26c2ec8c3916ff2a50781796882f8d6457        xorg-server-1.17.4.tar.bz2
-# From https://lists.x.org/archives/xorg-announce/2020-March/003041.html
-sha256 d17b646bee4ba0fb7850c1cc55b18e3e8513ed5c02bdf38da7e107f84e2d0146  xorg-server-1.20.8.tar.bz2
-sha512 ab0ec0fcbf490c61558b9297f61b58fd2dedb676c78bef6431dc9166054743b43a0091b88a8b3f4e81d1f539909440ee7e188a298cefabe13ea89159639cd805  xorg-server-1.20.8.tar.bz2
+sha256  0c4b45c116a812a996eb432d8508cf26c2ec8c3916ff2a50781796882f8d6457  xorg-server-1.17.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2020-August/003059.html
+sha256  e219f2e0dfe455467939149d7cd2ee53b79b512cc1d2094ae4f5c9ed9ccd3571  xorg-server-1.20.9.tar.bz2
+sha512  d9b5f93e1b9763a89187d8b272aa7d4ce9709641b8539f4536708af153310e5a4931bffd4229c51a3b0e3b12da7838750aa71b635751fb4c0bb27438cce4e5e6  xorg-server-1.20.9.tar.bz2
 
 # Locally calculated
-sha256 4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
+sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index bab20b5c97..8ccc04224d 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -38,11 +38,6 @@ XSERVER_XORG_SERVER_DEPENDENCIES = \
 	mcookie \
 	host-pkgconf
 
-ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_20),y)
-# 1.20.8/0007-fix-for-ZDI-11426.patch
-XSERVER_XORG_SERVER_IGNORE_CVES += CVE-2020-14347
-endif
-
 # We force -O2 regardless of the optimization level chosen by the
 # user, as the X.org server is known to trigger some compiler bugs at
 # -Os on several architectures.
