From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:02:20 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package: classpath
	concierge concierge/files
Message-ID: <20080306180220.1608B1201BD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:02:19 -0800 (Thu, 06 Mar 2008)
New Revision: 21187

Log:
added concierge OSGi and classpath

Added:
   trunk/buildroot/package/classpath/
   trunk/buildroot/package/classpath/Config.in
   trunk/buildroot/package/classpath/classpath-avr32-endianness.patch
   trunk/buildroot/package/classpath/classpath.mk
   trunk/buildroot/package/concierge/
   trunk/buildroot/package/concierge/Config.in
   trunk/buildroot/package/concierge/concierge.mk
   trunk/buildroot/package/concierge/files/
   trunk/buildroot/package/concierge/files/concierge
   trunk/buildroot/package/concierge/files/init.xargs


Changeset:
Added: trunk/buildroot/package/classpath/Config.in
===================================================================
--- trunk/buildroot/package/classpath/Config.in	                        (rev 0)
+++ trunk/buildroot/package/classpath/Config.in	2008-03-06 18:02:19 UTC (rev 21187)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_CLASSPATH
+	bool "classpath"
+	default n
+
+	help
+	  GNU Classpath, Essential Libraries for Java, is a GNU project to create free core class libraries for use with virtual machines and compilers for the java programming language
+	  http://www.classpath.org/

Added: trunk/buildroot/package/classpath/classpath-avr32-endianness.patch
===================================================================
--- trunk/buildroot/package/classpath/classpath-avr32-endianness.patch	                        (rev 0)
+++ trunk/buildroot/package/classpath/classpath-avr32-endianness.patch	2008-03-06 18:02:19 UTC (rev 21187)
@@ -0,0 +1,29 @@
+diff -rup ../classpath-0.96.1.default/ChangeLog ./ChangeLog
+--- ../classpath-0.96.1.default/ChangeLog       2007-10-16 17:35:33.000000000
++0200
++++ ./ChangeLog 2007-12-18 09:36:39.000000000 +0100
+@@ -1,3 +1,7 @@
++2007-12-18  Leen Toelen  <toelen@gmail.com>
++
++       * native/fdlibm/ieeefp.h: Added avr32 support
++
+ 2007-10-16  Mark Wielaard  <mark@klomp.org>
+
+        * NEWS: Mention small compile/configure/build fixes.
+diff -rup ../classpath-0.96.1.default/native/fdlibm/ieeefp.h
+./native/fdlibm/ieeefp.h
+--- ../classpath-0.96.1.default/native/fdlibm/ieeefp.h  2006-04-19
+19:55:13.000000000 +0200
++++ ./native/fdlibm/ieeefp.h    2007-12-18 09:32:55.000000000 +0100
+@@ -87,6 +87,10 @@
+ #define __IEEE_LITTLE_ENDIAN
+ #endif
+
++#ifdef __AVR32__
++#define __IEEE_BIG_ENDIAN
++#endif
++
+ #ifdef __MIPSEL__
+ #define __IEEE_LITTLE_ENDIAN
+ #endif
+

