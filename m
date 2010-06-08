From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 8 Jun 2010 23:32:40 +0200
Subject: [Buildroot] [git commit master] file: bump version and migrate to
	autotargets
Message-ID: <20100608220138.82FF1909FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0b8c497b3ecdbe9029e2ce548dd50934485b3c9f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1927

[Peter: host-zlib is a dependency of host-file, not file]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                       |    6 ++-
 package/file/file-nocxx.patch |   31 +++++++++++
 package/file/file.mk          |  119 ++++------------------------------------
 3 files changed, 47 insertions(+), 109 deletions(-)
 create mode 100644 package/file/file-nocxx.patch

diff --git a/CHANGES b/CHANGES
index 67c4348..365cb3e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7,8 +7,9 @@
 	New packages: cgilua, copas, coxpcall, luafilesystem,
 	luasocket, rings, wsapi, xavante
 
-	Updated/fixed packages: cdrkit, gawk, intltool, iptables, libidn,
-	netperf, openssl, php, qt, sqlite, tn5250, usbutils
+	Updated/fixed packages: cdrkit, file, gawk, intltool,
+	iptables, libidn, netperf, openssl, php, qt, sqlite, tn5250,
+	usbutils
 
 	Removed packages: modutils
 
@@ -21,6 +22,7 @@
 	#1897: Bump libusb to 1.0.7
 	#1903: Bump tn5250 to 0.17.4 and migrate to autotargets
 	#1909: netperf-2.4.5 fails to build because of undeclared SOCK_DCCP
+	#1927: Bump file to 5.03 and migrate to autotargets
 	#1933: Bump gawk to 3.1.8 and migrate to autotargets
 	#1945: PHP: add sqlite3 dependency when using external lib
 	#1951: Bump openssl to 0.9.8o
