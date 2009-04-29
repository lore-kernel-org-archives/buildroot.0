From: tpetazzoni at uclibc.org <tpetazzoni@uclibc.org>
Date: Wed, 29 Apr 2009 07:21:02 +0000 (UTC)
Subject: [Buildroot] svn commit: [26236] trunk/buildroot/package:
	shared-mime-info
Message-ID: <20090429072102.E9C2F7646C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: tpetazzoni
Date: 2009-04-29 07:21:02 +0000 (Wed, 29 Apr 2009)
New Revision: 26236

Log:
Add the shared-mime-info package

The shared-mime-info package contains the core database of common
types and the update-mime-database command used to extend it.

The only thing that is actually needed in the target is the file
mime.cache. In order to generate that file, shared-mime-info is
installed into the staging-dir. The idea is that other packages might
add more mime-info files and these should be collected in
staging-dir. From there the mime.cache file is created using tools
installed in host-dir and copied to target.

From Sven Neumann <s.neumann@raumfeld.com>

Modifications by Thomas Petazzoni :

 * Add a patch to the main Makefile.am so that the $(XMLLINT) variable
   is used instead of hardcoding xmllint

 * Apply the patch in the host build of shared-mime-info

 * In the target build, pass an XMLLINT environment variable so that
   the xmllint binary isn't searched in $(STAGING_DIR) but in
   $(HOST_DIR)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>



Added:
   trunk/buildroot/package/shared-mime-info/
   trunk/buildroot/package/shared-mime-info/Config.in
   trunk/buildroot/package/shared-mime-info/shared-mime-info-0.60-fix-xmllint.patch
   trunk/buildroot/package/shared-mime-info/shared-mime-info.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2009-04-29 07:13:20 UTC (rev 26235)
+++ trunk/buildroot/package/Config.in	2009-04-29 07:21:02 UTC (rev 26236)
@@ -100,6 +100,7 @@
 source "package/psmisc/Config.in"
 endif
 source "package/screen/Config.in"
+source "package/shared-mime-info/Config.in"
 source "package/startup-notification/Config.in"
 source "package/strace/Config.in"
 source "package/sudo/Config.in"

Added: trunk/buildroot/package/shared-mime-info/Config.in
===================================================================
--- trunk/buildroot/package/shared-mime-info/Config.in	                        (rev 0)
+++ trunk/buildroot/package/shared-mime-info/Config.in	2009-04-29 07:21:02 UTC (rev 26236)
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_SHARED_MIME_INFO
+	bool "shared-mime-info"
+	select BR2_PACKAGE_LIBGLIB2
+        select BR2_PACKAGE_LIBXML2
+	help
+                The shared-mime-info package contains the core
+                database of common types and the update-mime-database
+                command used to extend it.
+
+                http://freedesktop.org/wiki/Software/shared-mime-info

Added: trunk/buildroot/package/shared-mime-info/shared-mime-info-0.60-fix-xmllint.patch
===================================================================
--- trunk/buildroot/package/shared-mime-info/shared-mime-info-0.60-fix-xmllint.patch	                        (rev 0)
+++ trunk/buildroot/package/shared-mime-info/shared-mime-info-0.60-fix-xmllint.patch	2009-04-29 07:21:02 UTC (rev 26236)
@@ -0,0 +1,17 @@
+---
+ Makefile.am |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: shared-mime-info-0.60/Makefile.am
+===================================================================
+--- shared-mime-info-0.60.orig/Makefile.am
++++ shared-mime-info-0.60/Makefile.am
+@@ -72,7 +72,7 @@
+ 
+ check: freedesktop.org.xml
+ 	if test -n $(XMLLINT) ; then \
+-		xmllint --noout --valid $(top_srcdir)/freedesktop.org.xml;	\
++		$(XMLLINT) --noout --valid $(top_srcdir)/freedesktop.org.xml;	\
+ 	fi
+ 	if test -d CVS/ && test -x ../xdgmime/src/test-mime-data && test -x $(top_builddir)/test-tree-magic ; then \
+ 		mkdir -p $(top_builddir)/temp-mime-dir/mime/packages ; \

