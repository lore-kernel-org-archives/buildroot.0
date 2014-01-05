From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jan 2014 21:04:04 +0100
Subject: [Buildroot] [git commit] xorg: Bump xcb-proto & libxcb version to
	1.10
Message-ID: <20140105230941.E6B539C3D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=862e1221d1c36464d00e5dba2b4bb4f5fc046c85
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These have to be bumped together as new libxcb requires new xcb-proto, and
old libxcb doesn't build with new xcb-proto.

[Peter: fixup xcb-proto.pc instead of playing tricks with --define-variable]
Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/libxcb/libxcb.mk       |    8 ++------
 package/x11r7/xcb-proto/xcb-proto.mk |   12 +++++++++++-
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index dfcf6fa..ef6b4ce 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXCB_VERSION = 1.8.1
+LIBXCB_VERSION = 1.10
 LIBXCB_SOURCE = libxcb-$(LIBXCB_VERSION).tar.bz2
 LIBXCB_SITE = http://xcb.freedesktop.org/dist/
 LIBXCB_LICENSE = MIT
@@ -15,12 +15,8 @@ LIBXCB_INSTALL_STAGING = YES
 LIBXCB_DEPENDENCIES = \
 	host-libxslt xlib_libpthread-stubs xcb-proto xlib_libXdmcp xlib_libXau \
 	host-xcb-proto host-python host-pkgconf
-LIBXCB_CONF_ENV = STAGING_DIR="$(STAGING_DIR)"
-LIBXCB_MAKE_OPT = XCBPROTO_XCBINCLUDEDIR=$(STAGING_DIR)/usr/share/xcb \
-	XCBPROTO_XCBPYTHONDIR=$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
-LIBXCB_CONF_OPT = --disable-build-docs
 
-HOST_LIBXCB_CONF_OPT = --disable-build-docs
+LIBXCB_CONF_OPT = --disable-build-docs
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xcb-proto/xcb-proto.mk b/package/x11r7/xcb-proto/xcb-proto.mk
index 98d0f02..1bf6366 100644
--- a/package/x11r7/xcb-proto/xcb-proto.mk
+++ b/package/x11r7/xcb-proto/xcb-proto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XCB_PROTO_VERSION = 1.7.1
+XCB_PROTO_VERSION = 1.10
 XCB_PROTO_SOURCE = xcb-proto-$(XCB_PROTO_VERSION).tar.bz2
 XCB_PROTO_SITE = http://xcb.freedesktop.org/dist/
 XCB_PROTO_LICENSE = MIT
@@ -14,5 +14,15 @@ XCB_PROTO_INSTALL_STAGING = YES
 
 XCB_PROTO_DEPENDENCIES = host-python
 
+# xcbincludedir/pythondir is used by E.G. libxcb at build time to find the
+# xml / python files, so ensure these expand to their full (host) paths
+define XCB_PROTO_FIXUP_PC_FILE
+	$(SED) 's|^\(xcbincludedir=\)|\1$(STAGING_DIR)|' \
+	    -e 's|^\(pythondir=\)|\1$(STAGING_DIR)|' \
+		$(STAGING_DIR)/usr/lib/pkgconfig/xcb-proto.pc
+endef
+
+XCB_PROTO_POST_INSTALL_STAGING_HOOKS += XCB_PROTO_FIXUP_PC_FILE
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
