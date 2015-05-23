From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 May 2015 19:56:21 +0200
Subject: [Buildroot] [PATCH] package/ipmiutil: really disable lanplus
Message-ID: <1432403781-11670-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Due to weird constructs in the Makefiles, lanplus is always built, even
when explicitly disabled with --disable-lanplus .

So, add a patch to enforce disabling lanplus. We're doing an at-minima
patch just for the upcoming Buildroot release, and to avoid diverging
too far from upstream...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Romain Naour <romain.naour@openwide.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ipmiutil/0003-really-disable-lanplus.patch | 95 ++++++++++++++++++++++
 package/ipmiutil/ipmiutil.mk                       |  2 +-
 2 files changed, 96 insertions(+), 1 deletion(-)
 create mode 100644 package/ipmiutil/0003-really-disable-lanplus.patch

diff --git a/package/ipmiutil/0003-really-disable-lanplus.patch b/package/ipmiutil/0003-really-disable-lanplus.patch
new file mode 100644
index 0000000..33dd249
--- /dev/null
+++ b/package/ipmiutil/0003-really-disable-lanplus.patch
@@ -0,0 +1,95 @@
+lib: do not try to build lanplus if it is disabled
+
+If lanplus is disabled, we do not want to build it, especially when
+openssl is disabled, otherwise it fails to build with:
+
+    make[4]: Entering directory `/home/buildroot/build/instance-0/output/build/ipmiutil-2.9.5/lib/lanplus'
+    /home/buildroot/build/instance-0/output/host/usr/bin/i686-ctng-linux-gnu-gcc -DHAVE_CONFIG_H 
+    -I. -I../.. -I. -I./inc   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 
+    -DLINUX -DSKIP_MD2 -fPIC  -fstack-protector --param=ssp-buffer-size=4 -D_FORTIFY_SOURCE=2 -fPIC
+    -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os  -c -o lanplus.o lanplus.c
+    In file included from lanplus.c:78:0:
+    ./inc/ipmitool/ipmi.h:51:25: fatal error: openssl/evp.h: No such file or directory
+
+Sample build error visible at:
+    http://autobuild.buildroot.org/results/04a/04a1c48d484debd7894fd32997ed50d3a0110b93/build-end.log
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN ipmiutil-2.9.5.orig/configure.ac ipmiutil-2.9.5/configure.ac
+--- ipmiutil-2.9.5.orig/configure.ac	2015-05-23 19:33:54.293468417 +0200
++++ ipmiutil-2.9.5/configure.ac	2015-05-23 19:31:41.595877435 +0200
+@@ -474,6 +474,8 @@
+ AC_SUBST(SHR_LINK)
+ AC_SUBST(pkgconfigdir)
+ 
++AM_CONDITIONAL([LANPLUS], [test x$LANPLUS_SAM = xyes])
++
+ AC_OUTPUT(Makefile util/Makefile lib/Makefile lib/libipmiutil.pc lib/lanplus/Makefile doc/Makefile scripts/Makefile)
+ 
+ if test "x$sysname" = "xSunOS"; then
+diff -durN ipmiutil-2.9.5.orig/lib/lanplus/Makefile.am ipmiutil-2.9.5/lib/lanplus/Makefile.am
+--- ipmiutil-2.9.5.orig/lib/lanplus/Makefile.am	2014-11-04 18:46:11.000000000 +0100
++++ ipmiutil-2.9.5/lib/lanplus/Makefile.am	2015-05-23 19:32:30.956469461 +0200
+@@ -1,5 +1,7 @@
+ #  Makefile.am for libipmi_lanplus.so and libipmi_lanplus.a
+ 
++if LANPLUS
++
+ ODIR 	= obj
+ CFLAGS_STATIC  = @OS_CFLAGS@ -DSTATIC -fno-strict-aliasing -fPIC $(CFLAGS) 
+ AM_CFLAGS  = @OS_CFLAGS@ -fPIC  @LANPLUS_CFLAGS@
+@@ -53,3 +55,4 @@
+ #$(ODIR)/%.o:    %.c $(ODIR)
+ #	$(CC) -c $(CFLAGS_STATIC) $(INCLUDES) -o $@ $<
+ 
++endif
+diff -durN ipmiutil-2.9.5.orig/lib/Makefile.am ipmiutil-2.9.5/lib/Makefile.am
+--- ipmiutil-2.9.5.orig/lib/Makefile.am	2014-11-04 18:46:11.000000000 +0100
++++ ipmiutil-2.9.5/lib/Makefile.am	2015-05-23 19:41:06.378636668 +0200
+@@ -32,28 +32,39 @@
+ 	    else cp -f libipmiapi64.a.redhat  libipmiapi.a; fi \
+           else cp -f libipmiapi32.a libipmiapi.a; fi \
+ 	fi
++if LANPLUS
+ 	cd lanplus; make clean; make  
+ 	cp -f lanplus/libipmi_lanplus.a  .
++endif # LANPLUS
+ 
+ clean:
+ 	rm -f libipmiapi.a lib*_lanplus.a lib*_lanplus.so
++if LANPLUS
+ 	cd lanplus; make clean
++endif # LANPLUS
+ 
+ clobber:
+ 	rm -f libipmiapi.a lib*_lanplus.a  lib*_lanplus.so
++if LANPLUS
+ 	cd lanplus; make clean
++endif # LANPLUS
+ 	
+ distclean:
+ 	rm -f libipmiapi.a lib*.a  lib*_lanplus.so
++if LANPLUS
+ 	cd lanplus; make distclean
++endif # LANPLUS
+ 	
+ install:
+ 	$(MKDIR) ${datato}
++if LANPLUS
+ 	cd lanplus; make install
++endif # LANPLUS
+ 
+ check:
+ 
+ installso:
++if LANPLUS
+ 	@if [ -d /usr/lib64 ]; then \
+ 	$(MKDIR) ${lib64} ; \
+ 	echo "installing libipmi_lanplus into ${lib64}"; \
+@@ -68,4 +79,5 @@
+ 	(cd ${lib32} && rm -f libipmi_lanplus.* ); \
+ 	../../libtool --finish ${lib64} \
+ 	fi
++endif # LANPLUS
+ 	
diff --git a/package/ipmiutil/ipmiutil.mk b/package/ipmiutil/ipmiutil.mk
index 736e430..6f462b9 100644
--- a/package/ipmiutil/ipmiutil.mk
+++ b/package/ipmiutil/ipmiutil.mk
@@ -8,7 +8,7 @@ IPMIUTIL_VERSION = 2.9.5
 IPMIUTIL_SITE = http://sourceforge.net/projects/ipmiutil/files/
 IPMIUTIL_LICENSE = BSD-3c
 IPMIUTIL_LICENSE_FILES = COPYING
-# We're patching configure.ac
+# We're patching configure.ac , lib/Makefile.am and lib/lanplus/Makefile.am
 IPMIUTIL_AUTORECONF = YES
 
 IPMIUTIL_MAKE = $(MAKE1)
-- 
1.9.1
