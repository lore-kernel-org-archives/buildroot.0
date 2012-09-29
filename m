From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 29 Sep 2012 21:58:19 +0200
Subject: [Buildroot] [git commit] x11vnc: add optional dependencies
Message-ID: <20120929201757.000A59975D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2410e3d243114f3509b8189ee4de7fe3c66c49db
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11vnc/x11vnc-ipv6.patch |   25 +++++++++++++++++
 package/x11vnc/x11vnc.mk         |   54 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 77 insertions(+), 2 deletions(-)

diff --git a/package/x11vnc/x11vnc-ipv6.patch b/package/x11vnc/x11vnc-ipv6.patch
new file mode 100644
index 0000000..89c2835
--- /dev/null
+++ b/package/x11vnc/x11vnc-ipv6.patch
@@ -0,0 +1,25 @@
+[PATCH] fix build on uClibc without IPv6 support
+
+Some systems (like uClibc) defines AF_INET6 even when configured without
+IPv6 support, so don't use that to decide if IPv6 support should be enabled.
+
+Instead use the X11VNC_IPV6 define like elsewhere in the code.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ x11vnc/enc.h |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: x11vnc-0.9.13/x11vnc/enc.h
+===================================================================
+--- x11vnc-0.9.13.orig/x11vnc/enc.h
++++ x11vnc-0.9.13/x11vnc/enc.h
+@@ -1733,7 +1733,7 @@
+ 	}
+ 
+ 	try6:
+-#ifdef AF_INET6
++#if X11VNC_IPV6
+ 	if (!getenv("ULTRAVNC_DSM_HELPER_NOIPV6")) {
+ 		struct sockaddr_in6 sin;
+ 		int one = 1, sock = -1;
diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
index 06afcac..73da50e 100644
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -6,8 +6,9 @@
 X11VNC_VERSION = 0.9.13
 X11VNC_SOURCE = x11vnc-$(X11VNC_VERSION).tar.gz
 X11VNC_SITE = http://downloads.sourceforge.net/project/libvncserver/x11vnc/$(X11VNC_VERSION)
-X11VNC_CONF_OPT = \
-	--without-avahi
+# sdl support is not used in x11vnc, but host include / library search paths
+# leak in if host has sdl-config
+X11VNC_CONF_OPT = --without-sdl
 
 X11VNC_DEPENDENCIES = xlib_libXt xlib_libXext xlib_libXtst
 
@@ -17,4 +18,53 @@ X11VNC_CONF_OPT += --without-ipv6
 X11VNC_CONF_ENV += CFLAGS='$(TARGET_CFLAGS) -DX11VNC_IPV6=0'
 endif
 
+ifeq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yy)
+X11VNC_DEPENDENCIES += avahi dbus
+else
+X11VNC_CONF_OPT += --without-avahi
+endif
+
+ifeq ($(BR2_PACKAGE_JPEG),y)
+X11VNC_DEPENDENCIES += jpeg
+else
+X11VNC_CONF_OPT += --without-jpeg
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+X11VNC_DEPENDENCIES += openssl
+else
+X11VNC_CONF_OPT += --without-ssl --without-crypto
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
+X11VNC_DEPENDENCIES += xlib_libXinerama
+else
+X11VNC_CONF_OPT += --without-xinerama
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
+X11VNC_DEPENDENCIES += xlib_libXrandr
+else
+X11VNC_CONF_OPT += --without-xrandr
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXFIXES),y)
+X11VNC_DEPENDENCIES += xlib_libXfixes
+else
+X11VNC_CONF_OPT += --without-xfixes
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXDAMAGE),y)
+X11VNC_DEPENDENCIES += xlib_libXdamage
+else
+X11VNC_CONF_OPT += --without-xdamage
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+X11VNC_DEPENDENCIES += zlib
+else
+X11VNC_CONF_OPT += --without-zlib
+endif
+
+
 $(eval $(autotools-package))
