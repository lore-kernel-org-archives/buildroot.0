From: Thierry Bultel <thierry.bultel@wanadoo.fr>
Date: Thu, 20 Sep 2012 17:22:29 +0200
Subject: [Buildroot] [PATCH] Enables thread debugging with full gdb on target
In-Reply-To: <20120920144226.70dd0e27@skate>
References: <505A397B.80404@mind.be>
 <zarafa.505b004f.74f2.799ed96c0a00510d@jacal.basystemes.fr>
 <20120920144226.70dd0e27@skate>
Message-ID: <505B34B5.2050503@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libthread_db was not copied on target
GDB needs libpthread to be not stripped

Signed-off-by: Thierry Bultel <thierry.bultel@wanadoo.fr>
diff -Naur buildroot-2012.08.orig/Makefile buildroot-2012.08/Makefile
--- buildroot-2012.08.orig/Makefile	2012-08-31 10:49:41.000000000 +0200
+++ buildroot-2012.08/Makefile	2012-09-20 16:42:11.938021804 +0200
@@ -416,6 +416,10 @@
  
  $(TARGET_DIR): $(BUILD_DIR)/.root
  
+ifeq ($(BR2_PACKAGE_GDB),y)
+BR2_STRIP_EXCLUDE_FILES += libpthread*.so*
+endif
+
  STRIP_FIND_CMD = find $(TARGET_DIR)
  ifneq (,$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS)))
  STRIP_FIND_CMD += \( $(call finddirclauses,$(TARGET_DIR),$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS))) \) -prune -o
diff -Naur buildroot-2012.08.orig/toolchain/toolchain-crosstool-ng/crosstool-ng.mk buildroot-2012.08/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
--- buildroot-2012.08.orig/toolchain/toolchain-crosstool-ng/crosstool-ng.mk	2012-08-31 10:49:41.000000000 +0200
+++ buildroot-2012.08/toolchain/toolchain-crosstool-ng/crosstool-ng.mk	2012-09-20 16:41:46.741771907 +0200
@@ -41,6 +41,18 @@
  CTNG_LIBS_LIB := ld*.so libc.so libcrypt.so libdl.so libgcc_s.so libm.so    \
                   libnsl.so libpthread.so libresolv.so librt.so libutil.so
  
+ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
+CTNG_LIBS_LIB_THREAD_DB_NEEDED := y
+endif
+
+ifeq ($(BR2_PACKAGE_GDB),y)
+CTNG_LIBS_LIB_THREAD_DB_NEEDED := y
+endif
+
+ifeq ($(CTNG_LIBS_LIB_THREAD_DB_NEEDED),y)
+CTNG_LIBS_LIB += libthread_db.so
+endif
+
  #--------------
  # The libc-specific system libraries (in /lib)
  # Note: it may be needed to tweak the NSS libs in the glibc and eglibc cases...
