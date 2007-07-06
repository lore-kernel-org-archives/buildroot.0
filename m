From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Thu,  5 Jul 2007 21:26:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package package/dbus-glib
	package/direct etc...
Message-ID: <20070706042633.BA138A464B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-07-05 21:26:32 -0700 (Thu, 05 Jul 2007)
New Revision: 19008

Log:
Remove usage of TARGET_LDFLAGS all together. Both TARGET_CFLAGS and TARGET_LDFLAGS are passed with the compilers and linker respectively so that we can pass CFLAGS and LDFLAGS on a per-package basis which was not possible previously and a number of packages failed to build. TARGET_CFLAGS usage in package makefiles will be removed next.


Added:
   trunk/buildroot/package/procps/procps-remove-flags.patch

Modified:
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/package/dbus-glib/dbus-glib.mk
   trunk/buildroot/package/directfb/directfb.mk
   trunk/buildroot/package/dmalloc/dmalloc.mk
   trunk/buildroot/package/file/file.mk
   trunk/buildroot/package/lockfile-progs/lockfile-progs.mk
   trunk/buildroot/package/mtd/mtd.mk
   trunk/buildroot/package/procps/procps.mk
   trunk/buildroot/package/qte/qte.mk
   trunk/buildroot/package/qtopia4/qtopia4.mk
   trunk/buildroot/package/sudo/sudo.mk
   trunk/buildroot/package/xfsprogs/xfsprogs.mk
   trunk/buildroot/package/zlib/zlib.mk
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-07-06 04:21:22 UTC (rev 19007)
+++ trunk/buildroot/package/Makefile.in	2007-07-06 04:26:32 UTC (rev 19008)
@@ -123,17 +123,15 @@
 TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
 		AR=$(TARGET_CROSS)ar \
 		AS=$(TARGET_CROSS)as \
-		LD=$(TARGET_CROSS)ld \
+		LD="$(TARGET_CROSS)ld $(TARGET_LDFLAGS)" \
 		NM=$(TARGET_CROSS)nm \
-		CC=$(TARGET_CROSS)gcc \
-		GCC=$(TARGET_CROSS)gcc \
-		CXX=$(TARGET_CROSS)g++ \
-		CPP=$(TARGET_CROSS)cpp \
+		CC="$(TARGET_CROSS)gcc $(TARGET_CFLAGS)" \
+		GCC="$(TARGET_CROSS)gcc $(TARGET_CFLAGS)" \
+		CXX="$(TARGET_CROSS)g++ $(TARGET_CFLAGS)" \
+		CPP="$(TARGET_CROSS)cpp $(TARGET_CFLAGS)" \
 		RANLIB=$(TARGET_CROSS)ranlib \
 		STRIP=$(TARGET_CROSS)strip \
 		OBJCOPY=$(TARGET_CROSS)objcopy \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
 		AR_FOR_BUILD="$(HOSTAR)" \
 		AS_FOR_BUILD="$(HOSTAS)" \
 		CC_FOR_BUILD="$(HOSTCC)" \

Modified: trunk/buildroot/package/dbus-glib/dbus-glib.mk
===================================================================
--- trunk/buildroot/package/dbus-glib/dbus-glib.mk	2007-07-06 04:21:22 UTC (rev 19007)
+++ trunk/buildroot/package/dbus-glib/dbus-glib.mk	2007-07-06 04:26:32 UTC (rev 19008)
@@ -28,8 +28,6 @@
 		ac_cv_have_abstract_sockets=yes \
 		ac_cv_func_posix_getpwnam_r=yes \
 		have_abstract_sockets=yes \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
 		DBUS_CFLAGS="-I$(STAGING_DIR)/usr/include/dbus-1.0 -I$(STAGING_DIR)/usr/lib/dbus-1.0/include" \
 		DBUS_LIBS="$(STAGING_DIR)/usr/lib/libdbus-1.so" \
 		DBUS_GLIB_CFLAGS="-I$(STAGING_DIR)/include/glib-2.0 -I$(STAGING_DIR)/lib/glib-2.0/include" \

