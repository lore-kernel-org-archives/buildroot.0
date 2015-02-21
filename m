From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Feb 2015 23:36:21 +0100
Subject: [Buildroot] [PATCH 08/11 v5] package/freerdp: add options to
	enable/disable server and/or client
In-Reply-To: <cover.1424558036.git.yann.morin.1998@free.fr>
References: <cover.1424558036.git.yann.morin.1998@free.fr>
Message-ID: <44fb109d81db4309f73d7f85fcd533c3f1dee6cb.1424558036.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building the client or the server requires an X.Org stack.

Since freerdp can also be used for weston (wayland-based, hence no X.Org
stack), we may want to disable the client and server.

Conversely, even with an X.Org stack, we may want to enable either or
none if we're just interested in the library.

Add two options, one to enable the server, the other the client; the
client option defaults to 'Y' so that a previous .config can be re-used
as-is, and exhibit the same behaviour as before; the server option
defaults to 'N' as we were not ever building the server so far.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>

---
Changes v2 -> v3:
  - use -fPIC only for that library that needs it, not the whole
    package  (Samuel)
  - fix X.Org dependencies  (Samuel)
  - don't default server to 'Y'
---
 package/freerdp/Config.in                          | 25 ++++++++-
 .../freerdp-0002-fix-building-shared-libs.patch    | 23 ++++++++
 package/freerdp/freerdp.mk                         | 62 ++++++++++++++++++++--
 3 files changed, 105 insertions(+), 5 deletions(-)
 create mode 100644 package/freerdp/freerdp-0002-fix-building-shared-libs.patch

diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
index 09efbc0..47fd8be 100644
--- a/package/freerdp/Config.in
+++ b/package/freerdp/Config.in
@@ -2,9 +2,32 @@ config BR2_PACKAGE_FREERDP
 	bool "freerdp"
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
 	help
 	  FreeRDP is a free implementation of the Remote Desktop
 	  Protocol (RDP), released under the Apache license
 
+	  This only installs the freerdp library.
+
 	  http://www.freerdp.com/
+
+if BR2_PACKAGE_FREERDP
+
+config BR2_PACKAGE_FREERDP_SERVER
+	bool "build server"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXDAMAGE
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXFIXES
+
+config BR2_PACKAGE_FREERDP_CLIENT
+	bool "build client"
+	default y
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+
+comment "freerdp server and client need X.Org"
+	depends on !BR2_PACKAGE_XORG7
+
+endif
diff --git a/package/freerdp/freerdp-0002-fix-building-shared-libs.patch b/package/freerdp/freerdp-0002-fix-building-shared-libs.patch
new file mode 100644
index 0000000..420f3d3
--- /dev/null
+++ b/package/freerdp/freerdp-0002-fix-building-shared-libs.patch
@@ -0,0 +1,23 @@
+winpr/tools: fix building shared libs
+
+libwinpr-makecert-tool.a is used to build libxfreerdp-server.so, so even
+if we are building a static libwinpr-makecert-tool.a library, we need to
+build it with -fPIC.
+
+Patch and commit log suggested by Samuel MARTIN.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Cc: Samuel Martin <s.martin49@gmail.com>
+
+diff -durN freerdp-440916eae2e07463912d5fe507677e67096eb083.orig/winpr/tools/makecert/CMakeLists.txt freerdp-440916eae2e07463912d5fe507677e67096eb083/winpr/tools/makecert/CMakeLists.txt
+--- freerdp-440916eae2e07463912d5fe507677e67096eb083.orig/winpr/tools/makecert/CMakeLists.txt	2014-08-25 06:52:43.000000000 -0700
++++ freerdp-440916eae2e07463912d5fe507677e67096eb083/winpr/tools/makecert/CMakeLists.txt	2014-10-24 15:39:39.600319523 -0700
+@@ -43,3 +43,8 @@
+ 
+ set_property(TARGET ${MODULE_NAME} PROPERTY FOLDER "WinPR/Tools")
+ 
++if(BUILD_SHARED_LIBS)
++	# build libwinpr-makecert-tool.a with PIC because it is used to build
++	# the shared library libxfreerdp-server.so.
++	set_property(TARGET ${MODULE_NAME} PROPERTY POSITION_INDEPENDENT_CODE TRUE)
++endif()
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index cf96ff4..33eacc2 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -64,13 +64,33 @@ ifeq ($(BR2_arm)$(BR2_armeb),y)
 FREERDP_CONF_OPTS += -DARM_FP_ABI=$(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
 endif
 
-ifeq ($(BR2_PACKAGE_XLIB_LIBXEXT),y)
-FREERDP_DEPENDENCIES += xlib_libXext
-FREERDP_CONF_OPTS += -DWITH_X11=ON
+#---------------------------------------
+# Enabling server and/or client
+
+ifeq ($(BR2_PACKAGE_FREERDP_SERVER),y)
+FREERDP_CONF_OPTS += -DWITH_SERVER=ON -DWITH_SERVER_INTERFACE=ON
 else
-FREERDP_CONF_OPTS += -DWITH_X11=OFF
+FREERDP_CONF_OPTS += -DWITH_SERVER=OFF -DWITH_SERVER_INTERFACE=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_FREERDP_CLIENT),y)
+FREERDP_CONF_OPTS += -DWITH_CLIENT=ON -DWITH_CLIENT_INTERFACE=ON
+else
+FREERDP_CONF_OPTS += -DWITH_CLIENT=OFF -DWITH_CLIENT_INTERFACE=OFF
+endif
+
+#---------------------------------------
+# X.Org libs for client and/or server
+
+ifneq ($(BR2_PACKAGE_FREERDP_SERVER)$(BR2_PACKAGE_FREERDP_CLIENT),)
+
+# Those two are mandatory for both the server and the client
+FREERDP_DEPENDENCIES += xlib_libX11 xlib_libXext
+FREERDP_CONF_OPTS += -DWITH_X11=ON
+
+# The following libs are either optional or mandatory only for either
+# the server or the client. A mandatory library for either one is
+# selected from Kconfig, so we can make it conditional here
 ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
 FREERDP_CONF_OPTS += -DWITH_XCURSOR=ON
 FREERDP_DEPENDENCIES += xlib_libXcursor
