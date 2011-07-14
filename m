From: firegurafiku <firegurafiku@gmail.com>
Date: Thu, 14 Jul 2011 21:03:42 +0400
Subject: [Buildroot] [PATCH] Added partimage package.
Message-ID: <1310663022-28156-1-git-send-email-firegurafiku@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also supplied two patches. The first removes checking for setpgrp()function
which cannot be performed when cross-compiling and links partimage against
libintl explicitly, the second makes some slight fixes to the source code
because newt API has changed a bit.

Signed-off-by: firegurafiku <firegurafiku@gmail.com>
---
 package/Config.in                                 |    1 +
 package/partimage/Config.in                       |   43 ++++++++++++++++++++
 package/partimage/partimage-0.6.9-configure.patch |   23 +++++++++++
 package/partimage/partimage-0.6.9-src.patch       |   37 +++++++++++++++++
 package/partimage/partimage.mk                    |   45 +++++++++++++++++++++
 5 files changed, 149 insertions(+), 0 deletions(-)
 create mode 100644 package/partimage/Config.in
 create mode 100644 package/partimage/partimage-0.6.9-configure.patch
 create mode 100644 package/partimage/partimage-0.6.9-src.patch
 create mode 100644 package/partimage/partimage.mk

diff --git a/package/Config.in b/package/Config.in
index fb5a570..f19ee8e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -191,6 +191,7 @@ source "package/memtester/Config.in"
 source "package/mtd/Config.in"
 source "package/ntfs-3g/Config.in"
 source "package/ntfsprogs/Config.in"
+source "package/partimage/Config.in"
 source "package/pciutils/Config.in"
 source "package/rng-tools/Config.in"
 source "package/sdparm/Config.in"
