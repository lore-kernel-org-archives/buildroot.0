From: Lars Munch <lars@segv.dk>
Date: Tue, 31 Oct 2006 14:58:23 +0100
Subject: [Buildroot] libgcc_s still missing
Message-ID: <20061031135823.GA15326@tuxedo.home.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

The BR2_GCC_SHARED_LIBGCC fix does not fix all BR2_GCC_SHARED_LIBGCC
related issues.

buildroot/toolchain/gcc/gcc-uclibc-3.x.mk:
------------------------------------------------------------------------
r16442 | jacmet | 2006-10-26 17:15:08 +0200 (Thu, 26 Oct 2006) | 1 line

Fix missing libgcc_s.so.1 with BR2_GCC_SHARED_LIBGCC
------------------------------------------------------------------------

If I delete my build_ARCH/root directory and run "make", the library
files libgcc_s* are missing again.

The attached patch makes sure that libgcc_s.so.1 and friends always gets
installed in TARGET_DIR.

Regards
Lars Munch


-------------- next part --------------
Index: buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	(revision 16475)
+++ buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	(working copy)
@@ -250,6 +250,9 @@
 	#
 	# Ok... that's enough of that.
 	#
+	touch $(GCC_BUILD_DIR2)/.installed
+
+gcc-target-libs: $(GCC_BUILD_DIR2)/.installed
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
 	# These are in /lib, so...
 	rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
@@ -266,10 +269,9 @@
 	-cp -a $(STAGING_DIR)/usr/lib/security/libgcj.security $(TARGET_DIR)/usr/lib/security/
 	-cp -a $(STAGING_DIR)/usr/lib/security/classpath.security $(TARGET_DIR)/usr/lib/security/
 endif
-	touch $(GCC_BUILD_DIR2)/.installed
 
 gcc: uclibc-configured binutils gcc_initial $(LIBFLOAT_TARGET) uclibc \
-	$(GCC_BUILD_DIR2)/.installed $(GCC_TARGETS)
+	$(GCC_BUILD_DIR2)/.installed gcc-target-libs $(GCC_TARGETS)
 
 gcc-source: $(DL_DIR)/$(GCC_SOURCE)
 
