From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue,  5 Feb 2013 18:15:59 +0100
Subject: [Buildroot] [PATCH 1/4] manual: add section about storing the
	configuration.
In-Reply-To: <cover.1360084128.git.arnout@mind.be>
References: <cover.1360084128.git.arnout@mind.be>
Message-ID: <c389b413e9f055bfcc89bfd014a8a7c7e36b1819.1360084128.git.arnout@mind.be>
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
v4:
 - Rebased against master.

v3:
 - Removed the section about out-of-tree configuration.
 - Added barebox config.
 - Comments from Luca.

v2: mention LINUX_KERNEL_PATCH also in in-tree documentation
    (Samuel Martin)

It's probably Acked-by Luca, but since my changes are pretty
heavy (removing a whole section, adding barebox) I didn't include
the ack.
---
 docs/manual/adding-packages-directory.txt |    1 +
 docs/manual/board-support.txt             |   38 -------
 docs/manual/customize-store.txt           |  160 +++++++++++++++++++++++++++++
 docs/manual/customize.txt                 |    2 +
 4 files changed, 163 insertions(+), 38 deletions(-)
 delete mode 100644 docs/manual/board-support.txt
 create mode 100644 docs/manual/customize-store.txt

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 5d17aac..cc68497 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -168,6 +168,7 @@ coding style].
 
 The +.mk+ file
 ~~~~~~~~~~~~~~
+[[adding-packages-mk]]
 
 Finally, here's the hardest part. Create a file named +libfoo.mk+. It
 describes how the package should be downloaded, configured, built,
diff --git a/docs/manual/board-support.txt b/docs/manual/board-support.txt
deleted file mode 100644
index 44ab6eb..0000000
--- a/docs/manual/board-support.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-// -*- mode:doc -*- ;
-
-[[board-support]]
-Creating your own board support
--------------------------------
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
-directory, and rename it +BOARDNAME_defconfig+.
-
-It is recommended to use upstream versions of the Linux kernel and
-bootloaders where possible, and also to use default kernel and bootloader
-configurations if possible. If the defaults are incorrect for
-your board, or no default exists, we encourage you to send fixes to the
-corresponding upstream projects.
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
index 0000000..435c1b9
--- /dev/null
+++ b/docs/manual/customize-store.txt
@@ -0,0 +1,160 @@
+// -*- mode:doc -*-
+
+[[customize-store]]
+Storing the configuration
+-------------------------
+
+When you have a buildroot configuration that you are satisfied with and
+you want to share it with others, put it under revision control or move
+on to a different buildroot project, you need to store the configuration
+so it can be rebuilt later. The configuration that needs to be stored
+consists of the buildroot configuration, the configuration files for
+packages that you use (kernel, busybox, uClibc, ...), and your rootfs
+modifications.
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
++make defconfig BR2_DEFCONFIG=<path-to-defconfig-file>+.
+
+
+Other package configuration
+^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The configuration files for busybox, the linux kernel, barebox, uClibc and
+crosstool-NG should be stored as well. For each of these, a
+buildroot configuration option exists to point to an input configuration
+file, e.g. +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE+.  To save their
+configuration, set those configuration options to a path outside
+your output directory, e.g. +board/<manufacturer>/<boardname>/linux.config+.
+Then, copy the configuration files to that path.
+
+Make sure that you create a configuration file 'before' changing
+the +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE+ etc. options.  Otherwise,
+buildroot will try to access this config file, which doesn't exist
+yet, and will fail. You can create the configuration file by running
++make linux-menuconfig+ etc.
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
+* +make barebox-update-defconfig+ saves the barebox configuration to the
+  path specified by +BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE+.
+* For crosstool-NG and at91bootstrap3 and no helper exists so you
+  have to copy the config file manually to +BR2_TOOLCHAIN_CTNG_CONFIG+,
+  resp. +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE+.
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
+board, or no default exists, we encourage you to send fixes to the
+corresponding upstream projects.
+
+However, in the mean time, you may want to store kernel or bootloader
+configuration or patches specific to your target platform. To do so,
+create a directory +board/<manufacturer>+ and a subdirectory
++board/<manufacturer>/<boardname>+. You can then store your patches
+and configurations in these directories, and reference them from the main
+Buildroot configuration.
+
+
+Step-by-step instructions for storing configuration
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
+   * +BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE+
+1. Write the configuration files:
+   * +make linux-update-defconfig+
+   * +make busybox-update-config+
+   * +cp <output>/build/build-toolchain/.config board/<manufacturer>/<boardname>/ctng.config+
+   * +make uclibc-update-config+
+   * +cp <output>/build/at91bootstrap3-*/.config board/<manufacturer>/<boardname>/at91bootstrap3.config+
+   * +make barebox-update-defconfig+
+1. Create +board/<manufacturer>/<boardname>/fs-overlay/+ and fill it
+   with additional files you need on your rootfs, e.g.
+   +board/<manufacturer>/<boardname>/fs-overlay/etc/inittab+.
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
+1. To add patches to the linux build, set +BR2_LINUX_KERNEL_PATCH+ to
+   +board/<manufacturer>/<boardname>/patches/linux/+ and add your
+   patches in that directory. Each patch should be called
+   +linux-<num>-<description>.patch+. Similar for U-Boot, barebox,
+   at91bootstrap and at91bootstrap3.
+1. If you need modifications to other packages, or if you need to add
+   packages, do that directly in the +packages/+ directory, following the
+   instructions in xref:adding-packages[].
diff --git a/docs/manual/customize.txt b/docs/manual/customize.txt
index 1e6f4e8..a13ba8f 100644
--- a/docs/manual/customize.txt
+++ b/docs/manual/customize.txt
@@ -12,3 +12,5 @@ include::customize-uclibc-config.txt[]
 include::customize-kernel-config.txt[]
 
 include::customize-toolchain.txt[]
+
+include::customize-store.txt[]
-- 
1.7.10.4
