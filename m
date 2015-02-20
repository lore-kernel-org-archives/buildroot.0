From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Feb 2015 10:06:01 +0100
Subject: [Buildroot] [git commit] wf111: new package
Message-ID: <20150302222720.D23D4807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5b13fc05b37386e64b9f46515b57b5887ee357d9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds support for the BlueGiga WF111 WiFi driver and the binary utilities
distributed alongside the driver. An account is required to download the
sources from the BlueGiga website, which can be created freely. The
driver is available for armv5, arm7a and i386.

Since it is not possible to automatically retrieve the sources, because
of the required user account needed on the BlueGiga website, an option
is added to let the Buildroot user specify the directory where the
driver tarball was downloaded.

Finally, two options must be selected in the Linux kernel configuration:
CONFIG_WIRELESS_EXT and CONFIG_WEXT_PRIV. These are blind options (i.e.
not selectable directly) so they cannot be enabled by a change in
linux/linux.mk. The user as two choices to enable these options:
- By making them non blind, with a "WF111 support" configuration entry
  for example.
- By enabling another WiFi driver that select them.

The work behind this commit was funded by ECA Group
<http://www.ecagroup.com>. ECA Group is the copyright owner of the
contributed code.

Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in       |    1 +
 package/wf111/Config.in |   36 ++++++++++++++++++++++++++++++++++++
 package/wf111/wf111.mk  |   34 ++++++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 077efc0..bad0f7b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -391,6 +391,7 @@ endif
 	source "package/usbmount/Config.in"
 	source "package/usbutils/Config.in"
 	source "package/w_scan/Config.in"
+	source "package/wf111/Config.in"
 	source "package/wipe/Config.in"
 	source "package/xorriso/Config.in"
 endmenu
diff --git a/package/wf111/Config.in b/package/wf111/Config.in
new file mode 100644
index 0000000..d2ba440
--- /dev/null
+++ b/package/wf111/Config.in
@@ -0,0 +1,36 @@
+config BR2_PACKAGE_WF111
+	bool "wf111"
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_ARM_CPU_ARMV5 || BR2_ARM_CPU_ARMV7A || BR2_i386
+	# Binary tools are distributed alongside the driver, and are
+	# dynamically linked against the glibc.
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  BlueGiga WF111 WiFi driver and utilities.
+
+	  Warning: CONFIG_WIRELESS_EXT and CONFIG_WEXT_PRIV must be
+	  selected in the Linux kernel configuration. These are blind
+	  options (i.e. not selectable directly) so they cannot be
+	  enabled by a change in linux/linux.mk. There are two choices
+	  to enable these options:
+	  - By making them non blind, with a "WF111 support" configuration
+	    entry that selects them, for example.
+	  - By enabling another random WiFi driver that select them.
+
+	  http://www.bluegiga.com/en-US/products/wifi-modules/wf111-wifi-module/
+
+if BR2_PACKAGE_WF111
+
+config BR2_PACKAGE_WF111_TARBALL_PATH
+	string "Local tarball location"
+	help
+	  The WF111 tarball can be retrieved on the BlueGiga website
+	  after registration. This option specifies the path where the
+	  tarball is locally saved.
+
+endif
+
+comment "wf111 needs an (e)glibc toolchain"
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_ARM_CPU_ARMV5 || BR2_ARM_CPU_ARMV7A || BR2_i386
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/wf111/wf111.mk b/package/wf111/wf111.mk
new file mode 100644
index 0000000..479d665
--- /dev/null
+++ b/package/wf111/wf111.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# wf111
+#
+################################################################################
+
+WF111_VERSION = 5.2.2
+WF111_SITE_METHOD = file
+WF111_SITE = $(call qstrip,$(BR2_PACKAGE_WF111_TARBALL_PATH))
+WF111_DEPENDENCIES = linux
+
+ifeq ($(BR2_PACKAGE_WF111)$(call qstrip,$(BR2_PACKAGE_WF111_TARBALL_PATH)),y)
+$(error No tarball location specified, check BR2_PACKAGE_WF111_TARBALL_PATH)
+endif
+
+ifeq ($(BR2_ARM_CPU_ARMV7A),y)
+WF111_SOURCE = wf111-linux-driver_5.2.2-r1_armv7-a.tar.gz
+else ifeq ($(BR2_ARM_CPU_ARMV5),y)
+WF111_SOURCE = wf111-linux-driver_5.2.2-r1_armv5t.tar.gz
+else ifeq ($(BR2_i386),y)
+WF111_SOURCE = wf111-linux-driver_5.2.2-r1_x86.tar.gz
+endif
+
+define WF111_BUILD_CMDS
+	$(MAKE) -C $(@D) PWD=$(@D) \
+		$(LINUX_MAKE_FLAGS) KDIR=$(LINUX_DIR) \
+		install_static
+endef
+
+define WF111_INSTALL_TARGET_CMDS
+	cp -dpfr $(@D)/output/* $(TARGET_DIR)
+endef
+
+$(eval $(generic-package))
