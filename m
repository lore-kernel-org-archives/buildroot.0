From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  2 Sep 2007 13:53:38 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  mutt
Message-ID: <20070902205338.DCCF1A65FF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-02 13:53:38 -0700 (Sun, 02 Sep 2007)
New Revision: 19764

Log:
- add mutt. Will need wchar massage


Added:
   trunk/buildroot/package/mutt/
   trunk/buildroot/package/mutt/Config.in
   trunk/buildroot/package/mutt/mutt-1.5.16-makedoc-hostcc.patch
   trunk/buildroot/package/mutt/mutt.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-09-02 17:44:09 UTC (rev 19763)
+++ trunk/buildroot/package/Config.in	2007-09-02 20:53:38 UTC (rev 19764)
@@ -148,6 +148,7 @@
 source "package/lrzsz/Config.in"
 source "package/mdnsresponder/Config.in"
 source "package/mrouted/Config.in"
+source "package/mutt/Config.in"
 source "package/nbd/Config.in"
 source "package/ncftp/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS

Added: trunk/buildroot/package/mutt/Config.in
===================================================================
--- trunk/buildroot/package/mutt/Config.in	                        (rev 0)
+++ trunk/buildroot/package/mutt/Config.in	2007-09-02 20:53:38 UTC (rev 19764)
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_MUTT
+	bool "mutt"
+	default n
+	select BR2_PACKAGE_NCURSES
+	help
+	  Mutt is a sophisticated text-based Mail User Agent (MUA)
+
+	  http://www.mutt.org/
+

Added: trunk/buildroot/package/mutt/mutt-1.5.16-makedoc-hostcc.patch
===================================================================
--- trunk/buildroot/package/mutt/mutt-1.5.16-makedoc-hostcc.patch	                        (rev 0)
+++ trunk/buildroot/package/mutt/mutt-1.5.16-makedoc-hostcc.patch	2007-09-02 20:53:38 UTC (rev 19764)
@@ -0,0 +1,32 @@
+--- mutt-1.5.16.oorig/Makefile.in	2007-09-02 22:16:23.000000000 +0200
++++ mutt-1.5.16/Makefile.in	2007-09-02 22:19:49.000000000 +0200
+@@ -164,12 +164,6 @@
+ DBX = @DBX@
+ DEBUGGER = @DEBUGGER@
+ 
+-# $(makedoc_OBJECTS): $(makedoc_SOURCES)
+-# 	$(HOST_CC) $(DEFS) $(AM_CPPFLAGS) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) -c $<
+-
+-# makedoc: $(makedoc_OBJECTS) $(makedoc_DEPENDENCIES)
+-# 	@rm -rf makedoc
+-# 	$(HOST_CC) $(AM_CFLAGS) $(LDFLAGS) $(makedoc_LDFLAGS) $(makedoc_OBJECTS) $(makedoc_LDADD) -o makedoc
+ DEFS = -DPKGDATADIR=\"$(pkgdatadir)\" -DSYSCONFDIR=\"$(sysconfdir)\" \
+ 	-DBINDIR=\"$(bindir)\" -DMUTTLOCALEDIR=\"$(datadir)/locale\" \
+ 	-DHAVE_CONFIG_H=1
+@@ -447,9 +441,15 @@
+ 
+ clean-binPROGRAMS:
+ 	-test -z "$(bin_PROGRAMS)" || rm -f $(bin_PROGRAMS)
++
++$(makedoc_OBJECTS): $(makedoc_SOURCES)
++	$(CC_FOR_BUILD) -DHAVE_UNISTD_H -DHAVE_GETOPT_H -DHAVE_STRERROR -c $< ;#$(DEFS) $(AM_CPPFLAGS) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) -c $<
++#makedoc: $(makedoc_OBJECTS) $(makedoc_DEPENDENCIES)
++#	@rm -rf makedoc
++#	$(CC_FOR_BUILD) $(AM_CFLAGS) $(LDFLAGS) $(makedoc_LDFLAGS) $(makedoc_OBJECTS) $(makedoc_LDADD) -o makedoc
+ makedoc$(EXEEXT): $(makedoc_OBJECTS) $(makedoc_DEPENDENCIES) 
+ 	@rm -f makedoc$(EXEEXT)
+-	$(LINK) $(makedoc_LDFLAGS) $(makedoc_OBJECTS) $(makedoc_LDADD) $(LIBS)
++	$(CC_FOR_BUILD) $(makedoc_LDFLAGS) $(makedoc_OBJECTS) $(makedoc_LDADD) $(LIBS) -o $@
+ mutt$(EXEEXT): $(mutt_OBJECTS) $(mutt_DEPENDENCIES) 
+ 	@rm -f mutt$(EXEEXT)
+ 	$(LINK) $(mutt_LDFLAGS) $(mutt_OBJECTS) $(mutt_LDADD) $(LIBS)

