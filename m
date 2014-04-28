From: William Frost <tsmrnd0@gmail.com>
Date: Tue, 29 Apr 2014 08:58:14 +0900
Subject: [Buildroot] [PATCH v2] DCMTK: new package
Message-ID: <535EEB16.4090906@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It works fine but still every time I type "make all" in Buildroot dcmtk 
make the configure process again. Any idea on how to solve this?

Signed-off-by: William Frost <tsmrnd0@gmail.com>
---
Changes v1 -> v2:
   - fixed DCMTK_LICENSE to BDS
   - changed --host=$(arm-none-linux-gnueabi) to --host=$(GNU_TARGET_NAME)
   - fixed PKG_CONFIG_PATH and PKG_CONFIG_SYSROOT_DIR

  (suggested by Thomas De Schampheleire):
    - fixed all lines to less than 80 characters in Config.in ans dcmtk.mk
    - changed BR2_DCMTK_VERSION to  BR2_PACKAGE_DCMTK_VERSION
    - removed DCMTK_SOURCE
---
  package/Config.in       |  1 +
  package/dcmtk/Config.in | 38 ++++++++++++++++++++++
  package/dcmtk/dcmtk.mk  | 85 
+++++++++++++++++++++++++++++++++++++++++++++++++
  3 files changed, 124 insertions(+)
  create mode 100644 package/dcmtk/Config.in
  create mode 100644 package/dcmtk/dcmtk.mk

diff --git a/package/Config.in b/package/Config.in
index 07fd166..b88c0b0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -568,6 +568,7 @@ endmenu
  menu "Graphics"
  source "package/atk/Config.in"
  source "package/cairo/Config.in"
+source "package/dcmtk/Config.in"
  source "package/fltk/Config.in"
  source "package/fontconfig/Config.in"
  source "package/freetype/Config.in"
