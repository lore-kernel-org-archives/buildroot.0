From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Oct 2015 22:09:39 +0100
Subject: [Buildroot] [git commit] ipmiutil: bump to version 2.9.7
Message-ID: <20151027211833.CAA2881F77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9972408a94fa8447786de5d15a11f2649b43a882
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstream or unneeded patches. Renumber and refresh the doc disable
patch. Add a different version of the lanplus disable fix (sent upstream) that
integrates with upstream change in this area.

Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...c-use-CC-instead-of-gcc-full-link-for-sta.patch |   43 ---------
 ...-no-build-doc.patch => 0001-no-build-doc.patch} |   11 ++-
 .../0002-lib-Makefile.am-fix-lanplus-disable.patch |   38 ++++++++
 package/ipmiutil/0003-really-disable-lanplus.patch |   95 --------------------
 .../ipmiutil/0004-avoid-wchar-t-redefinition.patch |   19 ----
 .../0005-add-missing-param.h-header-include.patch  |   24 -----
 .../0006-add-missing-sys-select.h-include.patch    |   26 ------
 package/ipmiutil/ipmiutil.hash                     |    2 +-
 package/ipmiutil/ipmiutil.mk                       |    4 +-
 9 files changed, 47 insertions(+), 215 deletions(-)

diff --git a/package/ipmiutil/0001-configure.ac-use-CC-instead-of-gcc-full-link-for-sta.patch b/package/ipmiutil/0001-configure.ac-use-CC-instead-of-gcc-full-link-for-sta.patch
deleted file mode 100644
index 07e37d4..0000000
--- a/package/ipmiutil/0001-configure.ac-use-CC-instead-of-gcc-full-link-for-sta.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 2909bfbc97559cf3e28c9045f64e3078aacca354 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 4 Apr 2015 17:59:32 +0200
-Subject: [PATCH] configure.ac: use CC instead of gcc, full link for stack
- protector test
-
-Using gcc directly is incorrect when cross-compiling, $CC should be
-used instead.
-
-Also, for the stack protector test, a full link is needed, since just
-the compilation can work, but the link can fail due to libssp not
-being available in the toolchain.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index c1193c6..61efbc5 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -308,7 +308,7 @@ else
- 	echo $ECHO_N "checking compile warning flags ... $ECHO_C"
- 	cfwarn="-Wno-pointer-sign -Wno-sign-conversion -Wunused-result -Wgnu-designator"
- 	echo "int main() { return(1); }" >$tmpc
--	gcc -o $tmpo -c $cfwarn $tmpc  >/dev/null 2>&1
-+	$CC -o $tmpo -c $cfwarn $tmpc  >/dev/null 2>&1
- 	if test $? -ne 0 ; then
- 	   cfwarn=
- 	   echo "skip"
-@@ -319,7 +319,7 @@ else
- 	echo $ECHO_N "checking compile fortify flags ... $ECHO_C"
- 	cfhard="-fstack-protector --param=ssp-buffer-size=4 -D_FORTIFY_SOURCE=2"
- 	echo "int main() { return(1); }" >$tmpc
--	gcc -o $tmpo -c $cfhard $tmpc  >/dev/null 2>&1
-+	$CC -o $tmpo $cfhard $tmpc  >/dev/null 2>&1
- 	if test $? -ne 0 ; then
- 	   cfhard=
- 	   echo "skip"
--- 
-2.1.0
-
diff --git a/package/ipmiutil/0002-no-build-doc.patch b/package/ipmiutil/0001-no-build-doc.patch
similarity index 78%
rename from package/ipmiutil/0002-no-build-doc.patch
rename to package/ipmiutil/0001-no-build-doc.patch
index f26d22e..ea7da97 100644
--- a/package/ipmiutil/0002-no-build-doc.patch
+++ b/package/ipmiutil/0001-no-build-doc.patch
@@ -7,10 +7,11 @@ Fixes:
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 
-diff -durN ipmiutil-2.9.5.orig/configure.ac ipmiutil-2.9.5/configure.ac
---- ipmiutil-2.9.5.orig/configure.ac	2015-04-06 12:23:01.020731749 +0200
-+++ ipmiutil-2.9.5/configure.ac	2015-04-06 12:24:31.181773510 +0200
-@@ -55,7 +55,7 @@
+diff --git a/configure.ac b/configure.ac
+index 344b27a71a35..41b6ea89167a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -56,7 +56,7 @@ LIB_DIR="/usr/lib"
  isredhat=0
  init_scripts="scripts/ipmi_port.sh scripts/ipmiutil_evt scripts/ipmiutil_asy scripts/ipmiutil_wdt"
  projdir=`pwd`
