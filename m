From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Tue, 13 Jan 2009 07:29:35 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/samba
Message-ID: <20090113072935.C1AD576850@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2009-01-13 07:29:35 +0000 (Tue, 13 Jan 2009)
New Revision: 24810

Log:
samba: bump version to 3.2.7 and refresh patches against this version

This patch bumps the Samba version to 3.2.7 and refreshes the patches. It also
fixes two minor issues by introducing two new small patches.



Added:
   trunk/buildroot/package/samba/samba-fix-client-mtab.patch
   trunk/buildroot/package/samba/samba-fix-mount.cifs.patch

Removed:
   trunk/buildroot/package/samba/samba-use-unsigned-enums.patch

Modified:
   trunk/buildroot/package/samba/samba-add-check-for-__use_bsd.patch
   trunk/buildroot/package/samba/samba-do-not-check-glibc-version.patch
   trunk/buildroot/package/samba/samba-getgrouplist.patch
   trunk/buildroot/package/samba/samba.mk


Changeset:
Modified: trunk/buildroot/package/samba/samba-add-check-for-__use_bsd.patch
===================================================================
--- trunk/buildroot/package/samba/samba-add-check-for-__use_bsd.patch	2009-01-13 07:26:55 UTC (rev 24809)
+++ trunk/buildroot/package/samba/samba-add-check-for-__use_bsd.patch	2009-01-13 07:29:35 UTC (rev 24810)
@@ -1,6 +1,6 @@
 --- a/source/client/mount.cifs.c
 +++ b/source/client/mount.cifs.c
-@@ -91,6 +91,7 @@ char * prefixpath = NULL;
+@@ -96,6 +96,7 @@ char * prefixpath = NULL;
  
  /* glibc doesn't have strlcpy, strlcat. Ensure we do. JRA. We
   * don't link to libreplace so need them here. */
@@ -8,11 +8,11 @@
  
  /* like strncpy but does not 0 fill the buffer and always null
   *    terminates. bufsize is the size of the destination buffer */
-@@ -126,6 +127,7 @@ static size_t strlcat(char *d, const cha
- 	}
- 	return ret;
+@@ -177,6 +178,7 @@ static void mount_cifs_usage(void)
+ 	SAFE_FREE(mountpassword);
+ 	exit(EX_USAGE);
  }
 +#endif /* __GLIBC__ && !(__UCLIBC__ && __USE_BSD) */
  
