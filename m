From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 23 Nov 2007 05:24:56 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
Message-ID: <20071123132456.77C9430080@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-11-23 05:24:55 -0800 (Fri, 23 Nov 2007)
New Revision: 20501

Log:
Compile in dbus support if available

Modified:
   trunk/buildroot/package/avahi/avahi.mk


Changeset:
Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2007-11-23 13:23:25 UTC (rev 20500)
+++ trunk/buildroot/package/avahi/avahi.mk	2007-11-23 13:24:55 UTC (rev 20501)
@@ -22,17 +22,26 @@
 AVAHI_TARGETS+=$(TARGET_DIR)/usr/sbin/avahi-autoipd
 endif
 
+AVAHI_EXTRA_DEPS:=
+
 ifeq ($(strip $(BR2_PACKAGE_AVAHI_DAEMON)),y)
 AVAHI_TARGETS+=$(TARGET_DIR)/usr/sbin/avahi-daemon
 AVAHI_DISABLE_EXPAT:=
 # depend on the exact library file instead of expat so avahi isn't always
 # considered out-of-date
-AVAHI_EXPAT_DEP:=$(STAGING_DIR)/usr/lib/libexpat.so.1
+AVAHI_EXTRA_DEPS+=$(STAGING_DIR)/usr/lib/libexpat.so.1
 else
 AVAHI_DISABLE_EXPAT:=--disable-expat
-AVAHI_EXPAT_DEP:=
+
 endif
 
+ifeq ($(strip $(BR2_PACKAGE_DBUS)),y)
+AVAHI_DISABLE_DBUS:=
+AVAHI_EXTRA_DEPS+=$(STAGING_DIR)/usr/lib/libdbus-1.so
+else
+AVAHI_DISABLE_DBUS:=--disable-dbus
+endif
+
 $(DL_DIR)/$(AVAHI_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(AVAHI_SITE)/$(AVAHI_SOURCE)
 
@@ -43,13 +52,9 @@
 	toolchain/patch-kernel.sh $(AVAHI_DIR) package/avahi/ \*.patch
 	touch $@
 
-$(AVAHI_DIR)/.configured: $(AVAHI_DIR)/.unpacked $(AVAHI_EXPAT_DEP)
+$(AVAHI_DIR)/.configured: $(AVAHI_DIR)/.unpacked $(AVAHI_EXTRA_DEPS)
 	(cd $(AVAHI_DIR) && rm -rf config.cache && autoconf)
 	(cd $(AVAHI_DIR) && \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		LIBDAEMON_CFLAGS="-I$(STAGING_DIR)/usr/include" \
-		LIBDAEMON_LIBS="-L$(STAGING_DIR)/lib -ldaemon" \
 		ac_cv_func_strtod=yes \
 		ac_fsusage_space=yes \
 		fu_cv_sys_stat_statfs2_bsize=yes \
@@ -125,7 +130,7 @@
 		--disable-qt3 \
 		--disable-qt4 \
 		--disable-gtk \
-		--disable-dbus \
+		$(AVAHI_DISABLE_DBUS) \
 		$(AVAHI_DISABLE_EXPAT) \
 		--disable-gdbm \
 		--disable-python \
