From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Jul 2018 23:10:41 +0200
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server: bump
 version to 1.20.0
Message-ID: <20180728211152.4A3C47F885@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f906302354e133b81ae8067b775061107e93636a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebased patch 0001 after upstream commit:
https://cgit.freedesktop.org/xorg/xserver/commit/configure.ac?id=e0748b10a8621066b404d713a76826907da777b9

Removed patch 0004, applied upstream:
https://cgit.freedesktop.org/xorg/xserver/commit/glx/glxscreens.c?id=d16133e3e293fe16b291114d344fbd5a61d5ed65

Added legacy handling for internal version option.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                   |  7 +++++
 ...clude-compositeext.h-if-COMPOSITE-is-supp.patch | 31 ----------------------
 .../0001-modesettings-needs-dri2.patch             |  5 ++--
 ...onfigure.ac-Fix-check-for-CLOCK_MONOTONIC.patch |  0
 .../0003-Remove-check-for-useSIGIO-option.patch    |  0
 .../0004-include-misc.h-fix-uClibc-build.patch     | 31 ++++++++++++++++++++++
 package/x11r7/xserver_xorg-server/Config.in        | 12 ++++-----
 .../xserver_xorg-server/xserver_xorg-server.hash   | 10 +++----
 8 files changed, 52 insertions(+), 44 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 8afb489d58..29d5b6adcc 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2018.08"
 
+config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_19
+	bool "Modular X.org server was updated to version 1.20.0"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_20
+	help
+	  Modular X.org server was updated to version 1.20.0
+
 config BR2_PACKAGE_XPROTO_APPLEWMPROTO
 	bool "xproto-applewmproto package replaced by xorgproto"
 	select BR2_LEGACY
diff --git a/package/x11r7/xserver_xorg-server/1.19.6/0004-glx-Only-include-compositeext.h-if-COMPOSITE-is-supp.patch b/package/x11r7/xserver_xorg-server/1.19.6/0004-glx-Only-include-compositeext.h-if-COMPOSITE-is-supp.patch
deleted file mode 100644
index 93be91ae7f..0000000000
--- a/package/x11r7/xserver_xorg-server/1.19.6/0004-glx-Only-include-compositeext.h-if-COMPOSITE-is-supp.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From d16133e3e293fe16b291114d344fbd5a61d5ed65 Mon Sep 17 00:00:00 2001
-From: Jeremy Huddleston Sequoia <jeremyhu@apple.com>
-Date: Thu, 20 Jul 2017 19:48:26 -0700
-Subject: [PATCH] glx: Only include compositeext.h if COMPOSITE is
- supported
-
-Regressed-in: ea483af99a6351323afe00a0b630cd63310efdb1
-Signed-off-by: Jeremy Huddleston Sequoia <jeremyhu@apple.com>
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- glx/glxscreens.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/glx/glxscreens.c b/glx/glxscreens.c
-index 78e0aaff9..609661274 100644
---- a/glx/glxscreens.c
-+++ b/glx/glxscreens.c
-@@ -43,7 +43,10 @@
- #include "glxutil.h"
- #include "glxext.h"
- #include "protocol-versions.h"
-+
-+#ifdef COMPOSITE
- #include "compositeext.h"
-+#endif
- 
- static DevPrivateKeyRec glxScreenPrivateKeyRec;
- 
--- 
-2.11.0
-
diff --git a/package/x11r7/xserver_xorg-server/1.19.6/0001-modesettings-needs-dri2.patch b/package/x11r7/xserver_xorg-server/1.20.0/0001-modesettings-needs-dri2.patch
similarity index 88%
rename from package/x11r7/xserver_xorg-server/1.19.6/0001-modesettings-needs-dri2.patch
rename to package/x11r7/xserver_xorg-server/1.20.0/0001-modesettings-needs-dri2.patch
index 4ef95efc3e..790371c456 100644
--- a/package/x11r7/xserver_xorg-server/1.19.6/0001-modesettings-needs-dri2.patch
+++ b/package/x11r7/xserver_xorg-server/1.20.0/0001-modesettings-needs-dri2.patch
@@ -3,6 +3,7 @@ http://cgit.freedesktop.org/xorg/xserver/tree/hw/xfree86/drivers/modesetting/Mak
 
 Patch sent upstream: https://bugs.freedesktop.org/show_bug.cgi?id=91584
 
+[rebased for version 1.20.0]
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 
 diff -uNr xorg-server-1.17.2.org/configure.ac xorg-server-1.17.2/configure.ac
@@ -14,6 +15,6 @@ diff -uNr xorg-server-1.17.2.org/configure.ac xorg-server-1.17.2/configure.ac
  
 -	if test "x$DRM" = xyes; then
 +	if test "x$DRM" = xyes -a "x$DRI2" = xyes; then
