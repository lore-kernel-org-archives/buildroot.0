From: Alex Suykov <alex.suykov@gmail.com>
Date: Fri, 25 Dec 2015 23:40:10 +0200
Subject: [Buildroot] [PATCH 1/2 v5] vboot-utils: new package
Message-ID: <20151225214010.GA30096@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Chromium OS verified boot utilities.

Needed for signing kernel images and manipulating bootable
partitions on media intended for Chromebooks.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
v2: _LICENSE_FILES, minor text fixes
v3: git snapshot over https instead of git checkout
    comments on unusual make targets
    proper license name
v4: host-pkgconf dependency, proper host CC/CFLAGS/LDFLAGS
v5: revert to git checkout, ChromiumOS -> Chromium OS

 package/Config.in.host               |  1 +
 package/vboot-utils/Config.in.host   |  6 ++++++
 package/vboot-utils/vboot-utils.hash |  2 ++
 package/vboot-utils/vboot-utils.mk   | 38 ++++++++++++++++++++++++++++++++++++
 4 files changed, 47 insertions(+)
 create mode 100644 package/vboot-utils/Config.in.host
 create mode 100644 package/vboot-utils/vboot-utils.hash
 create mode 100644 package/vboot-utils/vboot-utils.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index d757316..8e6b870 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -30,5 +30,6 @@ menu "Host utilities"
 	source "package/sunxi-tools/Config.in.host"
 	source "package/uboot-tools/Config.in.host"
 	source "package/util-linux/Config.in.host"
+	source "package/vboot-utils/Config.in.host"
 
 endmenu
diff --git a/package/vboot-utils/Config.in.host b/package/vboot-utils/Config.in.host
new file mode 100644
index 0000000..899f6e7
--- /dev/null
+++ b/package/vboot-utils/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_VBOOT_UTILS
+	bool "host vboot utils"
+	help
+	  Chromium OS verified boot utilities: futility and cgpt.
+
+	  https://www.chromium.org/chromium-os/chromiumos-design-docs/verified-boot
diff --git a/package/vboot-utils/vboot-utils.hash b/package/vboot-utils/vboot-utils.hash
new file mode 100644
index 0000000..e161423
--- /dev/null
+++ b/package/vboot-utils/vboot-utils.hash
@@ -0,0 +1,2 @@
+# Git shapshot
+none	xxx	bbdd62f9b030db7ad8eef789aaf58a7ff9a25656.tar.gz
diff --git a/package/vboot-utils/vboot-utils.mk b/package/vboot-utils/vboot-utils.mk
new file mode 100644
index 0000000..75978cb
--- /dev/null
+++ b/package/vboot-utils/vboot-utils.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# vboot-utils
+#
+################################################################################
+
+VBOOT_UTILS_VERSION = bbdd62f9b030db7ad8eef789aaf58a7ff9a25656
+VBOOT_UTILS_SITE = https://chromium.googlesource.com/chromiumos/platform/vboot_reference
+VBOOT_UTILS_SITE_METHOD = git
+VBOOT_UTILS_LICENSE = BSD-3c
+VBOOT_UTILS_LICENSE_FILES = LICENSE
+
+HOST_VBOOT_UTILS_DEPENDENCIES = host-openssl host-pkgconf
+
+# vboot_reference contains code that goes into bootloaders,
+# utilities intended for the target system, and a bunch of scripts
+# for Chromium OS build system. Most of that does not make sense
+# in a buildroot host-package.
+#
+# We only need futility for signing images, the keys, and cgpt for boot
+# media partitioning.
+#
+# make target for futility is "futil".
+
+define HOST_VBOOT_UTILS_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
+		CC="$(HOSTCC)" \
+		CFLAGS="$(HOST_CFLAGS) -D_LARGEFILE64_SOURCE -D_GNU_SOURCE" \
+		LDFLAGS="$(HOST_LDFLAGS)" \
+		futil cgpt
+endef
+
+define HOST_VBOOT_UTILS_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR)/usr \
+		futil_install cgpt_install devkeys_install
+endef
+
+$(eval $(host-generic-package))
-- 
2.6.4