diff --git a/package/dcmtk/Config.in b/package/dcmtk/Config.in
new file mode 100644
index 0000000..ba9d2ee
--- /dev/null
+++ b/package/dcmtk/Config.in
@@ -0,0 +1,38 @@
+config BR2_PACKAGE_DCMTK
+    bool "dcmtk"
+    help
+      DCMTK is a collection of libraries and applications implementing
+      large parts the DICOM standard. It includes software for examining,
+      constructing and converting DICOM image files, handling offline
+      media, sending and receiving images over a network connection, as
+      well as demonstrative image storage and worklist servers. DCMTK is
+      is written in a mixture of ANSI C and C++. It comes in complete
+      source code and is made available as "open source" software.
+
+      http://dicom.offis.de/dcmtk.php.en
+
+if BR2_PACKAGE_DCMTK
+
+choice
+    prompt "DCMTK Version"
+    default BR2_PACKAGE_DCMTK_VERSION_3_6_0
+    help
+      Select the version of DCMTK you wish to use.
+
+    config BR2_PACKAGE_DCMTK_VERSION_3_6_0
+        bool "DCMTK 3.6.0"
+
+    config BR2_PACKAGE_DCMTK_VERSION_SNAPSHOT_2012
+        bool "DCMTK 3.6.1 snapshot (2012.11.02)"
+
+    config BR2_PACKAGE_DCMTK_VERSION_SNAPSHOT_2013
+        bool "DCMTK 3.6.1 snapshot (2013.11.14)"
+
+endchoice
+
+config BR2_PACKAGE_DCMTK_VERSION
+    string
+    default "3.6.0"    if BR2_PACKAGE_DCMTK_VERSION_3_6_0
+    default "3.6.1_20121102" if BR2_PACKAGE_DCMTK_VERSION_SNAPSHOT_2012
+    default "3.6.1_20131114" if BR2_PACKAGE_DCMTK_VERSION_SNAPSHOT_2013
+endif
diff --git a/package/dcmtk/dcmtk.mk b/package/dcmtk/dcmtk.mk
new file mode 100644
index 0000000..5c9a851
--- /dev/null
+++ b/package/dcmtk/dcmtk.mk
@@ -0,0 +1,85 @@
+################################################################################
+#
+# dcmtk
+#
+################################################################################
+DCMTK_VERSION = $(call qstrip,$(BR2_PACKAGE_DCMTK_VERSION))
+
+ifeq ($(BR2_PACKAGE_DCMTK_VERSION), "3.6.0")
+DCMTK_SITE = http://dicom.offis.de/download/dcmtk/dcmtk360/
+endif
+ifeq ($(BR2_PACKAGE_DCMTK_VERSION),"3.6.1_20121102")
+DCMTK_SITE = http://dicom.offis.de/download/dcmtk/snapshot/old
+endif
+ifeq ($(BR2_PACKAGE_DCMTK_VERSION),"3.6.1_20131114")
+DCMTK_SITE = http://dicom.offis.de/download/dcmtk/snapshot
+endif
+
+DCMTK_LICENSE = BSD
+DCMTK_LICENSE_FILES = COPYING
+DCMTK_INSTALL_STAGING = YES
+
+DCMTK_CFLAGS = $(TARGET_CFLAGS) --sysroot=$(STAGING_DIR) -O -D_REENTRANT \
+        -D_XOPEN_SOURCE_EXTENDED -D_XOPEN_SOURCE=500 -D_BSD_SOURCE \
+        -D_BSD_COMPAT -D_OSF_SOURCE -D_POSIX_C_SOURCE=199506L -Wall \
+        -Wno-psabi
+
+DCMTK_CXXFLAGS = $(TARGET_CFLAGS) --sysroot=$(STAGING_DIR) -O 
-D_REENTRANT \
+        -D_XOPEN_SOURCE_EXTENDED -D_XOPEN_SOURCE=500 -D_BSD_SOURCE \
+        -D_BSD_COMPAT -D_OSF_SOURCE -D_POSIX_C_SOURCE=199506L -Wall \
+        -Wno-psabi
+
+DCMTK_CPPFLAGS = $(TARGET_CFLAGS) --sysroot=$(STAGING_DIR)
+DCMTK_LDFLAGS = $(TARGET_CFLAGS) --sysroot=$(STAGING_DIR)
+
+DCMTK_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) STRIP=$(TARGET_STRIP) \
+                install
+
+DCMTK_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) STRIP=$(TARGET_STRIP) 
install
+
+DCMTK_CONF_OPT = --without-libtiff --without-openssl --without-libxml \
+          --without-libpng --without-libsndfile --disable-debug \
+          --without-private-tags --enable-std-includes --disable-rpath
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+    DCMTK_DEPENDENCIES += zlib
+else
+    DCMTK_CONF_OPT += --without-zlib
+endif
+VERBOSE=1
+
+define DCMTK_CONFIG_SET
+    $(CAT) $(@D)/config/Makefile.def | $(SED) 's%^$(1).*%$(1) = $(2)%g' \
+    $(@D)/config/Makefile.def
+endef
+
+define DCMTK_CONFIGURE_CMDS
+    (cd $(@D); \
+        CFLAGS="$(DCMTK_CFLAGS)" \
+        CXXFLAGS="$(DCMTK_CXXFLAGS)" \
+        CPPFLAGS="$(DCMTK_CPPFLAGS)" \
+        LDFLAGS="$(DCMTK_LDFLAGS)" \
+        ARFLAGS=cru \
+        CC=$(TARGET_CC) \
+        CXX=$(TARGET_CXX) \
+        RANLIB=$(TARGET_RANLIB) \
+        AR=$(TARGET_AR) \
+        STRIP=$(TARGET_STRIP) \
+        PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
+        PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
+        PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
+        MAKEFLAGS="$(MAKEFLAGS) -j$(PARALLEL_JOBS)" ./configure \
+        $(if $(VERBOSE),-verbose,-silent) \
+        $(DCMTK_CONF_OPT) \
+        ac_cv_my_c_rightshift_unsigned=no --prefix=$(STAGING_DIR)/usr \
+        --with-zlibinc=$(STAGING_DIR)/usr \
+        --host=$(GNU_TARGET_NAME) \
+    )
+endef
+
+define DCMTK_BUILD_CMDS
+    $(call DCMTK_CONFIG_SET,"CC =",$(TARGET_CC))
+    $(MAKE) -C $(@D) install-lib
+endef
+
+$(eval $(autotools-package))
-- 
1.8.1.4
