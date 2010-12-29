From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 29 Dec 2010 09:14:15 +0100
Subject: [Buildroot] [git commit master 1/1] toolchain: move sysroot to host
	dir
Message-ID: <20101229081558.60D4E81F53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=87b81bb56f45f3bb903c085f0745775e140e2154
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Drop the BR2_STAGING_DIR option
* Hardcode STAGING_DIR to $(HOST_DIR)/usr/TUPLE/sysroot

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in           |   13 ------------
 Makefile            |    2 -
 package/Makefile.in |   54 ++++++++++++++++++++++++++------------------------
 3 files changed, 28 insertions(+), 41 deletions(-)

diff --git a/Config.in b/Config.in
index ff77449..df0c7ce 100644
--- a/Config.in
+++ b/Config.in
@@ -72,19 +72,6 @@ config BR2_DL_DIR
 
 	  The default is $(TOPDIR)/dl
 
-config BR2_STAGING_DIR
-	string "Toolchain and header file location?"
-	default "$(BASE_DIR)/staging"
-	help
-	  This is the location where the toolchain will be installed.  The
-	  toolchain will not work if it is moved from this location.
-	  Therefore, if you wish to package up a uClibc toolchain, it is
-	  important that is is set to the final location where the toolchain
-	  will be used.
-
-	  Most people will leave this set to the default value of
-	  "$(BASE_DIR)/staging".
-
 menu "Mirrors and Download locations"
 
 config BR2_PRIMARY_SITE
diff --git a/Makefile b/Makefile
index f6ab07e..9ba80a6 100644
--- a/Makefile
+++ b/Makefile
@@ -268,8 +268,6 @@ TAR_OPTIONS=$(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 
 GNU_TARGET_SUFFIX:=-$(call qstrip,$(BR2_GNU_TARGET_SUFFIX))
 
-STAGING_DIR:=$(call qstrip,$(BR2_STAGING_DIR))
-
 # packages compiled for the host goes here
 HOST_DIR:=$(BASE_DIR)/host
 
diff --git a/package/Makefile.in b/package/Makefile.in
index 3fa98fe..9765a1a 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -9,6 +9,34 @@ HOSTMAKE :=$(shell which $(HOSTMAKE) || type -p $(HOSTMAKE) || echo make)
 MAKE1:=$(HOSTMAKE) -j1
 MAKE:=$(HOSTMAKE) -j$(BR2_JLEVEL)
 
+# Compute GNU_TARGET_NAME and REAL_GNU_TARGET_NAME
+GNU_TARGET_NAME=$(ARCH)-linux
+
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
+LIBC=uclibc
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
+LIBC=uclibc
+else
+LIBC=gnu
+endif
+
+# The ABI suffix is a bit special on ARM, as it needs to be
+# -uclibcgnueabi for uClibc EABI, -uclibc for uClibc OABI, -gnueabi
+# for glibc EABI and -gnu for glibc OABI. This means that the LIBC and
+# ABI aren't strictly orthogonal, which explains why we need the test
+# on LIBC below.
+ifeq ($(BR2_ARM_EABI),y)
+ifeq ($(LIBC),uclibc)
+ABI=gnueabi
+else
+ABI=eabi
+endif
+endif
+
+REAL_GNU_TARGET_NAME=$(ARCH)-unknown-linux-$(LIBC)$(ABI)
+
+STAGING_DIR=$(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/sysroot
+
 ifeq ($(BR2_OPTIMIZE_0),y)
 TARGET_OPTIMIZATION+=-O0
 endif
@@ -85,32 +113,6 @@ TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
 TARGET_CXXFLAGS=$(TARGET_CFLAGS)
 TARGET_SYSROOT_OPT=--sysroot=$(STAGING_DIR)
 
-# Compute GNU_TARGET_NAME and REAL_GNU_TARGET_NAME
-GNU_TARGET_NAME=$(ARCH)-linux
-
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-LIBC=uclibc
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
-LIBC=uclibc
-else
-LIBC=gnu
-endif
-
-# The ABI suffix is a bit special on ARM, as it needs to be
-# -uclibcgnueabi for uClibc EABI, -uclibc for uClibc OABI, -gnueabi
-# for glibc EABI and -gnu for glibc OABI. This means that the LIBC and
-# ABI aren't strictly orthogonal, which explains why we need the test
-# on LIBC below.
-ifeq ($(BR2_ARM_EABI),y)
-ifeq ($(LIBC),uclibc)
-ABI=gnueabi
-else
-ABI=eabi
-endif
-endif
-
-REAL_GNU_TARGET_NAME=$(ARCH)-unknown-linux-$(LIBC)$(ABI)
-
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 TARGET_CROSS=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
-- 
1.7.2.2
