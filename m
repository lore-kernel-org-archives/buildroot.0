From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Dec 2014 12:39:29 +0100
Subject: [Buildroot] [PATCH 3/6 v3] package/freerdp: add options to
	enable/disable server and/or client
In-Reply-To: <cover.1417952276.git.yann.morin.1998@free.fr>
References: <cover.1417952276.git.yann.morin.1998@free.fr>
Message-ID: <f5b4141517e83b34d222542490244a5773db9709.1417952276.git.yann.morin.1998@free.fr>
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
index 90aa9c5..df6b034 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -41,13 +41,33 @@ else
 FREERDP_CONF_OPTS += -DWITH_PULSEAUDIO=OFF
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
@@ -55,6 +75,27 @@ else
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
+ifeq ($(BR2_PACKAGE_XLIB_LIBXI),y)
+FREERDP_CONF_OPTS += -DWITH_XI=ON
+FREERDP_DEPENDENCIES += xlib_libXi
+else
+FREERDP_CONF_OPTS += -DWITH_XI=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
 FREERDP_CONF_OPTS += -DWITH_XINERAMA=ON
 FREERDP_DEPENDENCIES += xlib_libXinerama
@@ -69,6 +110,13 @@ else
 FREERDP_CONF_OPTS += -DWITH_XKBFILE=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXRENDER),y)
+FREERDP_DEPENDENCIES += xlib_libXrender
+FREERDP_CONF_OPTS += -DWITH_XRENDER=ON
+else
+FREERDP_CONF_OPTS += -DWITH_XRENDER=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBXV),y)
 FREERDP_CONF_OPTS += -DWITH_XV=ON
 FREERDP_DEPENDENCIES += xlib_libXv
@@ -76,4 +124,10 @@ else
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
