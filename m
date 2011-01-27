From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 27 Jan 2011 23:38:48 +0100
Subject: [Buildroot] [git commit master 1/1] libxcb: use host-python and fix
	dependencies
Message-ID: <20110127224051.E879B8D348@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5f19df9224d6ef826f9d4ce9a06673ada705d743
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we have a proper host-python package, use that one instead of
whatever might be available on the build host. Also don't overwrite
the host-python package version variable and fix dependency list
(xcb-proto is needed for the host).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/libxcb/libxcb.mk |   12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index bfeceab..c9835ed 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -11,12 +11,16 @@ LIBXCB_INSTALL_STAGING = YES
 
 LIBXCB_AUTORECONF = NO
 LIBXCB_LIBTOOL_PATCH = NO
-LIBXCB_DEPENDENCIES = host-libxslt pthread-stubs xcb-proto xlib_libXdmcp xlib_libXau
+LIBXCB_DEPENDENCIES = \
+	host-libxslt pthread-stubs xcb-proto xlib_libXdmcp xlib_libXau \
+	host-xcb-proto host-python
 LIBXCB_CONF_ENV = STAGING_DIR="$(STAGING_DIR)"
-HOST_PYTHON_VERSION=$(shell python --version 2>&1 | sed 's/Python \([0-9]\.[^\.]\).*/\1/')
-LIBXCB_MAKE_OPT = XCBPROTO_XCBINCLUDEDIR=$(STAGING_DIR)/usr/share/xcb XCBPROTO_XCBPYTHONDIR=$(STAGING_DIR)/usr/lib/python$(HOST_PYTHON_VERSION)/site-packages
+LIBXCB_MAKE_OPT = XCBPROTO_XCBINCLUDEDIR=$(STAGING_DIR)/usr/share/xcb \
+	XCBPROTO_XCBPYTHONDIR=$(HOST_DIR)/usr/lib/python$(HOST_PYTHON_VERSION)/site-packages
 
-HOST_LIBXCB_DEPENDENCIES = host-libxslt host-pthread-stubs host-xcb-proto host-xlib_libXdmcp host-xlib_libXau
+HOST_LIBXCB_DEPENDENCIES = \
+	host-libxslt host-pthread-stubs host-xcb-proto host-xlib_libXdmcp \
+	host-xlib_libXau host-python
 
 $(eval $(call AUTOTARGETS,package/x11r7,libxcb))
 $(eval $(call AUTOTARGETS,package/x11r7,libxcb,host))
-- 
1.7.3.4
