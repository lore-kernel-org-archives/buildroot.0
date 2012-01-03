From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  3 Jan 2012 21:22:54 +0100
Subject: [Buildroot] [PATCH 13/14] external-toolchain: run checks even on
	extracted toolchains
In-Reply-To: <cover.1325622133.git.thomas.petazzoni@free-electrons.com>
References: <cover.1325622133.git.thomas.petazzoni@free-electrons.com>
Message-ID: <1a9cee1d4590f98629d83151a5e18ae30c78b9ba.1325622133.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the mechanism that allows Buildroot to download external
toolchains automatically was added, all the sanity checks on the
external toolchains were not performed. This commit re-enables those
checks that we already do on external toolchains that are not
downloaded/extracted by Buildroot. This makes the toolchain checks
more consistent accross various configurations.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/ext-tool.mk |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 16135ed..4f7a567 100644
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
 	LIBC_A_LOCATION=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) -print-file-name=libc.a)` ; \
@@ -343,8 +341,8 @@ $(STAMP_DIR)/ext-toolchain-checked:
 #                       multilib variant compared to the main sysroot.
 #			Ex: mips16/soft-float/el
 
-$(STAMP_DIR)/ext-toolchain-installed: $(TOOLCHAIN_EXTERNAL_DEPENDENCIES)
-	LIBC_A_LOCATION=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) -print-file-name=libc.a)` ; \
+$(STAMP_DIR)/ext-toolchain-installed: $(STAMP_DIR)/ext-toolchain-checked
+	@LIBC_A_LOCATION=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) -print-file-name=libc.a)` ; \
 	SYSROOT_DIR=`echo $${LIBC_A_LOCATION} | sed -r -e 's:usr/lib(64)?/libc\.a::'` ; \
 	if test -z "$${SYSROOT_DIR}" ; then \
 		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
-- 
1.7.4.1
