From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Mon, 16 Jul 2007 17:21:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/samba
Message-ID: <20070717002116.037B83007C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-07-16 17:21:16 -0700 (Mon, 16 Jul 2007)
New Revision: 19117

Log:
Bump Samba to latest version and update patches.


Added:
   trunk/buildroot/package/samba/samba-use-unsigned-enums.patch

Modified:
   trunk/buildroot/package/samba/samba-getgrouplist.patch
   trunk/buildroot/package/samba/samba-remove-legacy-index.patch
   trunk/buildroot/package/samba/samba.mk


Changeset:
Modified: trunk/buildroot/package/samba/samba-getgrouplist.patch
===================================================================
--- trunk/buildroot/package/samba/samba-getgrouplist.patch	2007-07-17 00:20:32 UTC (rev 19116)
+++ trunk/buildroot/package/samba/samba-getgrouplist.patch	2007-07-17 00:21:16 UTC (rev 19117)
@@ -1,12 +1,12 @@
-diff -ur samba-3.0.23c/source/configure.in samba-3.0.23c-patched/source/configure.in
---- samba-3.0.23c/source/configure.in	2006-07-21 11:22:57.000000000 -0500
-+++ samba-3.0.23c-patched/source/configure.in	2006-11-09 10:23:26.000000000 -0600
-@@ -1399,38 +1399,6 @@
+diff -ur samba-3.0.25a/source/configure.in samba-3.0.25a-patched/source/configure.in
+--- samba-3.0.25a/source/configure.in	2007-05-23 10:29:20.000000000 -0500
++++ samba-3.0.25a-patched/source/configure.in	2007-06-19 11:38:21.000000000 -0500
+@@ -1370,38 +1370,6 @@
  AC_DEFINE(HAVE_PRCTL, 1, [Whether prctl is available]),[])
  
  #
--# 
 -#
+-#
 -case "$host_os" in
 -    *linux*)
 -       # glibc <= 2.3.2 has a broken getgrouplist

Modified: trunk/buildroot/package/samba/samba-remove-legacy-index.patch
===================================================================
--- trunk/buildroot/package/samba/samba-remove-legacy-index.patch	2007-07-17 00:20:32 UTC (rev 19116)
+++ trunk/buildroot/package/samba/samba-remove-legacy-index.patch	2007-07-17 00:21:16 UTC (rev 19117)
@@ -1,7 +1,7 @@
-diff -ur samba-3.0.23d/source/registry/reg_perfcount.c samba-3.0.23d-patched/source/registry/reg_perfcount.c
---- samba-3.0.23d/source/registry/reg_perfcount.c	2006-07-10 11:27:54.000000000 -0500
-+++ samba-3.0.23d-patched/source/registry/reg_perfcount.c	2007-01-20 23:12:23.456180669 -0600
-@@ -614,15 +614,15 @@
+diff -ur samba-3.0.25a/source/registry/reg_perfcount.c samba-3.0.25a-patched/source/registry/reg_perfcount.c
+--- samba-3.0.25a/source/registry/reg_perfcount.c	2007-02-28 22:55:05.000000000 -0600
++++ samba-3.0.25a-patched/source/registry/reg_perfcount.c	2007-06-19 11:40:01.000000000 -0500
+@@ -615,14 +615,14 @@
  	obj = NULL;
  	memset(buf, 0, PERFCOUNT_MAX_LEN);
  	memcpy(buf, data.dptr, data.dsize);
@@ -13,8 +13,7 @@
  		return False;
  	start = begin+1;
  
