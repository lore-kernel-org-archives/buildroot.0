From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 23:02:21 +0200
Subject: [Buildroot] [PATCH 1/3] binutils,gcc: use correct --prefix
In-Reply-To: <cover.1280264418.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280264418.git.thomas.petazzoni@free-electrons.com>
Message-ID: <2ae84ac85ff72a861e8c276ba4e650e1e9ba7982.1280264418.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The cross binutils and cross gcc are actually going to be executed
from $(STAGING_DIR)/usr, so the correct prefix is $(STAGING_DIR)/usr
and not /usr.

This also fixes what is known as the "AVR32 toolchain build failure",
which was due to the fact that the prefix directory wasn't writable
(since it was /usr).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/binutils/binutils.mk  |    6 ++----
 toolchain/gcc/gcc-uclibc-4.x.mk |    4 ++--
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/toolchain/binutils/binutils.mk b/toolchain/binutils/binutils.mk
index 68ac3e9..93dbbb0 100644
--- a/toolchain/binutils/binutils.mk
+++ b/toolchain/binutils/binutils.mk
@@ -67,12 +67,10 @@ $(BINUTILS_DIR1)/.configured: $(BINUTILS_DIR)/.patched
 	(cd $(BINUTILS_DIR1); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		$(BINUTILS_DIR)/configure $(QUIET) \
-		--prefix=/usr \
+		--prefix=$(STAGING_DIR)/usr \
 		--build=$(GNU_HOST_NAME) \
 		--host=$(GNU_HOST_NAME) \
 		--target=$(REAL_GNU_TARGET_NAME) \
-		--mandir=/usr/share/man \
-		--infodir=/usr/share/info \
 		$(BR2_CONFIGURE_DEVEL_SYSROOT) \
 		$(BR2_CONFIGURE_STAGING_SYSROOT) \
 		$(DISABLE_NLS) \
@@ -90,7 +88,7 @@ $(BINUTILS_DIR1)/binutils/objdump: $(BINUTILS_DIR1)/.configured
 # Make install will put gettext data in staging_dir/share/locale.
 # Unfortunatey, it isn't configureable.
 $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-ld: $(BINUTILS_DIR1)/binutils/objdump
-	$(MAKE) -C $(BINUTILS_DIR1) $(BR2_SYSROOT_STAGING_DESTDIR) install
+	$(MAKE) -C $(BINUTILS_DIR1) install
 	#	tooldir=/usr build_tooldir=/usr install
 	#rm -f $(STAGING_DIR)/usr/bin/{ar,as,ld,nm,objdump,ranlib,strip}
 
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 6e767ac..0a538de 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -266,7 +266,7 @@ $(GCC_BUILD_DIR2)/.configured: $(GCC_SRC_DIR)/.patched $(GCC_STAGING_PREREQ)
 	(cd $(GCC_BUILD_DIR2); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		$(GCC_SRC_DIR)/configure $(QUIET) \
-		--prefix=/usr \
+		--prefix=$(STAGING_DIR)/usr \
 		--build=$(GNU_HOST_NAME) \
 		--host=$(GNU_HOST_NAME) \
 		--target=$(REAL_GNU_TARGET_NAME) \
@@ -299,7 +299,7 @@ $(GCC_BUILD_DIR2)/.compiled: $(GCC_BUILD_DIR2)/.configured
 	touch $@
 
 $(GCC_BUILD_DIR2)/.installed: $(GCC_BUILD_DIR2)/.compiled
-	PATH=$(TARGET_PATH) $(MAKE) $(BR2_SYSROOT_STAGING_DESTDIR) \
+	PATH=$(TARGET_PATH) $(MAKE) \
 		-C $(GCC_BUILD_DIR2) install
 	if [ -d "$(STAGING_DIR)/lib64" ]; then \
 		if [ ! -e "$(STAGING_DIR)/lib" ]; then \
-- 
1.7.0.4
