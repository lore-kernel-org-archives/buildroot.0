From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Mon, 28 Apr 2008 22:04:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/rpm
Message-ID: <20080429050414.9E7E93C6A5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-04-28 22:04:14 -0700 (Mon, 28 Apr 2008)
New Revision: 21891

Log:
* Bump version to 5.1.1
* Use bzip2 compression (rpms can have gzip or bzip2 payloads)
* -j1, rpm cannot build with more than 1 thread


Modified:
   trunk/buildroot/package/rpm/Config.in
   trunk/buildroot/package/rpm/rpm.mk


Changeset:
Modified: trunk/buildroot/package/rpm/Config.in
===================================================================
--- trunk/buildroot/package/rpm/Config.in	2008-04-29 04:40:15 UTC (rev 21890)
+++ trunk/buildroot/package/rpm/Config.in	2008-04-29 05:04:14 UTC (rev 21891)
@@ -2,6 +2,7 @@
 	bool "rpm"
 	default n
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_BEECRYPT
 	select BR2_PACKAGE_NEON
 	select BR2_PACKAGE_POPT

Modified: trunk/buildroot/package/rpm/rpm.mk
===================================================================
--- trunk/buildroot/package/rpm/rpm.mk	2008-04-29 04:40:15 UTC (rev 21890)
+++ trunk/buildroot/package/rpm/rpm.mk	2008-04-29 05:04:14 UTC (rev 21891)
@@ -3,11 +3,11 @@
 # rpm
 #
 #############################################################
-RPM_VERSION = 5.1.0
-RPM_SITE = http://rpm5.org/files/rpm/rpm-5.0/
+RPM_VERSION = 5.1.1
+RPM_SITE = http://rpm5.org/files/rpm/rpm-5.1/
 RPM_AUTORECONF = YES
 
-RPM_DEPENDENCIES = zlib beecrypt neon popt
+RPM_DEPENDENCIES = zlib bzip2 beecrypt neon popt
 
 RPM_CONF_ENV = CFLAGS="-I$(STAGING_DIR)/usr/include/beecrypt -I$(STAGING_DIR)/usr/include/neon" \
 		ac_cv_va_copy=yes
@@ -19,8 +19,11 @@
 	--with-libbeecrypt=$(STAGING_DIR) \
 	--with-popt=$(STAGING_DIR) \
 	--with-mutex=UNIX/fcntl \
+	--with-bzip2 \
 	$(DISABLE_NLS)
 
+RPM_MAKE_OPT = -j1
+
 RPM_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) program_transform_name= install
 
 $(eval $(call AUTOTARGETS,package,rpm))
