From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Fri, 12 Dec 2008 01:09:51 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/samba
Message-ID: <20081212090951.D7F3B3C2BE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-12-12 01:09:51 -0800 (Fri, 12 Dec 2008)
New Revision: 24389

Log:
samba: bump version to 3.2.5

This patch bumps Samba version to 3.2.5. In the process Samba now
depends on libiconv. This dependency is needed because Samba wants to use
various formats when talking to the different parts of the system.

Two new patches are introduced, one to double check if BSD functions are
available, and one to skip checking for glibc version. The use unsigned
enum patch could be removed since this can be supplied with a autoconf
variable.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Added:
   trunk/buildroot/package/samba/samba-add-check-for-__use_bsd.patch
   trunk/buildroot/package/samba/samba-do-not-check-glibc-version.patch

Modified:
   trunk/buildroot/package/samba/Config.in
   trunk/buildroot/package/samba/samba-getgrouplist.patch
   trunk/buildroot/package/samba/samba-remove-legacy-index.patch
   trunk/buildroot/package/samba/samba.mk


Changeset:
Modified: trunk/buildroot/package/samba/Config.in
===================================================================
--- trunk/buildroot/package/samba/Config.in	2008-12-12 09:03:47 UTC (rev 24388)
+++ trunk/buildroot/package/samba/Config.in	2008-12-12 09:09:51 UTC (rev 24389)
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SAMBA
 	bool "samba"
+	select BR2_PACKAGE_LIBICONV
 	help
 	  Provides print services to all manner of SMB/CIFS clients,
 	  including the numerous versions of Microsoft Windows

Added: trunk/buildroot/package/samba/samba-add-check-for-__use_bsd.patch
===================================================================
--- trunk/buildroot/package/samba/samba-add-check-for-__use_bsd.patch	                        (rev 0)
+++ trunk/buildroot/package/samba/samba-add-check-for-__use_bsd.patch	2008-12-12 09:09:51 UTC (rev 24389)
@@ -0,0 +1,18 @@
+--- a/source/client/mount.cifs.c
++++ b/source/client/mount.cifs.c
+@@ -91,6 +91,7 @@ char * prefixpath = NULL;
+ 
+ /* glibc doesn't have strlcpy, strlcat. Ensure we do. JRA. We
+  * don't link to libreplace so need them here. */
++#if defined(__GLIBC__) && !(defined(__UCLIBC__) && defined(__USE_BSD))
+ 
+ /* like strncpy but does not 0 fill the buffer and always null
+  *    terminates. bufsize is the size of the destination buffer */
+@@ -126,6 +127,7 @@ static size_t strlcat(char *d, const cha
+ 	}
+ 	return ret;
+ }
++#endif /* __GLIBC__ && !(__UCLIBC__ && __USE_BSD) */
+ 
+ /* BB finish BB
+ 

Added: trunk/buildroot/package/samba/samba-do-not-check-glibc-version.patch
===================================================================
--- trunk/buildroot/package/samba/samba-do-not-check-glibc-version.patch	                        (rev 0)
+++ trunk/buildroot/package/samba/samba-do-not-check-glibc-version.patch	2008-12-12 09:09:51 UTC (rev 24389)
@@ -0,0 +1,99 @@
+--- a/source/configure
++++ b/source/configure
+@@ -40770,85 +40770,8 @@ fi
+ 
+ rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
+ 
+-#
+-#
+-#
+-case "$host_os" in
+-    *linux*)
+-       # glibc <= 2.3.2 has a broken getgrouplist
+-       if test "$cross_compiling" = yes; then
+-  { { echo "$as_me:$LINENO: error: cannot run test program while cross compiling
+-See \`config.log' for more details." >&5
+-echo "$as_me: error: cannot run test program while cross compiling
+-See \`config.log' for more details." >&2;}
+-   { (exit 1); exit 1; }; }
+-else
+-  cat >conftest.$ac_ext <<_ACEOF
+-/* confdefs.h.  */
+-_ACEOF
+-cat confdefs.h >>conftest.$ac_ext
+-cat >>conftest.$ac_ext <<_ACEOF
+-/* end confdefs.h.  */
+-
+-#include <unistd.h>
+-#include <sys/utsname.h>
+-main() {
+-       /* glibc up to 2.3 has a broken getgrouplist */
+-#if defined(__GLIBC__) && defined(__GLIBC_MINOR__)
+-       int libc_major = __GLIBC__;
+-       int libc_minor = __GLIBC_MINOR__;
+-
+-       if (libc_major < 2)
+-              exit(1);
+-       if ((libc_major == 2) && (libc_minor <= 3))
+-              exit(1);
+-#endif
+-       exit(0);
+-}
+-
+-_ACEOF
+-rm -f conftest$ac_exeext
+-if { (ac_try="$ac_link"
+-case "(($ac_try" in
+-  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+-  *) ac_try_echo=$ac_try;;
+-esac
+-eval "echo \"\$as_me:$LINENO: $ac_try_echo\"") >&5
+-  (eval "$ac_link") 2>&5
+-  ac_status=$?
+-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
+-  (exit $ac_status); } && { ac_try='./conftest$ac_exeext'
+-  { (case "(($ac_try" in
+-  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+-  *) ac_try_echo=$ac_try;;
+-esac
+-eval "echo \"\$as_me:$LINENO: $ac_try_echo\"") >&5
+-  (eval "$ac_try") 2>&5
+-  ac_status=$?
+-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
+-  (exit $ac_status); }; }; then
+-  linux_getgrouplist_ok=yes
+-else
+-  echo "$as_me: program exited with status $ac_status" >&5
+-echo "$as_me: failed program was:" >&5
+-sed 's/^/| /' conftest.$ac_ext >&5
+-
+-( exit $ac_status )
+-linux_getgrouplist_ok=no
+-fi
+-rm -f core *.core core.conftest.* gmon.out bb.out conftest$ac_exeext conftest.$ac_objext conftest.$ac_ext
+-fi
+-
+-
+-       if test x"$linux_getgrouplist_ok" = x"yes"; then
+-
+-cat >>confdefs.h <<\_ACEOF
+-#define HAVE_GETGROUPLIST 1
+-_ACEOF
+-
+-       fi
+-       ;;
+-    *)
++# Stripped glibc test which is not needed for uClibc
++linux_getgrouplist_ok=yes
+ 
+ for ac_func in getgrouplist
+ do
+@@ -40943,8 +40866,6 @@ _ACEOF
+ fi
+ done
+ 
+-       ;;
+-esac
+ 
+ #
+ # stat64 family may need <sys/stat.h> on some systems, notably ReliantUNIX

