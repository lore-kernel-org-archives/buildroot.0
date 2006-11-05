From: Thomas Lundquist <lists@zelow.no>
Date: Sun, 5 Nov 2006 17:46:52 +0100
Subject: [Buildroot] [Patch] Separate packages.
Message-ID: <20061105164652.GC14530@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok, next patch.

This is a patch that uses kconfig "tristate" to give the user the
possibility to make separate packages (well, tarballs for now. could do
.rpm or .ipk and do on if anyone felt like it was a good idea, but then
without dependencies, which makes a mess.).

I've kept "M" as the trigger for the packages since I don't feel like
messing with kconfig just for that. The whole "change" to kconfig was to
put MODULES in packages/Config.in so tristate would work.

this keeps TARGET_DIR where it is and adds a TARGET_PACKAGE_DIR for the
packages.


Thomas.
-------------- next part --------------
Index: target/Config.in
===================================================================
--- target/Config.in	(revision 16507)
+++ target/Config.in	(working copy)
@@ -10,6 +10,9 @@
 source "target/tar/Config.in"
 source "target/iso9660/Config.in"
 
+comment "Separate packages"
+source "target/packages/Config.in"
+
 comment "bootloader for target device"
 
 source "target/x86/grub/Config.in"
Index: target/packages/packages.mk
===================================================================
--- target/packages/packages.mk	(revision 0)
+++ target/packages/packages.mk	(revision 0)
@@ -0,0 +1,20 @@
+#############################################################
+#
+# packages to build, yup, packages.
+#
+#############################################################
+
+packages: 
+	( export PATH=$(TARGET_PATH) ; \
+	target/packages/make_packages.sh $(TARGET_PACKAGES_DIR) \
+		$(BR2_TARGET_PACKAGES_COMP) \
+	);
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_TARGET_PACKAGES)),y)
+TARGETS+=packages
+endif
Index: target/packages/make_packages.sh
===================================================================
--- target/packages/make_packages.sh	(revision 0)
+++ target/packages/make_packages.sh	(revision 0)
@@ -0,0 +1,43 @@
+#!/bin/sh -e
+#
+# make-packages
+#
+# Thomas Lundquist <thomasez@zelow.no> 2006-11-05
+#
+
+mkpack () {
+
+	cd $PACKAGES_DIR/$1
+	tar -cpf ../$1.tar *
+
+	cd ..
+	$COMP $1.tar > $1$EXT
+
+}
+
+case $2 in 
+	bz2)
+		COMP="bzip2 -c"
+		EXT=.tar.bz2
+	;;
+	lzma)
+		COMP="lzma -c"
+		EXT=.tar.lz
+	;;
+	gzip)
+		COMP="gzip -c"
+		EXT=.tgz
+	;;
+esac
+
+PACKAGES_DIR=$1
+
+for p in $PACKAGES_DIR/*
+ do
+  if [ -d $p ]
+   then
+    name=`basename $p`
+    echo "Building $name"
+    mkpack $name
+  fi
+done

Property changes on: target/packages/make_packages.sh
___________________________________________________________________
Name: svn:executable
   + *

Index: target/packages/Config.in
===================================================================
--- target/packages/Config.in	(revision 0)
+++ target/packages/Config.in	(revision 0)
@@ -0,0 +1,12 @@
+config BR2_TARGET_PACKAGES
+	bool "Build autonomous packages (if there are any)"
+	default y
+	help
+	  Build autonomous packages/tarballs (if there are any)
+
+config BR2_TARGET_PACKAGES_COMP
+	string "packages type"
+	default	"bz2"
+	help
+	  Compression method for the tarball. bz2, lzma or gzip
+
Index: package/Config.in
===================================================================
--- package/Config.in	(revision 16507)
+++ package/Config.in	(working copy)
@@ -1,5 +1,8 @@
 menu "Package Selection for the target"
 
+config MODULES
+	bool
+	default y
 
 comment "The default minimal system"
 source "package/busybox/Config.in"
Index: package/Makefile.in
===================================================================
--- package/Makefile.in	(revision 16507)
+++ package/Makefile.in	(working copy)
@@ -40,6 +40,7 @@
 #PATCH_DIR=$(BASE_DIR)/sources/patches
 BUILD_DIR:=$(BASE_DIR)/$(TOPDIR_PREFIX)build_$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)
 TARGET_DIR:=$(BUILD_DIR)/root
+TARGET_PACKAGES_DIR:=$(BUILD_DIR)/packages
 TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)
 
 GNU_TARGET_SUFFIX:=-$(strip $(subst ",, $(BR2_GNU_TARGET_SUFFIX)))
Index: package/config/mconf.c
===================================================================
--- package/config/mconf.c	(revision 16507)
+++ package/config/mconf.c	(working copy)
@@ -165,7 +165,8 @@
 	"Arrow keys navigate the menu.  "
 	"<Enter> selects submenus --->.  "
 	"Highlighted letters are hotkeys.  "
-	"Pressing <Y> selectes a feature, while <N> will exclude a feature.  "
+	"Pressing <Y> selectes a feature, while <N> will exclude a feature, "
+	"<M> will build a separate package. "
 	"Press <Esc><Esc> to exit, <?> for Help, </> for Search.  "
 	"Legend: [*] feature is selected  [ ] feature is excluded",
 radiolist_instructions[] =
Index: package/dropbear/dropbear.mk
===================================================================
--- package/dropbear/dropbear.mk	(revision 16507)
+++ package/dropbear/dropbear.mk	(working copy)
@@ -11,6 +11,13 @@
 DROPBEAR_BINARY:=dropbearmulti
 DROPBEAR_TARGET_BINARY:=usr/sbin/dropbear
 
+ifeq ($(strip $(BR2_PACKAGE_DROPBEAR)),m)
+DROPBEAR_DESTDIR=$(TARGET_PACKAGES_DIR)/dropbear
+else
+DROPBEAR_DESTDIR=$(TARGET_DIR)
+endif
+
+
 $(DL_DIR)/$(DROPBEAR_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(DROPBEAR_SITE)/$(DROPBEAR_SOURCE)
 
@@ -55,28 +62,30 @@
 		PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp" \
 		MULTI=1 SCPPROGRESS=1 -C $(DROPBEAR_DIR)
 
-$(TARGET_DIR)/$(DROPBEAR_TARGET_BINARY): $(DROPBEAR_DIR)/$(DROPBEAR_BINARY)
-	#$(MAKE) DESTDIR=$(TARGET_DIR) $(TARGET_CONFIGURE_OPTS) \
+$(DROPBEAR_DESTDIR)/$(DROPBEAR_TARGET_BINARY): $(DROPBEAR_DIR)/$(DROPBEAR_BINARY)
+	mkdir -p $(DROPBEAR_DESTDIR)
+	#$(MAKE) DESTDIR=$(DROPBEAR_DESTDIR) $(TARGET_CONFIGURE_OPTS) \
 	#	LD=$(TARGET_CC) -C $(DROPBEAR_DIR) install
-	#rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
-	#	$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
-	install -d -m 755 $(TARGET_DIR)/usr/sbin
-	install -d -m 755 $(TARGET_DIR)/usr/bin
+	#rm -rf $(DROPBEAR_DESTDIR)/share/locale $(DROPBEAR_DESTDIR)/usr/info \
+	#	$(DROPBEAR_DESTDIR)/usr/man $(DROPBEAR_DESTDIR)/usr/share/doc
+	install -d -m 755 $(DROPBEAR_DESTDIR)/usr/sbin
+	install -d -m 755 $(DROPBEAR_DESTDIR)/usr/bin
 	install -m 755 $(DROPBEAR_DIR)/$(DROPBEAR_BINARY) \
-		$(TARGET_DIR)/$(DROPBEAR_TARGET_BINARY)
-	$(STRIP) $(TARGET_DIR)/$(DROPBEAR_TARGET_BINARY)
-	ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/scp
-	ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/ssh
-	ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/dbclient
-	ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/dropbearkey
-	ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/dropbearconvert
-	cp $(DROPBEAR_DIR)/S50dropbear $(TARGET_DIR)/etc/init.d/
-	chmod a+x $(TARGET_DIR)/etc/init.d/S50dropbear
+		$(DROPBEAR_DESTDIR)/$(DROPBEAR_TARGET_BINARY)
+	$(STRIP) $(DROPBEAR_DESTDIR)/$(DROPBEAR_TARGET_BINARY)
+	ln -snf ../sbin/dropbear $(DROPBEAR_DESTDIR)/usr/bin/scp
+	ln -snf ../sbin/dropbear $(DROPBEAR_DESTDIR)/usr/bin/ssh
+	ln -snf ../sbin/dropbear $(DROPBEAR_DESTDIR)/usr/bin/dbclient
+	ln -snf ../sbin/dropbear $(DROPBEAR_DESTDIR)/usr/bin/dropbearkey
+	ln -snf ../sbin/dropbear $(DROPBEAR_DESTDIR)/usr/bin/dropbearconvert
+	install -d -m 755 $(DROPBEAR_DESTDIR)/etc/init.d
+	install -m 755 $(DROPBEAR_DIR)/S50dropbear \
+		$(DROPBEAR_DESTDIR)/etc/init.d/S50dropbear
 
-dropbear: uclibc zlib $(TARGET_DIR)/$(DROPBEAR_TARGET_BINARY)
+dropbear: uclibc zlib $(DROPBEAR_DESTDIR)/$(DROPBEAR_TARGET_BINARY)
 
 dropbear-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) $(TARGET_CONFIGURE_OPTS) \
+	$(MAKE) DESTDIR=$(DROPBEAR_DESTDIR) $(TARGET_CONFIGURE_OPTS) \
 		LD=$(TARGET_CC) -C $(DROPBEAR_DIR) uninstall
 	-$(MAKE) -C $(DROPBEAR_DIR) clean
 
@@ -91,3 +100,6 @@
 ifeq ($(strip $(BR2_PACKAGE_DROPBEAR)),y)
 TARGETS+=dropbear
 endif
+ifeq ($(strip $(BR2_PACKAGE_DROPBEAR)),m)
+TARGETS+=dropbear
+endif
Index: package/dropbear/Config.in
===================================================================
--- package/dropbear/Config.in	(revision 16507)
+++ package/dropbear/Config.in	(working copy)
@@ -1,11 +1,13 @@
 config BR2_PACKAGE_DROPBEAR
-	bool "dropbear"
+	tristate "dropbear"
 	default n
 	help
 	  A small SSH 2 server designed for small memory environments.
 
 	  http://matt.ucc.asn.au/dropbear/dropbear.html
 
+	  Choosing <M> here will choose to build a separate package.
+
 config BR2_PACKAGE_DROPBEAR_URANDOM
 	bool "  Use /dev/urandom (low entropy systems only)?"
 	default n
Index: Makefile
===================================================================
--- Makefile	(revision 16507)
+++ Makefile	(working copy)
@@ -75,7 +75,8 @@
 TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS))
 TARGETS_DIRCLEAN:=$(patsubst %,%-dirclean,$(TARGETS))
 
-world: $(DL_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) $(TARGETS)
+world: $(DL_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
+	$(TARGET_PACKAGES_DIR) $(TARGETS)
 
 .PHONY: all world clean dirclean distclean source $(TARGETS) \
 	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) \
@@ -113,6 +114,9 @@
 	-find $(TARGET_DIR) -type d -name CVS | xargs rm -rf
 	-find $(TARGET_DIR) -type d -name .svn | xargs rm -rf
 
+$(TARGET_PACKAGES_DIR):
+	@mkdir -p $(TARGET_PACKAGES_DIR)
+
 source: $(TARGETS_SOURCE)
 
 #############################################################
@@ -121,10 +125,10 @@
 #
 #############################################################
 clean: $(TARGETS_CLEAN)
-	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(IMAGE)
+	rm -rf $(STAGING_DIR) $(TARGET_PACKAGES_DIR) $(TARGET_DIR) $(IMAGE)
 
 dirclean: $(TARGETS_DIRCLEAN)
-	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(IMAGE)
+	rm -rf $(STAGING_DIR) $(TARGET_PACKAGES_DIR) $(TARGET_DIR) $(IMAGE)
 
 distclean:
 ifeq ($(DL_DIR),$(BASE_DIR)/dl)
