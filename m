From: andersen at uclibc.org <andersen@uclibc.org>
Date: Sat, 13 Jan 2007 19:48:14 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  pkgconfig
Message-ID: <20070114034814.64EE2485CE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-13 19:48:13 -0800 (Sat, 13 Jan 2007)
New Revision: 17286

Log:
filter pkgconfig output to force it do use our staging_dir and not
try to use the system libraries as it is inclined to do


Added:
   trunk/buildroot/package/pkgconfig/pkgconfig-filter.sh

Modified:
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/package/pkgconfig/pkgconfig.mk


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-01-14 03:45:06 UTC (rev 17285)
+++ trunk/buildroot/package/Makefile.in	2007-01-14 03:48:13 UTC (rev 17286)
@@ -88,8 +88,12 @@
 		CPP=$(TARGET_CROSS)cpp \
 		RANLIB=$(TARGET_CROSS)ranlib \
 		STRIP=$(TARGET_CROSS)strip \
-		OBJCOPY=$(TARGET_CROSS)objcopy
+		OBJCOPY=$(TARGET_CROSS)objcopy \
+		CC_FOR_BUILD="$(HOSTCC)" \
+		PKG_CONFIG_SYSROOT=$(STAGING_DIR) \
+		PKG_CONFIG=$(STAGING_DIR)/usr/bin/pkg-config
 
+
 ifeq ($(BR2_ENABLE_LOCALE),y)
 DISABLE_NLS:=
 else

Added: trunk/buildroot/package/pkgconfig/pkgconfig-filter.sh
===================================================================
--- trunk/buildroot/package/pkgconfig/pkgconfig-filter.sh	                        (rev 0)
+++ trunk/buildroot/package/pkgconfig/pkgconfig-filter.sh	2007-01-14 03:48:13 UTC (rev 17286)
@@ -0,0 +1,27 @@
+#!/bin/bash
+# filter the output from pkg-config (renamed as pkg-config.real)
+# and ensures PKG_CONFIG_SYSROOT is prepended to all paths
+
+CMD=$0
+
+if [ ! "$PKG_CONFIG_SYSROOT" ]; then
+	echo "pkg-config-filter: missing \$PKG_CONFIG_SYSROOT environment variable"
+	exit 2
+fi
+
+export PKG_CONFIG_LIBDIR
+export PKG_CONFIG_PATH
+
+if $CMD.real $* |
+	sed -e "s~\-L/*$PKG_CONFIG_SYSROOT/*~-L=/~g; s~\-I/*$PKG_CONFIG_SYSROOT/*~-I=/~g;" |
+	sed -e "s~\-L/~-L=/~g; s~\-I/~-I=/~g;" |
+	sed -e "s~\-L\=~-L$PKG_CONFIG_SYSROOT~g; s~\-I\=~-I$PKG_CONFIG_SYSROOT~g;"
+then
+	echo "PKG_CONFIG_LIBDIR=$PKG_CONFIG_LIBDIR" >&2
+	echo "PKG_CONFIG_PATH=$PKG_CONFIG_PATH" >&2
+	echo "OKAY" >&2;
+	exit 0;
+else
+	echo "pkg-config failed!" >&2
+	exit 1
+fi


Property changes on: trunk/buildroot/package/pkgconfig/pkgconfig-filter.sh
___________________________________________________________________
Name: svn:executable
   + *

Modified: trunk/buildroot/package/pkgconfig/pkgconfig.mk
===================================================================
--- trunk/buildroot/package/pkgconfig/pkgconfig.mk	2007-01-14 03:45:06 UTC (rev 17285)
+++ trunk/buildroot/package/pkgconfig/pkgconfig.mk	2007-01-14 03:48:13 UTC (rev 17286)
@@ -28,6 +28,7 @@
 		--exec-prefix=/usr \
 		--bindir=/usr/bin \
 		--sbindir=/usr/sbin \
+		--libdir=/lib \
 		--libexecdir=/usr/lib \
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
@@ -45,6 +46,9 @@
 
 $(STAGING_DIR)/$(PKGCONFIG_TARGET_BINARY): $(PKGCONFIG_DIR)/$(PKGCONFIG_BINARY)
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(PKGCONFIG_DIR) install
+	mv $(STAGING_DIR)/usr/bin/pkg-config $(STAGING_DIR)/usr/bin/pkg-config.real
+	cp package/pkgconfig/pkgconfig-filter.sh $(STAGING_DIR)/usr/bin/pkg-config
+	mkdir -p $(STAGING_DIR)/lib/pkgconfig
 	rm -rf $(STAGING_DIR)/share/locale $(STAGING_DIR)/usr/info \
 		$(STAGING_DIR)/usr/man $(STAGING_DIR)/usr/share/doc
 
