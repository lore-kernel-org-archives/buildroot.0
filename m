From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 May 2010 01:15:33 +0200
Subject: [Buildroot] [PATCH 08/12] mutt: fix build and convert to autotools
In-Reply-To: <cover.1273965305.git.thomas.petazzoni@free-electrons.com>
References: <cover.1273965305.git.thomas.petazzoni@free-electrons.com>
Message-ID: <698c6d575bb4d5c07ca1c1644ed400e1fef97229.1273965305.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mutt has been upgraded, but the mutt-1.5.16-makedoc-hostcc.patch
wasn't upgraded accordingly, causing build failures in the
documentation. Therefore, we add a new patch
mutt-1.5.17+20080114-nodoc.patch that disables the construction of the
documentation.

As this patch modifies Makefile.am, we need to autoreconf the
package. The simplest and cleanest way to do this is to convert the
package to the autotools infrastructure.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mutt/mutt-1.5.16-makedoc-hostcc.patch |   32 -----------
 package/mutt/mutt-1.5.17+20080114-nodoc.patch |   21 +++++++
 package/mutt/mutt.mk                          |   73 ++++---------------------
 3 files changed, 32 insertions(+), 94 deletions(-)
 delete mode 100644 package/mutt/mutt-1.5.16-makedoc-hostcc.patch
 create mode 100644 package/mutt/mutt-1.5.17+20080114-nodoc.patch

diff --git a/package/mutt/mutt-1.5.16-makedoc-hostcc.patch b/package/mutt/mutt-1.5.16-makedoc-hostcc.patch
deleted file mode 100644
index de5cc2d..0000000
--- a/package/mutt/mutt-1.5.16-makedoc-hostcc.patch
+++ /dev/null
@@ -1,32 +0,0 @@
---- mutt-1.5.16.oorig/Makefile.in	2007-09-02 22:16:23.000000000 +0200
-+++ mutt-1.5.16/Makefile.in	2007-09-02 22:19:49.000000000 +0200
-@@ -164,12 +164,6 @@
- DBX = @DBX@
- DEBUGGER = @DEBUGGER@
- 
--# $(makedoc_OBJECTS): $(makedoc_SOURCES)
--# 	$(HOST_CC) $(DEFS) $(AM_CPPFLAGS) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) -c $<
--
--# makedoc: $(makedoc_OBJECTS) $(makedoc_DEPENDENCIES)
--# 	@rm -rf makedoc
--# 	$(HOST_CC) $(AM_CFLAGS) $(LDFLAGS) $(makedoc_LDFLAGS) $(makedoc_OBJECTS) $(makedoc_LDADD) -o makedoc
- DEFS = -DPKGDATADIR=\"$(pkgdatadir)\" -DSYSCONFDIR=\"$(sysconfdir)\" \
- 	-DBINDIR=\"$(bindir)\" -DMUTTLOCALEDIR=\"$(datadir)/locale\" \
- 	-DHAVE_CONFIG_H=1
-@@ -447,9 +441,15 @@
- 
- clean-binPROGRAMS:
- 	-test -z "$(bin_PROGRAMS)" || rm -f $(bin_PROGRAMS)
-+
-+$(makedoc_OBJECTS): $(makedoc_SOURCES)
-+	$(CC_FOR_BUILD) -DHAVE_UNISTD_H -DHAVE_GETOPT_H -DHAVE_STRERROR -c $< ;#$(DEFS) $(AM_CPPFLAGS) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) -c $<
-+#makedoc: $(makedoc_OBJECTS) $(makedoc_DEPENDENCIES)
-+#	@rm -rf makedoc
-+#	$(CC_FOR_BUILD) $(AM_CFLAGS) $(LDFLAGS) $(makedoc_LDFLAGS) $(makedoc_OBJECTS) $(makedoc_LDADD) -o makedoc
- makedoc$(EXEEXT): $(makedoc_OBJECTS) $(makedoc_DEPENDENCIES) 
- 	@rm -f makedoc$(EXEEXT)
--	$(LINK) $(makedoc_LDFLAGS) $(makedoc_OBJECTS) $(makedoc_LDADD) $(LIBS)
-+	$(CC_FOR_BUILD) $(makedoc_LDFLAGS) $(makedoc_OBJECTS) $(makedoc_LDADD) $(LIBS) -o $@
- mutt$(EXEEXT): $(mutt_OBJECTS) $(mutt_DEPENDENCIES) 
- 	@rm -f mutt$(EXEEXT)
- 	$(LINK) $(mutt_LDFLAGS) $(mutt_OBJECTS) $(mutt_LDADD) $(LIBS)
diff --git a/package/mutt/mutt-1.5.17+20080114-nodoc.patch b/package/mutt/mutt-1.5.17+20080114-nodoc.patch
new file mode 100644
index 0000000..6fd556d
--- /dev/null
+++ b/package/mutt/mutt-1.5.17+20080114-nodoc.patch
@@ -0,0 +1,21 @@
+Disable the documentation build
+
+The documentation tool is compiled for the target, but executed on the
+host. We don't bother fixing this, as we don't care of the
+documentation in Buildroot.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: mutt-1.5.17+20080114/Makefile.am
+===================================================================
+--- mutt-1.5.17+20080114.orig/Makefile.am	2010-05-15 18:15:08.000000000 +0200
++++ mutt-1.5.17+20080114/Makefile.am	2010-05-15 18:15:17.000000000 +0200
+@@ -9,7 +9,7 @@
+ IMAP_INCLUDES = -I$(top_srcdir)/imap
+ endif
+ 
+-SUBDIRS = m4 po intl doc contrib $(IMAP_SUBDIR)
++SUBDIRS = m4 po intl contrib $(IMAP_SUBDIR)
+ 
+ bin_SCRIPTS = muttbug flea @SMIMEAUX_TARGET@
+ 
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 3ad0f2f..d021aef 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -7,70 +7,19 @@ MUTT_VERSION:=1.5.17+20080114
 MUTT_SOURCE:=mutt_$(MUTT_VERSION).orig.tar.gz
 MUTT_PATCH:=mutt_$(MUTT_VERSION)-1.diff.gz
 MUTT_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/m/mutt/