Modified: trunk/buildroot/package/samba/samba-getgrouplist.patch
===================================================================
--- trunk/buildroot/package/samba/samba-getgrouplist.patch	2008-12-12 09:03:47 UTC (rev 24388)
+++ trunk/buildroot/package/samba/samba-getgrouplist.patch	2008-12-12 09:09:51 UTC (rev 24389)
@@ -1,7 +1,6 @@
-diff -ur samba-3.0.25a/source/configure.in samba-3.0.25a-patched/source/configure.in
---- samba-3.0.25a/source/configure.in	2007-05-23 10:29:20.000000000 -0500
-+++ samba-3.0.25a-patched/source/configure.in	2007-06-19 11:38:21.000000000 -0500
-@@ -1370,38 +1370,6 @@
+--- a/source/configure.in
++++ b/source/configure.in
+@@ -1182,38 +1182,6 @@ AC_TRY_COMPILE([
  AC_DEFINE(HAVE_PRCTL, 1, [Whether prctl is available]),[])
  
  #

Modified: trunk/buildroot/package/samba/samba-remove-legacy-index.patch
===================================================================
--- trunk/buildroot/package/samba/samba-remove-legacy-index.patch	2008-12-12 09:03:47 UTC (rev 24388)
+++ trunk/buildroot/package/samba/samba-remove-legacy-index.patch	2008-12-12 09:09:51 UTC (rev 24389)
@@ -1,7 +1,6 @@
-diff -ur samba-3.0.25a/source/registry/reg_perfcount.c samba-3.0.25a-patched/source/registry/reg_perfcount.c
---- samba-3.0.25a/source/registry/reg_perfcount.c	2007-02-28 22:55:05.000000000 -0600
-+++ samba-3.0.25a-patched/source/registry/reg_perfcount.c	2007-06-19 11:40:01.000000000 -0500
-@@ -615,14 +615,14 @@
+--- a/source/registry/reg_perfcount.c
++++ b/source/registry/reg_perfcount.c
+@@ -616,14 +616,14 @@ static bool _reg_perfcount_add_counter(P
  	obj = NULL;
  	memset(buf, 0, PERFCOUNT_MAX_LEN);
  	memcpy(buf, data.dptr, data.dsize);

Modified: trunk/buildroot/package/samba/samba.mk
===================================================================
--- trunk/buildroot/package/samba/samba.mk	2008-12-12 09:03:47 UTC (rev 24388)
+++ trunk/buildroot/package/samba/samba.mk	2008-12-12 09:09:51 UTC (rev 24389)
@@ -3,7 +3,7 @@
 # samba
 #
 #############################################################
-SAMBA_VERSION:=3.0.33
+SAMBA_VERSION:=3.2.5
 SAMBA_SOURCE:=samba-$(SAMBA_VERSION).tar.gz
 SAMBA_SITE:=http://samba.org/samba/ftp/stable/
 SAMBA_DIR:=$(BUILD_DIR)/samba-$(SAMBA_VERSION)/source
@@ -32,8 +32,9 @@
 		samba_cv_HAVE_MMAP=yes \
 		samba_cv_HAVE_FCNTL_LOCK=yes \
 		samba_cv_HAVE_SECURE_MKSTEMP=yes \
+		samba_cv_HAVE_NATIVE_ICONV=no \
+		samba_cv_CC_NEGATIVE_ENUM_VALUES=yes \
 		samba_cv_fpie=no \
-		SMB_BUILD_CC_NEGATIVE_ENUM_VALUES=yes \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
@@ -45,17 +46,21 @@
 		--with-privatedir=/etc/samba \
 		--with-logfilebase=/var/log/samba \
 		--with-configdir=/etc/samba \
+		--with-libiconv=$(STAGING_DIR) \
 		--without-ldap \
-		--without-libaddns \
+		--without-ads \
+		--without-acl \
 		--with-included-popt \
 		--with-included-iniparser \
+		--disable-shared-libs \
+		--disable-static \
 		--disable-cups \
-		--disable-static \
+		$(BR2_LARGEFILE) \
 	)
 	touch $@
 
 $(SAMBA_DIR)/$(SAMBA_BINARY): $(SAMBA_DIR)/.configured
-	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(SAMBA_DIR)
+	$(MAKE1) -C $(SAMBA_DIR)
 
 SAMBA_TARGETS_ :=
 SAMBA_TARGETS_y :=
@@ -98,13 +103,22 @@
 		PRIVATEDIR="${TARGET_DIR}/etc/samba" \
 		CONFIGDIR="${TARGET_DIR}/etc/samba" \
 		VARDIR="${TARGET_DIR}/var/log/samba" \
-		-C $(SAMBA_DIR) installservers installbin installcifsmount installscripts
+		-C $(SAMBA_DIR) installlibs installservers installbin installcifsmount installscripts
+	# Do not install the LDAP-like embedded database tools
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/ldb, add del edit modify search)
+	# Remove not used library by Samba binaries
+	rm -f $(TARGET_DIR)/usr/lib/libnetapi*
+	rm -f $(TARGET_DIR)/usr/lib/libsmbclient*
+	rm -f $(TARGET_DIR)/usr/lib/libtalloc*
+	rm -f $(TARGET_DIR)/usr/lib/libtdb*
+	# Remove not wanted Samba binaries
 	for file in $(SAMBA_TARGETS_); do \
 		rm -f $(TARGET_DIR)/$$file; \
 	done
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$(SAMBA_TARGET_BINARY)
+	# Strip the wanted Samba binaries
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/$(SAMBA_TARGET_BINARY)
 	for file in $(SAMBA_TARGETS_y); do \
-		$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$$file; \
+		$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/$$file; \
 	done
 ifeq ($(BR2_PACKAGE_SAMBA_SWAT),y)
 	cp -dpfr $(SAMBA_DIR)/../swat $(TARGET_DIR)/usr/
@@ -116,7 +130,7 @@
 	rm -rf $(TARGET_DIR)/var/cache/samba
 	rm -rf $(TARGET_DIR)/var/lib/samba
 
-samba: uclibc $(TARGET_DIR)/$(SAMBA_TARGET_BINARY)
+samba: libiconv $(TARGET_DIR)/$(SAMBA_TARGET_BINARY)
 
 samba-source: $(DL_DIR)/$(SAMBA_SOURCE)
 
