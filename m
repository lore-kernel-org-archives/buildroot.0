From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  1 Jun 2014 23:43:51 +0200
Subject: [Buildroot] [PATCH 20/21] package/freerdp: add options to
	enable/disable server and/or client
In-Reply-To: <cover.1401658972.git.yann.morin.1998@free.fr>
References: <cover.1401658972.git.yann.morin.1998@free.fr>
Message-ID: <bcf7780bb35ee7a856a78be2112eb4b89f5fce34.1401658972.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Building the client or the server requires an X.Org stack.

Since freerdp can also be used for weston (wayland-based, hence no X.Org
stack), we may want to disable the client and server.

Conversely, with on an X.Org stack, we may want to enable either or
none if we're just interested in the library.

Add two options, one to enable the server, the other the client.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/freerdp/Config.in  | 18 ++++++++++++++++--
 package/freerdp/freerdp.mk | 12 ++++++++++++
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
index 81a67ea..0c2edc5 100644
--- a/package/freerdp/Config.in
+++ b/package/freerdp/Config.in
@@ -6,16 +6,30 @@ config BR2_PACKAGE_FREERDP
 	  FreeRDP is a free implementation of the Remote Desktop
 	  Protocol (RDP), released under the Apache license
 
+	  This only installs the freerdp library.
+
 	  http://www.freerdp.com/
 
 if BR2_PACKAGE_FREERDP
 
 config BR2_PACKAGE_FREERDP_NEEDS_XLIBS
-	def_bool y
-	depends on BR2_PACKAGE_XORG7
+	bool
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
 
+config BR2_PACKAGE_FREERDP_SERVER
+	bool "build server"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_FREERDP_X_LIBS
+
+config BR2_PACKAGE_FREERDP_CLIENT
+	bool "build client"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_FREERDP_X_LIBS
+
+comment "freerdp server and client needs X.Org"
+	depends on !BR2_PACKAGE_XORG7
+
 endif
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index aef9350..80e4945 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -23,6 +23,18 @@ else
 FREERDP_CONF_OPT += -DWITH_X11=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_FREERDP_SERVER),y)
+FREERDP_CONF_OPT += -DWITH_SERVER=ON -DWITH_SERVER_INTERFACE=ON
+else
+FREERDP_CONF_OPT += -DWITH_SERVER=OFF -DWITH_SERVER_INTERFACE=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_FREERDP_CLIENT),y)
+FREERDP_CONF_OPT += -DWITH_CLIENT=ON -DWITH_CLIENT_INTERFACE=ON
+else
+FREERDP_CONF_OPT += -DWITH_CLIENT=OFF -DWITH_CLIENT_INTERFACE=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_CUPS),y)
 FREERDP_CONF_OPT += -DWITH_CUPS=ON
 FREERDP_DEPENDENCIES += cups
-- 
1.8.3.2
