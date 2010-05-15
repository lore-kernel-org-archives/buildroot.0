From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 May 2010 01:15:31 +0200
Subject: [Buildroot] [PATCH 06/12] pango: run pango-querymodules on the
	target instead of on the host
In-Reply-To: <cover.1273965305.git.thomas.petazzoni@free-electrons.com>
References: <cover.1273965305.git.thomas.petazzoni@free-electrons.com>
Message-ID: <af7569b2385c4ae2761c8caee5608e59a1a0ecf1.1273965305.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We needed to build pango for the host in order to compile
pango-querymodules for the host, which was used to produce
/etc/pango/pango.modules. Unfortunately:

 * This produces an incorrect /etc/pango/pango.modules (no modules
   detected in my case), probably because the host pango-querymodules
   was looking at host pango modules

 * This requires to build pango for the host, which requires to build
   cairo for the host, which requires to build X11 for the host.

To make things work and remove the dependency between pango and
host-pango, we introduce a S25pango script that creates
/etc/pango/pango.modules on startup if it doesn't exist, just as we do
with libgtk2 for /etc/gtk-2.0/gdk-pixbuf.loaders.

Since host-pango is no longer needed, we remove all definitions
related to it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pango/S25pango |   20 ++++++++++++++++++++
 package/pango/pango.mk |   18 ++----------------
 2 files changed, 22 insertions(+), 16 deletions(-)
 create mode 100644 package/pango/S25pango

diff --git a/package/pango/S25pango b/package/pango/S25pango
new file mode 100644
index 0000000..9af9307
--- /dev/null
+++ b/package/pango/S25pango
@@ -0,0 +1,20 @@
+#!/bin/sh
+#
+# run pango-querymodules if needed
+
+FILE=/etc/pango/pango.modules
+
+case "$1" in
+     start|"")
+	if [ ! -f $FILE ] ; then
+	   mkdir -p /etc/pango
+	   /usr/bin/pango-querymodules > "$FILE"
+	fi
+	;;
+    stop)
+	;;
+    *)
+	echo "Usage: $0 {start|stop}" >&2
+	exit 1
+	;;
+esac
\ No newline at end of file
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 812a4c8..c640045 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -40,16 +40,7 @@ PANGO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 PANGO_CONF_OPT = --enable-shared --enable-static \
 		--enable-explicit-deps=no --disable-debug
 
-HOST_PANGO_CONF_OPT = \
-		--disable-static \
-		$(if $(BR2_PACKAGE_XORG7),--with-x,--without-x) \
-		--disable-debug \
-
-PANGO_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT),gettext libintl) host-pkg-config host-pango libglib2 cairo
-
-HOST_PANGO_DEPENDENCIES = host-pkg-config host-cairo host-libglib2 host-autoconf host-automake
-
-HOST_PANGO_AUTORECONF = YES
+PANGO_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT),gettext libintl) host-pkg-config libglib2 cairo
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
         PANGO_CONF_OPT += --with-x \
@@ -61,12 +52,7 @@ else
 endif
 
 $(eval $(call AUTOTARGETS,package,pango))
-$(eval $(call AUTOTARGETS,package,pango,host))
 
 $(PANGO_HOOK_POST_INSTALL):
-	mkdir -p $(TARGET_DIR)/etc/pango
-	$(PANGO_HOST_BINARY) > $(TARGET_DIR)/etc/pango/pango.modules
-	$(SED) 's~$(HOST_DIR)~~g' $(TARGET_DIR)/etc/pango/pango.modules
+	$(INSTALL) -m 755 package/pango/S25pango $(TARGET_DIR)/etc/init.d/
 	touch $@
-
-PANGO_HOST_BINARY:=$(HOST_DIR)/usr/bin/pango-querymodules
-- 
1.6.3.3
