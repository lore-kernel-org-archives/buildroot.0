From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu, 24 Apr 2008 09:48:21 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/java: classpath
	concierge jamvm
Message-ID: <20080424164821.800223C7C2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-04-24 09:48:20 -0700 (Thu, 24 Apr 2008)
New Revision: 21845

Log:
bump to 0.97.1, removed patch as it has been already applied in upstream revision 0.97.0 (http://gcc.gnu.org/bugzilla/buglist.cgi?product=classpath&target_milestone=0.97)
also fix change in package path that prevented patches from being applied

Removed:
   trunk/buildroot/package/java/classpath/classpath-avr32-endianness.patch

Modified:
   trunk/buildroot/package/java/classpath/classpath.mk
   trunk/buildroot/package/java/concierge/concierge.mk
   trunk/buildroot/package/java/jamvm/jamvm.mk


Changeset:
Deleted: trunk/buildroot/package/java/classpath/classpath-avr32-endianness.patch
===================================================================
--- trunk/buildroot/package/java/classpath/classpath-avr32-endianness.patch	2008-04-24 14:26:48 UTC (rev 21844)
+++ trunk/buildroot/package/java/classpath/classpath-avr32-endianness.patch	2008-04-24 16:48:20 UTC (rev 21845)
@@ -1,29 +0,0 @@
-diff -rup ../classpath-0.96.1.default/ChangeLog ./ChangeLog
---- ../classpath-0.96.1.default/ChangeLog       2007-10-16 17:35:33.000000000
-+0200
-+++ ./ChangeLog 2007-12-18 09:36:39.000000000 +0100
-@@ -1,3 +1,7 @@
-+2007-12-18  Leen Toelen  <toelen@gmail.com>
-+
-+       * native/fdlibm/ieeefp.h: Added avr32 support
-+
- 2007-10-16  Mark Wielaard  <mark@klomp.org>
-
-        * NEWS: Mention small compile/configure/build fixes.
-diff -rup ../classpath-0.96.1.default/native/fdlibm/ieeefp.h
-./native/fdlibm/ieeefp.h
---- ../classpath-0.96.1.default/native/fdlibm/ieeefp.h  2006-04-19
-19:55:13.000000000 +0200
-+++ ./native/fdlibm/ieeefp.h    2007-12-18 09:32:55.000000000 +0100
-@@ -87,6 +87,10 @@
- #define __IEEE_LITTLE_ENDIAN
- #endif
-
-+#ifdef __AVR32__
-+#define __IEEE_BIG_ENDIAN
-+#endif
-+
- #ifdef __MIPSEL__
- #define __IEEE_LITTLE_ENDIAN
- #endif
-

Modified: trunk/buildroot/package/java/classpath/classpath.mk
===================================================================
--- trunk/buildroot/package/java/classpath/classpath.mk	2008-04-24 14:26:48 UTC (rev 21844)
+++ trunk/buildroot/package/java/classpath/classpath.mk	2008-04-24 16:48:20 UTC (rev 21845)
@@ -3,14 +3,15 @@
 # classpath 0.96.1
 #
 #############################################################
-CLASSPATH_VERSION = 0.96.1
+CLASSPATH_VERSION = 0.97.1
 CLASSPATH_SOURCE = classpath-$(CLASSPATH_VERSION).tar.gz
 CLASSPATH_SITE = $(BR2_GNU_MIRROR)/classpath
 CLASSPATH_AUTORECONF = NO
 CLASSPATH_INSTALL_STAGING = YES
 CLASSPATH_INSTALL_TARGET = YES
 CLASSPATH_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install 
-CLASSPATH_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install 
+CLASSPATH_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+CLASSPATH_DIR_PREFIX = package/java
 
 CLASSPATH_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		glib_cv_uscore=no ac_cv_func_strtod=yes \
@@ -91,4 +92,4 @@
 
 
 
-$(eval $(call AUTOTARGETS,package,classpath))
+$(eval $(call AUTOTARGETS,package/java,classpath))

Modified: trunk/buildroot/package/java/concierge/concierge.mk
===================================================================
--- trunk/buildroot/package/java/concierge/concierge.mk	2008-04-24 14:26:48 UTC (rev 21844)
+++ trunk/buildroot/package/java/concierge/concierge.mk	2008-04-24 16:48:20 UTC (rev 21845)
@@ -10,19 +10,20 @@
 CONCIERGE_SITE_BUNDLES = http://concierge.sourceforge.net/bundles/
 
 $(DL_DIR)/concierge:
-	mkdir -p $(DL_DIR)/concierge/
-	$(WGET) -P $(DL_DIR)/concierge/ $(CONCIERGE_SITE)/concierge-$(CONCIERGE_VERSION).jar
-	$(WGET) -P $(DL_DIR)/concierge/ $(CONCIERGE_SITE_BUNDLES)shell-1.0.0.RC2.jar
-	$(WGET) -P $(DL_DIR)/concierge/ $(CONCIERGE_SITE_BUNDLES)service-tracker-1.0.0.RC2.jar
-	$(WGET) -P $(DL_DIR)/concierge/ $(CONCIERGE_SITE_BUNDLES)event-admin-1.0.0.RC2.jar
+	 mkdir -p $(DL_DIR)/concierge/
+	 $(WGET) -P $(DL_DIR)/concierge/ $(CONCIERGE_SITE)/concierge-$(CONCIERGE_VERSION).jar
+	 $(WGET) -P $(DL_DIR)/concierge/ $(CONCIERGE_SITE_BUNDLES)shell-1.0.0.RC2.jar
+	 $(WGET) -P $(DL_DIR)/concierge/ $(CONCIERGE_SITE_BUNDLES)service-tracker-1.0.0.RC2.jar
+	 $(WGET) -P $(DL_DIR)/concierge/ $(CONCIERGE_SITE_BUNDLES)event-admin-1.0.0.RC2.jar
 
 $(TARGET_DIR)/usr/lib/concierge/: $(DL_DIR)/concierge
+	mkdir -p $(TARGET_DIR)/usr/lib
 	mkdir -p $(TARGET_DIR)/usr/lib/concierge
 	cp -dpf $(DL_DIR)/concierge/* $(TARGET_DIR)/usr/lib/concierge/
 	cp -dpf package/concierge/files/init.xargs $(TARGET_DIR)/usr/lib/concierge/
 	touch -c $@
 
-$(TARGET_DIR)/usr/bin/concierge:
+$(TARGET_DIR)/usr/bin/concierge: 
 	cp -dpf package/concierge/files/concierge $(TARGET_DIR)/usr/bin/
 	chmod +x $(TARGET_DIR)/usr/bin/concierge
 	touch -c $@

Modified: trunk/buildroot/package/java/jamvm/jamvm.mk
===================================================================
--- trunk/buildroot/package/java/jamvm/jamvm.mk	2008-04-24 14:26:48 UTC (rev 21844)
+++ trunk/buildroot/package/java/jamvm/jamvm.mk	2008-04-24 16:48:20 UTC (rev 21845)
@@ -11,6 +11,7 @@
 JAMVM_INSTALL_TARGET = YES
 JAMVM_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
 JAMVM_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+JAMVM_DIR_PREFIX = package/java
 
 JAMVM_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		glib_cv_uscore=no ac_cv_func_strtod=yes \
@@ -102,4 +103,4 @@
 		CC="$(STAGING_DIR)/usr/bin/avr32-linux-gcc"
 endif
 
-$(eval $(call AUTOTARGETS,package,jamvm))
+$(eval $(call AUTOTARGETS,package/java,jamvm))