- 	while(start < end)
- 	{
+ 	while(start < end) {
 -		stop = index(start, ',');
 +		stop = strchr(start, ',');
  		if(stop == NULL)

Added: trunk/buildroot/package/samba/samba-use-unsigned-enums.patch
===================================================================
--- trunk/buildroot/package/samba/samba-use-unsigned-enums.patch	                        (rev 0)
+++ trunk/buildroot/package/samba/samba-use-unsigned-enums.patch	2007-07-17 00:21:16 UTC (rev 19117)
@@ -0,0 +1,43 @@
+diff -ur samba-3.0.25a/source/configure.in samba-3.0.25a-patched/source/configure.in
+--- samba-3.0.25a/source/configure.in	2007-06-19 11:40:49.000000000 -0500
++++ samba-3.0.25a-patched/source/configure.in	2007-06-19 11:45:04.000000000 -0500
+@@ -511,37 +511,8 @@
+    AC_DEFINE(HAVE_VOLATILE, 1, [Whether the C compiler understands volatile])
+ fi
+ 
+-############################################
+-# check if the compiler can handle negative enum values
+-# and don't truncate the values to INT_MAX
+-# a runtime test is needed here
+-AC_SUBST(PIDL_ARGS)
+-AC_CACHE_CHECK([that the C compiler understands negative enum values],SMB_BUILD_CC_NEGATIVE_ENUM_VALUES, [
+-    AC_TRY_RUN(
+-[
+-	#include <stdio.h>
+-	enum negative_values { NEGATIVE_VALUE = 0xFFFFFFFF };
+-	int main(void) {
+-		enum negative_values v1 = NEGATIVE_VALUE;
+-		unsigned v2 = NEGATIVE_VALUE;
+-
+-		if (v1 != 0xFFFFFFFF) {
+-			printf("%u != 0xFFFFFFFF\n", v1);
+-			return 1;
+-		}
+-		if (v2 != 0xFFFFFFFF) {
+-			printf("%u != 0xFFFFFFFF\n", v2);
+-			return 1;
+-		}
+-
+-		return 0;
+-	}
+-],
+-	SMB_BUILD_CC_NEGATIVE_ENUM_VALUES=yes,SMB_BUILD_CC_NEGATIVE_ENUM_VALUES=no)])
+-if test x"$SMB_BUILD_CC_NEGATIVE_ENUM_VALUES" != x"yes"; then
+-	AC_MSG_WARN([using --unit-enums for pidl])
+-	PIDL_ARGS="$PIDL_ARGS --uint-enums"
+-fi
++# Just hard code this for cross compile cases
++PIDL_ARGS="$PIDL_ARGS --uint-enums"
+ 
+ dnl Figure out the flags to support named structure initializers
+ 

Modified: trunk/buildroot/package/samba/samba.mk
===================================================================
--- trunk/buildroot/package/samba/samba.mk	2007-07-17 00:20:32 UTC (rev 19116)
+++ trunk/buildroot/package/samba/samba.mk	2007-07-17 00:21:16 UTC (rev 19117)
@@ -3,9 +3,9 @@
 # samba
 #
 #############################################################
-SAMBA_VERSION:=3.0.23d
+SAMBA_VERSION:=3.0.25b
 SAMBA_SOURCE:=samba-$(SAMBA_VERSION).tar.gz
-SAMBA_SITE:=ftp://us4.samba.org/pub/samba/old-versions/
+SAMBA_SITE:=ftp://us4.samba.org/pub/samba/
 SAMBA_DIR:=$(BUILD_DIR)/samba-$(SAMBA_VERSION)/source
 SAMBA_CAT:=$(ZCAT)
 SAMBA_BINARY:=bin/smbd
@@ -28,6 +28,7 @@
 		$(TARGET_CONFIGURE_ARGS) \
 		samba_cv_HAVE_GETTIMEOFDAY_TZ=yes \
 		samba_cv_USE_SETREUID=yes \
+		samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=yes \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
@@ -38,6 +39,7 @@
 		--with-logfilebase=/var/log/samba \
 		--with-configdir=/etc/samba \
 		--without-ldap \
+		--without-libaddns \
 		--with-included-popt \
 		--with-included-iniparser \
 		--disable-cups \
@@ -91,6 +93,10 @@
 	for file in $(SAMBA_TARGETS_) ; do \
 		rm -f $(TARGET_DIR)/$$file; \
 	done
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/$(SAMBA_TARGET_BINARY)
+	for file in $(SAMBA_TARGETS_y) ; do \
+		$(STRIP) --strip-unneeded $(TARGET_DIR)/$$file; \
+	done
 	$(INSTALL) -m 0755 package/samba/S91smb $(TARGET_DIR)/etc/init.d
 	@if [ ! -f $(TARGET_DIR)/etc/samba/smb.conf ] ; then \
 		$(INSTALL) -m 0755 -D package/samba/simple.conf $(TARGET_DIR)/etc/samba/smb.conf; \
