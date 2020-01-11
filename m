From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 11 Jan 2020 11:21:15 +0100
Subject: [Buildroot] [git commit branch/2019.11.x]
 package/x11r7/xserver_xorg-server: bump version to 1.20.6
Message-ID: <20200111103733.6E17E88FFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=67d29be910602905c18cff91e17ed607d2686b5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Removed patches 0006 & 0007 which were applied upstream as single
commit on the server-1.20-branch branch:
https://gitlab.freedesktop.org/xorg/xserver/commit/07efd81b819f21046afc0bb7e19a6cdf7f3c7ea9

Updated upstream URL for patch 0001.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5f90daa66f32e874185e289b71f00bad74b96461)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ler.h-only-use-inx-outx-on-ARM-with-glibc.patch | 34 ------------
 ...Do-not-include-sys-io.h-on-ARM-with-glibc.patch | 62 ----------------------
 .../0001-modesettings-needs-dri2.patch             |  2 +-
 ...onfigure.ac-Fix-check-for-CLOCK_MONOTONIC.patch |  0
 .../0003-Remove-check-for-useSIGIO-option.patch    |  0
 .../0004-include-misc.h-fix-uClibc-build.patch     |  0
 ...wayland-Makefile.am-fix-build-without-glx.patch |  0
 package/x11r7/xserver_xorg-server/Config.in        |  4 +-
 .../xserver_xorg-server/xserver_xorg-server.hash   | 10 ++--
 9 files changed, 8 insertions(+), 104 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/1.20.5/0006-compiler.h-only-use-inx-outx-on-ARM-with-glibc.patch b/package/x11r7/xserver_xorg-server/1.20.5/0006-compiler.h-only-use-inx-outx-on-ARM-with-glibc.patch