Added: trunk/buildroot/package/mutt/mutt.mk
===================================================================
--- trunk/buildroot/package/mutt/mutt.mk	                        (rev 0)
+++ trunk/buildroot/package/mutt/mutt.mk	2007-09-02 20:53:38 UTC (rev 19764)
@@ -0,0 +1,74 @@
+#############################################################
+#
+# mutt
+#
+#############################################################
+MUTT_VERSION:=1.5.16
+MUTT_SOURCE:=mutt_$(MUTT_VERSION).orig.tar.gz
+MUTT_PATCH:=mutt_$(MUTT_VERSION)-3.diff.gz
+MUTT_SITE:=ftp://ftp.debian.org/debian/pool/main/m/mutt/
+MUTT_DIR:=$(BUILD_DIR)/mutt-$(MUTT_VERSION)
+MUTT_CAT:=$(ZCAT)
+MUTT_BINARY:=mutt
+MUTT_TARGET_BINARY:=usr/bin/mutt
+
+$(DL_DIR)/$(MUTT_SOURCE):
+	$(WGET) -P $(DL_DIR) $(MUTT_SITE)/$(MUTT_SOURCE)
+
+$(DL_DIR)/$(MUTT_PATCH):
+	$(WGET) -P $(DL_DIR) $(MUTT_SITE)/$(MUTT_PATCH)
+
+mutt-source: $(DL_DIR)/$(MUTT_SOURCE) $(DL_DIR)/$(MUTT_PATCH)
+
+$(MUTT_DIR)/.unpacked: $(DL_DIR)/$(MUTT_SOURCE) $(DL_DIR)/$(MUTT_PATCH)
+	$(MUTT_CAT) $(DL_DIR)/$(MUTT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(MUTT_DIR) package/mutt/ mutt\*.patch
+ifneq ($(MUTT_PATCH),)
+	(cd $(MUTT_DIR) && $(MUTT_CAT) $(DL_DIR)/$(MUTT_PATCH) | patch -p1)
+	if [ -d $(MUTT_DIR)/debian/patches ]; then \
+		toolchain/patch-kernel.sh $(MUTT_DIR) $(MUTT_DIR)/debian/patches \*.patch; \
+	fi
+endif
+	touch $@
+
+$(MUTT_DIR)/.configured: $(MUTT_DIR)/.unpacked
+	(cd $(MUTT_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		$(DISABLE_LARGEFILE) \
+		$(DISABLE_IPV6) \
+		$(DISABLE_NLS) \
+		--disable-smtp \
+		--disable-iconv \
+		--without-wc-funcs \
+	)
+	touch $@
+
+$(MUTT_DIR)/$(MUTT_BINARY): $(MUTT_DIR)/.configured
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(MUTT_DIR)
+
+$(TARGET_DIR)/$(MUTT_TARGET_BINARY): $(MUTT_DIR)/$(MUTT_BINARY)
+	cp -dpf $(MUTT_DIR)/$(MUTT_BINARY) $@
+	$(STRIP) $(STRIP_STRIP_ALL) $@
+
+mutt: uclibc ncurses $(TARGET_DIR)/$(MUTT_TARGET_BINARY)
+
+mutt-clean:
+	-$(MAKE) -C $(MUTT_DIR) clean
+	rm -f $(TARGET_DIR)/$(MUTT_TARGET_BINARY)
+
+mutt-dirclean:
+	rm -rf $(MUTT_DIR)
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_MUTT)),y)
+TARGETS+=mutt
+endif
