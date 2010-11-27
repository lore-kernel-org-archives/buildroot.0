From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sat, 27 Nov 2010 18:55:53 +0100
Subject: [Buildroot] samba [PATCH] fixes cifs mount ,
	bump version fix missing valid.dat
Message-ID: <2FEF5A19C60B410C9B626D2E3FE7AF71@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
- bump to samba 3.5.6
 
- fixes : S91smb :  : /var/lock should have 755 perms. ( hint came from
running sambas testparm tool)
 
- cifs.mount build error : fix non existingf fstab.h
 
- makefile : also build ciifs.umount when cifs.mount was selected.
 
- valid.dat was missing in the target /usr/lib directory  ( hint came from
running testparm )

- get rid of old patches
 
Regards Johan


diff -rupN buildroot-2010.11-rc2/package/samba/S91smb
buildroot/package/samba/S91smb
--- buildroot-2010.11-rc2/package/samba/S91smb	2010-11-25
11:29:30.000000000 +0100
+++ buildroot/package/samba/S91smb	2010-11-27 16:45:00.000000000 +0100
@@ -10,6 +10,7 @@
 mkdir -p /var/cache/samba
 mkdir -p /var/log/samba
 mkdir -p /var/lock/subsys
+chmod 755 /var/lock
 
 RETVAL=0
 
