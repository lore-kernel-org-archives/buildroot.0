From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 29 Sep 2007 10:32:59 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070929173259.431383003F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-29 10:32:58 -0700 (Sat, 29 Sep 2007)
New Revision: 20117

Log:
Use linke to build-time-tools, disable libssp which does not work for cross-compile

Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-09-29 16:38:58 UTC (rev 20116)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-09-29 17:32:58 UTC (rev 20117)
@@ -252,8 +252,8 @@
 		--enable-languages=$(GCC_CROSS_LANGUAGES) \
 		--disable-__cxa_atexit \
 		--enable-target-optspace \
-		--with-gnu-ld \
-		--with-as=$(TARGET_CROSS)as \
+		--with-build-time-tools=$(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/bin \
+		--disable-libssp \
 		$(GCC_WITH_HOST_GMP) \
 		$(GCC_WITH_HOST_MPFR) \
 		$(GCC_SHARED_LIBGCC) \
@@ -355,13 +355,14 @@
 	touch $@
 
 cross_compiler:=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc
-cross_compiler gcc: uclibc-configured binutils gcc_initial \
-	$(LIBFLOAT_TARGET) uclibc \
-	$(GCC_BUILD_DIR2)/.installed $(GCC_BUILD_DIR2)/.libs_installed \
+cross_compiler gcc: gcc-config $(GCC_BUILD_DIR2)/.installed $(GCC_BUILD_DIR2)/.libs_installed \
 	$(GCC_TARGETS)
 
 gcc-source: $(DL_DIR)/$(GCC_SOURCE)
 
+gcc-config:uclibc-configured binutils gcc_initial $(LIBFLOAT_TARGET) \
+	uclibc $(GCC_BUILD_DIR2)/.configured
+
 gcc-clean:
 	rm -rf $(GCC_BUILD_DIR2)
 	for prog in cpp gcc gcc-[0-9]* protoize unprotoize gcov gccbug cc; do \