Modified: trunk/buildroot/package/directfb/directfb.mk
===================================================================
--- trunk/buildroot/package/directfb/directfb.mk	2007-07-06 04:21:22 UTC (rev 19007)
+++ trunk/buildroot/package/directfb/directfb.mk	2007-07-06 04:26:32 UTC (rev 19008)
@@ -23,8 +23,6 @@
 	(cd $(DIRECTFB_DIR); \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
-	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
-	LDFLAGS="$(TARGET_LDFLAGS)" \
 	ac_cv_header_linux_wm97xx_h=no \
 	ac_cv_header_linux_sisfb_h=no \
 	ac_cv_header_asm_page_h=no \

Modified: trunk/buildroot/package/dmalloc/dmalloc.mk
===================================================================
--- trunk/buildroot/package/dmalloc/dmalloc.mk	2007-07-06 04:21:22 UTC (rev 19007)
+++ trunk/buildroot/package/dmalloc/dmalloc.mk	2007-07-06 04:26:32 UTC (rev 19008)
@@ -3,7 +3,7 @@
 # dmalloc
 #
 #############################################################
-DMALLOC_VER:=5.4.2
+DMALLOC_VER:=5.4.3
 DMALLOC_SOURCE:=dmalloc-$(DMALLOC_VER).tgz
 DMALLOC_SITE:=http://dmalloc.com/releases
 DMALLOC_DIR:=$(BUILD_DIR)/dmalloc-$(DMALLOC_VER)
@@ -43,8 +43,8 @@
 	(cd $(DMALLOC_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
-		CFLAGS="-g $(TARGET_CFLAGS)" \
-		LDFLAGS="-g $(TARGET_LDFLAGS)" \
+		CFLAGS="-g" \
+		LDFLAGS="-g" \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \

Modified: trunk/buildroot/package/file/file.mk
===================================================================
--- trunk/buildroot/package/file/file.mk	2007-07-06 04:21:22 UTC (rev 19007)
+++ trunk/buildroot/package/file/file.mk	2007-07-06 04:26:32 UTC (rev 19008)
@@ -85,10 +85,10 @@
 	touch $(FILE_DIR2)/.configured
 
 $(FILE_DIR2)/$(FILE_BINARY): $(FILE_DIR2)/.configured $(TOOL_BUILD_DIR)/bin/file
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) LDFLAGS="$(TARGET_LDFLAGS) -static" -C $(FILE_DIR2)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) LDFLAGS="-static" -C $(FILE_DIR2)
 
 $(TARGET_DIR)/$(FILE_TARGET_BINARY): $(FILE_DIR2)/$(FILE_BINARY)
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) LDFLAGS="$(TARGET_LDFLAGS)" DESTDIR=$(TARGET_DIR) -C $(FILE_DIR2) install
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR) -C $(FILE_DIR2) install
 	-($(STRIP) $(TARGET_DIR)/usr/lib/libmagic.so.*.* > /dev/null 2>&1)
 	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
 		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc

Modified: trunk/buildroot/package/lockfile-progs/lockfile-progs.mk
===================================================================
--- trunk/buildroot/package/lockfile-progs/lockfile-progs.mk	2007-07-06 04:21:22 UTC (rev 19007)
+++ trunk/buildroot/package/lockfile-progs/lockfile-progs.mk	2007-07-06 04:26:32 UTC (rev 19008)
@@ -20,8 +20,7 @@
 	touch $(LOCKFILE_PROGS_DIR)/.unpacked
 
 $(TARGET_DIR)/$(LOCKFILE_PROGS_BINARY): $(LOCKFILE_PROGS_DIR)/.unpacked