-MUTT_DIR:=$(BUILD_DIR)/mutt-$(MUTT_VERSION)
-MUTT_CAT:=$(ZCAT)
-MUTT_BINARY:=mutt
-MUTT_TARGET_BINARY:=usr/bin/mutt
-
-$(DL_DIR)/$(MUTT_SOURCE):
-	$(call DOWNLOAD,$(MUTT_SITE),$(MUTT_SOURCE))
-
-$(DL_DIR)/$(MUTT_PATCH):
-	$(call DOWNLOAD,$(MUTT_SITE),$(MUTT_PATCH))
-
-$(MUTT_DIR)/.unpacked: $(DL_DIR)/$(MUTT_SOURCE) $(DL_DIR)/$(MUTT_PATCH)
-	$(MUTT_CAT) $(DL_DIR)/$(MUTT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(MUTT_DIR) package/mutt/ mutt-$(MUTT_VERSION)\*.patch
-ifneq ($(MUTT_PATCH),)
-	(cd $(MUTT_DIR) && $(MUTT_CAT) $(DL_DIR)/$(MUTT_PATCH) | patch -p1)
-	if [ -d $(MUTT_DIR)/debian/patches ]; then \
-		toolchain/patch-kernel.sh $(MUTT_DIR) $(MUTT_DIR)/debian/patches \*.patch; \
-	fi
-endif
-	touch $@
-
-$(MUTT_DIR)/.configured: $(MUTT_DIR)/.unpacked
-	(cd $(MUTT_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		$(DISABLE_LARGEFILE) \
-		$(DISABLE_IPV6) \
-		$(DISABLE_NLS) \
+MUTT_DEPENDENCIES=ncurses
+MUTT_CONF_OPT = \
 		--disable-smtp \
 		--disable-iconv \
-		--without-wc-funcs \
-	)
-	touch $@
-
-$(MUTT_DIR)/$(MUTT_BINARY): $(MUTT_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(MUTT_DIR)
-
-$(TARGET_DIR)/$(MUTT_TARGET_BINARY): $(MUTT_DIR)/$(MUTT_BINARY)
-	cp -dpf $(MUTT_DIR)/$(MUTT_BINARY) $@
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
+		--without-wc-funcs
+MUTT_AUTORECONF=YES
 
-mutt-source: $(DL_DIR)/$(MUTT_SOURCE) $(DL_DIR)/$(MUTT_PATCH)
+define MUTT_APPLY_DEBIAN_PATCHES
+        if [ -d $(@D)/debian/patches ]; then \
+                toolchain/patch-kernel.sh $(@D) $(@D)/debian/patches \*.patch; \
+        fi
+endef
 
-mutt-unpacked: $(MUTT_DIR)/.unpacked
+MUTT_POST_PATCH_HOOKS += MUTT_APPLY_DEBIAN_PATCHES
 
-mutt: ncurses $(TARGET_DIR)/$(MUTT_TARGET_BINARY)
-
-mutt-clean:
-	-$(MAKE) -C $(MUTT_DIR) clean
-	rm -f $(TARGET_DIR)/$(MUTT_TARGET_BINARY)
-
-mutt-dirclean:
-	rm -rf $(MUTT_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_MUTT),y)
-TARGETS+=mutt
-endif
+$(eval $(call AUTOTARGETS,package,mutt))
\ No newline at end of file
-- 
1.6.3.3
