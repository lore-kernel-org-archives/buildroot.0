From: Dmitry <golubovsky@gmail.com>
Date: Sun, 13 May 2012 23:50:25 -0400
Subject: [Buildroot] [PATCH] Added package v86d which provides a real-mode
	helper for uvesafb driver.
Message-ID: <1336967425-27449-1-git-send-email-golubovsky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Dmitry <golubovsky@gmail.com>
---
 package/Config.in      |    1 +
 package/v86d/Config.in |    9 +++++++++
 package/v86d/v86d.mk   |   36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+), 0 deletions(-)
 create mode 100644 package/v86d/Config.in
 create mode 100644 package/v86d/v86d.mk

diff --git a/package/Config.in b/package/Config.in
index fb1b08f..ddb55cf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -230,6 +230,7 @@ source "package/unionfs/Config.in"
 source "package/usb_modeswitch/Config.in"
 source "package/usbmount/Config.in"
 source "package/usbutils/Config.in"
+source "package/v86d/Config.in"
 source "package/wipe/Config.in"
 source "package/xfsprogs/Config.in"
 endmenu
diff --git a/package/v86d/Config.in b/package/v86d/Config.in
new file mode 100644
index 0000000..ba1baca
--- /dev/null
+++ b/package/v86d/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_V86D
+	bool "v86d"
+	depends on (BR2_i386 || BR2_x86_64)
+	help
+	  v86d is the userspace helper that runs x86 code in an emulated
+	  environment. uvesafb will not work without v86d. v86d currently
+	  supports the x86 and amd64 (x86-64) architectures.
+
+	  http://dev.gentoo.org/~spock/projects/uvesafb/
diff --git a/package/v86d/v86d.mk b/package/v86d/v86d.mk
new file mode 100644
index 0000000..59187fc
--- /dev/null
+++ b/package/v86d/v86d.mk
@@ -0,0 +1,36 @@
+############################################
+#
+# v86d
+# 
+############################################
+
+V86D_VERSION = 0.1.10
+V86D_SOURCE = v86d-$(V86D_VERSION).tar.bz2
+V86D_SITE = http://dev.gentoo.org/~spock/projects/uvesafb/archive
+
+# The configure script autodetects the host architecture, 
+# and assumes the target architecture to be the same as the host,
+# so we must use the target architecture flags provided 
+# by Buildroot for proper cross-compilation. The x86emu 
+# configure option should be 'n' for i386, and 'y' for x86-64.
+
+X86EMU = $(if $(BR2_i386),n,y)
+
+# v86d's configure script is not autoconf-based.
+# GENTARGETS macro will be used rather than AUTOTARGETS.
+
+define V86D_CONFIGURE_CMDS
+	(cd $(@D) ; ./configure --with-debug=n --with-klibc=n --with-x86emu=$(X86EMU))
+endef
+
+# It is necessary to define __i386__ explicitly for successful compilation.
+
+define V86D_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC) -D__i386__" LD="$(TARGET_LD)" -C $(@D) all
+endef
+
+define V86D_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/v86d $(TARGET_DIR)/sbin/v86d	
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.2.5
