From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  2 May 2011 15:16:41 -0300
Subject: [Buildroot] [PATCHv2] toolchain/gcc: add openmp support option
Message-ID: <1304360201-16074-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add OpenMP support in gcc as an option instead of dynamically enabling
it when threads are present.
Also fix it up since we never installed libgomp to the target or staging
thus it was never really functional.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/gcc/Config.in         |    6 ++++++
 toolchain/gcc/gcc-uclibc-4.x.mk |   17 ++++++++++++++++-
 2 files changed, 22 insertions(+), 1 deletions(-)

diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index fcdcc19..437b86b 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -109,3 +109,9 @@ config BR2_GCC_ENABLE_TLS
 	help
 	  Enable the compiler to generate code for accessing
 	  thread local storage variables
+
+config BR2_GCC_ENABLE_OPENMP
+	bool "Enable compiler OpenMP support"
+	depends on !BR2_PTHREADS_NONE && !BR2_avr32
+	help
+	  Enable OpenMP support for the compiler
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 568aa1a..9b8bf68 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -147,6 +147,12 @@ else
 GCC_SHARED_LIBGCC:=--disable-shared
 endif
 
+ifeq ($(BR2_GCC_ENABLE_OPENMP),y)
+GCC_ENABLE_OPENMP:=--enable-libgomp
+else
+GCC_ENABLE_OPENMP:=--disable-libgomp
+endif
+
 ifeq ($(BR2_GCC_ENABLE_TLS),y)
 GCC_TLS:=--enable-tls
 else
@@ -154,7 +160,7 @@ GCC_TLS:=--disable-tls
 endif
 
 ifeq ($(BR2_PTHREADS_NONE),y)
-THREADS:=--disable-threads --disable-libgomp
+THREADS:=--disable-threads
 else
 THREADS:=--enable-threads
 endif
@@ -234,6 +240,7 @@ $(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched
 		--disable-__cxa_atexit \
 		$(GCC_OPTSPACE) \
 		$(GCC_QUADMATH) \
+		$(GCC_ENABLE_OPENMP) \
 		--with-gnu-ld \
 		--disable-shared \
 		--disable-libssp \
@@ -301,6 +308,7 @@ $(GCC_BUILD_DIR2)/.configured: $(GCC_DIR)/.patched
 		--disable-__cxa_atexit \
 		$(GCC_OPTSPACE) \
 		$(GCC_QUADMATH) \
+		$(GCC_ENABLE_OPENMP) \
 		--with-gnu-ld \
 		--enable-shared \
 		--disable-libssp \
@@ -379,6 +387,7 @@ $(GCC_BUILD_DIR3)/.configured: $(GCC_SRC_DIR)/.patched $(GCC_STAGING_PREREQ)
 		--disable-__cxa_atexit \
 		$(GCC_OPTSPACE) \
 		$(GCC_QUADMATH) \
+		$(GCC_ENABLE_OPENMP) \
 		--with-gnu-ld \
 		--disable-libssp \
 		--disable-multilib \
@@ -470,6 +479,11 @@ ifeq ($(BR2_INSTALL_LIBGCJ),y)
 		$(TARGET_DIR)/usr/lib/security/
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libgcj.so*
 endif
+ifeq ($(BR2_GCC_ENABLE_OPENMP),y)
+	cp -dpf $(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib*/libgomp.so* $(STAGING_DIR)/usr/lib/
+	cp -dpf $(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib*/libgomp.so* $(TARGET_DIR)/usr/lib/
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libgomp.so*
+endif
 	mkdir -p $(@D)
 	touch $@
 
@@ -523,6 +537,7 @@ $(GCC_BUILD_DIR4)/.configured: $(GCC_BUILD_DIR4)/.prepared
 		--disable-__cxa_atexit \
 		$(GCC_OPTSPACE) \
 		$(GCC_QUADMATH) \
+		$(GCC_ENABLE_OPENMP) \
 		--with-gnu-ld \
 		--disable-libssp \
 		--disable-multilib \
-- 
1.7.3.4