-	$(MAKE) CC="$(TARGET_CC) $(TARGET_CFLAGS)"			\
-		LDFLAGS="$(TARGET_LDFLAGS)" -C $(LOCKFILE_PROGS_DIR)
+	$(MAKE) CC="$(TARGET_CC) $(TARGET_CFLAGS)" -C $(LOCKFILE_PROGS_DIR)
 	cp -a $(LOCKFILE_PROGS_DIR)/bin/lockfile* $(TARGET_DIR)/usr/bin
 	$(STRIP) --strip-unneeded $(TARGET_DIR)/$(LOCKFILE_PROGS_BINARY)
 

Modified: trunk/buildroot/package/mtd/mtd.mk
===================================================================
--- trunk/buildroot/package/mtd/mtd.mk	2007-07-06 04:21:22 UTC (rev 19007)
+++ trunk/buildroot/package/mtd/mtd.mk	2007-07-06 04:26:32 UTC (rev 19008)
@@ -115,7 +115,7 @@
 MTD_BUILD_TARGETS := $(addprefix $(MTD_DIR)/util/, $(MTD_TARGETS_y))
 
 $(MTD_BUILD_TARGETS): $(MTD_DIR)/.unpacked
-	$(MAKE)	CC=$(TARGET_CC) CFLAGS="-I$(MTD_DIR)/include -I$(LINUX_HEADERS_DIR)/include $(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" LINUXDIR=$(LINUX_DIR) -C $(MTD_DIR)/util
+	$(TARGET_CONFIGURE_OPTS) $(MAKE)	CFLAGS="-I$(MTD_DIR)/include -I$(LINUX_HEADERS_DIR)/include" LINUXDIR=$(LINUX_DIR) -C $(MTD_DIR)/util
 
 MTD_TARGETS := $(addprefix $(TARGET_DIR)/usr/sbin/, $(MTD_TARGETS_y))
 

Added: trunk/buildroot/package/procps/procps-remove-flags.patch
===================================================================
--- trunk/buildroot/package/procps/procps-remove-flags.patch	                        (rev 0)
+++ trunk/buildroot/package/procps/procps-remove-flags.patch	2007-07-06 04:26:32 UTC (rev 19008)
@@ -0,0 +1,26 @@
+diff -u procps-3.2.5/Makefile procps-3.2.5-patched/Makefile
+--- procps-3.2.5/Makefile	2005-01-25 22:55:26.000000000 -0600
++++ procps-3.2.5-patched/Makefile	2007-07-05 23:09:24.251423681 -0500
+@@ -70,9 +70,7 @@
+ CURSES := -lncurses
+ 
+ # Preprocessor flags.
+-PKG_CPPFLAGS := -D_GNU_SOURCE -I proc
+-CPPFLAGS     := -I/usr/include/ncurses
+-ALL_CPPFLAGS := $(PKG_CPPFLAGS) $(CPPFLAGS)
++ALL_CPPFLAGS := -D_GNU_SOURCE -I proc
+ 
+ # Left out -Wconversion due to noise in glibc headers.
+ # Left out -Wunreachable-code and -Wdisabled-optimization
+@@ -91,11 +89,9 @@
+   -Wstrict-prototypes -Wmissing-prototypes
+ # Note that some stuff below is conditional on CFLAGS containing
+ # an option that starts with "-g". (-g, -g2, -g3, -ggdb, etc.)
+-CFLAGS       := -O2 -s
+ ALL_CFLAGS   := $(PKG_CFLAGS) $(CFLAGS)
+ 
+ PKG_LDFLAGS  := -Wl,-warn-common
+-LDFLAGS      :=
+ ALL_LDFLAGS  := $(PKG_LDFLAGS) $(LDFLAGS)
+ 
+ ############ Add some extra flags if gcc allows

