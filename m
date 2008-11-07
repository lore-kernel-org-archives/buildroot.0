From: laird at uclibc.org <laird@uclibc.org>
Date: Fri,  7 Nov 2008 00:15:54 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20081107081554.B32593C98B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2008-11-07 00:15:53 -0800 (Fri, 07 Nov 2008)
New Revision: 23954

Log:
package/Makefile.in: revert rpath setup for toolchains.

Revert the rpath patch, it looked good up until someone tried 
to build a kernel as well.  This seems to break as a result.

Will post a new patch soon and see how that goes.. 

Signed-off-by: Daniel Laird <daniel.j.laird@nxp.com>



Modified:
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2008-11-07 01:58:21 UTC (rev 23953)
+++ trunk/buildroot/package/Makefile.in	2008-11-07 08:15:53 UTC (rev 23954)
@@ -39,7 +39,7 @@
 ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
 TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) \
 	-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include
-TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib -Wl,--rpath-link -Wl,$(STAGING_DIR)/lib -Wl,--rpath-link -Wl,$(STAGING_DIR)/usr/lib
+TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
 ifeq ($(BR2_TOOLCHAIN_SYSROOT),y)
 TARGET_CFLAGS+= $(BR2_SYSROOT) $(BR2_ISYSROOT)
 TARGET_LDFLAGS+= $(BR2_SYSROOT)
@@ -91,7 +91,7 @@
 else
 TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) -I$(STAGING_DIR)/include -I$(STAGING_DIR)/usr/include -I$(TOOLCHAIN_EXTERNAL_PATH)/$(TOOLCHAIN_EXTERNAL_PREFIX)/include
 TARGET_CXXFLAGS=$(TARGET_CFLAGS)
-TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib -Wl,--rpath-link -Wl,$(STAGING_DIR)/lib -Wl,--rpath-link -Wl,$(STAGING_DIR)/usr/lib
+TARGET_LDFLAGS=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
 endif
 #########################################################################
 #ifeq ($(BR2_ROOTFS_SUFFIX),)
@@ -196,8 +196,7 @@
 TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
 		AR="$(TARGET_AR)" \
 		AS="$(TARGET_AS)" \
-		LD="$(TARGET_LD)" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
+		LD="$(TARGET_LD) $(TARGET_LDFLAGS)" \
 		NM="$(TARGET_NM)" \
 		CC="$(TARGET_CC) $(TARGET_CFLAGS)" \
 		GCC="$(TARGET_CC) $(TARGET_CFLAGS)" \
