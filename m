From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 30 Jan 2009 13:34:36 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20090130133436.EDEB0765E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-30 13:34:35 +0000 (Fri, 30 Jan 2009)
New Revision: 25165

Log:
toolchain/gcc: remove unused gcc 3.x cruft from 4.x makefile (sysroot)

Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2009-01-30 11:35:04 UTC (rev 25164)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2009-01-30 13:34:35 UTC (rev 25165)
@@ -56,9 +56,6 @@
 GCC_STRIP_HOST_BINARIES:=nope
 GCC_SRC_DIR:=$(GCC_DIR)
 
-ifeq ($(findstring x3.,x$(GCC_VERSION)),x3.)
-GCC_NO_MPFR:=y
-endif
 ifeq ($(findstring x4.0.,x$(GCC_VERSION)),x4.0.)
 GCC_NO_MPFR:=y
 endif
@@ -335,27 +332,7 @@
 			$(GNU_TARGET_NAME)$${app##$(REAL_GNU_TARGET_NAME)}; \
 		done; \
 	)
-	#
-	# Now for the ugly 3.3.x soft float hack...
-	#
-ifeq ($(BR2_SOFT_FLOAT),y)
-ifeq ($(findstring x3.3.,x$(GCC_VERSION)),x3.3.)
-	# Make sure we have a soft float specs file for this arch
-	if [ ! -f toolchain/gcc/$(GCC_VERSION)/specs-$(ARCH)-soft-float ]; then \
-		echo soft float configured but no specs file for this arch; \
-		/bin/false; \
-	fi
-	# Replace specs file with one that defaults to soft float mode.
-	if [ ! -f $(STAGING_DIR)/lib/gcc-lib/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)/specs ]; then \
-		echo staging dir specs file is missing; \
-		/bin/false; \
-	fi
-	cp toolchain/gcc/$(GCC_VERSION)/specs-$(ARCH)-soft-float $(STAGING_DIR)/lib/gcc-lib/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)/specs
-endif
-endif
-	#
-	# Ok... that's enough of that.
-	#
+
 	mkdir -p $(TARGET_DIR)/usr/lib $(TARGET_DIR)/usr/sbin
 	touch $@
 
@@ -456,11 +433,7 @@
 #
 # gcc-lib dir changes names to gcc with 3.4.mumble
 #
-ifeq ($(findstring x3.4.,x$(GCC_VERSION)),x3.4.)
-GCC_LIB_SUBDIR=lib/gcc/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)
-else
 GCC_LIB_SUBDIR=lib/gcc-lib/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)
-endif
 # sigh... we need to find a better way
 ifeq ($(findstring x4.0.,x$(GCC_VERSION)),x4.0.)
 GCC_LIB_SUBDIR=lib/gcc/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)
@@ -487,20 +460,7 @@
 		$(MAKE1) -C $(GCC_BUILD_DIR3) install
 	# Remove broken specs file (cross compile flag is set).
 	rm -f $(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR)/specs
-	#
-	# Now for the ugly 3.3.x soft float hack...
-	#
-ifeq ($(BR2_SOFT_FLOAT),y)
-ifeq ($(findstring x3.3.,x$(GCC_VERSION)),x3.3.)
-	# Add a specs file that defaults to soft float mode.
-	cp toolchain/gcc/$(GCC_VERSION)/specs-$(ARCH)-soft-float $(TARGET_DIR)/usr/lib/gcc-lib/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)/specs
-	# Make sure gcc does not think we are cross compiling
-	$(SED) "s/^1/0/;" $(TARGET_DIR)/usr/lib/gcc-lib/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)/specs
-endif
-endif
-	#
-	# Ok... that's enough of that.
-	#
+
 	-(cd $(TARGET_DIR)/bin && find -type f | xargs $(STRIPCMD) > /dev/null 2>&1)
 	-(cd $(TARGET_DIR)/usr/bin && find -type f | xargs $(STRIPCMD) > /dev/null 2>&1)
 	-(cd $(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR) && $(STRIPCMD) cc1 cc1plus collect2 > /dev/null 2>&1)
