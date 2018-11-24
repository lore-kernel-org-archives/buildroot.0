From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 10:29:26 +0100
Subject: [Buildroot] [git commit] package/android-tools: add option to build
 ext4 utils for the host
Message-ID: <20181202071558.7B56682855@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=567928e5ada28552cfa9c228aba4f275df05008e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds an option to build and install the ext4_utils for the
host, i.e. make_ext4fs, ext4fixup, ext2simg, img2simg, simg2img and
simg2simg.

Signed-off-by: Alex Kaplan <kaplan2539@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Thomas:
 - simplify a bit the installation logic by using a single
   HOST_ANDROID_TOOLS_INSTALL_TARGETS variable, instead of having one
   specific for ext4 tools
 - drop "default n" from Config.in.host]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...akefiles-for-out-of-tree-ext4_utils-build.patch | 48 ++++++++++++++++++++++
 package/android-tools/Config.in.host               |  7 ++++
 package/android-tools/android-tools.mk             | 19 ++++++---
 3 files changed, 69 insertions(+), 5 deletions(-)

diff --git a/package/android-tools/0009-Fix-makefiles-for-out-of-tree-ext4_utils-build.patch b/package/android-tools/0009-Fix-makefiles-for-out-of-tree-ext4_utils-build.patch
new file mode 100644
index 0000000000..80ea1ec1fe
--- /dev/null
+++ b/package/android-tools/0009-Fix-makefiles-for-out-of-tree-ext4_utils-build.patch
@@ -0,0 +1,48 @@
+From d24abbec201975a5eb7f8589614cfb424b8c80b6 Mon Sep 17 00:00:00 2001
+From: Alex Kaplan <kaplan2539@gmail.com>
+Date: Sat, 10 Nov 2018 19:50:51 -0800
+Subject: [PATCH] Fix makefiles for out-of-tree ext4_utils build
+
+Signed-off-by: Alex Kaplan <kaplan2539@gmail.com>
+---
+ debian/makefiles/ext4_utils.mk | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/debian/makefiles/ext4_utils.mk b/debian/makefiles/ext4_utils.mk
+index cb64916..c5904bf 100644
+--- a/debian/makefiles/ext4_utils.mk
++++ b/debian/makefiles/ext4_utils.mk
+@@ -1,6 +1,7 @@
+ # Makefile for ext4_utils; based on https://heiher.info/2227.html
+ # Author: Dmitrijs Ledkovs <xnox@ubuntu.com>
+ 
++VPATH+=$(SRCDIR)/extras/ext4_utils
+ SRCS+=make_ext4fs.c
+ SRCS+=ext4fixup.c
+ SRCS+=ext4_utils.c
+@@ -13,7 +14,7 @@ SRCS+=sha1.c
+ SRCS+=wipe.c
+ SRCS+=crc16.c
+ 
+-VPATH+=../../core/libsparse
++VPATH+=$(SRCDIR)/core/libsparse
+ SRCS+= backed_block.c
+ SRCS+= sparse_crc32.c
+ SRCS+= sparse.c
+@@ -31,10 +32,9 @@ SRCS+=img2simg.c
+ SRCS+=simg2img.c
+ SRCS+=simg2simg.c
+ 
+-CPPFLAGS+= -I.
+-CPPFLAGS+= -I/usr/include
+-CPPFLAGS+= -I../../core/include
+-CPPFLAGS+= -I../../core/libsparse/include/
++CPPFLAGS+= -I$(SRCDIR)
++CPPFLAGS+= -I$(SRCDIR)/core/include
++CPPFLAGS+= -I$(SRCDIR)/core/libsparse/include/
+ 
+ LIBS+= -lz -lselinux
+ 
+-- 
+2.7.4
+
diff --git a/package/android-tools/Config.in.host b/package/android-tools/Config.in.host
index 993c4c9fdc..433f4e384f 100644
--- a/package/android-tools/Config.in.host
+++ b/package/android-tools/Config.in.host
@@ -23,4 +23,11 @@ config BR2_PACKAGE_HOST_ANDROID_TOOLS_ADB
 	  host, which can be used to interact with target devices
 	  implementing the ADB protocol.
 
