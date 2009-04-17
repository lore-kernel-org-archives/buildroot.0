From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 17 Apr 2009 15:55:17 +0000 (UTC)
Subject: [Buildroot] svn commit: [26136] trunk/buildroot/package: pkg-config
	pkgconfig
Message-ID: <20090417155517.438E377697@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-17 15:55:16 +0000 (Fri, 17 Apr 2009)
New Revision: 26136

Log:
pkg-config: fix target package

As reported by Sven Neumann on the list.

Added:
   trunk/buildroot/package/pkg-config/
   trunk/buildroot/package/pkg-config/Config.in
   trunk/buildroot/package/pkg-config/pkg-config-0.23-fix-sysroot.patch
   trunk/buildroot/package/pkg-config/pkg-config.mk

Removed:
   trunk/buildroot/package/pkgconfig/Config.in
   trunk/buildroot/package/pkgconfig/pkg-config-0.23-fix-sysroot.patch
   trunk/buildroot/package/pkgconfig/pkgconfig.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2009-04-17 14:35:43 UTC (rev 26135)
+++ trunk/buildroot/package/Config.in	2009-04-17 15:55:16 UTC (rev 26136)
@@ -43,7 +43,7 @@
 source "package/m4/Config.in"
 source "package/mpatrol/Config.in"
 source "package/oprofile/Config.in"
-source "package/pkgconfig/Config.in"
+source "package/pkg-config/Config.in"
 source "package/readline/Config.in"
 source "package/valgrind/Config.in"
 source "package/pcre/Config.in"

Copied: trunk/buildroot/package/pkg-config/Config.in (from rev 26134, trunk/buildroot/package/pkgconfig/Config.in)
===================================================================
--- trunk/buildroot/package/pkg-config/Config.in	                        (rev 0)
+++ trunk/buildroot/package/pkg-config/Config.in	2009-04-17 15:55:16 UTC (rev 26136)
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PKG_CONFIG
+	bool "pkg-config"
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  pkg-config is a system for managing library compile/link
+	  flags that works with automake and autoconf. It replaces
+	  the ubiquitous *-config scripts you may have seen with a
+	  single tool.
+
+	  http://www.freedesktop.org/software/pkgconfig/

