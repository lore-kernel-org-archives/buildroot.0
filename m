From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 21 Oct 2012 01:45:22 +0200
Subject: [Buildroot] [PATCH 01/10] manual: add section about storing the
	configuration.
In-Reply-To: <1350776731-8467-1-git-send-email-arnout@mind.be>
References: <1350776731-8467-1-git-send-email-arnout@mind.be>
Message-ID: <1350776731-8467-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Reuse part of board-support.txt, and remove that one because it
was unused.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 docs/manual/adding-packages-directory.txt |    1 +
 docs/manual/board-support.txt             |   35 -----
 docs/manual/customize-store.txt           |  241 +++++++++++++++++++++++++++++
 docs/manual/customize.txt                 |    2 +
 4 files changed, 244 insertions(+), 35 deletions(-)
 delete mode 100644 docs/manual/board-support.txt
 create mode 100644 docs/manual/customize-store.txt

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 4a96415..ce9c5ce 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -147,6 +147,7 @@ package.
 
 The +.mk+ file
 ~~~~~~~~~~~~~~
+[[adding-packages-mk]]
 
 Finally, here's the hardest part. Create a file named +libfoo.mk+. It
 describes how the package should be downloaded, configured, built,
diff --git a/docs/manual/board-support.txt b/docs/manual/board-support.txt
deleted file mode 100644
index d1d9d63..0000000
--- a/docs/manual/board-support.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-Creating your own board support
-===============================
-
-Creating your own board support in Buildroot allows users of a
-particular hardware platform to easily build a system that is known to
-work.
-
-To do so, you need to create a normal Buildroot configuration that
-builds a basic system for the hardware: toolchain, kernel, bootloader,
-filesystem and a simple Busybox-only userspace. No specific package
-should be selected: the configuration should be as minimal as
-possible, and should only build a working basic Busybox system for the
-target platform. You can of course use more complicated configurations
-for your internal projects, but the Buildroot project will only
-integrate basic board configurations. This is because package
-selections are highly application-specific.
-
-Once you have a known working configuration, run +make
-savedefconfig+. This will generate a minimal +defconfig+ file at the
-root of the Buildroot source tree. Move this file into the +configs/+
-directory, and rename it +MYBOARD_defconfig+.
-
-It is recommended to use as much as possible upstream versions of the
-Linux kernel and bootloaders, and to use as much as possible default
-kernel and bootloader configurations. If they are incorrect for your
-platform, we encourage you to send fixes to the corresponding upstream
-projects.
-
-However, in the mean time, you may want to store kernel or bootloader
-configuration or patches specific to your target platform. To do so,
-create a directory +board/MANUFACTURER+ and a subdirectory
-+board/MANUFACTURER/BOARDNAME+ (after replacing, of course,
-MANUFACTURER and BOARDNAME with the appropriate values, in lower case
-letters). You can then store your patches and configurations in these
-directories, and reference them from the main Buildroot configuration.
diff --git a/docs/manual/customize-store.txt b/docs/manual/customize-store.txt
new file mode 100644
index 0000000..cad1700
--- /dev/null
+++ b/docs/manual/customize-store.txt
@@ -0,0 +1,241 @@
+Storing the configuration
+-------------------------
+[[customize-store]]
+
+When you have a buildroot configuration that you are satisfied with
+and you want to move to share it with others, put it under revision
+control or move on to a different buildroot project, you need to store
+the configuration so it can be rebuilt later. The configuration that
+needs to be stored consists of the buildroot configuration, the
+configuration files for packages that you use (kernel, busybox,
+uClibc, ...), and your rootfs modifications.
+
+Basics for storing the configuration
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+[[customize-store-basics]]
+
+Buildroot configuration
+^^^^^^^^^^^^^^^^^^^^^^^
+
+For storing the buildroot configuration itself, buildroot offers the
+following command: +make savedefconfig+
+
+This strips the buildroot configuration down by removing configuration
+options that are at their default value. The result is stored in a file
+called +defconfig+. Copy this file to +foo_defconfig+ in the +configs+
+directory. The configuration can then be rebuilt by running
++make foo_defconfig+
+
+Alternatively, you can copy the file to any other place and rebuild with
++make BR2_DEFCONFIG=<path-to-defconfig> defconfig+
+
+
+Other package configuration
+^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The configuration files for busybox, the linux kernel, uClibc and
+crosstool-NG should be stored as well. For each of these, a
+buildroot configuration option exists to point to an input configuration
+file, e.g. +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE+.  To save their
+configuration, set those configuration options to a path outside
+your output directory.  Then, copy the configuration files
+to that path.
+
+Make sure that you create a configuration file 'before' changing
+the +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE+ etc. options.  Otherwise,
+buildroot will try to access this config file, which doesn't exist
+yet, and will fail.
+
+Buildroot provides a few helper targets to make the saving of
+configuration files easier.
+
+* +make linux-update-defconfig+ saves the linux configuration to the
+  path specified by +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE+.  It
+  simplifies the config file by removing default values.  However,
+  this only works with kernels starting from 2.6.33.  For earlier
+  kernels, use +make linux-update-config+.
+* +make busybox-update-config+ saves the busybox configuration to the
+  path specified by +BR2_PACKAGE_BUSYBOX_CONFIG+.
+* +make uclibc-update-config+ saves the uClibc configuration to the
+  path specified by +BR2_UCLIBC_CONFIG+.
+* For crosstool-NG, no helper exists so you have to copy the config
+  file manually to +BR2_TOOLCHAIN_CTNG_CONFIG+.
+
+
+Creating your own board support
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Creating your own board support in Buildroot allows users of a
+particular hardware platform to easily build a system that is known to
+work.
+
+To do so, you need to create a normal Buildroot configuration that
+builds a basic system for the hardware: toolchain, kernel, bootloader,
+filesystem and a simple Busybox-only userspace. No specific package
+should be selected: the configuration should be as minimal as
+possible, and should only build a working basic Busybox system for the
+target platform. You can of course use more complicated configurations
+for your internal projects, but the Buildroot project will only
+integrate basic board configurations. This is because package
+selections are highly application-specific.
+
+Once you have a known working configuration, run +make
+savedefconfig+. This will generate a minimal +defconfig+ file at the
+root of the Buildroot source tree. Move this file into the +configs/+
+directory, and rename it +<boardname>_defconfig+.
+
+It is recommended to use as much as possible upstream versions of the
+Linux kernel and bootloaders, and to use as much as possible default
+kernel and bootloader configurations. If they are incorrect for your
+platform, we encourage you to send fixes to the corresponding upstream
+projects.
+
+However, in the mean time, you may want to store kernel or bootloader
+configuration or patches specific to your target platform. To do so,
+create a directory +board/<manufacturer>+ and a subdirectory
++board/<manufacturer>/<boardname>+. You can then store your patches
+and configurations in these directories, and reference them from the main
+Buildroot configuration.
+
+
+Step-by-step instructions for storing configuration inside the buildroot tree
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+To store the configuration for a specific product, device or
+application, it is advisable to use the same conventions as for the
+board support: put the buildroot defconfig in the +configs+ directory,
+and any other files in a subdirectory of the +boards+ directory.  This
+section gives step-by-step instructions about how to do that. Of course,
+you can skip the steps that are not relevant for your use case.
+
+1. +make menuconfig+ to configure toolchain, packages and kernel.
+1. +make linux-menuconfig+ to update the kernel config, similar for
+   other configuration.
+1. +mkdir -p board/<manufacturer>/<boardname>+
+1. Set the following options to +board/<manufacturer>/<boardname>/<package>.config+
+   (as far as they are relevant):
+   * +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE+
+   * +BR2_PACKAGE_BUSYBOX_CONFIG+
+   * +BR2_TOOLCHAIN_CTNG_CONFIG+
+   * +BR2_UCLIBC_CONFIG+
+   * +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE+
+1. Write the configuration files:
+   * +make linux-update-defconfig+
+   * +make busybox-update-config+
+   * +cp <output>/build/build-toolchain/.config board/<manufacturer>/<boardname>/ctng.config+
+   * +make uclibc-update-config+
+   * +cp <output>/build/at91bootstrap3-*/.config board/<manufacturer>/<boardname>/at91bootstrap3.config+
+1. Create +board/<manufacturer>/<boardname>/fs-overlay+ and fill it
+   with additional files you need on your rootfs, e.g.
+   +board/<manufacturer>/<boardname>/etc/inittab+.
+1. Create a post-build script
+   +board/<manufacturer>/<boardname>/post-build.sh+.  It should contain
+   the following command:
++
+------------
+rsync -a --exclude .empty --exclude '*~' ${0%/*}/fs-overlay $1
+------------
++
+1. Set +BR2_ROOTFS_POST_BUILD_SCRIPT+ to +board/<manufacturer>/<boardname>/post-build.sh+
+1. If additional setuid permissions have to be set or device nodes have
+   to be created, create +board/<manufacturer>/<boardname>/device_table.txt+
+   and add that path to +BR2_ROOTFS_DEVICE_TABLE+.
+1. +make savedefconfig+ to save the buildroot configuration.
+1. +cp defconfig configs/<boardname>_defconfig+
+
+
+Step-by-step instructions for storing configuration outside the buildroot tree
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+When you use buildroot in different projects, you may want to keep
+each project separate from buildroot itself. This requires an extra
+script or Makefile, but is otherwise easy to do with buildroot.
+Take the following steps (very similar to storing configuration inside
+the buildroot tree).
+
+1. +make menuconfig+ to configure toolchain, packages and kernel.
+1. +make linux-menuconfig+ to update the kernel config, similar for
+   other configuration.
+1. +mkdir -p <path-to-board-directory>+
+1. Set the following options to +$(BOARDDIR)/<package>.config+
+   (as far as they are relevant):
+   * +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE+
+   * +BR2_PACKAGE_BUSYBOX_CONFIG+
+   * +BR2_TOOLCHAIN_CTNG_CONFIG+
+   * +BR2_UCLIBC_CONFIG+
+   * +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE+
+1. Write the configuration files:
+   * +make linux-update-defconfig+
+   * +make busybox-update-config+
+   * +cp <output>/build/build-toolchain/.config <path-to-board-directory>/ctng.config+
+   * +make uclibc-update-config+
+   * +cp <output>/build/at91bootstrap3-*/.config <path-to-board-directory>/at91bootstrap3.config+
+1. Create +<path-to-board-directory>/fs-overlay+ and fill it
+   with additional files you need on your rootfs, e.g.
+   +<path-to-board-directory>/etc/inittab+.
+1. Create a post-build script
+   +<path-to-board-directory>/post-build.sh+.  It should contain
+   the following command:
++
+------------
+rsync -a --exclude .empty --exclude '*~' ${0%/*}/fs-overlay $1
+------------
++
+1. Set +BR2_ROOTFS_POST_BUILD_SCRIPT+ to +$(BOARDDIR)/post-build.sh+
+1. If additional setuid permissions have to be set or device nodes have
+   to be created, create +<path-to-board-directory>/device_table.txt+
+   and add that path to +BR2_ROOTFS_DEVICE_TABLE+.
+1. +make savedefconfig+ to save the buildroot configuration.
+1. +cp defconfig <path-to-board-directory>/buildroot.config+
+1. Create a script or Makefile in the board directory that calls
+   buildroot:
++
+------------
+make -C <path-to-buildroot> O=<path-to-board-directory>/output BR2_DEFCONFIG=<path-to-board-directory>/buildroot.config defconfig
+make -C <path-to-buildroot> O=<path-to-board-directory>/output BOARDDIR=<path-to-board-directory>
+------------
++
+1. If you have additional proprietary binaries that are compiled
+   outside of buildroot, you can copy them into the rootfs as
+   part of +post-build.sh+
+1. If you need additional packages that are not available in buildroot
+   and that you don't want to make available (e.g. proprietary
+   applications), set +BR2_PACKAGE_OVERRIDE_FILE+ to
+   +$(BOARDDIR)/local.mk+. Add the following to +local.mk+ to
+   add package 'foo': +include foo/foo.mk+.  Add the following in
+   +foo.mk+ (see xref:adding-packages-mk[Adding packages to buildroot]):
++
+------------
+BR2_PACKAGE_FOO     = y
+FOO_OVERRIDE_SRCDIR = $(BOARDDIR)/foo
+
+define FOO_BUILD_CMDS
+        $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define FOO_INSTALL_TARGET_CMDS
+        $(INSTALL) -D -m 0755 $(@D)/foo $(TARGET_DIR)/usr/bin/foo
+endef
+
+$(eval $(generic-package))
+------------
++
+The +BR2_PACKAGE_FOO=y+ makes sure the package is always selected,
+so there is no need for a +Config.in+ file. The +FOO_OVERRIDE_SRCDIR+
+tells buildroot to fetch the sources from the +foo+ directory, and
+also makes sure that they are re-synchronized when you call +make
+foo-rebuild+
++
+1. To add patches to the linux build, set +BR2_LINUX_KERNEL_PATCH+ to
+   +$(BOARDDIR)/patches/linux+ and add your patches in that directory.
+   Similar for U-Boot, barebox, at91bootstrap and at91bootstrap3.
+1. To add patches for some other package 'foo', put them in the
+   +patches/foo+ directory and add the following to +local.mk+:
++
+------------
+define FOO_LOCAL_PATCHES
+support/scripts/apply-patches.sh $(@D) $(BOARDDIR)/patches/foo foo-\*.patch
+endef
+
+FOO_POST_PATCH_HOOKS += FOO_LOCAL_PATCHES
+------------
diff --git a/docs/manual/customize.txt b/docs/manual/customize.txt
index e8235de..6bd5811 100644
--- a/docs/manual/customize.txt
+++ b/docs/manual/customize.txt
@@ -10,3 +10,5 @@ include::customize-uclibc-config.txt[]
 include::customize-kernel-config.txt[]
 
 include::customize-toolchain.txt[]
+
+include::customize-store.txt[]
-- 
1.7.10.4