- /* BB finish BB
- 
+ /* caller frees username if necessary */
+ static char * getusername(void) {

Modified: trunk/buildroot/package/samba/samba-do-not-check-glibc-version.patch
===================================================================
--- trunk/buildroot/package/samba/samba-do-not-check-glibc-version.patch	2009-01-13 07:26:55 UTC (rev 24809)
+++ trunk/buildroot/package/samba/samba-do-not-check-glibc-version.patch	2009-01-13 07:29:35 UTC (rev 24810)
@@ -1,6 +1,6 @@
 --- a/source/configure
 +++ b/source/configure
-@@ -40770,85 +40770,8 @@ fi
+@@ -41016,85 +41016,8 @@ fi
  
  rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
  
@@ -88,7 +88,7 @@
  
  for ac_func in getgrouplist
  do
-@@ -40943,8 +40866,6 @@ _ACEOF
+@@ -41189,8 +41112,6 @@ _ACEOF
  fi
  done
  

Added: trunk/buildroot/package/samba/samba-fix-client-mtab.patch
===================================================================
--- trunk/buildroot/package/samba/samba-fix-client-mtab.patch	                        (rev 0)
+++ trunk/buildroot/package/samba/samba-fix-client-mtab.patch	2009-01-13 07:29:35 UTC (rev 24810)
@@ -0,0 +1,11 @@
+--- a/source/client/mtab.c
++++ b/source/client/mtab.c
+@@ -31,6 +31,8 @@
+ #include <unistd.h>
+ #include <errno.h>
+ #include <stdio.h>
++#include <sys/types.h>
++#include <sys/stat.h>
+ #include <sys/time.h>
+ #include <time.h>
+ #include <fcntl.h>

Added: trunk/buildroot/package/samba/samba-fix-mount.cifs.patch
===================================================================
--- trunk/buildroot/package/samba/samba-fix-mount.cifs.patch	                        (rev 0)
+++ trunk/buildroot/package/samba/samba-fix-mount.cifs.patch	2009-01-13 07:29:35 UTC (rev 24810)
@@ -0,0 +1,40 @@
+--- a/source/client/mount.cifs.c
++++ b/source/client/mount.cifs.c
+@@ -16,6 +16,10 @@
+    You should have received a copy of the GNU General Public License
+    along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
+ 
++#ifdef _SAMBA_BUILD_
++#include "include/config.h"
++#endif
++
+ #ifndef _GNU_SOURCE
+ #define _GNU_SOURCE
+ #endif
+@@ -57,10 +61,6 @@
+  #endif /* _SAMBA_BUILD_ */
+ #endif /* MOUNT_CIFS_VENDOR_SUFFIX */
+ 
+-#ifdef _SAMBA_BUILD_
+-#include "include/config.h"
+-#endif
+-
+ #ifndef MS_MOVE 
+ #define MS_MOVE 8192 
+ #endif 
+@@ -138,6 +138,7 @@ static size_t strlcat(char *d, const cha
+ 	return ret;
+ }
+ #endif
++#endif /* __GLIBC__ && !(__UCLIBC__ && __USE_BSD) */
+ 
+ /* BB finish BB
+ 
+@@ -178,7 +179,6 @@ static void mount_cifs_usage(void)
+ 	SAFE_FREE(mountpassword);
+ 	exit(EX_USAGE);
+ }
+-#endif /* __GLIBC__ && !(__UCLIBC__ && __USE_BSD) */
+ 
+ /* caller frees username if necessary */
+ static char * getusername(void) {

Modified: trunk/buildroot/package/samba/samba-getgrouplist.patch
===================================================================
--- trunk/buildroot/package/samba/samba-getgrouplist.patch	2009-01-13 07:26:55 UTC (rev 24809)
+++ trunk/buildroot/package/samba/samba-getgrouplist.patch	2009-01-13 07:29:35 UTC (rev 24810)
@@ -1,6 +1,6 @@
 --- a/source/configure.in
 +++ b/source/configure.in
-@@ -1182,38 +1182,6 @@ AC_TRY_COMPILE([
+@@ -1199,38 +1199,6 @@ AC_TRY_COMPILE([
  AC_DEFINE(HAVE_PRCTL, 1, [Whether prctl is available]),[])
  
  #

Deleted: trunk/buildroot/package/samba/samba-use-unsigned-enums.patch
===================================================================
--- trunk/buildroot/package/samba/samba-use-unsigned-enums.patch	2009-01-13 07:26:55 UTC (rev 24809)
+++ trunk/buildroot/package/samba/samba-use-unsigned-enums.patch	2009-01-13 07:29:35 UTC (rev 24810)
@@ -1,43 +0,0 @@
-diff -ur samba-3.0.25a/source/configure.in samba-3.0.25a-patched/source/configure.in
---- samba-3.0.25a/source/configure.in	2007-06-19 11:40:49.000000000 -0500
-+++ samba-3.0.25a-patched/source/configure.in	2007-06-19 11:45:04.000000000 -0500
-@@ -511,37 +511,8 @@
-    AC_DEFINE(HAVE_VOLATILE, 1, [Whether the C compiler understands volatile])
- fi
- 
--############################################
--# check if the compiler can handle negative enum values
--# and don't truncate the values to INT_MAX
--# a runtime test is needed here
--AC_SUBST(PIDL_ARGS)
--AC_CACHE_CHECK([that the C compiler understands negative enum values],SMB_BUILD_CC_NEGATIVE_ENUM_VALUES, [
--    AC_TRY_RUN(
--[
--	#include <stdio.h>
--	enum negative_values { NEGATIVE_VALUE = 0xFFFFFFFF };
--	int main(void) {
--		enum negative_values v1 = NEGATIVE_VALUE;
--		unsigned v2 = NEGATIVE_VALUE;
--
--		if (v1 != 0xFFFFFFFF) {
--			printf("%u != 0xFFFFFFFF\n", v1);
--			return 1;
--		}
--		if (v2 != 0xFFFFFFFF) {
--			printf("%u != 0xFFFFFFFF\n", v2);
--			return 1;
--		}
--
--		return 0;
--	}
--],
--	SMB_BUILD_CC_NEGATIVE_ENUM_VALUES=yes,SMB_BUILD_CC_NEGATIVE_ENUM_VALUES=no)])
--if test x"$SMB_BUILD_CC_NEGATIVE_ENUM_VALUES" != x"yes"; then
--	AC_MSG_WARN([using --unit-enums for pidl])
--	PIDL_ARGS="$PIDL_ARGS --uint-enums"
--fi
-+# Just hard code this for cross compile cases
-+PIDL_ARGS="$PIDL_ARGS --uint-enums"
- 
- dnl Figure out the flags to support named structure initializers
- 

Modified: trunk/buildroot/package/samba/samba.mk
===================================================================
--- trunk/buildroot/package/samba/samba.mk	2009-01-13 07:26:55 UTC (rev 24809)
+++ trunk/buildroot/package/samba/samba.mk	2009-01-13 07:29:35 UTC (rev 24810)
@@ -3,7 +3,7 @@
 # samba
 #
 #############################################################
-SAMBA_VERSION:=3.2.5
+SAMBA_VERSION:=3.2.7
 SAMBA_SOURCE:=samba-$(SAMBA_VERSION).tar.gz
 SAMBA_SITE:=http://samba.org/samba/ftp/stable/
 SAMBA_DIR:=$(BUILD_DIR)/samba-$(SAMBA_VERSION)/source