Modified: trunk/buildroot/package/procps/procps.mk
===================================================================
--- trunk/buildroot/package/procps/procps.mk	2007-07-06 04:21:22 UTC (rev 19007)
+++ trunk/buildroot/package/procps/procps.mk	2007-07-06 04:26:32 UTC (rev 19008)
@@ -16,13 +16,10 @@
 $(PROCPS_DIR)/.source: $(DL_DIR)/$(PROCPS_SOURCE)
 	$(ZCAT) $(DL_DIR)/$(PROCPS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(PROCPS_DIR) package/procps/ procps\*.patch
-	$(SED) '/^CFLAGS/s:-O2:$(TARGET_CFLAGS):' $(PROCPS_DIR)/Makefile
-	$(SED) '/^LDFLAGS/s:$$:$(TARGET_LDFLAGS):' $(PROCPS_DIR)/Makefile
 	touch $(PROCPS_DIR)/.source
 
 $(PROCPS_DIR)/$(PROCPS_BINARY): $(PROCPS_DIR)/.source
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) CPPFLAGS=-I$(STAGING_DIR)/include \
-		CC=$(TARGET_CC) -C $(PROCPS_DIR)
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(PROCPS_DIR)
 
 $(TARGET_DIR)/$(PROCPS_TARGET_BINARY): $(PROCPS_DIR)/$(PROCPS_BINARY)
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) DESTDIR=$(TARGET_DIR) \

Modified: trunk/buildroot/package/qte/qte.mk
===================================================================
--- trunk/buildroot/package/qte/qte.mk	2007-07-06 04:21:22 UTC (rev 19007)
+++ trunk/buildroot/package/qte/qte.mk	2007-07-06 04:26:32 UTC (rev 19008)
@@ -157,8 +157,6 @@
 $(QTE_QVFB_DIR)/.configured: $(QTE_QVFB_DIR)/.unpacked $(QTE_TMAKE_DIR)/.unpacked
 	(cd $(@D); export QTDIR=`pwd`; export TMAKEPATH=$(QTE_TMAKE_DIR)/lib/linux-g++; export $$QTDIR/bin:$$PATH; export LD_LIBRARY_PATH=$$QTDIR/lib:$$LD_LIBRARY_PATH; echo 'yes' | \
 		$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
 		./configure \
 		$(QTE_QVFB_CONFIGURE) \
 	);
