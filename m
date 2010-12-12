From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Dec 2010 15:17:00 +0100
Subject: [Buildroot] [PATCH 04/14] toolchain: remove toolchain-specific
	stripping
In-Reply-To: <cover.1292163398.git.thomas.petazzoni@free-electrons.com>
References: <cover.1292163398.git.thomas.petazzoni@free-electrons.com>
Message-ID: <1fd847785df3843e906c143c04528f4f1fef0a77.1292163398.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We already handle the stripping of libraries in $(TARGET_DIR) at the
global level, so there's no need to have toolchain-specific option and
code for this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk                             |    9 ---------
 toolchain/toolchain-crosstool-ng/Config.in       |    6 ------
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    4 ++--
 toolchain/toolchain-external/Config.in           |    7 -------
 toolchain/toolchain-external/ext-tool.mk         |    4 ++--
 5 files changed, 4 insertions(+), 26 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 43c6db3..24f379d 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -15,13 +15,11 @@
 # $1: arch specific sysroot directory
 # $2: library name
 # $3: destination directory of the libary, relative to $(TARGET_DIR)
-# $4: strip (y|n), default is to strip
 #
 copy_toolchain_lib_root = \
 	ARCH_SYSROOT_DIR="$(strip $1)"; \
 	LIB="$(strip $2)"; \
 	DESTDIR="$(strip $3)" ; \
-	STRIP="$(strip $4)"; \
  \
 	LIBS=`(cd $${ARCH_SYSROOT_DIR}; \
 		find -L . -path "./lib/$${LIB}.*"     -o \
@@ -39,13 +37,6 @@ copy_toolchain_lib_root = \
 				cp -d $${FULLPATH} $(TARGET_DIR)/$${DESTDIR}/; \
 			elif test -f $${FULLPATH}; then \
 				$(INSTALL) -D -m0755 $${FULLPATH} $(TARGET_DIR)/$${DESTDIR}/$${LIB}; \
-				case "$${STRIP}" in \
-				(0 | n | no) \
-;; \
-				(*) \
-					$(TARGET_CROSS)strip "$(TARGET_DIR)/$${DESTDIR}/$${LIB}"; \
-;; \
-				esac; \
 			else \
 				exit -1; \
 			fi; \
diff --git a/toolchain/toolchain-crosstool-ng/Config.in b/toolchain/toolchain-crosstool-ng/Config.in
index 4f30588..4ee665d 100644
--- a/toolchain/toolchain-crosstool-ng/Config.in
+++ b/toolchain/toolchain-crosstool-ng/Config.in
@@ -98,10 +98,4 @@ config BR2_TOOLCHAIN_CTNG_uClibc_PROGRAM_INVOCATION
 
 endif # BR2_TOOLCHAIN_CTNG_uClibc
 
-config BR2_TOOLCHAIN_CTNG_STRIP_LIBS
-	bool "Strip libs copied to target"
-	default !BR2_STRIP_none
-	help
-	  Strip shared libraries copied from the toolchain.
-
 endif # BR2_TOOLCHAIN_CTNG
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 31797c4..1c5e864 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -65,10 +65,10 @@ $(STAMP_DIR)/ct-ng-toolchain-installed: $(STAMP_DIR)/ct-ng-toolchain-built
 	    echo "CTNG_SYSROOT='$${CTNG_SYSROOT}'";                         \
 	    echo "Copy external toolchain libraries to target...";          \
 	    for libs in $(CTNG_LIBS_LIB); do                                \
-	        $(call copy_toolchain_lib_root,$${CTNG_SYSROOT},$$libs,/lib,$(BR2_TOOLCHAIN_CTNG_STRIP_LIBS)); \
+	        $(call copy_toolchain_lib_root,$${CTNG_SYSROOT},$$libs,/lib); \
 	    done;                                                           \
 	    for libs in $(CTNG_LIBS_USR_LIB); do                            \
-	        $(call copy_toolchain_lib_root,$${CTNG_SYSROOT},$$libs,/usr/lib,$(BR2_TOOLCHAIN_CTNG_STRIP_LIBS)); \
+	        $(call copy_toolchain_lib_root,$${CTNG_SYSROOT},$$libs,/usr/lib); \
 	    done;                                                           \
 	    echo "Copy external toolchain sysroot to staging...";           \
 	    $(call copy_toolchain_sysroot,$${CTNG_SYSROOT},$${CTNG_SYSROOT},)
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index c2602d2..59fcb52 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -218,12 +218,5 @@ endif # BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
 
 endif # BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
-config BR2_TOOLCHAIN_EXTERNAL_STRIP
-	bool
-	default y
-	prompt "Strip shared libraries"
-	help
-	  Strip shared libraries copied from the external toolchain.
-
 endif # BR2_TOOLCHAIN_EXTERNAL
 
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 7a17914..71aa127 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -184,10 +184,10 @@ $(STAMP_DIR)/ext-toolchain-installed: $(TOOLCHAIN_EXTERNAL_DEPENDENCIES)
 	mkdir -p $(TARGET_DIR)/lib ; \
 	echo "Copy external toolchain libraries to target..." ; \
 	for libs in $(LIB_EXTERNAL_LIBS); do \
-	 	$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$$libs,/lib,$(BR2_TOOLCHAIN_EXTERNAL_STRIP)); \
+	 	$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$$libs,/lib); \
 	done ; \
 	for libs in $(USR_LIB_EXTERNAL_LIBS); do \
-	 	$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$$libs,/usr/lib,$(BR2_TOOLCHAIN_EXTERNAL_STRIP)); \
+	 	$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$$libs,/usr/lib); \
 	done ; \
 	echo "Copy external toolchain sysroot to staging..." ; \
 	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR}) ; \
-- 
1.7.0.4