Added: trunk/buildroot/package/classpath/classpath.mk
===================================================================
--- trunk/buildroot/package/classpath/classpath.mk	                        (rev 0)
+++ trunk/buildroot/package/classpath/classpath.mk	2008-03-06 18:02:19 UTC (rev 21187)
@@ -0,0 +1,94 @@
+#############################################################
+#
+# classpath 0.96.1
+#
+#############################################################
+CLASSPATH_VERSION = 0.96.1
+CLASSPATH_SOURCE = classpath-$(CLASSPATH_VERSION).tar.gz
+CLASSPATH_SITE = ftp://ftp.gnu.org/gnu/classpath/
+CLASSPATH_AUTORECONF = NO
+CLASSPATH_INSTALL_STAGING = YES
+CLASSPATH_INSTALL_TARGET = YES
+CLASSPATH_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install 
+CLASSPATH_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install 
+
+CLASSPATH_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
+		glib_cv_uscore=no ac_cv_func_strtod=yes \
+		ac_fsusage_space=yes fu_cv_sys_stat_statfs2_bsize=yes \
+		ac_cv_func_closedir_void=no ac_cv_func_getloadavg=no \
+		ac_cv_lib_util_getloadavg=no ac_cv_lib_getloadavg_getloadavg=no \
+		ac_cv_func_getgroups=yes ac_cv_func_getgroups_works=yes \
+		ac_cv_func_chown_works=yes ac_cv_have_decl_euidaccess=no \
+		ac_cv_func_euidaccess=no ac_cv_have_decl_strnlen=yes \
+		ac_cv_func_strnlen_working=yes ac_cv_func_lstat_dereferences_slashed_symlink=yes \
+		ac_cv_func_lstat_empty_string_bug=no ac_cv_func_stat_empty_string_bug=no \
+		vb_cv_func_rename_trailing_slash_bug=no ac_cv_have_decl_nanosleep=yes \
+		jm_cv_func_nanosleep_works=yes gl_cv_func_working_utimes=yes \
+		ac_cv_func_utime_null=yes ac_cv_have_decl_strerror_r=yes \
+		ac_cv_func_strerror_r_char_p=no jm_cv_func_svid_putenv=yes \
+		ac_cv_func_getcwd_null=yes ac_cv_func_getdelim=yes \
+		ac_cv_func_mkstemp=yes utils_cv_func_mkstemp_limitations=no \
+		utils_cv_func_mkdir_trailing_slash_bug=no ac_cv_func_memcmp_working=yes \
+		ac_cv_have_decl_malloc=yes gl_cv_func_malloc_0_nonnull=yes \
+		ac_cv_func_malloc_0_nonnull=yes ac_cv_func_calloc_0_nonnull=yes \
+		ac_cv_func_realloc_0_nonnull=yes jm_cv_func_gettimeofday_clobber=no \
+		gl_cv_func_working_readdir=yes jm_ac_cv_func_link_follows_symlink=no \
+		utils_cv_localtime_cache=no ac_cv_struct_st_mtim_nsec=no \
+		gl_cv_func_tzset_clobber=no gl_cv_func_getcwd_null=yes \
+		gl_cv_func_getcwd_path_max=yes ac_cv_func_fnmatch_gnu=yes \
+		am_getline_needs_run_time_check=no am_cv_func_working_getline=yes \
+		gl_cv_func_mkdir_trailing_slash_bug=no gl_cv_func_mkstemp_limitations=no \
+		ac_cv_func_working_mktime=yes jm_cv_func_working_re_compile_pattern=yes \
+		ac_use_included_regex=no gl_cv_c_restrict=no \
+		ac_cv_path_GLIB_GENMARSHAL=/usr/bin/glib-genmarshal \
+		ac_cv_prog_F77=no ac_cv_prog_CXX=no ac_cv_path_CUPS_CONFIG=no 
+
+
+CLASSPATH_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) --prefix=/usr \
+		--exec-prefix=/usr --bindir=/usr/bin \
+		--sbindir=/usr/sbin --libdir=/usr/lib \
+		--libexecdir=/usr/lib --sysconfdir=/etc \
+		--datadir=/usr/share --localstatedir=/var \
+		--includedir=/usr/include --mandir=/usr/man \
+		--infodir=/usr/info --enable-shared \
+		--enable-static \
+		--disable-glibtest --enable-explicit-deps=no \
+		--disable-debug PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
+		--disable-gconf-peer --disable-examples --disable-plugin
+
+CLASSPATH_DEPENDENCIES = uclibc png jpeg tiff
+
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+	CLASSPATH_DEPENDENCIES+= alsa-lib
+	CLASSPATH_CONF_OPT+= --enable-alsa
+else 
+	CLASSPATH_CONF_OPT+= --disable-alsa
+endif
+
+ifeq ($(BR2_PACKAGE_QTOPIA4),y)
+	CLASSPATH_DEPENDENCIES+= qtopia4
+	CLASSPATH_CONF_OPT+= --enable-qt-peer
+else 
+	CLASSPATH_CONF_OPT+= --disable-qt-peer
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK2),y)
+	CLASSPATH_DEPENDENCIES+= libgtk2
+	CLASSPATH_CONF_OPT+= --enable-gtk-peer
+else 
+	CLASSPATH_CONF_OPT+= --disable-gtk-peer
+endif
+
+ifneq ($(BR2_PACKAGE_XSERVER_none),y)
+	CLASSPATH_DEPENDENCIES+= $(XSERVER)
+	CLASSPATH_CONF_OPT+= --with-x \
+		--x-includes=$(STAGING_DIR)/usr/include/X11 \
+		--x-libraries=$(STAGING_DIR)/usr/lib
+else
+	CLASSPATH_CONF_OPT+= --without-x 
+endif
+
+
+
+$(eval $(call AUTOTARGETS,package,classpath))

