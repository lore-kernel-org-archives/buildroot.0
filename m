From: Stuart Summers <stuart.summers@intel.com>
Date: Thu,  4 Apr 2019 12:24:13 -0700
Subject: [Buildroot] [PATCH 1/1] package/pkgconf: add host link to pkg-config
In-Reply-To: <20190404192413.10205-1-stuart.summers@intel.com>
References: <20190404192413.10205-1-stuart.summers@intel.com>
Message-ID: <20190404192413.10205-2-stuart.summers@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A patch was added to the Linux kernel in 5.1.0-rc3 which
adds a requirement that the host build environment include
pkg-config. Since pkg-config was deprecated in buildroot,
add a link in the host directory to /usr/bin/pkg-config.

Also add a new config option to enforce building host-pkgconf
before building the Linux kernel.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 linux/Config.in            | 8 ++++++++
 linux/linux.mk             | 4 ++++
 package/pkgconf/pkgconf.mk | 8 +++++++-
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 9a4d46e534..5d0c623c2b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -432,6 +432,14 @@ config BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF
 	  CONFIG_UNWINDER_ORC=y, please install libelf-dev,
 	  libelf-devel or elfutils-libelf-devel".
 
+config BR2_LINUX_KERNEL_NEEDS_HOST_PKG_CONFIG
+	bool "Needs host pkgconf"
+	help
+	  Starting in 5.1.0-rc3, a change was added to the Linux kernel
+	  which uses pkg-config to determine the location of the libelf
+	  library. Without this option, the kernel will fail with build
+	  errors.
+
 # Linux extensions
 source "linux/Config.ext.in"
 
diff --git a/linux/linux.mk b/linux/linux.mk
index 6bf2b88038..d011f92828 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -100,6 +100,10 @@ ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF),y)
 LINUX_DEPENDENCIES += host-elfutils
 endif
 
+ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_PKG_CONFIG),y)
+LINUX_DEPENDENCIES += host-pkgconf
+endif
+
 # If host-uboot-tools is selected by the user, assume it is needed to
 # create a custom image
 ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS),y)
diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index e3c73fd405..8284799f1e 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -16,6 +16,10 @@ define PKGCONF_LINK_PKGCONFIG
 	ln -sf pkgconf $(TARGET_DIR)/usr/bin/pkg-config
 endef
 
+define HOST_PKGCONF_LINK_PKGCONFIG
+	ln -sf pkgconf $(HOST_DIR)/usr/bin/pkg-config
+endef
+
 define HOST_PKGCONF_INSTALL_WRAPPER
 	$(INSTALL) -m 0755 -D package/pkgconf/pkg-config.in \
 		$(HOST_DIR)/bin/pkg-config
@@ -32,7 +36,9 @@ define HOST_PKGCONF_SHARED
 endef
 
 PKGCONF_POST_INSTALL_TARGET_HOOKS += PKGCONF_LINK_PKGCONFIG
-HOST_PKGCONF_POST_INSTALL_HOOKS += HOST_PKGCONF_INSTALL_WRAPPER
+HOST_PKGCONF_POST_INSTALL_HOOKS += \
+	HOST_PKGCONF_INSTALL_WRAPPER \
+	HOST_PKGCONF_LINK_PKGCONFIG
 
 ifeq ($(BR2_STATIC_LIBS),y)
 HOST_PKGCONF_POST_INSTALL_HOOKS += HOST_PKGCONF_STATIC
-- 
2.20.1
