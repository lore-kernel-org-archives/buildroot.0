From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Mar 2012 20:26:38 +0100
Subject: [Buildroot] [git commit] external-toolchain: run checks even on
	extracted toolchains
Message-ID: <20120306223952.1937790D16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3367d5ce770ac409e7b3f5bba2c7ed1a819b3ef7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the mechanism that allows Buildroot to download external
toolchains automatically was added, all the sanity checks on the
external toolchains were not performed. This commit re-enables those
checks that we already do on external toolchains that are not
downloaded/extracted by Buildroot. This makes the toolchain checks
more consistent accross various configurations.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/ext-tool.mk |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 132aacd..8132caa 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -170,8 +170,6 @@ endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
 TOOLCHAIN_EXTERNAL_DEPENDENCIES = $(TOOLCHAIN_EXTERNAL_DIR)/.extracted
-else
-TOOLCHAIN_EXTERNAL_DEPENDENCIES = $(STAMP_DIR)/ext-toolchain-checked
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q3),y)
@@ -284,7 +282,7 @@ endif
 # location, check that it supports sysroot, and then verify that it
 # matches the configuration provided in Buildroot: ABI, C++ support,
 # type of C library and all C library features.
-$(STAMP_DIR)/ext-toolchain-checked:
+$(STAMP_DIR)/ext-toolchain-checked: $(TOOLCHAIN_EXTERNAL_DEPENDENCIES)
 	@echo "Checking external toolchain settings"
 	$(Q)$(call check_cross_compiler_exists,$(TOOLCHAIN_EXTERNAL_CC))
 	$(Q)LIBC_A_LOCATION=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) -print-file-name=libc.a)` ; \
@@ -343,7 +341,7 @@ $(STAMP_DIR)/ext-toolchain-checked:
 #                       multilib variant compared to the main sysroot.
 #			Ex: mips16/soft-float/el
 
-$(STAMP_DIR)/ext-toolchain-installed: $(TOOLCHAIN_EXTERNAL_DEPENDENCIES)
+$(STAMP_DIR)/ext-toolchain-installed: $(STAMP_DIR)/ext-toolchain-checked
 	$(Q)LIBC_A_LOCATION=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) -print-file-name=libc.a)` ; \
 	SYSROOT_DIR=`echo $${LIBC_A_LOCATION} | sed -r -e 's:usr/lib(64)?/libc\.a::'` ; \
 	if test -z "$${SYSROOT_DIR}" ; then \