diff --git a/package/file/file-nocxx.patch b/package/file/file-nocxx.patch
new file mode 100644
index 0000000..3b0eec6
--- /dev/null
+++ b/package/file/file-nocxx.patch
@@ -0,0 +1,31 @@
+From 126fcb5d08d69693eb4c6e5f5c3d1082b6910121 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Mon, 7 Jun 2010 11:40:04 -0300
+Subject: [PATCH] Disable configure script from checking for CXX since it's not needed
+
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ configure |    6 ++----
+ 1 files changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/configure b/configure
+index a6e812b..ac2587f 100755
+--- a/configure
++++ b/configure
+@@ -6136,10 +6136,8 @@ if $ac_preproc_ok; then
+   :
+ else
+   { { echo "$as_me:$LINENO: error: C++ preprocessor \"$CXXCPP\" fails sanity check
+-See \`config.log' for more details." >&5
+-echo "$as_me: error: C++ preprocessor \"$CXXCPP\" fails sanity check
+-See \`config.log' for more details." >&2;}
+-   { (exit 1); exit 1; }; }
++See \`config.log' for more details." >&5;}
++   { echo "C++ sucks, ignoring ..." >&5; }; }
+ fi
+ 
+ ac_ext=cpp
+-- 
+1.6.4.4
+
diff --git a/package/file/file.mk b/package/file/file.mk
index 6a76117..11fe05a 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -3,113 +3,18 @@
 # file
 #
 #############################################################
-FILE_VERSION:=4.26
-FILE_SOURCE:=file-$(FILE_VERSION).tar.gz
-FILE_SITE:=ftp://ftp.astron.com/pub/file/
-FILE_SOURCE_DIR:=$(BUILD_DIR)/file-$(FILE_VERSION)
-FILE_DIR1:=$(TOOLCHAIN_DIR)/file-$(FILE_VERSION)-host
-FILE_DIR2:=$(BUILD_DIR)/file-$(FILE_VERSION)-target
-FILE_CAT:=$(ZCAT)
-FILE_BINARY:=src/file
-FILE_TARGET_BINARY:=usr/bin/file
 
-$(DL_DIR)/$(FILE_SOURCE):
-	 $(call DOWNLOAD,$(FILE_SITE),$(FILE_SOURCE))
+FILE_VERSION = 5.04
+FILE_SITE = ftp://ftp.astron.com/pub/file/
+FILE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
+FILE_DEPENDENCIES = host-file zlib
+HOST_FILE_DEPENDENCIES = host-zlib
 
-file-source: $(DL_DIR)/$(FILE_SOURCE)
+$(eval $(call AUTOTARGETS,package,file))
+$(eval $(call AUTOTARGETS,package,file,host))
 
-
-#############################################################
-#
-# build file for use on the host system
-#
-#############################################################
-$(FILE_DIR1)/.configured: $(FILE_SOURCE_DIR)/.unpacked
-	mkdir -p $(FILE_DIR1)
-	(cd $(FILE_DIR1); rm -rf config.cache; \
-		CC="$(HOSTCC)" \
-		$(FILE_SOURCE_DIR)/configure $(QUIET) \
-		--prefix=$(FILE_DIR1)/install \
-	)
-	touch $@
-
-$(TOOLCHAIN_DIR)/bin/file: $(FILE_DIR1)/.configured
-	$(MAKE) -C $(FILE_DIR1) install
-	ln -sf $(FILE_DIR1)/install/bin/file $(TOOLCHAIN_DIR)/bin/file
-
-host-file: $(TOOLCHAIN_DIR)/bin/file
-
-host-file-clean:
-	-$(MAKE) -C $(FILE_DIR1) clean
-
-host-file-dirclean:
-	rm -rf $(FILE_DIR1)
-
-#############################################################
-#
-# build file for use on the target system
-#
-#############################################################
-file-unpacked: $(FILE_SOURCE_DIR)/.unpacked
-$(FILE_SOURCE_DIR)/.unpacked: $(DL_DIR)/$(FILE_SOURCE)
-	$(FILE_CAT) $(DL_DIR)/$(FILE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(FILE_SOURCE_DIR) package/file/ file\*.patch
-	$(CONFIG_UPDATE) $(FILE_SOURCE_DIR)
-	touch $@
-
-$(FILE_DIR2)/.configured: $(FILE_SOURCE_DIR)/.unpacked
-	mkdir -p $(FILE_DIR2)
-	(cd $(FILE_DIR2); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		$(FILE_SOURCE_DIR)/configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share/misc \
-		--localstatedir=/var \
-		--mandir=/usr/share/man \
-		--infodir=/usr/share/info \
-		$(DISABLE_NLS) \
-		$(DISABLE_LARGEFILE) \
-		--enable-static \
-		--disable-fsect-man5 \
-	)
-	touch $@
-
-$(FILE_DIR2)/$(FILE_BINARY): $(FILE_DIR2)/.configured $(TOOLCHAIN_DIR)/bin/file
-	ln -sf $(FILE_DIR1)/install/bin/file $(FILE_DIR2)/magic/file
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) LDFLAGS="-static" -C $(FILE_DIR2)
-
-$(TARGET_DIR)/$(FILE_TARGET_BINARY): $(FILE_DIR2)/$(FILE_BINARY)
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR) -C $(FILE_DIR2) install
-	-($(STRIPCMD) $(TARGET_DIR)/usr/lib/libmagic.so.*.* > /dev/null 2>&1)
-	rm -rf $(TARGET_DIR)/share/locale
-	mv $(TARGET_DIR)/lib/libmagic.a $(STAGING_DIR)/lib
-	rm -f $(TARGET_DIR)/lib/libmagic.la
-	mv $(TARGET_DIR)/usr/include/magic.h $(STAGING_DIR)/usr/include
-
-file: zlib $(TARGET_DIR)/$(FILE_TARGET_BINARY)
-
-file-clean:
-	-$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(FILE_DIR2) uninstall
-	-$(MAKE) -C $(FILE_DIR2) clean
-
-file-dirclean:
-	rm -rf $(FILE_DIR2)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_FILE),y)
-TARGETS+=file
-endif
+$(FILE_TARGET_UNINSTALL):
+	$(call MESSAGE,"Uninstalling")
+	$(MAKE) DESTDIR=$(TARGET_DIR) uninstall -C $(FILE_DIR)
+	rm -f $(TARGET_DIR)/usr/lib/libmagic.*
+	rm -f $(FILE_TARGET_INSTALL_TARGET) $(FILE_HOOK_POST_INSTALL)
-- 
1.6.3.3
