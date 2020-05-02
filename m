From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  2 May 2020 12:06:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/gkrellm: new package
Message-ID: <20200502100635.3520066-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/gkrellm/Config.in    | 43 ++++++++++++++++++++++++++++++
 package/gkrellm/gkrellm.hash |  4 +++
 package/gkrellm/gkrellm.mk   | 51 ++++++++++++++++++++++++++++++++++++
 5 files changed, 100 insertions(+)
 create mode 100644 package/gkrellm/Config.in
 create mode 100644 package/gkrellm/gkrellm.hash
 create mode 100644 package/gkrellm/gkrellm.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e427ab15d4..52b5f4ad97 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -357,6 +357,7 @@ F:	package/freetype/
 F:	package/fstrcmp/
 F:	package/ghostscript/
 F:	package/giflib/
+F:	package/gkrellm/
 F:	package/gli/
 F:	package/glmark2/
 F:	package/gpsd/
diff --git a/package/Config.in b/package/Config.in
index c12676d859..11a67f7374 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2344,6 +2344,7 @@ menu "System tools"
 	source "package/emlog/Config.in"
 	source "package/ftop/Config.in"
 	source "package/getent/Config.in"
+	source "package/gkrellm/Config.in"
 	source "package/htop/Config.in"
 	source "package/ibm-sw-tpm2/Config.in"
 	source "package/initscripts/Config.in"
diff --git a/package/gkrellm/Config.in b/package/gkrellm/Config.in
new file mode 100644
index 0000000000..2743be76d3
--- /dev/null
+++ b/package/gkrellm/Config.in
@@ -0,0 +1,43 @@
+config BR2_PACKAGE_GKRELLM
+	bool "gkrellm"
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_GKRELLM_SERVER if !BR2_PACKAGE_GKRELLM_CLIENT
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  GKrellM is a single process stack of system monitors which
+	  supports applying themes to match its appearance to your
+	  window manager, Gtk, or any other theme.
+
+	  http://gkrellm.srcbox.net/
+
+if BR2_PACKAGE_GKRELLM
+
+config BR2_PACKAGE_GKRELLM_SERVER
+	bool "daemon"
+	help
+	  Enable gkrellm daemon.
+
+config BR2_PACKAGE_GKRELLM_CLIENT
+	bool "client"
+	depends on BR2_PACKAGE_XORG7 # libgtk2
+	depends on BR2_INSTALL_LIBSTDCPP # libgtk2 -> pango
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libgtk2 -> pango -> harfbuzz
+	select BR2_PACKAGE_LIBGTK2
+	select BR2_PACKAGE_XLIB_LIBSM
+	help
+	  Enable gkrellm client.
+
+comment "client depends on X.org and needs a toolchain w/ C++, gcc >= 4.8"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_PACKAGE_XORG7
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
+endif # BR2_PACKAGE_GKRELLM
+
+comment "gkrellm needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gkrellm/gkrellm.hash b/package/gkrellm/gkrellm.hash
new file mode 100644
index 0000000000..88624c3366
--- /dev/null
+++ b/package/gkrellm/gkrellm.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256  1ee0643ed9ed99f88c1504c89d9ccb20780cf29319c904b68e80a8e7c8678c06  gkrellm-2.3.11.tar.bz2
+sha256  691de85c3c6eeda5b6982c751548575344739ce4b4418d78905e599359f6c435  COPYING
+sha256  b81e0c0c3fb2a58f25377388484a1f729abb367f5f2b43e335a6ed3272ce8536  COPYRIGHT
diff --git a/package/gkrellm/gkrellm.mk b/package/gkrellm/gkrellm.mk
new file mode 100644
index 0000000000..9e9dcd69ea
--- /dev/null
+++ b/package/gkrellm/gkrellm.mk
@@ -0,0 +1,51 @@
+################################################################################
+#
+# gkrellm
+#
+################################################################################
+
+GKRELLM_VERSION = 2.3.11
+GKRELLM_SITE = http://gkrellm.srcbox.net/releases
+GKRELLM_SOURCE = gkrellm-$(GKRELLM_VERSION).tar.bz2
+GKRELLM_LICENSE = GPL-3.0+
+GKRELLM_LICENSE_FILES = COPYING COPYRIGHT
+GKRELLM_DEPENDENCIES = host-pkgconf libglib2
+GKRELLM_BUILD_OPTS = STRIP=""
+
+ifeq ($(BR2_PACKAGE_LM_SENSORS),y)
+GKRELLM_DEPENDENCIES += lm-sensors
+else
+GKRELLM_BUILD_OPTS += without-libsensors=yes
+endif
+
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
+GKRELLM_BUILD_OPTS += enable_nls=1
+else
+GKRELLM_BUILD_OPTS += enable_nls=0
+endif
+
+ifeq ($(BR2_PACKAGE_GKRELLM_SERVER)$(BR2_PACKAGE_GKRELLM_CLIENT),yy)
+GKRELLM_BUILD_DIR = $(@D)
+else ifeq ($(BR2_PACKAGE_GKRELLM_SERVER),y)
+GKRELLM_BUILD_DIR = $(@D)/server
+else
+GKRELLM_BUILD_DIR = $(@D)/src
+endif
+
+ifeq ($(BR2_PACKAGE_GKRELLM_CLIENT),y)
+GKRELLM_DEPENDENCIES += libgtk2 xlib_libSM
+GKRELLM_LICENSE += GPL (base64.c), Public Domain (md5.h, md5c.c)
+endif
+
+define GKRELLM_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) \
+		-C $(GKRELLM_BUILD_DIR) $(GKRELLM_BUILD_OPTS)
+endef
+
+define GKRELLM_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) \
+		-C $(GKRELLM_BUILD_DIR) $(GKRELLM_BUILD_OPTS) \
+		INSTALLROOT=$(TARGET_DIR)/usr install
+endef
+
+$(eval $(generic-package))
-- 
2.26.2
