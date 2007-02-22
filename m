From: Haavard Skinnemoen <hskinnemoen@atmel.com>
Date: Thu, 22 Feb 2007 18:35:43 +0100
Subject: [Buildroot] [PATCH] Fix missing/broken $(CONFIG_UPDATE) calls
Message-ID: <20070222183543.1af6a2ed@dhcp-252-105.norway.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch fixes a broken use of $(CONFIG_UPDATE) in bash.mk
(config.sub and config.guess is stored in the "support" subdirectory,
not directly under $(BASH_DIR)) and adds $(CONFIG_UPDATE) to
several other makefiles.

There are probably other cases that need to be fixed up as well,
but these are the ones that broke for me when compiling for AVR32
(which hasn't propagated out to config.sub in all the individual
packages yet.)

Hope you don't mind this `git' style patch. If you do, please let me
know.

Haavard
---
 package/bash/bash.mk           |    2 +-
 package/bison/bison.mk         |    1 +
 package/dropbear/dropbear.mk   |    1 +
 package/e2fsprogs/e2fsprogs.mk |    1 +
 package/file/file.mk           |    1 +
 package/flex/flex.mk           |    1 +
 package/gawk/gawk.mk           |    1 +
 package/libpng/libpng.mk       |    1 +
 package/make/make.mk           |    1 +
 package/nfs-utils/nfs-utils.mk |    1 +
 10 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index d115e8f..7528931 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -23,7 +23,7 @@ $(BASH_DIR)/.unpacked: $(DL_DIR)/$(BASH_SOURCE)
 	# This is broken when -lintl is added to LIBS
 	$(SED) 's,LIBS_FOR_BUILD =.*,LIBS_FOR_BUILD =,g' \
 		$(BASH_DIR)/builtins/Makefile.in
-	$(CONFIG_UPDATE) $(BASH_DIR)
+	$(CONFIG_UPDATE) $(BASH_DIR)/support
 	touch $@
 
 $(BASH_DIR)/.configured: $(BASH_DIR)/.unpacked
diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index 2185d20..4a6a350 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -18,6 +18,7 @@ bison-source: $(DL_DIR)/$(BISON_SOURCE)
 
 $(BISON_DIR)/.unpacked: $(DL_DIR)/$(BISON_SOURCE)
 	$(BISON_CAT) $(DL_DIR)/$(BISON_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(CONFIG_UPDATE) $(BISON_DIR)/build-aux
 	touch $(BISON_DIR)/.unpacked
 
 $(BISON_DIR)/.configured: $(BISON_DIR)/.unpacked
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 16da531..92c3813 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -20,6 +20,7 @@ $(DROPBEAR_DIR)/.unpacked: $(DL_DIR)/$(DROPBEAR_SOURCE)
 	$(DROPBEAR_CAT) $(DL_DIR)/$(DROPBEAR_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(DROPBEAR_DIR) package/dropbear/ dropbear\*.patch
 	$(SED) 's,^/\* #define DROPBEAR_MULTI.*,#define DROPBEAR_MULTI,g' $(DROPBEAR_DIR)/options.h
+	$(CONFIG_UPDATE) $(DROPBEAR_DIR)
 	touch $(DROPBEAR_DIR)/.unpacked
 
 $(DROPBEAR_DIR)/.configured: $(DROPBEAR_DIR)/.unpacked
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index deee42b..39d8bea 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -23,6 +23,7 @@ e2fsprogs-source: $(DL_DIR)/$(E2FSPROGS_SOURCE)
 $(E2FSPROGS_DIR)/.unpacked: $(DL_DIR)/$(E2FSPROGS_SOURCE)
 	$(E2FSPROGS_CAT) $(DL_DIR)/$(E2FSPROGS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(E2FSPROGS_DIR) package/e2fsprogs/ e2fsprogs\*.patch
+	$(CONFIG_UPDATE) $(E2FSPROGS_DIR)/config
 	touch $(E2FSPROGS_DIR)/.unpacked
 
 $(E2FSPROGS_DIR)/.configured: $(E2FSPROGS_DIR)/.unpacked
diff --git a/package/file/file.mk b/package/file/file.mk
index 3a499ac..c50be30 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -54,6 +54,7 @@ file-unpacked: $(FILE_SOURCE_DIR)/.unpacked
 $(FILE_SOURCE_DIR)/.unpacked: $(DL_DIR)/$(FILE_SOURCE)
 	$(FILE_CAT) $(DL_DIR)/$(FILE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(FILE_SOURCE_DIR) package/file/ file\*.patch
+	$(CONFIG_UPDATE) $(FILE_SOURCE_DIR)
 	touch $(FILE_SOURCE_DIR)/.unpacked
 
 $(FILE_DIR2)/.configured: $(FILE_SOURCE_DIR)/.unpacked
diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index 0445279..b58d404 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -29,6 +29,7 @@ ifneq ($(FLEX_PATCH),)
 		toolchain/patch-kernel.sh $(FLEX_DIR) $(FLEX_DIR)/debian/patches \*.patch ; \
 	fi
 endif
+	$(CONFIG_UPDATE) $(FLEX_DIR)
 	touch $@
 
 $(FLEX_DIR)/.configured: $(FLEX_DIR)/.unpacked
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index ae88f88..25a4ee6 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -19,6 +19,7 @@ gawk-source: $(DL_DIR)/$(GAWK_SOURCE)
 $(GAWK_DIR)/.unpacked: $(DL_DIR)/$(GAWK_SOURCE)
 	$(GAWK_CAT) $(DL_DIR)/$(GAWK_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(GAWK_DIR) package/gawk gawk\*.patch
+	$(CONFIG_UPDATE) $(GAWK_DIR)
 	touch $(GAWK_DIR)/.unpacked
 
 $(GAWK_DIR)/.configured: $(GAWK_DIR)/.unpacked
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 39ef8d5..7451d4b 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -34,6 +34,7 @@ libpng-source: $(DL_DIR)/$(LIBPNG_SOURCE)
 
 $(LIBPNG_DIR)/.unpacked: $(DL_DIR)/$(LIBPNG_SOURCE)
 	$(LIBPNG_CAT) $(DL_DIR)/$(LIBPNG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(CONFIG_UPDATE) $(LIBPNG_DIR)
 	touch $(LIBPNG_DIR)/.unpacked
 
 $(LIBPNG_DIR)/.configured: $(LIBPNG_DIR)/.unpacked
diff --git a/package/make/make.mk b/package/make/make.mk
index c568575..27ec0dc 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -18,6 +18,7 @@ make-source: $(DL_DIR)/$(GNUMAKE_SOURCE)
 
 $(GNUMAKE_DIR)/.unpacked: $(DL_DIR)/$(GNUMAKE_SOURCE)
 	$(GNUMAKE_CAT) $(DL_DIR)/$(GNUMAKE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(CONFIG_UPDATE) $(GNUMAKE_DIR)/config
 	touch $(GNUMAKE_DIR)/.unpacked
 
 $(GNUMAKE_DIR)/.configured: $(GNUMAKE_DIR)/.unpacked
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index ddfdca0..36cc523 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -27,6 +27,7 @@ $(NFS_UTILS_DIR)/.unpacked: $(DL_DIR)/$(NFS_UTILS_SOURCE)
 	$(NFS_UTILS_CAT) $(DL_DIR)/$(NFS_UTILS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(NFS_UTILS_DIR) package/nfs-utils/ nfs-utils*.patch
 	toolchain/patch-kernel.sh $(NFS_UTILS_DIR) $(NFS_UTILS_DIR)/debian/ *.patch
+	$(CONFIG_UPDATE) $(NFS_UTILS_DIR)
 	touch $@
 
 $(NFS_UTILS_DIR)/.configured: $(NFS_UTILS_DIR)/.unpacked
-- 
1.4.4.4
