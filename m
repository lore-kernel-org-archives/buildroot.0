From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 24 Oct 2012 17:10:44 -0300
Subject: [Buildroot] [PATCHv7 1/5] pkgconf: new package
Message-ID: <1351109444-3301-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pkgconf is a drop-in replacement for pkg-config that doesn't need
itself to build and just requires a C89 compiler.

Instead of using a patch for hardcoded sysroot support (as the patch to
pkg-config does) we rely instead on a wrapper script that takes the
appropiate action.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                          |    1 +
 package/pkgconf/Config.in                  |    9 ++++++++
 package/pkgconf/pkg-config.in              |    2 +
 package/pkgconf/pkgconf-fix-variable.patch |   27 ++++++++++++++++++++++++
 package/pkgconf/pkgconf.mk                 |   31 ++++++++++++++++++++++++++++
 5 files changed, 70 insertions(+), 0 deletions(-)
 create mode 100644 package/pkgconf/Config.in
 create mode 100644 package/pkgconf/pkg-config.in
 create mode 100644 package/pkgconf/pkgconf-fix-variable.patch
 create mode 100644 package/pkgconf/pkgconf.mk

diff --git a/package/Config.in b/package/Config.in
index 90be56e..09f789f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -84,6 +84,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/patch/Config.in"
 endif
 source "package/pkg-config/Config.in"
+source "package/pkgconf/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/sed/Config.in"
 endif
diff --git a/package/pkgconf/Config.in b/package/pkgconf/Config.in
new file mode 100644
index 0000000..f95847f
--- /dev/null
+++ b/package/pkgconf/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PKGCONF
+	bool "pkgconf"
+	help
+	  pkgconf is a program which helps to configure compiler and linker
+	  flags for development frameworks. It is similar to pkg-config,
+	  but was written from scratch in the summer of 2011 to replace
+	  pkg-config, which now needs itself to build itself
+
+	  https://github.com/nenolod/pkgconf
diff --git a/package/pkgconf/pkg-config.in b/package/pkgconf/pkg-config.in
new file mode 100644
index 0000000..25a536b
--- /dev/null
+++ b/package/pkgconf/pkg-config.in
@@ -0,0 +1,2 @@
+#!/bin/sh
+PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:- at PKG_CONFIG_LIBDIR@} PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:- at STAGING_DIR@} $(dirname $0)/pkgconf $@
diff --git a/package/pkgconf/pkgconf-fix-variable.patch b/package/pkgconf/pkgconf-fix-variable.patch
new file mode 100644
index 0000000..e19f76c
--- /dev/null
+++ b/package/pkgconf/pkgconf-fix-variable.patch
@@ -0,0 +1,27 @@
+[PATCH] prefix sysroot to include/libdir path variables
+
+Prefix includedir / libdir variable values with sysroot if a variable is
+requested (--variable=<name>), similar to how it's done for -I / -L flags.
+
+This is sometimes used to find header files (E.G. in gst-plugins configure),
+so ensure the sysroot'ed files are used.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura pkgconf-0.8.9.orig/main.c pkgconf-0.8.9/main.c
+--- pkgconf-0.8.9.orig/main.c	2012-10-24 14:32:08.236508699 -0300
++++ pkgconf-0.8.9/main.c	2012-10-24 14:54:36.771070217 -0300
+@@ -298,7 +298,12 @@
+ 	if (eflag != PKG_ERRF_OK)
+ 		return false;
+ 
+-	printf("%s\n", req.buf);
++	if ( !strcmp(req.variable, "includedir") ||
++	  !strcmp(req.variable, "mapdir") ||
++	  !strcmp(req.variable, "libdir"))
++		printf("%s%s\n", sysroot_dir, req.buf);
++	else
++		printf("%s\n", req.buf);
+ 	return true;
+ }
+ 
diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
new file mode 100644
index 0000000..36a5bb8
--- /dev/null
+++ b/package/pkgconf/pkgconf.mk
@@ -0,0 +1,31 @@
+#############################################################
+#
+# pkgconf
+#
+#############################################################
+
+PKGCONF_VERSION = 0.8.9
+PKGCONF_SITE = http://tortois.es/~nenolod/distfiles
+PKGCONF_SOURCE = pkgconf-$(PKGCONF_VERSION).tar.bz2
+
+PKG_CONFIG_HOST_BINARY = $(HOST_DIR)/usr/bin/pkg-config
+
+ifeq ($(BR2_PACKAGE_PKG_CONFIG),)
+define PKGCONF_LINK_PKGCONFIG
+	ln -sf pkgconf $(TARGET_DIR)/usr/bin/pkg-config
+endef
+endif
+
+define HOST_PKGCONF_INSTALL_WRAPPER
+	$(INSTALL) -m 0755 -D package/pkgconf/pkg-config.in \
+		$(HOST_DIR)/usr/bin/pkg-config
+	$(SED) 's, at PKG_CONFIG_LIBDIR@,$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig,' \
+		-e 's, at STAGING_DIR@,$(STAGING_DIR),' \
+		$(HOST_DIR)/usr/bin/pkg-config
+endef
+
+PKGCONF_POST_INSTALL_TARGET_HOOKS += PKGCONF_LINK_PKGCONFIG
+HOST_PKGCONF_POST_INSTALL_HOOKS += HOST_PKGCONF_INSTALL_WRAPPER
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.7.8.6
