From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Jan 2013 22:29:37 +0100
Subject: [Buildroot] [PATCH 25/28] xvkbd: fix X.org dependencies
In-Reply-To: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <9cd5652426d94c1e64d34ac861e312092483c7b5.1357507764.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xvkbd is a X.org client application, so there is no reason to depend
on the X.org server. Instead, depend on the X.org client libraries
that xvkbd actually links against.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xvkbd/Config.in |    7 +++++++
 package/xvkbd/xvkbd.mk  |   11 ++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/xvkbd/Config.in b/package/xvkbd/Config.in
index a75687d..bd3f2aa 100644
--- a/package/xvkbd/Config.in
+++ b/package/xvkbd/Config.in
@@ -1,7 +1,14 @@
 config BR2_PACKAGE_XVKBD
 	bool "xvkbd"
 	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBICE
+	select BR2_PACKAGE_XLIB_LIBSM
+	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXAW
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXMU
+	select BR2_PACKAGE_XLIB_LIBXPM
+	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XLIB_LIBXTST
 	help
 	  on-screen keyboard for X
diff --git a/package/xvkbd/xvkbd.mk b/package/xvkbd/xvkbd.mk
index ec63027..ae81f84 100644
--- a/package/xvkbd/xvkbd.mk
+++ b/package/xvkbd/xvkbd.mk
@@ -10,7 +10,16 @@ XVKBD_SITE = http://homepage3.nifty.com/tsato/xvkbd
 XVKBD_MAKE_OPT = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" LD="$(TARGET_CC)" \
 				CFLAGS="-O2 -I$(STAGING_DIR)/usr/include" USRLIBDIR="$(STAGING_DIR)/usr/lib"
 
-XVKBD_DEPENDENCIES = xserver_xorg-server xlib_libXaw xlib_libXtst
+XVKBD_DEPENDENCIES = \
+	xlib_libICE \
+	xlib_libSM \
+	xlib_libX11 \
+	xlib_libXaw \
+	xlib_libXext \
+	xlib_libXmu \
+	xlib_libXpm \
+	xlib_libXt \
+	xlib_libXtst
 
 $(eval $(autotools-package))
 
-- 
1.7.9.5
