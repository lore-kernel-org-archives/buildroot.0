From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Wed, 13 Aug 2008 12:51:45 +0100
Subject: [Buildroot] [PATCH] Bounce lzo version and update to autotools.in
	format	(tested with mtd-utils)
Message-ID: <1218628305.12419.2.camel@lnx32dtp04>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bounce LZO version and update makefile - tested with latest mtdutils.

 lzo-cross-compile.patch |   43 ---------------------------
 lzo.mk                  |   75 +++++++-----------------------------------------
 2 files changed, 11 insertions(+), 107 deletions(-)

Signed-off-by: daniel.j.laird <daniel.j.laird@nxp.com>

diff -urN buildroot.orig/package/lzo/lzo-cross-compile.patch buildroot/package/lzo/lzo-cross-compile.patch
--- buildroot.orig/package/lzo/lzo-cross-compile.patch	2008-08-13 10:44:43.000000000 +0100
+++ buildroot/package/lzo/lzo-cross-compile.patch	1970-01-01 01:00:00.000000000 +0100
@@ -1,43 +0,0 @@
-For some reason the lzo autoconf script uses a local macro that does
-a test for cross-compiles, and assumes that if the build target name
-and the host target name are the same that --host was not specified to
-the configure script. In the uClibc buildroot, this is not the case.
-
---- lzo-1.08/aclocal.m4	2002-07-12 18:31:52.000000000 -0700
-+++ lzo-1.08/aclocal.m4.new	2004-03-10 15:32:42.000000000 -0700
-@@ -205,12 +205,6 @@
- [
- AC_REQUIRE([AC_PROG_CC])
- 
--if test "X$cross_compiling" = Xyes; then
--  if test "X$build" = "X$host"; then
--    AC_MSG_ERROR([you are cross compiling - please use the \`--host=' option])
--  fi
--fi
--
- ])
- 
- 
---- lzo-1.08/configure-dist	2004-03-11 02:18:28.000000000 -0600
-+++ lzo-1.08/configure	2004-03-11 02:19:16.000000000 -0600
-@@ -2282,13 +2282,13 @@
- 
- 
- 
--if test "X$cross_compiling" = Xyes; then
--  if test "X$build" = "X$host"; then
--    { { echo "$as_me:$LINENO: error: you are cross compiling - please use the \`--host=' option" >&5
--echo "$as_me: error: you are cross compiling - please use the \`--host=' option" >&2;}
--   { (exit 1); exit 1; }; }
--  fi
--fi
-+#if test "X$cross_compiling" = Xyes; then
-+#  if test "X$build" = "X$host"; then
-+#    { { echo "$as_me:$LINENO: error: you are cross compiling - please use the \`--host=' option" >&5
-+#echo "$as_me: error: you are cross compiling - please use the \`--host=' option" >&2;}
-+#   { (exit 1); exit 1; }; }
-+#  fi
-+#fi
- 
- 
- 
diff -urN buildroot.orig/package/lzo/lzo.mk buildroot/package/lzo/lzo.mk
--- buildroot.orig/package/lzo/lzo.mk	2008-08-13 10:44:43.000000000 +0100
+++ buildroot/package/lzo/lzo.mk	2008-08-12 11:58:11.000000000 +0100
@@ -2,69 +2,16 @@
 #
 # lzo
 #
-# Note: this builds only a static library, it does not provide
-# anything to be installed into the target system.
-#
 #############################################################
-LZO_VERSION:=1.08
-LZO_SOURCE:=lzo_$(LZO_VERSION).orig.tar.gz
-LZO_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/l/lzo
-#LZO_SOURCE:=lzo-$(LZO_VERSION).tar.bz2
-#LZO_SITE:=http://www.oberhumer.com/opensource/lzo/download
-LZO_DIR:=$(BUILD_DIR)/lzo-$(LZO_VERSION)
-LZO_CAT:=$(ZCAT)
-
-$(DL_DIR)/$(LZO_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(LZO_SITE)/$(LZO_SOURCE)
-
-lzo-source: $(DL_DIR)/$(LZO_SOURCE)
-
-$(LZO_DIR)/.unpacked: $(DL_DIR)/$(LZO_SOURCE)
-	$(LZO_CAT) $(DL_DIR)/$(LZO_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LZO_DIR) package/lzo/ lzo\*.patch
-	$(CONFIG_UPDATE) $(LZO_DIR)/acconfig
-	touch $@
-
-LZO_CONFIG_SHARED:=--disable-shared
-#LZO_CONFIG_SHARED:=--enable-shared
-
-$(LZO_DIR)/.configured: $(LZO_DIR)/.unpacked
-	(cd $(LZO_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--includedir=/usr/include \
-		--libdir=/usr/lib \
-		$(LZO_CONFIG_SHARED) \
-	)
-	touch $@
-
-$(LZO_DIR)/src/liblzo.la: $(LZO_DIR)/.configured
-	$(MAKE) -C $(LZO_DIR)
-
-$(STAGING_DIR)/usr/lib/liblzo.a: $(LZO_DIR)/src/liblzo.la
-	$(MAKE) CC="$(TARGET_CC)" DESTDIR=$(STAGING_DIR) -C $(LZO_DIR) install
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/liblzo.la
-	touch -c $@
+LZO_VERSION:=2.03
+LZO_SOURCE:=lzo-$(LZO_VERSION).tar.gz
+LZO_SITE:=http://www.oberhumer.com/opensource/lzo/download
+LZO_AUTORECONF = NO
+LZO_INSTALL_STAGING = YES
+LZO_INSTALL_TARGET = YES
+LZO_INSTALL_STAGING_OPT = CC="$(TARGET_CC)" DESTDIR=$(STAGING_DIR) install
+LZO_CONF_ENV =
+LZO_CONF_OPT =
+LZO_DEPENDENCIES = uclibc
 
-lzo: uclibc $(STAGING_DIR)/usr/lib/liblzo.a
-
-lzo-clean:
-	-$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LZO_DIR) uninstall
-	-$(MAKE) -C $(LZO_DIR) clean
-
-lzo-dirclean:
-	rm -rf $(LZO_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(strip $(BR2_PACKAGE_LZO)),y)
-TARGETS+=lzo
-endif
+$(eval $(call AUTOTARGETS,package,lzo))