+config BR2_PACKAGE_HOST_ANDROID_TOOLS_EXT4_UTILS
+	bool "ext4 utils"
+	help
+	  This option will build and install the ext4 utils for the
+	  host, i.e. make_ext4fs, ext4fixup, ext2simg, img2simg,
+	  simg2img and simg2simg.
+
 endif
diff --git a/package/android-tools/android-tools.mk b/package/android-tools/android-tools.mk
index 879d788e3a..6f6ca7729b 100644
--- a/package/android-tools/android-tools.mk
+++ b/package/android-tools/android-tools.mk
@@ -31,15 +31,24 @@ HOST_ANDROID_TOOLS_PRE_PATCH_HOOKS += ANDROID_TOOLS_DEBIAN_PATCH
 ANDROID_TOOLS_PRE_PATCH_HOOKS += ANDROID_TOOLS_DEBIAN_PATCH
 
 ifeq ($(BR2_PACKAGE_HOST_ANDROID_TOOLS_FASTBOOT),y)
-HOST_ANDROID_TOOLS_TARGETS += fastboot
+HOST_ANDROID_TOOLS_BUILD_TARGETS += fastboot
+HOST_ANDROID_TOOLS_INSTALL_TARGETS += build-fastboot/fastboot
 HOST_ANDROID_TOOLS_DEPENDENCIES += host-zlib host-libselinux
 endif
 
 ifeq ($(BR2_PACKAGE_HOST_ANDROID_TOOLS_ADB),y)
-HOST_ANDROID_TOOLS_TARGETS += adb
+HOST_ANDROID_TOOLS_BUILD_TARGETS += adb
+HOST_ANDROID_TOOLS_INSTALL_TARGETS += build-adb/adb
 HOST_ANDROID_TOOLS_DEPENDENCIES += host-zlib host-openssl
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_ANDROID_TOOLS_EXT4_UTILS),y)
+HOST_ANDROID_TOOLS_BUILD_TARGETS += ext4_utils
+HOST_ANDROID_TOOLS_INSTALL_TARGETS += \
+	$(addprefix build-ext4_utils/,make_ext4fs ext4fixup ext2simg img2simg simg2img simg2simg)
+HOST_ANDROID_TOOLS_DEPENDENCIES += host-libselinux
+endif
+
 ifeq ($(BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT),y)
 ANDROID_TOOLS_TARGETS += fastboot
 ANDROID_TOOLS_DEPENDENCIES += zlib libselinux
@@ -58,7 +67,7 @@ endif
 # Build each tool in its own directory not to share object files
 
 define HOST_ANDROID_TOOLS_BUILD_CMDS
-	$(foreach t,$(HOST_ANDROID_TOOLS_TARGETS),\
+	$(foreach t,$(HOST_ANDROID_TOOLS_BUILD_TARGETS),\
 		mkdir -p $(@D)/build-$(t) && \
 		$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) SRCDIR=$(@D) \
 			-C $(@D)/build-$(t) -f $(@D)/debian/makefiles/$(t).mk$(sep))
@@ -72,8 +81,8 @@ define ANDROID_TOOLS_BUILD_CMDS
 endef
 
 define HOST_ANDROID_TOOLS_INSTALL_CMDS
-	$(foreach t,$(HOST_ANDROID_TOOLS_TARGETS),\
-		$(INSTALL) -D -m 0755 $(@D)/build-$(t)/$(t) $(HOST_DIR)/bin/$(t)$(sep))
+	$(foreach t,$(HOST_ANDROID_TOOLS_INSTALL_TARGETS),\
+		$(INSTALL) -D -m 0755 $(@D)/$(t) $(HOST_DIR)/bin/$(notdir $(t))$(sep))
 endef
 
 define ANDROID_TOOLS_INSTALL_TARGET_CMDS
