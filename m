From: tpetazzoni at uclibc.org <tpetazzoni@uclibc.org>
Date: Tue, 11 Nov 2008 10:32:31 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20081111183231.E74AC3C989@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: tpetazzoni
Date: 2008-11-11 10:32:31 -0800 (Tue, 11 Nov 2008)
New Revision: 24000

Log:
Fix external toolchain build

This patch is a new version of a patch already sent several times on
the mailing-list, committed and reverted a few times by Daniel Laird,
due to several imperfections. This version is a new try at finding a
solution that works for everybody. Hopefully it'll work :-)

The original problem is that external toolchain builds failed because
packages couldn't find their dependent libraries at configure time and
could not be linked with them. To fix these two problems, two things
are added:

 * The TARGET_LDFLAGS variable was exposed as LDFLAGS at ./configure
   time thanks to TARGET_CONFIGURE_OPTS. The TARGET_LDFLAGS variable
   contains -L options with the path in the STAGING_DIR for the
   libraries. It allows ./configure scripts to properly compile the
   small test programs testing whether a dependency is properly
   installed.

 * The TARGET_CFLAGS contains a new -Wl,--rpath-link option for both
   $(STAGING_DIR)/lib and $(STAGING_DIR)/usr/lib. It allows library
   depending on other libraries to link properly. The TARGET_CFLAGS is
   exposed as CFLAGS in TARGET_CONFIGURE_OPTS.

This new version fixes a problem encountered by hartleys
<hartleys@visionengravers.com> when building the kernel. The problem
was that the -Wl,--rpath-link options were added to LDFLAGS, while
there are options for the C compiler, not the ld linker. Moving them
to CFLAGS seems to fix the issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>



Modified:
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2008-11-11 11:43:27 UTC (rev 23999)
+++ trunk/buildroot/package/Makefile.in	2008-11-11 18:32:31 UTC (rev 24000)
@@ -38,7 +38,8 @@
 #########################################################################
 ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
 TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) \
-	-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include
+	-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include \
+	-Wl,--rpath-link -Wl,$(STAGING_DIR)/lib -Wl,--rpath-link -Wl,$(STAGING_DIR)/usr/lib
 TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
 ifeq ($(BR2_TOOLCHAIN_SYSROOT),y)
 TARGET_CFLAGS+= $(BR2_SYSROOT) $(BR2_ISYSROOT)
@@ -89,7 +90,9 @@
 # else it's an external toolchain
 #########################################################################
 else
-TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) -I$(STAGING_DIR)/include -I$(STAGING_DIR)/usr/include -I$(TOOLCHAIN_EXTERNAL_PATH)/$(TOOLCHAIN_EXTERNAL_PREFIX)/include
+TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) \
+	-I$(STAGING_DIR)/include -I$(STAGING_DIR)/usr/include -I$(TOOLCHAIN_EXTERNAL_PATH)/$(TOOLCHAIN_EXTERNAL_PREFIX)/include \
+	 -Wl,--rpath-link -Wl,$(STAGING_DIR)/lib -Wl,--rpath-link -Wl,$(STAGING_DIR)/usr/lib
 TARGET_CXXFLAGS=$(TARGET_CFLAGS)
 TARGET_LDFLAGS=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
 endif
@@ -126,7 +129,8 @@
 #"))
 #TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(TOOLCHAIN_EXTERNAL_PREFIX)
 TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(ARCH)$(COND_ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)
-TARGET_PATH="$(STAGING_DIR)/bin:$(TOOL_BUILD_DIR)/bin:$(TOOLCHAIN_EXTERNAL_PATH)/bin:$(PATH)"
+# Make sure that STAGING_DIR/usr/bin is in path for freetype-config etc.
+TARGET_PATH="$(STAGING_DIR)/usr/bin:$(STAGING_DIR)/bin:$(TOOL_BUILD_DIR)/bin:$(TOOLCHAIN_EXTERNAL_PATH)/bin:$(PATH)"
 #IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(TOOLCHAIN_EXTERNAL_PREFIX)$(ROOTFS_SUFFIX)
 IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(ARCH)$(COND_ARCH_FPU_SUFFIX)$(ROOTFS_SUFFIX)
 
@@ -196,7 +200,9 @@
 TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
 		AR="$(TARGET_AR)" \
 		AS="$(TARGET_AS)" \
-		LD="$(TARGET_LD) $(TARGET_LDFLAGS)" \
+		LD="$(TARGET_LD)" \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
 		NM="$(TARGET_NM)" \
 		CC="$(TARGET_CC) $(TARGET_CFLAGS)" \
 		GCC="$(TARGET_CC) $(TARGET_CFLAGS)" \
