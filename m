From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon,  4 May 2009 16:21:18 +0200
Subject: [Buildroot] [PATCH 3/3] package/: add gob2 for target/host and use
	for gmpc compilation
In-Reply-To: <1241446878-32056-2-git-send-email-jacmet@uclibc.org>
References: <1241446878-32056-1-git-send-email-jacmet@uclibc.org>
	<1241446878-32056-2-git-send-email-jacmet@uclibc.org>
Message-ID: <1241446878-32056-3-git-send-email-jacmet@uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Peter Korsgaard <jacmet@sunsite.dk>

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                |    1 +
 package/gmpc/gmpc.mk                             |   12 +----
 package/gob2/Config.in                           |   10 ++++
 package/gob2/gob2-dont-include-from-prefix.patch |   40 +++++++++++++++
 package/gob2/gob2.mk                             |   56 ++++++++++++++++++++++
 5 files changed, 110 insertions(+), 9 deletions(-)
 create mode 100644 package/gob2/Config.in
 create mode 100644 package/gob2/gob2-dont-include-from-prefix.patch
 create mode 100644 package/gob2/gob2.mk

diff --git a/package/Config.in b/package/Config.in
index f01f6f6..251888b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -384,6 +384,7 @@ source "package/dillo/Config.in"
 source "package/docker/Config.in"
 source "package/gqview/Config.in"
 source "package/gmpc/Config.in"
+source "package/gob2/Config.in"
 source "package/gtkperf/Config.in"
 source "package/leafpad/Config.in"
 source "package/midori/Config.in"
diff --git a/package/gmpc/gmpc.mk b/package/gmpc/gmpc.mk
index 95795dd..7110d15 100644
--- a/package/gmpc/gmpc.mk
+++ b/package/gmpc/gmpc.mk
@@ -7,10 +7,11 @@ GMPC_VERSION = 0.17.0
 GMPC_SOURCE = gmpc-$(GMPC_VERSION).tar.gz
 GMPC_SITE = http://download.sarine.nl/download/Programs/gmpc/$(GMPC_VERSION)/
 GMPC_LIBTOOL_PATCH = NO
-GMPC_CONF_ENV = ac_cv_lib_curl_curl_global_init=yes
+GMPC_CONF_ENV = ac_cv_lib_curl_curl_global_init=yes \
+		ac_cv_path_GOB2=$(GOB2_HOST_BINARY)
 GMPC_CONF_OPT = --disable-mmkeys
 
-GMPC_DEPENDENCIES = libglib2 libgtk2 libglade libcurl libmpd
+GMPC_DEPENDENCIES = libglib2 libgtk2 libglade libcurl libmpd host-gob2
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBSM),y)
 GMPC_DEPENENCIES += xlib_libSM
@@ -20,10 +21,3 @@ GMPC_CONF_OPT += --disable-sm
 endif
 
 $(eval $(call AUTOTARGETS,package,gmpc))
