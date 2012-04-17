From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Apr 2012 16:45:26 +0200
Subject: [Buildroot] [PATCH 14/22] toolchain: remove useless indirect
	variables
In-Reply-To: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
References: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
Message-ID: <1488a586916d42731cac7ebb53dc6aff5dd35643.1334673910.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The BR2_CONFIGURE_DEVEL_SYSROOT, BR2_CONFIGURE_STAGING_SYSROOT and
BR2_CONFIGURE_BUILD_TOOLS were used only in a few places, and it is in
fact clearer to just use their value in the various places they are
used.

The ultimate goal is to get rid of the toolchain/Makefile.in file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/binutils.mk    |    2 +-
 toolchain/Makefile.in           |    4 ----
 toolchain/gcc/gcc-uclibc-4.x.mk |    8 ++++----
 3 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 8632d67..0a5a948 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -37,7 +37,7 @@ endif
 HOST_BINUTILS_CONF_OPT = --disable-multilib --disable-werror \
 			--target=$(REAL_GNU_TARGET_NAME) \
 			--disable-shared --enable-static \
-			$(BR2_CONFIGURE_STAGING_SYSROOT) \
+			--with-sysroot=$(STAGING_DIR) \
 			$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
 HOST_BINUTILS_DEPENDENCIES =
diff --git a/toolchain/Makefile.in b/toolchain/Makefile.in
index a7ca558..5f32f82 100644
--- a/toolchain/Makefile.in
+++ b/toolchain/Makefile.in
@@ -1,6 +1,2 @@
-BR2_CONFIGURE_DEVEL_SYSROOT=--with-sysroot=$(TOOLCHAIN_DIR)/uClibc_dev/
-BR2_CONFIGURE_STAGING_SYSROOT=--with-sysroot=$(STAGING_DIR)
-BR2_CONFIGURE_BUILD_TOOLS=--with-build-time-tools=$(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin
-
 # gcc has a bunch of needed stuff....
 include toolchain/gcc/Makefile.in
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index ae734e8..7cdba0e 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -223,7 +223,7 @@ $(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched
 		--host=$(GNU_HOST_NAME) \
 		--target=$(REAL_GNU_TARGET_NAME) \
 		--enable-languages=c \
-		$(BR2_CONFIGURE_DEVEL_SYSROOT) \
+		--with-sysroot=$(TOOLCHAIN_DIR)/uClibc_dev/ \
 		--disable-__cxa_atexit \
 		$(GCC_OPTSPACE) \
 		$(GCC_QUADMATH) \
@@ -291,7 +291,7 @@ $(GCC_BUILD_DIR2)/.configured: $(GCC_DIR)/.patched
 		--host=$(GNU_HOST_NAME) \
 		--target=$(REAL_GNU_TARGET_NAME) \
 		--enable-languages=c \
-		$(BR2_CONFIGURE_DEVEL_SYSROOT) \
+		--with-sysroot=$(TOOLCHAIN_DIR)/uClibc_dev/ \
 		--disable-__cxa_atexit \
 		$(GCC_OPTSPACE) \
 		$(GCC_QUADMATH) \
@@ -369,8 +369,8 @@ $(GCC_BUILD_DIR3)/.configured: $(GCC_SRC_DIR)/.patched $(GCC_STAGING_PREREQ)
 		--host=$(GNU_HOST_NAME) \
 		--target=$(REAL_GNU_TARGET_NAME) \
 		--enable-languages=$(GCC_CROSS_LANGUAGES) \
-		$(BR2_CONFIGURE_STAGING_SYSROOT) \
-		$(BR2_CONFIGURE_BUILD_TOOLS) \
+		--with-sysroot=$(STAGING_DIR) \
+		--with-build-time-tools=$(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin \
 		--disable-__cxa_atexit \
 		$(GCC_OPTSPACE) \
 		$(GCC_QUADMATH) \
-- 
1.7.4.1