diff -rupN buildroot-2010.11-rc2/package/samba/samba-3.5.6.patch
buildroot/package/samba/samba-3.5.6.patch
--- buildroot-2010.11-rc2/package/samba/samba-3.5.6.patch	1970-01-01
01:00:00.000000000 +0100
+++ buildroot/package/samba/samba-3.5.6.patch	2010-11-27
17:24:02.000000000 +0100
@@ -0,0 +1,21 @@
+diff -rupN samba-3.5.6org/client/fstab.h samba-3.5.6/client/fstab.h
+--- samba-3.5.6org/client/fstab.h	1970-01-01 01:00:00.000000000 +0100
++++ samba-3.5.6/client/fstab.h	2010-11-27 17:05:32.000000000 +0100
+@@ -0,0 +1,5 @@
++/* 
++ * missing fstab.h file required for cifs mount
++ */
++
++#define _PATH_FSTAB "/etc/fstab"
+diff -rupN samba-3.5.6org/client/mount.cifs.c
samba-3.5.6/client/mount.cifs.c
+--- samba-3.5.6org/client/mount.cifs.c	2010-10-07 18:41:16.000000000 +0200
++++ samba-3.5.6/client/mount.cifs.c	2010-11-27 17:18:31.000000000 +0100
+@@ -39,7 +39,7 @@
+ #include <mntent.h>
+ #include <fcntl.h>
+ #include <limits.h>
+-#include <fstab.h>
++#include "fstab.h"
+ #include "mount.h"
+ 
+ #define MOUNT_CIFS_VERSION_MAJOR "1"
diff -rupN
buildroot-2010.11-rc2/package/samba/samba-add-check-for-__use_bsd.patch
buildroot/package/samba/samba-add-check-for-__use_bsd.patch
--- buildroot-2010.11-rc2/package/samba/samba-add-check-for-__use_bsd.patch
2010-11-25 11:29:30.000000000 +0100
+++ buildroot/package/samba/samba-add-check-for-__use_bsd.patch	1970-01-01
01:00:00.000000000 +0100
@@ -1,18 +0,0 @@
---- a/source/client/mount.cifs.c	2009-04-01 13:48:54.000000000 +0200
-+++ b/source/client/mount.cifs.c	2009-04-20 12:59:57.000000000 +0200
-@@ -100,6 +100,7 @@
- 
- /* glibc doesn't have strlcpy, strlcat. Ensure we do. JRA. We
-  * don't link to libreplace so need them here. */
-+#if defined(__GLIBC__) && !(defined(__UCLIBC__) && defined(__USE_BSD))
- 
- /* like strncpy but does not 0 fill the buffer and always null
-  *    terminates. bufsize is the size of the destination buffer */
-@@ -181,6 +182,7 @@
- 	SAFE_FREE(mountpassword);
- 	exit(EX_USAGE);
- }
-+#endif /* __GLIBC__ && !(__UCLIBC__ && __USE_BSD) */
- 
- /* caller frees username if necessary */
- static char * getusername(void) {
diff -rupN
buildroot-2010.11-rc2/package/samba/samba-do-not-check-glibc-version.patch
buildroot/package/samba/samba-do-not-check-glibc-version.patch
---
buildroot-2010.11-rc2/package/samba/samba-do-not-check-glibc-version.patch
2010-11-25 11:29:30.000000000 +0100
+++ buildroot/package/samba/samba-do-not-check-glibc-version.patch
1970-01-01 01:00:00.000000000 +0100
@@ -1,104 +0,0 @@
---- a/source/configure	2009-04-01 14:19:36.000000000 +0200
-+++ b/source/configure	2009-04-20 13:05:12.000000000 +0200
-@@ -44061,90 +44061,8 @@
- 
- rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
- 
--#
--#
--#
--case "$host_os" in
--    *linux*)
--       # glibc <= 2.3.2 has a broken getgrouplist
--       if test "$cross_compiling" = yes; then
--  { { $as_echo "$as_me:$LINENO: error: in \`$ac_pwd':" >&5
--$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
--{ { $as_echo "$as_me:$LINENO: error: cannot run test program while cross
compiling
--See \`config.log' for more details." >&5
--$as_echo "$as_me: error: cannot run test program while cross compiling
--See \`config.log' for more details." >&2;}
--   { (exit 1); exit 1; }; }; }
--else
--  cat >conftest.$ac_ext <<_ACEOF
--/* confdefs.h.  */
--_ACEOF
--cat confdefs.h >>conftest.$ac_ext
--cat >>conftest.$ac_ext <<_ACEOF
--/* end confdefs.h.  */
--
--#include <unistd.h>
--#include <sys/utsname.h>
--main() {
--       /* glibc up to 2.3 has a broken getgrouplist */
--#if defined(__GLIBC__) && defined(__GLIBC_MINOR__)
--       int libc_major = __GLIBC__;
--       int libc_minor = __GLIBC_MINOR__;
--
--       if (libc_major < 2)
--              exit(1);
--       if ((libc_major == 2) && (libc_minor <= 3))
--              exit(1);
--#endif
--       exit(0);
--}
--
--_ACEOF
--rm -f conftest$ac_exeext
--if { (ac_try="$ac_link"
--case "(($ac_try" in
--  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
--  *) ac_try_echo=$ac_try;;
--esac
--eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
--$as_echo "$ac_try_echo") >&5
--  (eval "$ac_link") 2>&5
--  ac_status=$?
--  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
--  (exit $ac_status); } && { ac_try='./conftest$ac_exeext'
--  { (case "(($ac_try" in
--  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
--  *) ac_try_echo=$ac_try;;
--esac
--eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
--$as_echo "$ac_try_echo") >&5
--  (eval "$ac_try") 2>&5
--  ac_status=$?
--  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
--  (exit $ac_status); }; }; then
--  linux_getgrouplist_ok=yes
--else
--  $as_echo "$as_me: program exited with status $ac_status" >&5
--$as_echo "$as_me: failed program was:" >&5
--sed 's/^/| /' conftest.$ac_ext >&5
--
--( exit $ac_status )
--linux_getgrouplist_ok=no
--fi
--rm -rf conftest.dSYM
--rm -f core *.core core.conftest.* gmon.out bb.out conftest$ac_exeext
conftest.$ac_objext conftest.$ac_ext
--fi
--
--
--       if test x"$linux_getgrouplist_ok" = x"yes"; then
--
--cat >>confdefs.h <<\_ACEOF
--#define HAVE_GETGROUPLIST 1
--_ACEOF
--
--       fi
--       ;;
--    *)
-+# Stripped glibc test which is not needed for uClibc
-+linux_getgrouplist_ok=yes
- 
- for ac_func in getgrouplist
- do
-@@ -44246,8 +44164,6 @@
- fi
- done
- 
--       ;;
--esac
- 
- #
- # stat64 family may need <sys/stat.h> on some systems, notably ReliantUNIX
diff -rupN buildroot-2010.11-rc2/package/samba/samba-fix-client-mtab.patch
buildroot/package/samba/samba-fix-client-mtab.patch
--- buildroot-2010.11-rc2/package/samba/samba-fix-client-mtab.patch
2010-11-25 11:29:30.000000000 +0100
+++ buildroot/package/samba/samba-fix-client-mtab.patch	1970-01-01
01:00:00.000000000 +0100
@@ -1,11 +0,0 @@
---- a/source/client/mtab.c
-+++ b/source/client/mtab.c
-@@ -31,6 +31,8 @@
- #include <unistd.h>
- #include <errno.h>
- #include <stdio.h>
-+#include <sys/types.h>
-+#include <sys/stat.h>
- #include <sys/time.h>
- #include <time.h>
- #include <fcntl.h>
diff -rupN buildroot-2010.11-rc2/package/samba/samba-fix-mount.cifs.patch
buildroot/package/samba/samba-fix-mount.cifs.patch
--- buildroot-2010.11-rc2/package/samba/samba-fix-mount.cifs.patch
2010-11-25 11:29:30.000000000 +0100
+++ buildroot/package/samba/samba-fix-mount.cifs.patch	1970-01-01
01:00:00.000000000 +0100
@@ -1,18 +0,0 @@
---- a/source/client/mount.cifs.c
-+++ b/source/client/mount.cifs.c
-@@ -138,6 +138,7 @@ static size_t strlcat(char *d, const cha
- 	return ret;
- }
- #endif
-+#endif /* __GLIBC__ && !(__UCLIBC__ && __USE_BSD) */
- 
- /* BB finish BB
- 
-@@ -178,7 +179,6 @@ static void mount_cifs_usage(void)
- 	SAFE_FREE(mountpassword);
- 	exit(EX_USAGE);
- }
--#endif /* __GLIBC__ && !(__UCLIBC__ && __USE_BSD) */
- 
- /* caller frees username if necessary */
- static char * getusername(void) {
diff -rupN buildroot-2010.11-rc2/package/samba/samba-getgrouplist.patch
buildroot/package/samba/samba-getgrouplist.patch
--- buildroot-2010.11-rc2/package/samba/samba-getgrouplist.patch
2010-11-25 11:29:30.000000000 +0100
+++ buildroot/package/samba/samba-getgrouplist.patch	1970-01-01
01:00:00.000000000 +0100
@@ -1,41 +0,0 @@
---- a/source/configure.in	2009-04-01 13:48:54.000000000 +0200
-+++ b/source/configure.in	2009-04-20 13:08:42.000000000 +0200
-@@ -1219,38 +1219,6 @@
- AC_DEFINE(HAVE_PRCTL, 1, [Whether prctl is available]),[])
- 
- #
--#
--#
--case "$host_os" in
--    *linux*)
--       # glibc <= 2.3.2 has a broken getgrouplist
--       AC_TRY_RUN([
--#include <unistd.h>
--#include <sys/utsname.h>
--main() {
--       /* glibc up to 2.3 has a broken getgrouplist */
--#if defined(__GLIBC__) && defined(__GLIBC_MINOR__)
--       int libc_major = __GLIBC__;
--       int libc_minor = __GLIBC_MINOR__;
--
--       if (libc_major < 2)
--              exit(1);
--       if ((libc_major == 2) && (libc_minor <= 3))
--              exit(1);
--#endif
--       exit(0);
--}
--], [linux_getgrouplist_ok=yes], [linux_getgrouplist_ok=no])
--       if test x"$linux_getgrouplist_ok" = x"yes"; then
--          AC_DEFINE(HAVE_GETGROUPLIST, 1, [Have good getgrouplist])
--       fi
--       ;;
--    *)
--       AC_CHECK_FUNCS(getgrouplist)
--       ;;
--esac
--
--#
- # stat64 family may need <sys/stat.h> on some systems, notably ReliantUNIX
- #
- 
diff -rupN buildroot-2010.11-rc2/package/samba/samba.mk
buildroot/package/samba/samba.mk
--- buildroot-2010.11-rc2/package/samba/samba.mk	2010-11-25
11:29:30.000000000 +0100
+++ buildroot/package/samba/samba.mk	2010-11-27 18:25:37.000000000 +0100
@@ -3,11 +3,11 @@
 # samba
 #
 #############################################################
-SAMBA_VERSION:=3.3.14
+SAMBA_VERSION:=3.5.6
 SAMBA_SOURCE:=samba-$(SAMBA_VERSION).tar.gz
 SAMBA_SITE:=http://samba.org/samba/ftp/stable/
 
-SAMBA_SUBDIR = source
+SAMBA_SUBDIR = source3
 SAMBA_AUTORECONF = NO
 SAMBA_LIBTOOL_PATCH = NO
 
@@ -66,6 +66,7 @@ SAMBA_CONF_OPT = \
 	--with-libiconv=$(STAGING_DIR) \
 	\
 	$(if $(BR2_PACKAGE_SAMBA_CIFS),--with-cifsmount,--without-cifsmount)
\
+	$(if
$(BR2_PACKAGE_SAMBA_CIFS),--with-cifsumount,--without-cifsumount) \
 	$(if $(BR2_PACKAGE_SAMBA_RPCCLIENT),--with-readline=$(STAGING_DIR))
\
 	$(if $(BR2_PACKAGE_SAMBA_SMBCLIENT),--with-readline=$(STAGING_DIR))
\
 	$(if $(BR2_PACKAGE_SAMBA_WINBINDD),--with-winbind,--without-winbind)
@@ -75,6 +76,7 @@ SAMBA_INSTALL_TARGET_OPT = \
 	DESTDIR=$(TARGET_DIR) -C $(SAMBA_DIR)/$(SAMBA_SUBDIR) \
 	installlibs installservers installbin installscripts \
 	$(if $(BR2_PACKAGE_SAMBA_CIFS),installcifsmount) \
+	$(if $(BR2_PACKAGE_SAMBA_CIFS),installcifsumount) \
 	$(if $(BR2_PACKAGE_SAMBA_SWAT),installswat)
 
 
@@ -82,6 +84,7 @@ SAMBA_UNINSTALL_TARGET_OPT = \
 	DESTDIR=$(TARGET_DIR) -C $(SAMBA_DIR)/$(SAMBA_SUBDIR) \
 	uninstalllibs uninstallservers uninstallbin uninstallscripts \
 	$(if $(BR2_PACKAGE_SAMBA_CIFS),uninstallcifsmount) \
+	$(if $(BR2_PACKAGE_SAMBA_CIFS),uninstallcifsumount) \
 	$(if $(BR2_PACKAGE_SAMBA_SWAT),uninstallswat)
 
 
@@ -186,6 +189,14 @@ define SAMBA_INSTALL_INITSCRIPTS_CONFIG
 	fi
 endef
 
+define SAMBA_INSTALL_DAT_FILES_IN_TARGET
+	# install dat files in target
+	cp  $(STAGING_DIR)/usr/lib/*.dat $(TARGET_DIR)/usr/lib
+endef
+
+
 SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_INSTALL_INITSCRIPTS_CONFIG
 
+SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_INSTALL_DAT_FILES_IN_TARGET
+
 $(eval $(call AUTOTARGETS,package,samba))
diff -rupN
buildroot-2010.11-rc2/package/samba/samba-remove-legacy-index.patch
buildroot/package/samba/samba-remove-legacy-index.patch
--- buildroot-2010.11-rc2/package/samba/samba-remove-legacy-index.patch
2010-11-25 11:29:30.000000000 +0100
+++ buildroot/package/samba/samba-remove-legacy-index.patch	1970-01-01
01:00:00.000000000 +0100
@@ -1,20 +0,0 @@
---- a/source/registry/reg_perfcount.c
-+++ b/source/registry/reg_perfcount.c
-@@ -616,14 +616,14 @@ static bool _reg_perfcount_add_counter(P
- 	obj = NULL;
- 	memset(buf, 0, PERFCOUNT_MAX_LEN);
- 	memcpy(buf, data.dptr, data.dsize);
--	begin = index(buf, '[');
--	end = index(buf, ']');
-+	begin = strchr(buf, '[');
-+	end = strchr(buf, ']');
- 	if(begin == NULL || end == NULL)
- 		return False;
- 	start = begin+1;
- 
- 	while(start < end) {
--		stop = index(start, ',');
-+		stop = strchr(start, ',');
- 		if(stop == NULL)
- 			stop = end;
- 		*stop = '\0';
 
 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: br_samba.patch
Type: application/octet-stream
Size: 11611 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101127/957028c7/attachment-0001.obj>
