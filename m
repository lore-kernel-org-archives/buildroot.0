From: Petr Kulhavy <brain@jikos.cz>
Date: Sat,  9 Sep 2017 23:29:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/uwebsockets: new package
Message-ID: <1504992570-8893-1-git-send-email-brain@jikos.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add uWebSockets, a lightweight, efficient and scalable WebSocket library.
https://github.com/uNetworking/uWebSockets

Signed-off-by: Petr Kulhavy <brain@jikos.cz>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/uwebsockets/Config.in        | 20 ++++++++++++++++++++
 package/uwebsockets/uwebsockets.hash |  2 ++
 package/uwebsockets/uwebsockets.mk   | 36 ++++++++++++++++++++++++++++++++++++
 5 files changed, 60 insertions(+)
 create mode 100644 package/uwebsockets/Config.in
 create mode 100644 package/uwebsockets/uwebsockets.hash
 create mode 100644 package/uwebsockets/uwebsockets.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 2bd3aca..8737384 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1368,6 +1368,7 @@ F:	package/sdl2_ttf/
 
 N:	Petr Kulhavy <brain@jikos.cz>
 F:	package/linuxptp/
+F:	package/uwebsockets/
 
 N:	Petr Vorel <petr.vorel@gmail.com>
 F:	package/linux-backports/
diff --git a/package/Config.in b/package/Config.in
index d926f7e..0afae7a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1384,6 +1384,7 @@ menu "Networking"
 	source "package/sofia-sip/Config.in"
 	source "package/thrift/Config.in"
 	source "package/usbredir/Config.in"
+	source "package/uwebsockets/Config.in"
 	source "package/zeromq/Config.in"
 	source "package/zmqpp/Config.in"
 	source "package/zyre/Config.in"
diff --git a/package/uwebsockets/Config.in b/package/uwebsockets/Config.in
new file mode 100644
index 0000000..fff5d7a
--- /dev/null
+++ b/package/uwebsockets/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_UWEBSOCKETS
+	bool "uWebSockets"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_OPENSSL
+	help
+	  uWebSockets is one of the most lightweight, efficient and
+	  scalable WebSocket and HTTP server implementations available.
+	  It features an easy-to-use, fully async object-oriented
+	  interface and scales to millions of connections using only
+	  a fraction of memory compared to the competition. While
+	  performance and scalability are two of our top priorities,
+	  we consider security, stability and standards compliance
+	  paramount. License is zlib/libpng (very permissive & suits
+	  commercial applications).
+
+	  https://github.com/uNetworking/uWebSockets
+
+comment "uWebSockets needs a toolchain with C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/uwebsockets/uwebsockets.hash b/package/uwebsockets/uwebsockets.hash
new file mode 100644
index 0000000..b07c48c
--- /dev/null
+++ b/package/uwebsockets/uwebsockets.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 9d7854fe3b8c43903957ccd9001e954e210e14a0545549515a9f020bf275c4fc  uwebsockets-v0.14.4.tar.gz
diff --git a/package/uwebsockets/uwebsockets.mk b/package/uwebsockets/uwebsockets.mk
new file mode 100644
index 0000000..084385e
--- /dev/null
+++ b/package/uwebsockets/uwebsockets.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# uWebSockets
+#
+################################################################################
+
+UWEBSOCKETS_VERSION = v0.14.4
+UWEBSOCKETS_SITE = $(call github,uNetworking,uWebSockets,$(UWEBSOCKETS_VERSION))
+UWEBSOCKETS_LICENSE = Zlib
+UWEBSOCKETS_LICENSE_FILES = LICENSE
+UWEBSOCKETS_DEPENDENCIES = zlib openssl
+
+UWEBSOCKETS_INSTALL_STAGING = YES
+UWEBSOCKETS_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_PACKAGE_BOOST),y)
+UWEBSOCKETS_CFLAGS += -DUSE_ASIO
+else ifeq ($(BR2_PACKAGE_LIBUV),y)
+UWEBSOCKETS_CFLAGS += -DUSE_LIBUV
+endif
+
+define UWEBSOCKETS_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) CXXFLAGS="$(UWEBSOCKETS_CFLAGS)" -C $(@D) Linux
+endef
+
+define UWEBSOCKETS_INSTALL_STAGING_CMDS
+	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/uWS/
+	$(INSTALL) -D -m 0644 $(@D)/src/*.h $(STAGING_DIR)/usr/include/uWS/
+endef
+
+define UWEBSOCKETS_INSTALL_TARGET_CMDS
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/lib/
+	$(INSTALL) -D -m 0755 $(@D)/libuWS.so* $(TARGET_DIR)/usr/lib/
+endef
+
+$(eval $(generic-package))
-- 
2.7.4
