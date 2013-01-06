From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Jan 2013 22:29:38 +0100
Subject: [Buildroot] [PATCH 26/28] xvkbd: turn into a generic-package
In-Reply-To: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <ce7075376884a3a306aa0df7b35d1f47cb5f72b3.1357507764.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xvkbd was integrated has an autotools package, but it does not have a
./configure script. And to avoid executing the ./configure, the
xvkbd-2.8-makefile.patch was creating a dummy .stamp_configured stamp
file... Ugly.

So, make xvkbd a normal generic package, with BUILD_CMDS and
INSTALL_TARGET_CMDS, and get rid of the crappy part of the patch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xvkbd/xvkbd-2.8-makefile.patch |    5 -----
 package/xvkbd/xvkbd.mk                 |   14 +++++++++++---
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/package/xvkbd/xvkbd-2.8-makefile.patch b/package/xvkbd/xvkbd-2.8-makefile.patch
index e0ac21a..a8f6577 100644
--- a/package/xvkbd/xvkbd-2.8-makefile.patch
+++ b/package/xvkbd/xvkbd-2.8-makefile.patch
@@ -1,8 +1,3 @@
---- a/.stamp_configured	2008-03-04 06:14:55.425005441 -0500
-+++ b/.stamp_configured	2008-03-05 08:42:53.000000000 -0500
-@@ -0,0 +1 @@
-+dummy
-\ No newline at end of file
 --- a/Makefile	2008-03-04 06:14:55.425005441 -0500
 +++ b/Makefile	2008-03-05 08:40:50.000000000 -0500
 @@ -0,0 +1,2397 @@
diff --git a/package/xvkbd/xvkbd.mk b/package/xvkbd/xvkbd.mk
index ae81f84..59085bf 100644
--- a/package/xvkbd/xvkbd.mk
+++ b/package/xvkbd/xvkbd.mk
@@ -7,8 +7,16 @@ XVKBD_VERSION = 3.2
 XVKBD_SOURCE = xvkbd-$(XVKBD_VERSION).tar.gz
 XVKBD_SITE = http://homepage3.nifty.com/tsato/xvkbd
 
-XVKBD_MAKE_OPT = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" LD="$(TARGET_CC)" \
-				CFLAGS="-O2 -I$(STAGING_DIR)/usr/include" USRLIBDIR="$(STAGING_DIR)/usr/lib"
+# Passing USRLIBDIR ensures that the stupid Makefile doesn't add
+# /usr/lib to the library search path.
+define XVKBD_BUILD_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		USRLIBDIR="$(STAGING_DIR)/usr/lib"
+endef
+
+define XVKBD_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
 
 XVKBD_DEPENDENCIES = \
 	xlib_libICE \
@@ -21,5 +29,5 @@ XVKBD_DEPENDENCIES = \
 	xlib_libXt \
 	xlib_libXtst
 
-$(eval $(autotools-package))
+$(eval $(generic-package))
 
-- 
1.7.9.5
