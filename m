From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 31 Mar 2010 10:53:12 +0200
Subject: [Buildroot] [git commit master] toolchain: prepare for more than
	two alternatives
Message-ID: <20100331085412.2A39D20AEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=26b44b2b0272e7f51415942c72328e9a3dbe400a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Lay down the path to add more than two toolchain kinds:
- check the type of toolchain as:
    ifeq (toolchain_buildroot,y)
        blabla buildroot-specific
    else ifeq (toolchain_external,y)
        blabla external-specific
    endif

- prefer using positive checks, a-la:
    ifeq (foo,y)
  instead of:
    ifneq (bar,y)
  (where foo and bar are mutually exclusive)

- have the toolchain_buildroot case always appear first

- gettext is handled differently, because we want to add an option
  only if not using the buildroot toolchain, hence we use ifneq.

Signed-off-by: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Acked-By: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile                   |    6 +++---
 package/Makefile.in        |   11 +++++------
 package/gettext/gettext.mk |    2 +-
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index fed6e12..b746934 100644
--- a/Makefile
+++ b/Makefile
@@ -199,7 +199,7 @@ PREFERRED_LIB_FLAGS:=--enable-static --enable-shared
 ##############################################################
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 BASE_TARGETS:=uclibc-configured binutils cross_compiler uclibc-target-utils kernel-headers
-else
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 BASE_TARGETS:=uclibc
 endif
 TARGETS:=
@@ -301,7 +301,7 @@ include toolchain/kernel-headers/kernel-headers.mk
 include toolchain/mklibs/mklibs.mk
 include toolchain/sstrip/sstrip.mk
 include toolchain/uClibc/uclibc.mk
-else
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 include toolchain/*/*.mk
 endif
 
@@ -363,7 +363,7 @@ $(STAGING_DIR):
 ifeq ($(BR2_TOOLCHAIN_SYSROOT),y)
 	@mkdir -p $(STAGING_DIR)/usr/lib
 else
-ifneq ($(BR2_TOOLCHAIN_EXTERNAL),y)
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 	@ln -snf . $(STAGING_DIR)/usr
 	@mkdir -p $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)
 	@ln -snf ../lib $(STAGING_DIR)/usr/lib
diff --git a/package/Makefile.in b/package/Makefile.in
index 1e412a6..2bd3640 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -88,9 +88,8 @@ endif
 
 TARGET_CXXFLAGS=$(TARGET_CFLAGS)
 
-# else it's an external toolchain
 #########################################################################
-else
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) --sysroot $(STAGING_DIR)/
 TARGET_CXXFLAGS=$(TARGET_CFLAGS)
 TARGET_LDFLAGS=--sysroot $(STAGING_DIR)/
@@ -115,7 +114,7 @@ GNU_TARGET_NAME=$(OPTIMIZE_FOR_CPU)-linux
 REAL_GNU_TARGET_NAME=$(OPTIMIZE_FOR_CPU)$(GNU_TARGET_SUFFIX)
 TARGET_CROSS=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-
 KERNEL_CROSS=$(TARGET_CROSS)
-else
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 TOOLCHAIN_EXTERNAL_PREFIX:=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
 TOOLCHAIN_EXTERNAL_PATH:=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
 TOOLCHAIN_DIR=$(BASE_DIR)/toolchain
@@ -139,10 +138,10 @@ TARGET_NM=$(TARGET_CROSS)nm
 TARGET_RANLIB=$(TARGET_CROSS)ranlib
 TARGET_OBJCOPY=$(TARGET_CROSS)objcopy
 TARGET_OBJDUMP=$(TARGET_CROSS)objdump
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
-TARGET_LDCONFIG=/sbin/ldconfig
-else
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 TARGET_LDCONFIG=$(TARGET_CROSS)ldconfig
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
+TARGET_LDCONFIG=/sbin/ldconfig
 endif
 ifeq ($(BR2_STRIP_strip),y)
 STRIP_DISCARD_ALL:=--discard-all
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index dbc1f2c..81ab9de 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -29,7 +29,7 @@ $(GETTEXT_DIR)/.unpacked: $(DL_DIR)/$(GETTEXT_SOURCE)
 	$(CONFIG_UPDATE) $(GETTEXT_DIR)/build-aux
 	touch $@
 
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
+ifneq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 IGNORE_EXTERNAL_GETTEXT:=--with-included-gettext
 endif
 
-- 
1.6.3.3