@@ -78,6 +98,20 @@ else
 FREERDP_CONF_OPTS += -DWITH_XCURSOR=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXDAMAGE),y)
+FREERDP_CONF_OPTS += -DWITH_XDAMAGE=ON
+FREERDP_DEPENDENCIES += xlib_libXdamage
+else
+FREERDP_CONF_OPTS += -DWITH_XDAMAGE=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXFIXES),y)
+FREERDP_CONF_OPTS += -DWITH_XFIXES=ON
+FREERDP_DEPENDENCIES += xlib_libXfixes
+else
+FREERDP_CONF_OPTS += -DWITH_XFIXES=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBXI),y)
 FREERDP_CONF_OPTS += -DWITH_XI=ON
 FREERDP_DEPENDENCIES += xlib_libXi
@@ -99,6 +133,13 @@ else
 FREERDP_CONF_OPTS += -DWITH_XKBFILE=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
+FREERDP_CONF_OPTS += -DWITH_XRANDR=ON
+FREERDP_DEPENDENCIES += xlib_libXrandr
+else
+FREERDP_CONF_OPTS += -DWITH_XRANDR=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBXRENDER),y)
 FREERDP_CONF_OPTS += -DWITH_XRENDER=ON
 FREERDP_DEPENDENCIES += xlib_libXrender
@@ -106,6 +147,13 @@ else
 FREERDP_CONF_OPTS += -DWITH_XRENDER=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXTST),y)
+FREERDP_CONF_OPTS += -DWITH_XTEST=ON
+FREERDP_DEPENDENCIES += xlib_libXtst
+else
+FREERDP_CONF_OPTS += -DWITH_XTEST=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBXV),y)
 FREERDP_CONF_OPTS += -DWITH_XV=ON
 FREERDP_DEPENDENCIES += xlib_libXv
@@ -113,4 +161,10 @@ else
 FREERDP_CONF_OPTS += -DWITH_XV=OFF
 endif
 
+else # ! SERVER && ! CLIENT
+
+FREERDP_CONF_OPTS += -DWITH_X11=OFF
+
+endif # ! USES_XLIBS
+
 $(eval $(cmake-package))
-- 
1.9.1
