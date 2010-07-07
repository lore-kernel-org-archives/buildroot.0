From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  7 Jul 2010 08:21:03 +0200
Subject: [Buildroot] [PATCH 10/20] Rework sysroot option handling
In-Reply-To: <cover.1278483657.git.thomas.petazzoni@free-electrons.com>
References: <cover.1278483657.git.thomas.petazzoni@free-electrons.com>
Message-ID: <dc67c7f4dc3b3dbd0c71c2917373deab70f75b7a.1278483657.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The external toolchain and internal toolchain cases both need to use
the --sysroot option, and they have almost identical
LDFLAGS/CFLAGS/CXXFLAGS definition, so we can factorize these
definitions.

Moreover, the --isysroot option is implied by --sysroot so there's no
need to specify both.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in   |   16 +++-------------
 toolchain/Makefile.in |    2 --
 2 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 734af03..e4aa220 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -77,23 +77,13 @@ ifeq ($(BR2_LARGEFILE),y)
 TARGET_CFLAGS+=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 endif
 
-
-#########################################################################
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 TARGET_CFLAGS+=-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include
-TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
-TARGET_CXXFLAGS=$(TARGET_CFLAGS)
-TARGET_CFLAGS+= $(BR2_SYSROOT) $(BR2_ISYSROOT)
-TARGET_LDFLAGS+= $(BR2_SYSROOT)
+endif
 
-#########################################################################
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
-TARGET_CFLAGS+=--sysroot=$(STAGING_DIR)/
+TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib --sysroot=$(STAGING_DIR)
+TARGET_CFLAGS+=--sysroot=$(STAGING_DIR)
 TARGET_CXXFLAGS=$(TARGET_CFLAGS)
-TARGET_LDFLAGS=--sysroot=$(STAGING_DIR)/
-TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
-endif
-#########################################################################
 
 # Compute GNU_TARGET_NAME and REAL_GNU_TARGET_NAME
 GNU_TARGET_NAME=$(ARCH)-linux
diff --git a/toolchain/Makefile.in b/toolchain/Makefile.in
index 5d0e5a1..e5fae1f 100644
--- a/toolchain/Makefile.in
+++ b/toolchain/Makefile.in
@@ -15,8 +15,6 @@ BR2_SYSROOT_TARGET_DESTDIR=DESTDIR=$(TARGET_DIR)/
 BR2_CONFIGURE_DEVEL_SYSROOT=--with-sysroot=$(TOOLCHAIN_DIR)/uClibc_dev/
 BR2_CONFIGURE_STAGING_SYSROOT=--with-sysroot=$(STAGING_DIR)
 BR2_CONFIGURE_BUILD_TOOLS=--with-build-time-tools=$(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin
-BR2_SYSROOT=--sysroot=$(STAGING_DIR)/
-BR2_ISYSROOT=-isysroot $(STAGING_DIR)
 
 # gcc has a bunch of needed stuff....
 include toolchain/gcc/Makefile.in
-- 
1.7.0.4