Added: trunk/buildroot/package/shared-mime-info/shared-mime-info.mk
===================================================================
--- trunk/buildroot/package/shared-mime-info/shared-mime-info.mk	                        (rev 0)
+++ trunk/buildroot/package/shared-mime-info/shared-mime-info.mk	2009-04-29 07:21:02 UTC (rev 26236)
@@ -0,0 +1,72 @@
+#############################################################
+#
+# shared-mime-info
+#
+#############################################################
+SHARED_MIME_INFO_VERSION = 0.60
+SHARED_MIME_INFO_SOURCE = shared-mime-info-$(SHARED_MIME_INFO_VERSION).tar.bz2
+SHARED_MIME_INFO_SITE = http://freedesktop.org/~hadess
+
+SHARED_MIME_INFO_INSTALL_STAGING = YES
+SHARED_MIME_INFO_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
+SHARED_MIME_INFO_INSTALL_TARGET = NO
+
+SHARED_MIME_INFO_AUTORECONF = NO
+SHARED_MIME_INFO_CONF_ENV = XMLLINT=$(HOST_DIR)/usr/bin/xmllint
+SHARED_MIME_INFO_DEPENDENCIES = uclibc host-pkgconfig host-libglib2 host-libxml2
+
+SHARED_MIME_INFO_CONF_OPT = --disable-update-mimedb
+
+$(eval $(call AUTOTARGETS,package,shared-mime-info))
+
+
+# shared-mime-info for the host
+SHARED_MIME_INFO_HOST_DIR:=$(BUILD_DIR)/shared-mime-info-$(SHARED_MIME_INFO_VERSION)-host
+SHARED_MIME_INFO_HOST_BINARY:=$(HOST_DIR)/usr/bin/update-mime-database
+
+$(DL_DIR)/$(SHARED_MIME_INFO_SOURCE):
+	$(call DOWNLOAD,$(SHARED_MIME_INFO_SITE),$(SHARED_MIME_INFO_SOURCE))
+
+$(STAMP_DIR)/host_shared-mime-info_unpacked: $(DL_DIR)/$(SHARED_MIME_INFO_SOURCE)
+	mkdir -p $(SHARED_MIME_INFO_HOST_DIR)
+	$(INFLATE$(suffix $(SHARED_MIME_INFO_SOURCE))) $< | \
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(SHARED_MIME_INFO_HOST_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(SHARED_MIME_INFO_HOST_DIR) package/shared-mime-info/ \*.patch
+	touch $@
+
+$(STAMP_DIR)/host_shared-mime-info_configured: $(STAMP_DIR)/host_shared-mime-info_unpacked $(STAMP_DIR)/host_pkgconfig_installed
+	(cd $(SHARED_MIME_INFO_HOST_DIR); rm -rf config.cache; \
+		$(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CFLAGS)" \
+		LDFLAGS="$(HOST_LDFLAGS)" \
+		./configure \
+		--prefix="$(HOST_DIR)/usr" \
+		--sysconfdir="$(HOST_DIR)/etc" \
+		--disable-update-mimedb \
+	)
+	touch $@
+
+$(STAMP_DIR)/host_shared-mime-info_compiled: $(STAMP_DIR)/host_shared-mime-info_configured
+	$(MAKE) -C $(SHARED_MIME_INFO_HOST_DIR)
+	touch $@
+
+$(STAMP_DIR)/host_shared-mime-info_installed: $(STAMP_DIR)/host_shared-mime-info_compiled
+	$(HOST_MAKE_ENV) $(MAKE) -C $(SHARED_MIME_INFO_HOST_DIR) install
+	touch $@
+
+host-shared-mime-info: $(STAMP_DIR)/host_shared-mime-info_installed
+
+host-shared-mime-info-source: shared-mime-info-source
+
+host-shared-mime-info-clean:
+	rm -f $(addprefix $(STAMP_DIR)/host_shared-mime-info_,unpacked configured compiled installed)
+	-$(MAKE) -C $(SHARED_MIME_INFO_HOST_DIR) uninstall
+	-$(MAKE) -C $(SHARED_MIME_INFO_HOST_DIR) clean
+
+host-shared-mime-info-dirclean:
+	rm -rf $(SHARED_MIME_INFO_HOST_DIR)
+
+# update the shared-mime-info database in the target
+$(SHARED_MIME_INFO_HOOK_POST_INSTALL): host-shared-mime-info
+	$(SHARED_MIME_INFO_HOST_BINARY) $(STAGING_DIR)/usr/share/mime
+	$(INSTALL) -D $(STAGING_DIR)/usr/share/mime/mime.cache $(TARGET_DIR)/usr/share/mime/mime.cache
