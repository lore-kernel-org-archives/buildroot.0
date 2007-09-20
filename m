From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 20 Sep 2007 10:27:02 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070920172702.5B7A83004A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-20 10:26:59 -0700 (Thu, 20 Sep 2007)
New Revision: 19918

Log:
- Reset flags, packages are usually built with -O2 otherwise.
  Packages that need to pass additional CFLAGS in their .mk have to do something
  like this: ...configure $(foreach i,$(foo_CFLAGS),CFLAGS+=$$i) --prefix=...


Modified:
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-09-20 17:08:46 UTC (rev 19917)
+++ trunk/buildroot/package/Makefile.in	2007-09-20 17:26:59 UTC (rev 19918)
@@ -136,6 +136,7 @@
 		GCC="$(TARGET_CROSS)gcc $(TARGET_CFLAGS)" \
 		CXX="$(TARGET_CROSS)g++ $(TARGET_CFLAGS)" \
 		CPP="$(TARGET_CROSS)cpp $(TARGET_CFLAGS)" \
+		CFLAGS="" CXXFLAGS="" FFLAGS="" \
 		RANLIB=$(TARGET_CROSS)ranlib \
 		STRIP=$(TARGET_CROSS)strip \
 		OBJCOPY=$(TARGET_CROSS)objcopy \
@@ -205,6 +206,18 @@
 BR2_AC_CV_C_BIGENDIAN=ac_cv_c_bigendian=no
 endif
 
+# Does malloc return live pointer for malloc(0) ?
+ifeq ($(MALLOC_GLIBC_COMPAT),y)
+BR2_AC_CV_FUNC_MALLOC_0_NONNULL=ac_cv_func_malloc_0_nonnull=yes \
+				gl_cv_func_malloc_0_nonnull=yes \
+				ac_cv_func_realloc_0_nonnull=yes
+else
+BR2_AC_CV_FUNC_MALLOC_0_NONNULL=ac_cv_func_malloc_0_nonnull=no \
+				gl_cv_func_malloc_0_nonnull=no \
+				ac_cv_func_realloc_0_nonnull=no
+endif
+
+
 TARGET_CONFIGURE_ARGS= \
 	$(BR2_AC_CV_TRAP_CHECK) \
 	ac_cv_func_mmap_fixed_mapped=yes \