-
-# we NEED a host gob2
-ifeq ($(BR2_PACKAGE_GMPC),y)
-ifeq ($(wildcard $(shell which gob2 || echo /usr/bin/gob2)),)
-$(error Host gob2 not found. Please install GTK+ Object Builder package on your host (something like gob2))
-endif
-endif
diff --git a/package/gob2/Config.in b/package/gob2/Config.in
new file mode 100644
index 0000000..314a1da
--- /dev/null
+++ b/package/gob2/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_GOB2
+	bool "gob2"
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_FLEX
+	select BR2_PACKAGE_BISON
+	help
+	  GOB (GTK+ Object Builder) is a preprocessor which simplifies
+	  the writing of GObjects in C.
+
+	  http://www.jirka.org/gob.html
diff --git a/package/gob2/gob2-dont-include-from-prefix.patch b/package/gob2/gob2-dont-include-from-prefix.patch
new file mode 100644
index 0000000..1b603d7
--- /dev/null
+++ b/package/gob2/gob2-dont-include-from-prefix.patch
@@ -0,0 +1,40 @@
+[PATCH] Don't search $prefix/include for header files
+
+Don't add $prefix/include to the header file search path, as that breaks
+cross compilation (build $prefix/include isn't the same as target
+$prefix/include).
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ src/Makefile.am |    3 +--
+ src/Makefile.in |    3 +--
+ 2 files changed, 2 insertions(+), 4 deletions(-)
+
+Index: gob2-2.0.15/src/Makefile.am
+===================================================================
+--- gob2-2.0.15.orig/src/Makefile.am
++++ gob2-2.0.15/src/Makefile.am
+@@ -17,8 +17,7 @@ INCLUDES = \
+ 	-I$(top_builddir)	\
+ 	-I$(top_builddir)/src	\
+ 	-I$(top_srcdir)		\
+-	-I$(top_srcdir)/src	\
+-	-I$(includedir)
++	-I$(top_srcdir)/src
+ 
+ if NOINSTGOB
+ noinst_PROGRAMS = @NOINSTGOB@
+Index: gob2-2.0.15/src/Makefile.in
+===================================================================
+--- gob2-2.0.15.orig/src/Makefile.in
++++ gob2-2.0.15/src/Makefile.in
+@@ -193,8 +193,7 @@ INCLUDES = \
+ 	-I$(top_builddir)	\
+ 	-I$(top_builddir)/src	\
+ 	-I$(top_srcdir)		\
+-	-I$(top_srcdir)/src	\
+-	-I$(includedir)
++	-I$(top_srcdir)/src
+ 
+ @NOINSTGOB_TRUE at noinst_PROGRAMS = @NOINSTGOB@
+ @NOINSTGOB_FALSE at bin_PROGRAMS = @INSTGOB@
diff --git a/package/gob2/gob2.mk b/package/gob2/gob2.mk
new file mode 100644
index 0000000..a36f9ad
--- /dev/null
+++ b/package/gob2/gob2.mk
@@ -0,0 +1,56 @@
+#############################################################
+#
+# gob2
+#
+#############################################################
+GOB2_VERSION = 2.0.15
+GOB2_SOURCE = gob2-$(GOB2_VERSION).tar.gz
+GOB2_SITE = http://ftp.5z.com/pub/gob/
+
+GOB2_DEPENDENCIES = libglib2 flex bison host-pkgconfig
+
+$(eval $(call AUTOTARGETS,package,gob2))
+
+# gob2 for the host
+GOB2_HOST_DIR:=$(BUILD_DIR)/gob2-$(GOB2_VERSION)-host
+GOB2_HOST_BINARY:=$(HOST_DIR)/usr/bin/gob2
+
+$(DL_DIR)/$(GOB2_SOURCE):
+	$(call DOWNLOAD,$(GOB2_SITE),$(GOB2_SOURCE))
+
+$(STAMP_DIR)/host_gob2_unpacked: $(DL_DIR)/$(GOB2_SOURCE)
+	mkdir -p $(GOB2_HOST_DIR)
+	$(INFLATE$(suffix $(GOB2_SOURCE))) $< | \
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(GOB2_HOST_DIR) $(TAR_OPTIONS) -
+	touch $@
+
+$(STAMP_DIR)/host_gob2_configured: $(STAMP_DIR)/host_gob2_unpacked $(STAMP_DIR)/host_libglib2_installed
+	(cd $(GOB2_HOST_DIR); rm -rf config.cache; \
+		$(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CFLAGS)" \
+		LDFLAGS="$(HOST_LDFLAGS)" \
+		./configure \
+		--prefix="$(HOST_DIR)/usr" \
+		--sysconfdir="$(HOST_DIR)/etc" \
+	)
+	touch $@
+
+$(STAMP_DIR)/host_gob2_compiled: $(STAMP_DIR)/host_gob2_configured
+	$(HOST_MAKE_ENV) $(MAKE) -C $(GOB2_HOST_DIR)
+	touch $@
+
+$(STAMP_DIR)/host_gob2_installed: $(STAMP_DIR)/host_gob2_compiled
+	$(HOST_MAKE_ENV) $(MAKE) -C $(GOB2_HOST_DIR) install
+	touch $@
+
+host-gob2: $(STAMP_DIR)/host_gob2_installed
+
+host-gob2-source: gob2-source
+
+host-gob2-clean:
+	rm -f $(addprefix $(STAMP_DIR)/host_gob2_,unpacked configured compiled installed)
+	-$(MAKE) -C $(GOB2_HOST_DIR) uninstall
+	-$(MAKE) -C $(GOB2_HOST_DIR) clean
+
+host-gob2-dirclean:
+	rm -rf $(GOB2_HOST_DIR)
-- 
1.6.2