diff --git a/package/partimage/Config.in b/package/partimage/Config.in
new file mode 100644
index 0000000..ac067bd
--- /dev/null
+++ b/package/partimage/Config.in
@@ -0,0 +1,43 @@
+config BR2_PACKAGE_PARTIMAGE
+        bool "partimage"
+        select BR2_PACKAGE_LIBINTL
+        select BR2_PACKAGE_NEWT
+        select BR2_PACKAGE_ZLIB
+        select BR2_PACKAGE_BZIP2
+        help
+          Console-based application to efficiently save raw partition data 
+          to an image file. It saves partitions having a supported filesystem 
+          on a sector basis to an image file. The image file can be compressed
+          to save disk space and transfer time and can be split into multiple 
+          files to be copied to CDs or DVDs. Partitions can be saved across 
+          the network using the partimage network support, or using Samba or 
+          NFS (Network File Systems). This provides the ability to perform an 
+          hard disk partition recovery after a disk crash.
+          
+          http://www.partimage.org
+
+config BR2_PACKAGE_PARTIMAGE_SSL
+        bool "enable SSL support (openssl)"
+        depends on BR2_PACKAGE_PARTIMAGE
+        select BR2_PACKAGE_OPENSSL
+        help 
+          Enables SSL support for partimage client and server.
+
+config BR2_PACKAGE_PARTIMAGE_PAM
+        bool "enable PAM support"
+        depends on BR2_PACKAGE_PARTIMAGE
+        help 
+          Enables PAM support for partimage client and server.
+
+config BR2_PACKAGE_PARTIMAGE_CHEUID
+        bool "setuid to unprivileged user after server startup"
+        depends on BR2_PACKAGE_PARTIMAGE
+        help 
+          Server will change EUID to 'partimag' user after sucessful startup.
+
+config BR2_PACKAGE_PARTIMAGE_DEBUG
+        bool "enable partimage debug features"
+        depends on BR2_PACKAGE_PARTIMAGE
+        help 
+          Enable options for developpers (debug, etc).
+
diff --git a/package/partimage/partimage-0.6.9-configure.patch b/package/partimage/partimage-0.6.9-configure.patch
new file mode 100644
index 0000000..04e682e
--- /dev/null
+++ b/package/partimage/partimage-0.6.9-configure.patch
@@ -0,0 +1,23 @@
+Removes checking for presence of setpgrp() function which is not possible
+when cross-compiling and explicitly links partimage against libintl as 
+required in case of using uClibc. 
+
+--- a/configure.ac	2010-07-25 19:30:52.000000000 +0400
++++ b/configure.ac	2011-07-13 20:16:31.365546004 +0400
+@@ -96,6 +96,8 @@
+ AC_CHECK_LIB([z], [gzwrite], [],
+    AC_MSG_ERROR([*** gzip library (libz) not found]))
+ 
++LIBS="$LIBS -lintl"
++
+ dnl Search for headers, add path to CPPFLAGS if found 
+ AC_DEFUN([AC_SEARCH_HEADERS], 
+ [
+@@ -195,7 +197,6 @@
+ AC_STRUCT_TM
+ 
+ dnl Check for library functions.
+-AC_FUNC_SETPGRP
+ AC_CHECK_FUNCS(getwd strerror strdup atoll strtoll setpgid)
+ AC_CHECK_FUNCS(fstat64 fstatfs64 open64)
+ dnl getcwd, putenv, strdup have already been checked.
diff --git a/package/partimage/partimage-0.6.9-src.patch b/package/partimage/partimage-0.6.9-src.patch
new file mode 100644
index 0000000..d384bf9
--- /dev/null
+++ b/package/partimage/partimage-0.6.9-src.patch
@@ -0,0 +1,37 @@
+Slightly fixes source code of partimage client to get rid of compilation
+errors like "not enough actual parameters for newtScale() function" and
+"could not convert const char** to char**". 
+
+diff -u -r a/src/client/gui_text.cpp b/src/client/gui_text.cpp
+--- a/src/client/gui_text.cpp	2010-07-25 19:30:31.000000000 +0400
++++ b/src/client/gui_text.cpp	2011-07-13 18:36:08.000000000 +0400
+@@ -497,7 +497,7 @@
+   m_labelStatsSpeed = newtLabel(1, 11, "");
+   m_labelStatsSpace = newtLabel(1, 12, "");
+ 
+-  m_progressSaving = newtScale(1, 18, 70, 100);
++  m_progressSaving = newtScale(1, 18, 70, 100, 0);
+   m_labelPercent = newtLabel(72, 18, "");
+   
+   m_formMain = newtForm(NULL, NULL, 0);
+@@ -760,7 +760,7 @@
+   m_labelStatsSpeed = newtLabel(1, 11, "");
+   m_labelStatsSpace = newtLabel(1, 12, "");
+ 
+-  m_progressRestoring = newtScale(1, 18, 70, 100);
++  m_progressRestoring = newtScale(1, 18, 70, 100, 0);
+   m_labelPercent = newtLabel(72, 18, "");
+   
+   m_formMain = newtForm(NULL, NULL, 0);
+diff -u -r a/src/client/interface_newt.cpp b/src/client/interface_newt.cpp
+--- a/src/client/interface_newt.cpp	2010-07-25 19:30:31.000000000 +0400
++++ b/src/client/interface_newt.cpp	2011-07-13 18:40:41.000000000 +0400
+@@ -611,7 +611,7 @@
+ char *filesel(char *dr)
+ {
+ 	newtComponent	lb, b1, b2, b3, l1, l2, f, f1;
+-	const char	*enr2, *enr3;
++	char		*enr2, *enr3;
+ 	char		*curv;
+ 	char		curvv[PATH_MAX]; // stupid, but who cares...
+ 	int		i, cnt;
diff --git a/package/partimage/partimage.mk b/package/partimage/partimage.mk
new file mode 100644
index 0000000..418f7d0
--- /dev/null
+++ b/package/partimage/partimage.mk
@@ -0,0 +1,45 @@
+#############################################################
+#
+# partimage
+#
+#############################################################
+PARTIMAGE_VERSION = 0.6.9
+PARTIMAGE_SOURCE = partimage-$(PARTIMAGE_VERSION).tar.bz2
+PARTIMAGE_SITE = http://waix.dl.sourceforge.net/sourceforge/partimage
+PARTIMAGE_AUTORECONF = YES
+PARTIMAGE_INSTALL_STAGING = NO
+PARTIMAGE_INSTALL_TARGET = YES
+
+PARTIMAGE_CONF_OPT = --program-prefix='' \
+                     --disable-largefile \
+                     --disable-ssl \
+                     --disable-pam \
+                     --disable-cheuid \
+                     --disable-largefile \
+                     --disable-devel 
+
+PARTIMAGE_DEPENDENCIES = uclibc libintl newt zlib bzip2 
+
+ifeq ($(BR2_LARGEFILE), y)
+PARTIMAGE_CONF_OPT += --enable-largefile
+endif
+
+ifeq ($(BR2_PACKAGE_PARTIMAGE_SSL),y)
+PARTIMAGE_DEPENDENCIES += openssl
+PARTIMAGE_CONF_OPT += --enable-ssl
+endif
+
+ifeq ($(BR2_PACKAGE_PARTIMAGE_PAM),y)
+PARTIMAGE_CONF_OPT += --enable-pam
+endif
+
+ifeq ($(BR2_PACKAGE_PARTIMAGE_DEBUG),y)
+PARTIMAGE_CONF_OPT += --enable-devel
+endif
+
+ifneq ($(BR2_PACKAGE_PARTIMAGE_CHEUID),y)
+PARTiMAGE_CONF_OPT += --enable-cheuid
+endif
+
+$(eval $(call AUTOTARGETS,package,partimage))
+
-- 
1.7.3.4
