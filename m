From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Jul 2010 08:01:00 +0200
Subject: [Buildroot] [git commit master 1/1] ext-toolchain: Fix ARCH_SYSROOT
	detection
Message-ID: <20100706060217.8BB71825FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=07d15f907bfc8737abc69cfb11ce30c88e9bb5c2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For the detection of the ARCH_SYSROOT_DIR (which contains the C
library variant specific to the compiler flags), we used to pass only
the -march argument instead of the full TARGET_CFLAGS. This was done
because TARGET_CFLAGS contains --sysroot, and we don't want to tell
here the compiler which sysroot to use, because we're specifically
asking the compiler where the *normal* arch sysroot directory is.

Unfortunately, there are some multilib variants that aren't decided
only based on -march, but also on -msoft-float or other compiler
flags. Therefore, we take the opposite approach: pass the full
TARGET_CFLAGS, from which we have stripped the --sysroot option.

For example, this allows a PowerPC CodeSourcery toolchain, on which
we're using the soft-float multilib variant, to work properly as an
external toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in                      |    4 ++--
 toolchain/external-toolchain/ext-tool.mk |   18 +++++++++---------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 92b5710..5147dc8 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -88,9 +88,9 @@ TARGET_LDFLAGS+= $(BR2_SYSROOT)
 
 #########################################################################
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
-TARGET_CFLAGS+=--sysroot $(STAGING_DIR)/
+TARGET_CFLAGS+=--sysroot=$(STAGING_DIR)/
 TARGET_CXXFLAGS=$(TARGET_CFLAGS)
-TARGET_LDFLAGS=--sysroot $(STAGING_DIR)/
+TARGET_LDFLAGS=--sysroot=$(STAGING_DIR)/
 TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
 endif
 #########################################################################
diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index 3943ceb..b1eee23 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -270,9 +270,10 @@ endif # ! no threads
 # SYSROOT_DIR selection. We first try the -print-sysroot option,
 # available in gcc 4.4.x and in some Codesourcery toolchains. If this
 # option is not available, we fallback to the value of --with-sysroot
-# as visible in CROSS-gcc -v. We don't pass the -march= option to gcc
-# as we want the "main" sysroot, which contains all variants of the C
-# library in the case of multilib toolchains.
+# as visible in CROSS-gcc -v. We don't pass any option to gcc that
+# could select a multilib variant as we want the "main" sysroot, which
+# contains all variants of the C library in the case of multilib
+# toolchains.
 SYSROOT_DIR=$(shell $(TARGET_CC) -print-sysroot 2>/dev/null)
 ifeq ($(SYSROOT_DIR),)
 SYSROOT_DIR=$(shell readlink -f $$(LANG=C $(TARGET_CC) -print-file-name=libc.a |sed -r -e 's:usr/lib/libc\.a::;'))
@@ -281,15 +282,14 @@ endif
 # Now, find if the toolchain specifies a sub-directory for the
 # specific architecture variant we're interested in. This is the case
 # with multilib toolchain, when the selected architecture variant is
-# not the default one. To do so, we ask the compiler by passing the
-# appropriate -march= flags. ARCH_SUBDIR will contain the
+# not the default one. To do so, we ask the compiler by passing all
+# flags, except the --sysroot flag since we want to the compiler to
+# tell us where its original sysroot is. ARCH_SUBDIR will contain the
 # subdirectory, in the main SYSROOT_DIR, that corresponds to the
 # selected architecture variant. ARCH_SYSROOT_DIR will contain the
 # full path to this location.
-ifneq ($(CC_TARGET_ARCH_),)
-TARGET_CC_ARCH_CFLAGS+=-march=$(CC_TARGET_ARCH_)
-endif
-ARCH_SUBDIR=$(shell $(TARGET_CC) $(TARGET_CC_ARCH_CFLAGS) -print-multi-directory)
+TARGET_CFLAGS_NO_SYSROOT=$(filter-out --sysroot=%,$(TARGET_CFLAGS))
+ARCH_SUBDIR=$(shell $(TARGET_CC) $(TARGET_CFLAGS_NO_SYSROOT) -print-multi-directory)
 ARCH_SYSROOT_DIR=$(SYSROOT_DIR)/$(ARCH_SUBDIR)
 
 $(STAMP_DIR)/ext-toolchain-installed:
-- 
1.7.1
