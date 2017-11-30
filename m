From: Keith Mok <ek9852@gmail.com>
Date: Thu, 30 Nov 2017 12:56:30 -0800
Subject: [Buildroot] [PATCH 1/2] android-tools: Enable build for ext4 fsutils
Message-ID: <20171130205631.93251-1-ek9852@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This enable the build for make_ext4fs, simg2img, etc.
For creating Android sparse ext4 files and extract tools (simg2img).

Signed-off-by: Keith Mok <ek9852@gmail.com>
---
 ...ke_ext4fs-makefiles-for-out-of-tree-build.patch | 53 ++++++++++++++++++++++
 package/android-tools/Config.in                    | 12 +++++
 package/android-tools/Config.in.host               |  6 +++
 package/android-tools/android-tools.mk             | 39 +++++++++++-----
 4 files changed, 99 insertions(+), 11 deletions(-)
 create mode 100644 package/android-tools/0008-Fix-make_ext4fs-makefiles-for-out-of-tree-build.patch

diff --git a/package/android-tools/0008-Fix-make_ext4fs-makefiles-for-out-of-tree-build.patch b/package/android-tools/0008-Fix-make_ext4fs-makefiles-for-out-of-tree-build.patch
new file mode 100644
index 0000000..ec68c25
--- /dev/null
+++ b/package/android-tools/0008-Fix-make_ext4fs-makefiles-for-out-of-tree-build.patch
@@ -0,0 +1,53 @@
+[PATCH] Fix make_ext4fs makefiles for out-of-tree build
+
+Signed-off-by: Keith Mok <keith@density.io>
+---
+ debian/makefiles/ext4_utils.mk | 11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/debian/makefiles/ext4_utils.mk b/debian/makefiles/ext4_utils.mk
+index cb64916..b56e27e 100644
+--- a/debian/makefiles/ext4_utils.mk
++++ b/debian/makefiles/ext4_utils.mk
+@@ -1,6 +1,7 @@
+ # Makefile for ext4_utils; based on https://heiher.info/2227.html
+ # Author: Dmitrijs Ledkovs <xnox@ubuntu.com>
+ 
++VPATH+= $(SRCDIR)/extras/ext4_utils
+ SRCS+=make_ext4fs.c
+ SRCS+=ext4fixup.c
+ SRCS+=ext4_utils.c
+@@ -13,7 +14,7 @@ SRCS+=sha1.c
+ SRCS+=wipe.c
+ SRCS+=crc16.c
+ 
+-VPATH+=../../core/libsparse
++VPATH+= $(SRCDIR)/core/libsparse
+ SRCS+= backed_block.c
+ SRCS+= sparse_crc32.c
+ SRCS+= sparse.c
+@@ -23,6 +24,7 @@ SRCS+= output_file.c
+ 
+ OBJS_SHARED:= $(SRCS:.c=.o)
+ 
++VPATH+= $(SRCDIR)/extras/ext4_utils
+ SRCS+=make_ext4fs_main.c
+ SRCS+=ext4fixup_main.c
+ SRCS+=setup_fs.c
+@@ -31,10 +33,9 @@ SRCS+=img2simg.c
+ SRCS+=simg2img.c
+ SRCS+=simg2simg.c
+ 
+-CPPFLAGS+= -I.
+-CPPFLAGS+= -I/usr/include
+-CPPFLAGS+= -I../../core/include
+-CPPFLAGS+= -I../../core/libsparse/include/
++CPPFLAGS+= -I$(SRCDIR)/core/include
++CPPFLAGS+= -I$(SRCDIR)/extras/ext4_utils/
++CPPFLAGS+= -I$(SRCDIR)/core/libsparse/include/
+ 
+ LIBS+= -lz -lselinux
+ 
+-- 
+2.13.6 (Apple Git-96)
+
diff --git a/package/android-tools/Config.in b/package/android-tools/Config.in
index 96e36e6..6697d45 100644
--- a/package/android-tools/Config.in
+++ b/package/android-tools/Config.in
@@ -75,6 +75,18 @@ config BR2_PACKAGE_ANDROID_TOOLS_ADBD
 	  target, which can be used to interact with a host machine
 	  implementing the ADB protocol.
 
+config BR2_PACKAGE_ANDROID_TOOLS_EXT4_UTILS
+	bool "ext4-utils"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libselinux
+	depends on !BR2_STATIC_LIBS # libselinux
+	depends on BR2_TOOLCHAIN_USES_GLIBC # libselinux
+	depends on !BR2_arc # libselinux
+	select BR2_PACKAGE_LIBSELINUX
+	select BR2_PACKAGE_ZLIB
+	help
+	  This option will build and install the ext4 utility for the
+	  host, which can be used to build sparse/extract ext4 image.
+
 endif
 
 comment "android-tools needs a toolchain w/ threads"
diff --git a/package/android-tools/Config.in.host b/package/android-tools/Config.in.host
index 993c4c9..a30b2d4 100644
--- a/package/android-tools/Config.in.host
+++ b/package/android-tools/Config.in.host
@@ -23,4 +23,10 @@ config BR2_PACKAGE_HOST_ANDROID_TOOLS_ADB
 	  host, which can be used to interact with target devices
 	  implementing the ADB protocol.
 
+config BR2_PACKAGE_HOST_ANDROID_TOOLS_EXT4_UTILS
+	bool "ext4-utils"
+	help
+	  This option will build and install the ext4 utility for the
+	  host, which can be used to build sparse/extract ext4 image.
+
 endif
