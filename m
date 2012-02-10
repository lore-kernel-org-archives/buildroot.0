From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 10 Feb 2012 16:00:07 +0100
Subject: [Buildroot] [git commit] package: add libvncserver
Message-ID: <20120210150044.92D5E90A56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=615ba54394649c1a83c6b9d5d06406ac86d7cac5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                    |    1 +
 package/libvncserver/Config.in       |    6 ++++
 package/libvncserver/libvncserver.mk |   50 ++++++++++++++++++++++++++++++++++
 3 files changed, 57 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index c679652..8a7c9c4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -363,6 +363,7 @@ source "package/libosip2/Config.in"
 source "package/librsync/Config.in"
 source "package/libsoup/Config.in"
 source "package/libupnp/Config.in"
+source "package/libvncserver/Config.in"
 endmenu
 
 menu "Other"
diff --git a/package/libvncserver/Config.in b/package/libvncserver/Config.in
new file mode 100644
index 0000000..ff83e34
--- /dev/null
+++ b/package/libvncserver/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBVNCSERVER
+	bool "libvncserver"
+	help
+	  libvncserver is a VNC server/client library.
+
+	  http://libvncserver.sourceforge.net/
diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
new file mode 100644
index 0000000..c98fba3
--- /dev/null
+++ b/package/libvncserver/libvncserver.mk
@@ -0,0 +1,50 @@
+#############################################################
+#
+# libvncserver
+#
+#############################################################
+
+LIBVNCSERVER_VERSION = 0.9.8.2
+LIBVNCSERVER_SOURCE = LibVNCServer-$(LIBVNCSERVER_VERSION).tar.gz
+LIBVNCSERVER_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libvncserver/$(LIBVNCSERVER_VERSION)
+
+LIBVNCSERVER_INSTALL_STAGING = YES
+
+# only used for examples
+LIBVNCSERVER_CONF_OPT += --with-sdl-config=/bin/false
+
+ifneq ($(BR2_INET_IPV6),y)
+LIBVNCSERVER_CONF_OPT += --without-ipv6
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBVNCSERVER_DEPENDENCIES += openssl
+else
+LIBVNCSERVER_CONF_OPT += --without-crypto
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+LIBVNCSERVER_DEPENDENCIES += libgcrypt
+else
+LIBVNCSERVER_CONF_OPT += --without-gcrypt
+endif
+
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+LIBVNCSERVER_DEPENDENCIES += gnutls host-pkg-config
+else
+LIBVNCSERVER_CONF_OPT += --without-gnutls
+endif
+
+ifeq ($(BR2_PACKAGE_JPEG),y)
+LIBVNCSERVER_DEPENDENCIES += jpeg
+else
+LIBVNCSERVER_CONF_OPT += --without-jpeg
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+LIBVNCSERVER_DEPENDENCIES += zlib
+else
+LIBVNCSERVER_CONF_OPT += --without-zlib
+endif
+
+$(eval $(call AUTOTARGETS))