Copied: trunk/buildroot/package/pkg-config/pkg-config-0.23-fix-sysroot.patch (from rev 26134, trunk/buildroot/package/pkgconfig/pkg-config-0.23-fix-sysroot.patch)
===================================================================
--- trunk/buildroot/package/pkg-config/pkg-config-0.23-fix-sysroot.patch	                        (rev 0)
+++ trunk/buildroot/package/pkg-config/pkg-config-0.23-fix-sysroot.patch	2009-04-17 15:55:16 UTC (rev 26136)
@@ -0,0 +1,34 @@
+[PATCH] fix PKG_CONFIG_SYSROOT_DIR handling
+
+With PKG_CONFIG_SYSROOT_DIR enabled, everything else than -L and -I words
+gets stripped away.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ pkg.c |    8 ++------
+ 1 file changed, 2 insertions(+), 6 deletions(-)
+
+Index: pkg-config-0.23/pkg.c
+===================================================================
+--- pkg-config-0.23.orig/pkg.c
++++ pkg-config-0.23/pkg.c
+@@ -472,17 +472,13 @@
+   while (tmp != NULL)
+     {
+       char *tmpstr = (char*) tmp->data;
+-      if (pcsysrootdir != NULL)
++      if (pcsysrootdir != NULL && tmpstr[0] == '-' &&
++          (tmpstr[1] == 'I' || tmpstr[1] == 'L'))
+ 	{
+-	  if (tmpstr[0] == '-' &&
+-	      (tmpstr[1] == 'I' ||
+-	       tmpstr[1] == 'L'))
+-	    {
+ 	      g_string_append_c (str, '-');
+ 	      g_string_append_c (str, tmpstr[1]);
+ 	      g_string_append (str, pcsysrootdir);
+ 	      g_string_append (str, tmpstr+2);
+-	    }
+ 	}
+       else 
+ 	{

Copied: trunk/buildroot/package/pkg-config/pkg-config.mk (from rev 26134, trunk/buildroot/package/pkgconfig/pkgconfig.mk)
===================================================================
--- trunk/buildroot/package/pkg-config/pkg-config.mk	                        (rev 0)
+++ trunk/buildroot/package/pkg-config/pkg-config.mk	2009-04-17 15:55:16 UTC (rev 26136)
@@ -0,0 +1,65 @@
+#############################################################
+#
+# pkgconfig
+#
+#############################################################
+PKG_CONFIG_VERSION = 0.23
+PKG_CONFIG_SOURCE = pkg-config-$(PKG_CONFIG_VERSION).tar.gz
+PKG_CONFIG_SITE = http://pkgconfig.freedesktop.org/releases/
+
+ifeq ($(BR2_ENABLE_DEBUG),y) # install-exec doesn't install aclocal stuff
+PKG_CONFIG_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+endif
+
+PKG_CONFIG_DEPENDENCIES = uclibc libglib2
+
+PKG_CONFIG_CONF_OPT = --with-installed-glib
+
+$(eval $(call AUTOTARGETS,package,pkg-config))
+
+# pkg-config for the host
+PKG_CONFIG_HOST_DIR:=$(BUILD_DIR)/pkg-config-$(PKG_CONFIG_VERSION)-host
+PKG_CONFIG_HOST_BINARY:=$(HOST_DIR)/usr/bin/pkg-config
+
+$(DL_DIR)/$(PKG_CONFIG_SOURCE):
+	$(call DOWNLOAD,$(PKG_CONFIG_SITE),$(PKG_CONFIG_SOURCE))
+
+$(STAMP_DIR)/host_pkgconfig_unpacked: $(DL_DIR)/$(PKG_CONFIG_SOURCE)
+	mkdir -p $(PKG_CONFIG_HOST_DIR)
+	$(INFLATE$(suffix $(PKG_CONFIG_SOURCE))) $< | \
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(PKG_CONFIG_HOST_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(PKG_CONFIG_HOST_DIR) package/pkg-config/ \*.patch
+	touch $@
+
+$(STAMP_DIR)/host_pkgconfig_configured: $(STAMP_DIR)/host_pkgconfig_unpacked
+	(cd $(PKG_CONFIG_HOST_DIR); rm -rf config.cache; \
+		$(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CFLAGS)" \
+		LDFLAGS="$(HOST_LDFLAGS)" \
+		./configure \
+		--prefix="$(HOST_DIR)/usr" \
+		--sysconfdir="$(HOST_DIR)/etc" \
+		--with-pc-path="$(STAGING_DIR)/usr/lib/pkgconfig" \
+		--disable-static \
+	)
+	touch $@
+
+$(STAMP_DIR)/host_pkgconfig_compiled: $(STAMP_DIR)/host_pkgconfig_configured
+	$(MAKE) -C $(PKG_CONFIG_HOST_DIR)
+	touch $@
+
+$(STAMP_DIR)/host_pkgconfig_installed: $(STAMP_DIR)/host_pkgconfig_compiled
+	$(MAKE) -C $(PKG_CONFIG_HOST_DIR) install
+	install -D -m 0644 $(HOST_DIR)/usr/share/aclocal/pkg.m4 \
+		$(STAGING_DIR)/usr/share/aclocal/pkg.m4
+	touch $@
+
+host-pkgconfig: $(STAMP_DIR)/host_pkgconfig_installed
+
+host-pkgconfig-clean:
+	rm -f $(addprefix $(STAMP_DIR)/host_pkgconfig_,unpacked configured compiled installed)
+	-$(MAKE) -C $(PKG_CONFIG_HOST_DIR) uninstall
+	-$(MAKE) -C $(PKG_CONFIG_HOST_DIR) clean
+
+host-pkgconfig-dirclean:
+	rm -rf $(PKG_CONFIG_HOST_DIR)

Deleted: trunk/buildroot/package/pkgconfig/Config.in
===================================================================
--- trunk/buildroot/package/pkgconfig/Config.in	2009-04-17 14:35:43 UTC (rev 26135)
+++ trunk/buildroot/package/pkgconfig/Config.in	2009-04-17 15:55:16 UTC (rev 26136)
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_PKG_CONFIG
-	bool "pkg-config"
-	select BR2_PACKAGE_LIBGLIB2
-	help
-	  pkg-config is a system for managing library compile/link
-	  flags that works with automake and autoconf. It replaces
-	  the ubiquitous *-config scripts you may have seen with a
-	  single tool.
-
-	  http://www.freedesktop.org/software/pkgconfig/

Deleted: trunk/buildroot/package/pkgconfig/pkg-config-0.23-fix-sysroot.patch
===================================================================
--- trunk/buildroot/package/pkgconfig/pkg-config-0.23-fix-sysroot.patch	2009-04-17 14:35:43 UTC (rev 26135)
+++ trunk/buildroot/package/pkgconfig/pkg-config-0.23-fix-sysroot.patch	2009-04-17 15:55:16 UTC (rev 26136)
@@ -1,34 +0,0 @@
-[PATCH] fix PKG_CONFIG_SYSROOT_DIR handling
-
-With PKG_CONFIG_SYSROOT_DIR enabled, everything else than -L and -I words
-gets stripped away.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- pkg.c |    8 ++------
- 1 file changed, 2 insertions(+), 6 deletions(-)
-
-Index: pkg-config-0.23/pkg.c
-===================================================================
---- pkg-config-0.23.orig/pkg.c
-+++ pkg-config-0.23/pkg.c
-@@ -472,17 +472,13 @@
-   while (tmp != NULL)
-     {
-       char *tmpstr = (char*) tmp->data;
--      if (pcsysrootdir != NULL)
-+      if (pcsysrootdir != NULL && tmpstr[0] == '-' &&
-+          (tmpstr[1] == 'I' || tmpstr[1] == 'L'))
- 	{
--	  if (tmpstr[0] == '-' &&
--	      (tmpstr[1] == 'I' ||
--	       tmpstr[1] == 'L'))
--	    {
- 	      g_string_append_c (str, '-');
- 	      g_string_append_c (str, tmpstr[1]);
- 	      g_string_append (str, pcsysrootdir);
- 	      g_string_append (str, tmpstr+2);
--	    }
- 	}
-       else 
- 	{

Deleted: trunk/buildroot/package/pkgconfig/pkgconfig.mk
===================================================================
--- trunk/buildroot/package/pkgconfig/pkgconfig.mk	2009-04-17 14:35:43 UTC (rev 26135)
+++ trunk/buildroot/package/pkgconfig/pkgconfig.mk	2009-04-17 15:55:16 UTC (rev 26136)
@@ -1,65 +0,0 @@
-#############################################################
-#
-# pkgconfig
-#
-#############################################################
-PKG_CONFIG_VERSION = 0.23
-PKG_CONFIG_SOURCE = pkg-config-$(PKG_CONFIG_VERSION).tar.gz
-PKG_CONFIG_SITE = http://pkgconfig.freedesktop.org/releases/
-
-ifeq ($(BR2_ENABLE_DEBUG),y) # install-exec doesn't install aclocal stuff
-PKG_CONFIG_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
-endif
-
-PKG_CONFIG_DEPENDENCIES = uclibc libglib2
-
-PKG_CONFIG_CONF_OPT = --with-installed-glib
-
-$(eval $(call AUTOTARGETS,package,pkgconfig))
-
-# pkg-config for the host
-PKG_CONFIG_HOST_DIR:=$(BUILD_DIR)/pkg-config-$(PKG_CONFIG_VERSION)-host
-PKG_CONFIG_HOST_BINARY:=$(HOST_DIR)/usr/bin/pkg-config
-
-$(DL_DIR)/$(PKG_CONFIG_SOURCE):
-	$(call DOWNLOAD,$(PKG_CONFIG_SITE),$(PKG_CONFIG_SOURCE))
-
-$(STAMP_DIR)/host_pkgconfig_unpacked: $(DL_DIR)/$(PKG_CONFIG_SOURCE)
-	mkdir -p $(PKG_CONFIG_HOST_DIR)
-	$(INFLATE$(suffix $(PKG_CONFIG_SOURCE))) $< | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(PKG_CONFIG_HOST_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(PKG_CONFIG_HOST_DIR) package/pkgconfig/ \*.patch
-	touch $@
-
-$(STAMP_DIR)/host_pkgconfig_configured: $(STAMP_DIR)/host_pkgconfig_unpacked
-	(cd $(PKG_CONFIG_HOST_DIR); rm -rf config.cache; \
-		$(HOST_CONFIGURE_OPTS) \
-		CFLAGS="$(HOST_CFLAGS)" \
-		LDFLAGS="$(HOST_LDFLAGS)" \
-		./configure \
-		--prefix="$(HOST_DIR)/usr" \
-		--sysconfdir="$(HOST_DIR)/etc" \
-		--with-pc-path="$(STAGING_DIR)/usr/lib/pkgconfig" \
-		--disable-static \
-	)
-	touch $@
-
-$(STAMP_DIR)/host_pkgconfig_compiled: $(STAMP_DIR)/host_pkgconfig_configured
-	$(MAKE) -C $(PKG_CONFIG_HOST_DIR)
-	touch $@
-
-$(STAMP_DIR)/host_pkgconfig_installed: $(STAMP_DIR)/host_pkgconfig_compiled
-	$(MAKE) -C $(PKG_CONFIG_HOST_DIR) install
-	install -D -m 0644 $(HOST_DIR)/usr/share/aclocal/pkg.m4 \
-		$(STAGING_DIR)/usr/share/aclocal/pkg.m4
-	touch $@
-
-host-pkgconfig: $(STAMP_DIR)/host_pkgconfig_installed
-
-host-pkgconfig-clean:
-	rm -f $(addprefix $(STAMP_DIR)/host_pkgconfig_,unpacked configured compiled installed)
-	-$(MAKE) -C $(PKG_CONFIG_HOST_DIR) uninstall
-	-$(MAKE) -C $(PKG_CONFIG_HOST_DIR) clean
-
-host-pkgconfig-dirclean:
-	rm -rf $(PKG_CONFIG_HOST_DIR)
