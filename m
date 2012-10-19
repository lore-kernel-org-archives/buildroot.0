From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 19 Oct 2012 09:59:23 -0300
Subject: [Buildroot] [PATCHv5 1/5] pkgconf: new package
Message-ID: <1350651563-3639-1-git-send-email-gustavo@zacarias.com.ar>
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
 package/Config.in             |    1 +
 package/pkgconf/Config.in     |    9 +++++++++
 package/pkgconf/pkg-config.in |    2 ++
 package/pkgconf/pkgconf.mk    |   32 ++++++++++++++++++++++++++++++++
 4 files changed, 44 insertions(+), 0 deletions(-)
 create mode 100644 package/pkgconf/Config.in
 create mode 100644 package/pkgconf/pkg-config.in
 create mode 100644 package/pkgconf/pkgconf.mk

diff --git a/package/Config.in b/package/Config.in
index cfc29c6..546af88 100644
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
index 0000000..9da5187
--- /dev/null
+++ b/package/pkgconf/pkg-config.in
@@ -0,0 +1,2 @@
+#!/bin/sh
+PKG_CONFIG_PATH=@PKG_CONFIG_PATH@ PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:- at STAGING_DIR@} $(dirname $0)/pkgconf $@
diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
new file mode 100644
index 0000000..84fccf3
--- /dev/null
+++ b/package/pkgconf/pkgconf.mk
@@ -0,0 +1,32 @@
+#############################################################
+#
+# pkgconf
+#
+#############################################################
+
+PKGCONF_VERSION = 0.8.9
+PKGCONF_SITE = https://github.com/pkgconf/pkgconf/tarball/pkgconf-$(PKGCONF_VERSION)
+PKGCONF_AUTORECONF = YES
+HOST_PKGCONF_AUTORECONF = YES
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
+	$(SED) 's, at PKG_CONFIG_PATH@,$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig,' \
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