diff --git a/package/android-tools/android-tools.mk b/package/android-tools/android-tools.mk
index f6c6913..01398de 100644
--- a/package/android-tools/android-tools.mk
+++ b/package/android-tools/android-tools.mk
@@ -31,54 +31,71 @@ HOST_ANDROID_TOOLS_PRE_PATCH_HOOKS += ANDROID_TOOLS_DEBIAN_PATCH
 ANDROID_TOOLS_PRE_PATCH_HOOKS += ANDROID_TOOLS_DEBIAN_PATCH
 
 ifeq ($(BR2_PACKAGE_HOST_ANDROID_TOOLS_FASTBOOT),y)
-HOST_ANDROID_TOOLS_TARGETS += fastboot
+HOST_ANDROID_TOOLS_BUILD_TARGETS += fastboot
+HOST_ANDROID_TOOLS_INSTALL_TARGETS += fastboot/fastboot
 HOST_ANDROID_TOOLS_DEPENDENCIES += host-zlib host-libselinux
 endif
 
 ifeq ($(BR2_PACKAGE_HOST_ANDROID_TOOLS_ADB),y)
-HOST_ANDROID_TOOLS_TARGETS += adb
+HOST_ANDROID_TOOLS_BUILD_TARGETS += adb
+HOST_ANDROID_TOOLS_INSTALL_TARGETS += adb/adb
 HOST_ANDROID_TOOLS_DEPENDENCIES += host-zlib host-openssl
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_ANDROID_TOOLS_EXT4_UTILS),y)
+HOST_ANDROID_TOOLS_BUILD_TARGETS += ext4_utils
+HOST_ANDROID_TOOLS_INSTALL_TARGETS += ext4_utils/ext2simg ext4_utils/ext4fixup ext4_utils/img2simg ext4_utils/make_ext4fs ext4_utils/simg2img ext4_utils/simg2simg
+HOST_ANDROID_TOOLS_DEPENDENCIES += host-zlib host-libselinux
+endif
+
 ifeq ($(BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT),y)
-ANDROID_TOOLS_TARGETS += fastboot
+ANDROID_TOOLS_BUILD_TARGETS += fastboot
+ANDROID_TOOLS_INSTALL_TARGETS += fastboot/fastboot
 ANDROID_TOOLS_DEPENDENCIES += zlib libselinux
 endif
 
 ifeq ($(BR2_PACKAGE_ANDROID_TOOLS_ADB),y)
-ANDROID_TOOLS_TARGETS += adb
+ANDROID_TOOLS_BUILD_TARGETS += adb
+ANDROID_TOOLS_INSTALL_TARGETS += adb/adb
 ANDROID_TOOLS_DEPENDENCIES += zlib openssl
 endif
 
 ifeq ($(BR2_PACKAGE_ANDROID_TOOLS_ADBD),y)
-ANDROID_TOOLS_TARGETS += adbd
+ANDROID_TOOLS_BUILD_TARGETS += adbd
+ANDROID_TOOLS_INSTALL_TARGETS += adbd/adbd
 ANDROID_TOOLS_DEPENDENCIES += zlib openssl
 endif
 
+ifeq ($(BR2_PACKAGE_ANDROID_TOOLS_EXT4_UTILS),y)
+ANDROID_TOOLS_BUILD_TARGETS += ext4_utils
+ANDROID_TOOLS_INSTALL_TARGETS += ext4_utils/ext2simg ext4_utils/ext4fixup ext4_utils/img2simg ext4_utils/make_ext4fs ext4_utils/simg2img ext4_utils/simg2simg
+ANDROID_TOOLS_DEPENDENCIES += zlib libselinux
+endif
+
 # Build each tool in its own directory not to share object files
 
 define HOST_ANDROID_TOOLS_BUILD_CMDS
-	$(foreach t,$(HOST_ANDROID_TOOLS_TARGETS),\
+	$(foreach t,$(HOST_ANDROID_TOOLS_BUILD_TARGETS),\
 		mkdir -p $(@D)/build-$(t) && \
 		$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) SRCDIR=$(@D) \
 			-C $(@D)/build-$(t) -f $(@D)/debian/makefiles/$(t).mk$(sep))
 endef
 
 define ANDROID_TOOLS_BUILD_CMDS
-	$(foreach t,$(ANDROID_TOOLS_TARGETS),\
+	$(foreach t,$(ANDROID_TOOLS_BUILD_TARGETS),\
 		mkdir -p $(@D)/build-$(t) && \
 		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) SRCDIR=$(@D) \
 			-C $(@D)/build-$(t) -f $(@D)/debian/makefiles/$(t).mk$(sep))
 endef
 
 define HOST_ANDROID_TOOLS_INSTALL_CMDS
-	$(foreach t,$(HOST_ANDROID_TOOLS_TARGETS),\
-		$(INSTALL) -D -m 0755 $(@D)/build-$(t)/$(t) $(HOST_DIR)/bin/$(t)$(sep))
+	$(foreach t,$(HOST_ANDROID_TOOLS_INSTALL_TARGETS),\
+		$(INSTALL) -D -m 0755 $(@D)/build-$(t) $(HOST_DIR)/bin/$(basename $(notdir $(t)))$(sep))
 endef
 
 define ANDROID_TOOLS_INSTALL_TARGET_CMDS
-	$(foreach t,$(ANDROID_TOOLS_TARGETS),\
-		$(INSTALL) -D -m 0755 $(@D)/build-$(t)/$(t) $(TARGET_DIR)/usr/bin/$(t)$(sep))
+	$(foreach t,$(ANDROID_TOOLS_INSTALL_TARGETS),\
+		$(INSTALL) -D -m 0755 $(@D)/build-$(t) $(TARGET_DIR)/usr/bin/$(basename $(notdir $(t)))$(sep))
 endef
 
 $(eval $(host-generic-package))
-- 
2.7.4