- 		dnl 2.4.46 is required for cursor hotspot support.
- 		PKG_CHECK_EXISTS(libdrm >= 2.4.46)
  		XORG_DRIVER_MODESETTING=yes
+ 	fi
+ 
diff --git a/package/x11r7/xserver_xorg-server/1.19.6/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch b/package/x11r7/xserver_xorg-server/1.20.0/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.19.6/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
rename to package/x11r7/xserver_xorg-server/1.20.0/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
diff --git a/package/x11r7/xserver_xorg-server/1.19.6/0003-Remove-check-for-useSIGIO-option.patch b/package/x11r7/xserver_xorg-server/1.20.0/0003-Remove-check-for-useSIGIO-option.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.19.6/0003-Remove-check-for-useSIGIO-option.patch
rename to package/x11r7/xserver_xorg-server/1.20.0/0003-Remove-check-for-useSIGIO-option.patch
diff --git a/package/x11r7/xserver_xorg-server/1.20.0/0004-include-misc.h-fix-uClibc-build.patch b/package/x11r7/xserver_xorg-server/1.20.0/0004-include-misc.h-fix-uClibc-build.patch
new file mode 100644
index 0000000000..562aa79fbb
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/1.20.0/0004-include-misc.h-fix-uClibc-build.patch
@@ -0,0 +1,31 @@
+From 2e8fca00f5bdb02f2f59aaa428d1e9d808ab0e86 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 16 Jun 2018 19:20:16 +0200
+Subject: [PATCH] include/misc.h: fix uClibc build
+
+A similar fix was used for Dovecot:
+https://www.dovecot.org/list/dovecot/2017-November/110019.html
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ include/misc.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/include/misc.h b/include/misc.h
+index 14920c3c3..390e52b60 100644
+--- a/include/misc.h
++++ b/include/misc.h
+@@ -185,6 +185,10 @@ typedef struct _xReq *xReqPtr;
+ #endif
+ #endif
+ 
++#undef bswap_16
++#undef bswap_32
++#undef bswap_64
++
+ /**
+  * Calculate the number of bytes needed to hold bits.
+  * @param bits The minimum number of bits needed.
+-- 
+2.17.1
+
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 16422316fc..5af4d09eed 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -48,21 +48,21 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_14
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
 	bool
 
-config BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_23
+config BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_24
 	bool
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI
 	int
 	default 14 if BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_14
 	default 19 if BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
-	default 23 if BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_23
+	default 24 if BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_24
 
 choice
 	bool "X Window System server version"
 
-config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_19
-	bool "1.19.6"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_23
+config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_20
+	bool "1.20.0"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_24
 	select BR2_PACKAGE_XLIB_LIBXFONT2
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
@@ -79,7 +79,7 @@ endchoice
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VERSION
 	string
-	default "1.19.6" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_19
+	default "1.20.0" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_20
 	default "1.17.4" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
 	default "1.14.7" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14
 
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 10285abf12..691229a834 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -3,8 +3,8 @@ sha1   7a95765e56b124758fcd7b609589e65b8870880b                                x
 sha256 fcf66fa6ad86227613d2d3e8ae13ded297e2a1e947e9060a083eaf80d323451f        xorg-server-1.14.7.tar.bz2
 # From https://lists.x.org/archives/xorg-announce/2015-October/002650.html
 sha256 0c4b45c116a812a996eb432d8508cf26c2ec8c3916ff2a50781796882f8d6457        xorg-server-1.17.4.tar.bz2
-# From https://lists.x.org/archives/xorg-announce/2017-December/002830.html
-md5 3e47777ff034a331aed2322b078694a8  xorg-server-1.19.6.tar.bz2
-sha1 2dd560ac49bdbda7f67166546af43541fabf517f  xorg-server-1.19.6.tar.bz2
-sha256 a732502f1db000cf36a376cd0c010ffdbf32ecdd7f1fa08ba7f5bdf9601cc197  xorg-server-1.19.6.tar.bz2
-sha512 38519a8d0af9dd034045fc346959496dd718fa59b6188307974797a1cd9c349deb54987f6232ea8396baf810dcc710c0ff191f76ed2186cae4d44921b3680412  xorg-server-1.19.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-May/002893.html
+md5 c1ca1ea0a905ea788da03c77cc38b06e  xorg-server-1.20.0.tar.bz2
+sha1 a9e999c15a2322bc423d5d6e1978ba38f9635901  xorg-server-1.20.0.tar.bz2
+sha256 9d967d185f05709274ee0c4f861a4672463986e550ca05725ce27974f550d3e6  xorg-server-1.20.0.tar.bz2
+sha512 1489e8511c9da682ef0460182dfeeddd241c72d4ef4d206d9706f1e39572c09953df851fab18cefb65a1ee4c6710c6ba13c63c9c9fc0bc1b5f12c50780412cde  xorg-server-1.20.0.tar.bz2
