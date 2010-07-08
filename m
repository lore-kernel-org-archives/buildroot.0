From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jul 2010 13:57:12 +0200
Subject: [Buildroot] [git commit master 1/1] Cleanup TARGET_CONFIGURE_OPTS
Message-ID: <20100708115825.90A7D8269B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=efb1d8d3f40281645c178c150d992601c8042c1a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The definition of CC, LD, GCC, CPP, CXX and FC shouldn't contain the
CFLAGS/LDFLAGS/CXXFLAGS, those should be passed through the
appropriate variables.

However, the --sysroot option is a particular case here: it needs to
be part of the CC/LD/GCC/etc. definitions otherwise libtool strips it
from the CFLAGS/LDFLAGS.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in |   45 +++++++++++++++++++++++++--------------------
 1 files changed, 25 insertions(+), 20 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index e4aa220..0fc8deb 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -81,9 +81,9 @@ ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 TARGET_CFLAGS+=-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include
 endif
 
-TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib --sysroot=$(STAGING_DIR)
-TARGET_CFLAGS+=--sysroot=$(STAGING_DIR)
+TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
 TARGET_CXXFLAGS=$(TARGET_CFLAGS)
+TARGET_SYSROOT_OPT=--sysroot=$(STAGING_DIR)
 
 # Compute GNU_TARGET_NAME and REAL_GNU_TARGET_NAME
 GNU_TARGET_NAME=$(ARCH)-linux
@@ -113,22 +113,27 @@ TOOLCHAIN_EXTERNAL_PATH:=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
 TARGET_PATH="$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin/:$(TOOLCHAIN_DIR)/bin:$(TOOLCHAIN_EXTERNAL_PATH)/bin:$(PATH)"
 TARGET_CROSS=$(TOOLCHAIN_EXTERNAL_PATH)/bin/$(TOOLCHAIN_EXTERNAL_PREFIX)-
 endif
-TARGET_AR=$(TARGET_CROSS)ar
-TARGET_AS=$(TARGET_CROSS)as
-TARGET_CC=$(TARGET_CROSS)gcc
-TARGET_CPP=$(TARGET_CROSS)cpp
-TARGET_CXX=$(TARGET_CROSS)g++
-TARGET_FC=$(TARGET_CROSS)gfortran
-TARGET_LD=$(TARGET_CROSS)ld
-TARGET_NM=$(TARGET_CROSS)nm
-TARGET_RANLIB=$(TARGET_CROSS)ranlib
-TARGET_OBJCOPY=$(TARGET_CROSS)objcopy
-TARGET_OBJDUMP=$(TARGET_CROSS)objdump
+
+# Define TARGET_xx variables for all common binutils/gcc tools by
+# including the --sysroot option where necessary.
+TARGET_AR       = $(TARGET_CROSS)ar
+TARGET_AS       = $(TARGET_CROSS)as
+TARGET_CC       = $(TARGET_CROSS)gcc $(TARGET_SYSROOT_OPT)
+TARGET_CPP      = $(TARGET_CROSS)cpp $(TARGET_SYSROOT_OPT)
+TARGET_CXX      = $(TARGET_CROSS)g++ $(TARGET_SYSROOT_OPT)
+TARGET_FC       = $(TARGET_CROSS)gfortran $(TARGET_SYSROOT_OPT)
+TARGET_LD       = $(TARGET_CROSS)ld $(TARGET_SYSROOT_OPT)
+TARGET_NM       = $(TARGET_CROSS)nm
+TARGET_RANLIB   = $(TARGET_CROSS)ranlib
+TARGET_OBJCOPY  = $(TARGET_CROSS)objcopy
+TARGET_OBJDUMP  = $(TARGET_CROSS)objdump
+
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-TARGET_LDCONFIG=$(TARGET_CROSS)ldconfig
+TARGET_LDCONFIG = $(TARGET_CROSS)ldconfig
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
-TARGET_LDCONFIG=/sbin/ldconfig
+TARGET_LDCONFIG = /sbin/ldconfig
 endif
+
 ifeq ($(BR2_STRIP_strip),y)
 STRIP_DISCARD_ALL:=--discard-all
 STRIP_STRIP_UNNEEDED:=--strip-unneeded
@@ -169,11 +174,11 @@ TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
 		AS="$(TARGET_AS)" \
 		LD="$(TARGET_LD)" \
 		NM="$(TARGET_NM)" \
-		CC="$(TARGET_CC) $(TARGET_CFLAGS)" \
-		GCC="$(TARGET_CC) $(TARGET_CFLAGS)" \
-		CPP="$(TARGET_CPP) $(TARGET_CFLAGS)" \
-		CXX="$(TARGET_CXX) $(TARGET_CXXFLAGS)" \
-		FC="$(TARGET_FC) $(TARGET_FCFLAGS)" \
+		CC="$(TARGET_CC)" \
+		GCC="$(TARGET_CC)" \
+		CPP="$(TARGET_CPP)" \
+		CXX="$(TARGET_CXX)" \
+		FC="$(TARGET_FC)" \
 		RANLIB="$(TARGET_RANLIB)" \
 		STRIP="$(TARGET_STRIP)" \
 		OBJCOPY="$(TARGET_OBJCOPY)" \
-- 
1.7.1