deleted file mode 100644
index e6f2b4382e..0000000000
--- a/package/x11r7/xserver_xorg-server/1.20.5/0006-compiler.h-only-use-inx-outx-on-ARM-with-glibc.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 6a2ce6c5da9456b97683db6224f38ef3b02cce4b Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Thu, 20 Sep 2018 13:21:34 +0100
-Subject: [PATCH] compiler.h: only use inx/outx on ARM with glibc
-
-musl only implements inx/outx on x86, so check for __GLIBC__ instead of
-__linux__.
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-[Upstream: https://gitlab.freedesktop.org/xorg/xserver/commit/6a2ce6c5da9456b97683db6224f38ef3b02cce4b.patch]
-Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
----
- hw/xfree86/common/compiler.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/hw/xfree86/common/compiler.h b/hw/xfree86/common/compiler.h
-index 7144c6a27..fb53ced80 100644
---- a/hw/xfree86/common/compiler.h
-+++ b/hw/xfree86/common/compiler.h
-@@ -758,9 +758,9 @@ inl(unsigned short port)
-     return xf86ReadMmio32Le((void *) ioBase, port);
- }
- 
--#elif defined(__arm__) && defined(__linux__)
-+#elif defined(__arm__) && defined(__GLIBC__)
- 
--/* for Linux on ARM, we use the LIBC inx/outx routines */
-+/* for glibc on ARM, we use the LIBC inx/outx routines */
- /* note that the appropriate setup via "ioperm" needs to be done */
- /*  *before* any inx/outx is done. */
- 
--- 
-2.23.0
-
diff --git a/package/x11r7/xserver_xorg-server/1.20.5/0007-compiler.h-Do-not-include-sys-io.h-on-ARM-with-glibc.patch b/package/x11r7/xserver_xorg-server/1.20.5/0007-compiler.h-Do-not-include-sys-io.h-on-ARM-with-glibc.patch
deleted file mode 100644
index 87ef064bf7..0000000000
--- a/package/x11r7/xserver_xorg-server/1.20.5/0007-compiler.h-Do-not-include-sys-io.h-on-ARM-with-glibc.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From fe4cd0e7f5c58fa94db36326aadc1bd4e6d73eba Mon Sep 17 00:00:00 2001
-From: Olivier Fourdan <ofourdan@redhat.com>
-Date: Mon, 1 Jul 2019 13:20:39 +0200
-Subject: [PATCH] compiler.h: Do not include sys/io.h on ARM with glibc
-
-<sys/io.h> on ARM hasn't worked for a long, long time, so it was removed
-it from glibc upstream.
-
-Remove the include to avoid a compilation failure on ARM with glibc.
-
-Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
-Closes: https://gitlab.freedesktop.org/xorg/xserver/issues/840
-[Upstream: https://gitlab.freedesktop.org/xorg/xserver/commit/fe4cd0e7f5c58fa94db36326aadc1bd4e6d73eba.patch]
-Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
----
- hw/xfree86/common/compiler.h | 30 ------------------------------
- 1 file changed, 30 deletions(-)
-
-diff --git a/hw/xfree86/common/compiler.h b/hw/xfree86/common/compiler.h
-index fb53ced80..2b2008b3f 100644
---- a/hw/xfree86/common/compiler.h
-+++ b/hw/xfree86/common/compiler.h
-@@ -758,36 +758,6 @@ inl(unsigned short port)
-     return xf86ReadMmio32Le((void *) ioBase, port);
- }
- 
--#elif defined(__arm__) && defined(__GLIBC__)
--
--/* for glibc on ARM, we use the LIBC inx/outx routines */
--/* note that the appropriate setup via "ioperm" needs to be done */
--/*  *before* any inx/outx is done. */
--
--#include <sys/io.h>
--
--static __inline__ void
--xf_outb(unsigned short port, unsigned char val)
--{
--    outb(val, port);
--}
--
--static __inline__ void
--xf_outw(unsigned short port, unsigned short val)
--{
--    outw(val, port);
--}
--
--static __inline__ void
--xf_outl(unsigned short port, unsigned int val)
--{
--    outl(val, port);
--}
--
--#define outb xf_outb
--#define outw xf_outw
--#define outl xf_outl
--
- #elif defined(__nds32__)
- 
- /*
--- 
-2.23.0
-
diff --git a/package/x11r7/xserver_xorg-server/1.20.5/0001-modesettings-needs-dri2.patch b/package/x11r7/xserver_xorg-server/1.20.6/0001-modesettings-needs-dri2.patch
similarity index 89%
rename from package/x11r7/xserver_xorg-server/1.20.5/0001-modesettings-needs-dri2.patch
rename to package/x11r7/xserver_xorg-server/1.20.6/0001-modesettings-needs-dri2.patch
index 790371c456..97ec29d044 100644
--- a/package/x11r7/xserver_xorg-server/1.20.5/0001-modesettings-needs-dri2.patch
+++ b/package/x11r7/xserver_xorg-server/1.20.6/0001-modesettings-needs-dri2.patch
@@ -1,7 +1,7 @@
 Kernel modesettings support also depends on dri2, see
 http://cgit.freedesktop.org/xorg/xserver/tree/hw/xfree86/drivers/modesetting/Makefile.am#n46
 
-Patch sent upstream: https://bugs.freedesktop.org/show_bug.cgi?id=91584
+Patch sent upstream: https://gitlab.freedesktop.org/xorg/xserver/issues/479
 
 [rebased for version 1.20.0]
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
diff --git a/package/x11r7/xserver_xorg-server/1.20.5/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch b/package/x11r7/xserver_xorg-server/1.20.6/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.20.5/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
rename to package/x11r7/xserver_xorg-server/1.20.6/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
diff --git a/package/x11r7/xserver_xorg-server/1.20.5/0003-Remove-check-for-useSIGIO-option.patch b/package/x11r7/xserver_xorg-server/1.20.6/0003-Remove-check-for-useSIGIO-option.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.20.5/0003-Remove-check-for-useSIGIO-option.patch
rename to package/x11r7/xserver_xorg-server/1.20.6/0003-Remove-check-for-useSIGIO-option.patch
diff --git a/package/x11r7/xserver_xorg-server/1.20.5/0004-include-misc.h-fix-uClibc-build.patch b/package/x11r7/xserver_xorg-server/1.20.6/0004-include-misc.h-fix-uClibc-build.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.20.5/0004-include-misc.h-fix-uClibc-build.patch
rename to package/x11r7/xserver_xorg-server/1.20.6/0004-include-misc.h-fix-uClibc-build.patch
diff --git a/package/x11r7/xserver_xorg-server/1.20.5/0005-hw-xwayland-Makefile.am-fix-build-without-glx.patch b/package/x11r7/xserver_xorg-server/1.20.6/0005-hw-xwayland-Makefile.am-fix-build-without-glx.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.20.5/0005-hw-xwayland-Makefile.am-fix-build-without-glx.patch
rename to package/x11r7/xserver_xorg-server/1.20.6/0005-hw-xwayland-Makefile.am-fix-build-without-glx.patch
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index ec4ba91502..982b9bcb4e 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -61,7 +61,7 @@ choice
 	bool "X Window System server version"
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_20
-	bool "1.20.5"
+	bool "1.20.6"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_24
 	select BR2_PACKAGE_XLIB_LIBXFONT2
 
@@ -79,7 +79,7 @@ endchoice
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VERSION
 	string
-	default "1.20.5" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_20
+	default "1.20.6" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_20
 	default "1.17.4" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
 	default "1.14.7" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14
 
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index fe2a7ae55a..cd1b560162 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -3,11 +3,11 @@ sha1   7a95765e56b124758fcd7b609589e65b8870880b                                x
 sha256 fcf66fa6ad86227613d2d3e8ae13ded297e2a1e947e9060a083eaf80d323451f        xorg-server-1.14.7.tar.bz2
 # From https://lists.x.org/archives/xorg-announce/2015-October/002650.html
 sha256 0c4b45c116a812a996eb432d8508cf26c2ec8c3916ff2a50781796882f8d6457        xorg-server-1.17.4.tar.bz2
-# From https://lists.x.org/archives/xorg-announce/2019-May/002993.html
-md5 c9fc7e21e11286dbedd22c00df652130  xorg-server-1.20.5.tar.bz2
-sha1 fea6fd34c7f48b3c69fbecd8fb294eaa1498e69c  xorg-server-1.20.5.tar.bz2
-sha256 a81d8243f37e75a03d4f8c55f96d0bc25802be6ec45c3bfa5cb614c6d01bac9d  xorg-server-1.20.5.tar.bz2
-sha512 625f0626b122cf95600abe382c3217348999357a0e2d2443092f1b67cff1c98d7ef09303884ceaeac181e0555dc56b0d4d44bda45cc464dac2d9a50c5b32d631  xorg-server-1.20.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-November/003032.html
+md5 a98170084f2c8fed480d2ff601f8a14b  xorg-server-1.20.6.tar.bz2
+sha1 59473e72136113f3a35b1ab5a5cfcbcad955b660  xorg-server-1.20.6.tar.bz2
+sha256 6316146304e6e8a36d5904987ae2917b5d5b195dc9fc63d67f7aca137e5a51d1  xorg-server-1.20.6.tar.bz2
+sha512 9aa0ba4aee92fe628f2b8c41e4fe0134dc86154bb8787f907884ef2fd970e18e68e72ea8a1beb706d11ecf155b2abc9731f1abadff251ed592f8cca3b1240dd6  xorg-server-1.20.6.tar.bz2
 
 # Locally calculated
 sha256 4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