@@ -19,7 +20,7 @@ diff -durN ipmiutil-2.9.5.orig/configure.ac ipmiutil-2.9.5/configure.ac
  os=Linux
  
  # ltmain.sh, config.sub, et al should have been created, but check to be sure.
-@@ -161,7 +161,7 @@
+@@ -162,7 +162,7 @@ AC_ARG_ENABLE([standalone],
  	LANPLUS_SAM="no"
  	LD_SAMX=""
  	CFLAGS="-O2"
diff --git a/package/ipmiutil/0002-lib-Makefile.am-fix-lanplus-disable.patch b/package/ipmiutil/0002-lib-Makefile.am-fix-lanplus-disable.patch
new file mode 100644
index 0000000..35d1d67
--- /dev/null
+++ b/package/ipmiutil/0002-lib-Makefile.am-fix-lanplus-disable.patch
@@ -0,0 +1,38 @@
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 27 Oct 2015 14:23:44 +0200
+Subject: [PATCH] lib/Makefile.am: fix lanplus disable
+
+Protect the install target as well when lanplus is disabled. Fixes the
+following installation failure when openssl is missing:
+
+In file included from lanplus.c:78:0:
+./inc/ipmitool/ipmi.h:51:25: fatal error: openssl/evp.h: No such file or directory
+
+Patch status: sent upstream
+(http://sourceforge.net/p/ipmiutil/mailman/message/34572580/)
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+ lib/Makefile.am | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/lib/Makefile.am b/lib/Makefile.am
+index 805a218ab7eb..939594cfd3e5 100644
+--- a/lib/Makefile.am
++++ b/lib/Makefile.am
+@@ -51,8 +51,10 @@ distclean:
+ 	cd lanplus; make distclean
+ 	
+ install:
+-	$(MKDIR) ${datato}
+-	cd lanplus; make install
++	if [ "$(PLUSFLAGS)" = "-DHAVE_LANPLUS" ]; then \
++	  $(MKDIR) ${datato} ; \
++	  cd lanplus; make install ; \
++	fi
+ 
+ check:
+ 
+-- 
+2.6.1
+
diff --git a/package/ipmiutil/0003-really-disable-lanplus.patch b/package/ipmiutil/0003-really-disable-lanplus.patch
deleted file mode 100644
index 33dd249..0000000
--- a/package/ipmiutil/0003-really-disable-lanplus.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-lib: do not try to build lanplus if it is disabled
-
-If lanplus is disabled, we do not want to build it, especially when
-openssl is disabled, otherwise it fails to build with:
-
-    make[4]: Entering directory `/home/buildroot/build/instance-0/output/build/ipmiutil-2.9.5/lib/lanplus'
-    /home/buildroot/build/instance-0/output/host/usr/bin/i686-ctng-linux-gnu-gcc -DHAVE_CONFIG_H 
-    -I. -I../.. -I. -I./inc   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 
-    -DLINUX -DSKIP_MD2 -fPIC  -fstack-protector --param=ssp-buffer-size=4 -D_FORTIFY_SOURCE=2 -fPIC
-    -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os  -c -o lanplus.o lanplus.c
-    In file included from lanplus.c:78:0:
-    ./inc/ipmitool/ipmi.h:51:25: fatal error: openssl/evp.h: No such file or directory
-
-Sample build error visible at:
-    http://autobuild.buildroot.org/results/04a/04a1c48d484debd7894fd32997ed50d3a0110b93/build-end.log
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -durN ipmiutil-2.9.5.orig/configure.ac ipmiutil-2.9.5/configure.ac
---- ipmiutil-2.9.5.orig/configure.ac	2015-05-23 19:33:54.293468417 +0200
-+++ ipmiutil-2.9.5/configure.ac	2015-05-23 19:31:41.595877435 +0200
-@@ -474,6 +474,8 @@
- AC_SUBST(SHR_LINK)
- AC_SUBST(pkgconfigdir)
- 
-+AM_CONDITIONAL([LANPLUS], [test x$LANPLUS_SAM = xyes])
-+
- AC_OUTPUT(Makefile util/Makefile lib/Makefile lib/libipmiutil.pc lib/lanplus/Makefile doc/Makefile scripts/Makefile)
- 
- if test "x$sysname" = "xSunOS"; then
-diff -durN ipmiutil-2.9.5.orig/lib/lanplus/Makefile.am ipmiutil-2.9.5/lib/lanplus/Makefile.am
---- ipmiutil-2.9.5.orig/lib/lanplus/Makefile.am	2014-11-04 18:46:11.000000000 +0100
-+++ ipmiutil-2.9.5/lib/lanplus/Makefile.am	2015-05-23 19:32:30.956469461 +0200
-@@ -1,5 +1,7 @@
- #  Makefile.am for libipmi_lanplus.so and libipmi_lanplus.a
- 
-+if LANPLUS
-+
- ODIR 	= obj
- CFLAGS_STATIC  = @OS_CFLAGS@ -DSTATIC -fno-strict-aliasing -fPIC $(CFLAGS) 
- AM_CFLAGS  = @OS_CFLAGS@ -fPIC  @LANPLUS_CFLAGS@
-@@ -53,3 +55,4 @@
- #$(ODIR)/%.o:    %.c $(ODIR)
- #	$(CC) -c $(CFLAGS_STATIC) $(INCLUDES) -o $@ $<
- 
-+endif
-diff -durN ipmiutil-2.9.5.orig/lib/Makefile.am ipmiutil-2.9.5/lib/Makefile.am
---- ipmiutil-2.9.5.orig/lib/Makefile.am	2014-11-04 18:46:11.000000000 +0100
-+++ ipmiutil-2.9.5/lib/Makefile.am	2015-05-23 19:41:06.378636668 +0200
-@@ -32,28 +32,39 @@
- 	    else cp -f libipmiapi64.a.redhat  libipmiapi.a; fi \
-           else cp -f libipmiapi32.a libipmiapi.a; fi \
- 	fi
-+if LANPLUS
- 	cd lanplus; make clean; make  
- 	cp -f lanplus/libipmi_lanplus.a  .
-+endif # LANPLUS
- 
- clean:
- 	rm -f libipmiapi.a lib*_lanplus.a lib*_lanplus.so
-+if LANPLUS
- 	cd lanplus; make clean
-+endif # LANPLUS
- 
- clobber:
- 	rm -f libipmiapi.a lib*_lanplus.a  lib*_lanplus.so
-+if LANPLUS
- 	cd lanplus; make clean
-+endif # LANPLUS
- 	
- distclean:
- 	rm -f libipmiapi.a lib*.a  lib*_lanplus.so
-+if LANPLUS
- 	cd lanplus; make distclean
-+endif # LANPLUS
- 	
- install:
- 	$(MKDIR) ${datato}
-+if LANPLUS
- 	cd lanplus; make install
-+endif # LANPLUS
- 
- check:
- 
- installso:
-+if LANPLUS
- 	@if [ -d /usr/lib64 ]; then \
- 	$(MKDIR) ${lib64} ; \
- 	echo "installing libipmi_lanplus into ${lib64}"; \
-@@ -68,4 +79,5 @@
- 	(cd ${lib32} && rm -f libipmi_lanplus.* ); \
- 	../../libtool --finish ${lib64} \
- 	fi
-+endif # LANPLUS
- 	
diff --git a/package/ipmiutil/0004-avoid-wchar-t-redefinition.patch b/package/ipmiutil/0004-avoid-wchar-t-redefinition.patch
deleted file mode 100644
index 63a5927..0000000
--- a/package/ipmiutil/0004-avoid-wchar-t-redefinition.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Avoid wchar_t redefinition
-
-The musl C library does not define _WCHAR_T. Check also for compiler defined
-__WCHAR_TYPE__.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-
-diff -Nuar ipmiutil-2.9.5-orig/util/imb_api.h ipmiutil-2.9.5/util/imb_api.h
---- ipmiutil-2.9.5-orig/util/imb_api.h	2014-11-04 19:46:11.000000000 +0200
-+++ ipmiutil-2.9.5/util/imb_api.h	2015-09-29 07:49:40.799063825 +0300
-@@ -49,7 +49,7 @@
- /* DOS defines wchar_t in stdlib.h */
- #else 
-  // defined(LINUX) | defined(SOLARIS)
--#ifndef _WCHAR_T
-+#if !defined(_WCHAR_T) && !defined(__WCHAR_TYPE__)
- #define _WCHAR_T
- typedef long    wchar_t;
- #endif
diff --git a/package/ipmiutil/0005-add-missing-param.h-header-include.patch b/package/ipmiutil/0005-add-missing-param.h-header-include.patch
deleted file mode 100644
index 30bc47b..0000000
--- a/package/ipmiutil/0005-add-missing-param.h-header-include.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Add missing linux/param.h header include
-
-Fixes the following build failure under musl:
-
-mem_if.c: In function ???MapPhysicalMemory???:
-mem_if.c:337:36: error: ???EXEC_PAGESIZE??? undeclared (first use in this function)
-  ulDiff = (ULONG)(tdStartAddress % EXEC_PAGESIZE);
-                                    ^
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-
-diff -Nuar ipmiutil-2.9.5-orig/util/mem_if.c ipmiutil-2.9.5/util/mem_if.c
---- ipmiutil-2.9.5-orig/util/mem_if.c	2014-11-04 19:46:11.000000000 +0200
-+++ ipmiutil-2.9.5/util/mem_if.c	2015-09-29 08:08:31.800459775 +0300
-@@ -65,6 +65,9 @@
- #include <sys/param.h>
- #include <sys/mman.h>
- #include <sys/ioctl.h>
-+#ifdef __linux__
-+#include <linux/param.h>
-+#endif
- #endif
- #if defined(SOLARIS) || defined(BSD)
- #define EXEC_PAGESIZE     4096
diff --git a/package/ipmiutil/0006-add-missing-sys-select.h-include.patch b/package/ipmiutil/0006-add-missing-sys-select.h-include.patch
deleted file mode 100644
index a0cba20..0000000
--- a/package/ipmiutil/0006-add-missing-sys-select.h-include.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Add missing sys/select.h include
-
-POSIX.1-2001 requires sys/select.h for select(). Fixes the following build
-failure under musl:
-
-ipmimv.c: In function ???ipmicmd_mv???:
-ipmimv.c:345:5: error: unknown type name ???fd_set???
-     fd_set readfds;
-     ^
-ipmimv.c:346:20: error: storage size of ???tv??? isn???t known
-     struct timeval tv;
-                    ^
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-
-diff -Nuar ipmiutil-2.9.5-orig/util/ipmimv.c ipmiutil-2.9.5/util/ipmimv.c
---- ipmiutil-2.9.5-orig/util/ipmimv.c	2014-11-04 19:46:11.000000000 +0200
-+++ ipmiutil-2.9.5/util/ipmimv.c	2015-09-29 09:16:08.862828679 +0300
-@@ -62,6 +62,7 @@
- #include <time.h>
- #include <errno.h>
- #include <sys/ioctl.h>
-+#include <sys/select.h>
- #if defined(MACOS)
- #include <sys/time.h>
- #else
diff --git a/package/ipmiutil/ipmiutil.hash b/package/ipmiutil/ipmiutil.hash
index 2afc0f2..35a0bd3 100644
--- a/package/ipmiutil/ipmiutil.hash
+++ b/package/ipmiutil/ipmiutil.hash
@@ -1,2 +1,2 @@
 # From http://sourceforge.net/projects/ipmiutil/files/?source=navbar
-sha1	265f022c876da373b2ecb4be2bc0f98e65f70977	ipmiutil-2.9.5.tar.gz
+sha1	cc26d977afc87717812ef25aa02b2d5ab84843c4	ipmiutil-2.9.7.tar.gz
diff --git a/package/ipmiutil/ipmiutil.mk b/package/ipmiutil/ipmiutil.mk
index 4861c81..30d0f96 100644
--- a/package/ipmiutil/ipmiutil.mk
+++ b/package/ipmiutil/ipmiutil.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-IPMIUTIL_VERSION = 2.9.5
+IPMIUTIL_VERSION = 2.9.7
 IPMIUTIL_SITE = http://sourceforge.net/projects/ipmiutil/files
 IPMIUTIL_LICENSE = BSD-3c
 IPMIUTIL_LICENSE_FILES = COPYING
-# We're patching configure.ac , lib/Makefile.am and lib/lanplus/Makefile.am
+# We're patching configure.ac, lib/Makefile.am
 IPMIUTIL_AUTORECONF = YES
 
 IPMIUTIL_MAKE = $(MAKE1)