@@ -173,8 +171,6 @@
 $(QTE_QTOPIA_DIR)/.configured: $(QTE_QTOPIA_DIR)/.unpacked $(QTE_TMAKE_DIR)/.unpacked $(QTE_QTE_DIR)/$(QTE_UIC_BINARY) $(QTE_QTE_DIR)/$(QTE_QVFB_BINARY) $(QTE_QT3_DIR)/.configured
 	(cd $(@D); export QTDIR=$(QTE_QTE_DIR); export QPEDIR=$(QTE_QTOPIA_DIR); export PATH=$(STAGING_DIR)/bin:$$QTDIR/bin:$$PATH; QT3DIR=$(QTE_QTE_DIR); echo 'yes' | \
 		$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
 		./configure \
 		$(QTE_QTOPIA_CONFIGURE) --edition phone -no-qtopiadesktop -dqt $(QTE_QT3_DIR) -arch generic -displaysize 160-240 -languages en_US \
 		-platform linux-g++ -qvfb -xplatform $(BR2_QTE_CROSS_PLATFORM) \

Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
===================================================================
--- trunk/buildroot/package/qtopia4/qtopia4.mk	2007-07-06 04:21:22 UTC (rev 19007)
+++ trunk/buildroot/package/qtopia4/qtopia4.mk	2007-07-06 04:26:32 UTC (rev 19008)
@@ -123,7 +123,6 @@
 	(cd $(QTOPIA4_TARGET_DIR); rm -rf config.cache; \
 		PATH=$(TARGET_PATH) \
 		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
 		CXXFLAGS="$(TARGET_CXXFLAGS)" \
 		QPEHOME=/usr \
 		QPEDIR=/usr \

Modified: trunk/buildroot/package/sudo/sudo.mk
===================================================================
--- trunk/buildroot/package/sudo/sudo.mk	2007-07-06 04:21:22 UTC (rev 19007)
+++ trunk/buildroot/package/sudo/sudo.mk	2007-07-06 04:26:32 UTC (rev 19008)
@@ -25,8 +25,6 @@
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		./configure \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \

Modified: trunk/buildroot/package/xfsprogs/xfsprogs.mk
===================================================================
--- trunk/buildroot/package/xfsprogs/xfsprogs.mk	2007-07-06 04:21:22 UTC (rev 19007)
+++ trunk/buildroot/package/xfsprogs/xfsprogs.mk	2007-07-06 04:26:32 UTC (rev 19008)
@@ -35,8 +35,8 @@
 	(cd $(XFSPROGS_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
-		CPPFLAGS=-I$(E2FSPROGS_DIR)/lib \
-		LDFLAGS="$(TARGET_LDFLAGS) -L$(E2FSPROGS_DIR)/lib" \
+		CPPFLAGS="-I$(E2FSPROGS_DIR)/lib" \
+		LDFLAGS="-L$(E2FSPROGS_DIR)/lib" \
 		LIBTOOL=$(LIBTOOL_DIR)/libtool \
 		INSTALL_USER=$(shell whoami) \
 		INSTALL_GROUP=$(shell groups | cut -d" " -f1) \
@@ -52,8 +52,8 @@
 	touch $(XFSPROGS_DIR)/.configured
 
 $(XFSPROGS_DIR)/$(XFSPROGS_BINARY): $(XFSPROGS_DIR)/.configured
-	$(MAKE1) PATH=$(TARGET_PATH) CPPFLAGS=-I$(E2FSPROGS_DIR)/lib \
-		LDFLAGS="$(TARGET_LDFLAGS) -L$(E2FSPROGS_DIR)/lib" -C $(XFSPROGS_DIR)
+	$(MAKE1) PATH=$(TARGET_PATH) CPPFLAGS="-I$(E2FSPROGS_DIR)/lib" \
+		LDFLAGS="-L$(E2FSPROGS_DIR)/lib" -C $(XFSPROGS_DIR)
 ifeq ($(XFSPROGS_CONFIG_SHARED),--enable-shared)
 	( \
 		cd $(XFSPROGS_DIR) ; \

Modified: trunk/buildroot/package/zlib/zlib.mk
===================================================================
--- trunk/buildroot/package/zlib/zlib.mk	2007-07-06 04:21:22 UTC (rev 19007)
+++ trunk/buildroot/package/zlib/zlib.mk	2007-07-06 04:26:32 UTC (rev 19008)
@@ -8,7 +8,7 @@
 ZLIB_CAT:=$(BZCAT)
 ZLIB_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libpng
 ZLIB_DIR:=$(BUILD_DIR)/zlib-$(ZLIB_VER)
-ZLIB_CFLAGS:=$(TARGET_CFLAGS) -fPIC
+ZLIB_CFLAGS:=-fPIC
 ifeq ($(BR2_LARGEFILE),y)
 ZLIB_CFLAGS+=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 endif
@@ -25,8 +25,7 @@
 $(ZLIB_DIR)/.configured: $(ZLIB_DIR)/.patched
 	(cd $(ZLIB_DIR); rm -rf config.cache ; \
 		$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS) $(ZLIB_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
+		CFLAGS="$(ZLIB_CFLAGS)" \
 		./configure \
 		--shared \
 		--prefix=/usr \

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-07-06 04:21:22 UTC (rev 19007)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-07-06 04:26:32 UTC (rev 19008)
@@ -113,8 +113,6 @@
 		-e 's,^DEVEL_PREFIX=.*,DEVEL_PREFIX=\"/usr/\",g' \
 		-e 's,^SHARED_LIB_LOADER_PREFIX=.*,SHARED_LIB_LOADER_PREFIX=\"/lib\",g' \
 		$(UCLIBC_DIR)/.config
-	$(SED) 's,^ARCH_CFLAGS=",ARCH_CFLAGS="$(TARGET_CFLAGS) ,g' \
-		$(UCLIBC_DIR)/.config
 ifeq ($(UCLIBC_TARGET_ARCH),arm)
 	$(SED) 's/^\(CONFIG_[^_]*[_]*ARM[^=]*\)=.*/# \1 is not set/g' \
 		 $(UCLIBC_DIR)/.config