Added: trunk/buildroot/package/concierge/Config.in
===================================================================
--- trunk/buildroot/package/concierge/Config.in	                        (rev 0)
+++ trunk/buildroot/package/concierge/Config.in	2008-03-06 18:02:19 UTC (rev 21187)
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_CONCIERGE
+	bool "concierge"
+	default n
+        depends on BR2_PACKAGE_JAMVM
+
+	help
+	  Concierge is an optimized OSGi R3 framework implementations with a file footprint of about 80 kBytes. This makes it ideal for mobile or embedded devices. 
+	  http://concierge.sourceforge.net/

Added: trunk/buildroot/package/concierge/concierge.mk
===================================================================
--- trunk/buildroot/package/concierge/concierge.mk	                        (rev 0)
+++ trunk/buildroot/package/concierge/concierge.mk	2008-03-06 18:02:19 UTC (rev 21187)
@@ -0,0 +1,40 @@
+#############################################################
+#
+# concierge 1.0-RC2
+#
+#############################################################
+CONCIERGE_VERSION = 1.0_RC2
+CONCIERGE_SOURCE = concierge-$(CONCIERGE_VERSION).jar
+CONCIERGE_SITE = http://ovh.dl.sourceforge.net/sourceforge/concierge/
+CONCIERGE_DIR=$(BUILD_DIR)/concierge-$(CONCIERGE_VERSION)
+CONCIERGE_SITE_BUNDLES = http://concierge.sourceforge.net/bundles/
+
+$(DL_DIR)/concierge:
+	 mkdir -p $(DL_DIR)/concierge/
+	 $(WGET) -P $(DL_DIR)/concierge/ $(CONCIERGE_SITE)/concierge-$(CONCIERGE_VERSION).jar
+	 $(WGET) -P $(DL_DIR)/concierge/ $(CONCIERGE_SITE_BUNDLES)shell-1.0.0.RC2.jar
+	 $(WGET) -P $(DL_DIR)/concierge/ $(CONCIERGE_SITE_BUNDLES)service-tracker-1.0.0.RC2.jar
+	 $(WGET) -P $(DL_DIR)/concierge/ $(CONCIERGE_SITE_BUNDLES)event-admin-1.0.0.RC2.jar
+
+$(TARGET_DIR)/usr/lib/concierge/: $(DL_DIR)/concierge
+	mkdir -p $(TARGET_DIR)/usr/lib
+	mkdir -p $(TARGET_DIR)/usr/lib/concierge
+	cp -dpf $(DL_DIR)/concierge/* $(TARGET_DIR)/usr/lib/concierge/
+	cp -dpf package/concierge/files/init.xargs $(TARGET_DIR)/usr/lib/concierge/
+	touch -c $@
+
+$(TARGET_DIR)/usr/bin/concierge: 
+	cp -dpf package/concierge/files/concierge $(TARGET_DIR)/usr/bin/
+	chmod +x $(TARGET_DIR)/usr/bin/concierge
+	touch -c $@
+
+concierge: $(TARGET_DIR)/usr/lib/concierge $(TARGET_DIR)/usr/bin/concierge
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_CONCIERGE)),y)
+TARGETS+=concierge
+endif

Added: trunk/buildroot/package/concierge/files/concierge
===================================================================
--- trunk/buildroot/package/concierge/files/concierge	                        (rev 0)
+++ trunk/buildroot/package/concierge/files/concierge	2008-03-06 18:02:19 UTC (rev 21187)
@@ -0,0 +1,2 @@
+#!/bin/sh
+/usr/bin/jamvm -jar /usr/lib/concierge/concierge-1.0_RC2.jar

Added: trunk/buildroot/package/concierge/files/init.xargs
===================================================================
--- trunk/buildroot/package/concierge/files/init.xargs	                        (rev 0)
+++ trunk/buildroot/package/concierge/files/init.xargs	2008-03-06 18:02:19 UTC (rev 21187)
@@ -0,0 +1,10 @@
+-init
+-all
+-Dch.ethz.iks.concierge.debug=true
+-Dch.ethz.iks.concierge.log.enabled=true
+-Dch.ethz.iks.concierge.log.level=4
+
+
+#-istart shell-1.0.0.RC2.jar
+#-istart service-tracker-1.0.0.RC2.jar
+#-istart event-admin-1.0.0.RC2.jar
