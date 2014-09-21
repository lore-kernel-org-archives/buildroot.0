From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 19:41:12 +0200
Subject: [Buildroot] [git commit] manual/user guide/customization: move
	section on storing configuration
Message-ID: <20140921174201.36B2C9D488@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e140eb70d473f9f61d3f426f0855af02d4994c0b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch moves the section 'Basics for storing the configuration' to a
separate file and upwards in the manual section order, to line up with the
listing of customization actions in the introduction of the chapter. The
text itself is currently unchanged, this will be handled in the next patch.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/customize-configuration.txt |   68 +++++++++++++++++++++++++++++++
 docs/manual/customize-store.txt         |   65 -----------------------------
 docs/manual/customize.txt               |    2 +
 3 files changed, 70 insertions(+), 65 deletions(-)

diff --git a/docs/manual/customize-configuration.txt b/docs/manual/customize-configuration.txt
new file mode 100644
index 0000000..d118cad
--- /dev/null
+++ b/docs/manual/customize-configuration.txt
@@ -0,0 +1,68 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+[[customize-store-basics]]
+=== Basics for storing the configuration
+
+When you have a buildroot configuration that you are satisfied with and
+you want to share it with others, put it under revision control or move
+on to a different buildroot project, you need to store the configuration
+so it can be rebuilt later. The configuration that needs to be stored
+consists of the buildroot configuration, the configuration files for
+packages that you use (kernel, busybox, uClibc, ...), and your rootfs
+modifications.
+
+[[customize-store-buildroot-config]]
+==== Buildroot configuration
+
+For storing the buildroot configuration itself, buildroot offers the
+following command: +make savedefconfig+.
+
+This strips the buildroot configuration down by removing configuration
+options that are at their default value. The result is stored in a file
+called +defconfig+.  If you want to save it in another place, change
+the +BR2_DEFCONFIG+ option, or call make with +make savedefconfig
+BR2_DEFCONFIG=<path-to-defconfig>+.  The usual place is
++configs/<boardname>_defconfig+. The configuration can then be rebuilt by
+running +make <boardname>_defconfig+.
+
+Alternatively, you can copy the file to any other place and rebuild with
++make defconfig BR2_DEFCONFIG=<path-to-defconfig-file>+.
+
+
+[[customize-store-package-config]]
+==== Other package configuration
+
+The configuration files for busybox, the linux kernel, barebox and
+uClibc should be stored as well if changed. For each of these, a
+buildroot configuration option exists to point to an input
+configuration file, e.g. +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE+.  To
+save their configuration, set those configuration options to a path
+outside your output directory,
+e.g. +board/<manufacturer>/<boardname>/linux.config+.  Then, copy the
+configuration files to that path.
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
+* For at91bootstrap3, no helper exists so you have to copy the config
+  file manually to +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE+.
+
+
diff --git a/docs/manual/customize-store.txt b/docs/manual/customize-store.txt
index 9c87f62..7f4a289 100644
--- a/docs/manual/customize-store.txt
+++ b/docs/manual/customize-store.txt
@@ -1,71 +1,6 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-[[customize-store-basics]]
-=== Basics for storing the configuration
-
-When you have a buildroot configuration that you are satisfied with and
-you want to share it with others, put it under revision control or move
-on to a different buildroot project, you need to store the configuration
-so it can be rebuilt later. The configuration that needs to be stored
-consists of the buildroot configuration, the configuration files for
-packages that you use (kernel, busybox, uClibc, ...), and your rootfs
-modifications.
-
-[[customize-store-buildroot-config]]
-==== Buildroot configuration
-
-For storing the buildroot configuration itself, buildroot offers the
-following command: +make savedefconfig+.
-
-This strips the buildroot configuration down by removing configuration
-options that are at their default value. The result is stored in a file
-called +defconfig+.  If you want to save it in another place, change
-the +BR2_DEFCONFIG+ option, or call make with +make savedefconfig
-BR2_DEFCONFIG=<path-to-defconfig>+.  The usual place is
-+configs/<boardname>_defconfig+. The configuration can then be rebuilt by
-running +make <boardname>_defconfig+.
-
-Alternatively, you can copy the file to any other place and rebuild with
-+make defconfig BR2_DEFCONFIG=<path-to-defconfig-file>+.
-
-
-[[customize-store-package-config]]
-==== Other package configuration
-
-The configuration files for busybox, the linux kernel, barebox and
-uClibc should be stored as well if changed. For each of these, a
-buildroot configuration option exists to point to an input
-configuration file, e.g. +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE+.  To
-save their configuration, set those configuration options to a path
-outside your output directory,
-e.g. +board/<manufacturer>/<boardname>/linux.config+.  Then, copy the
-configuration files to that path.
-
-Make sure that you create a configuration file 'before' changing
-the +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE+ etc. options.  Otherwise,
-buildroot will try to access this config file, which doesn't exist
-yet, and will fail. You can create the configuration file by running
-+make linux-menuconfig+ etc.
-
-Buildroot provides a few helper targets to make the saving of
-configuration files easier.
-
-* +make linux-update-defconfig+ saves the linux configuration to the
-  path specified by +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE+.  It
-  simplifies the config file by removing default values.  However,
-  this only works with kernels starting from 2.6.33.  For earlier
-  kernels, use +make linux-update-config+.
-* +make busybox-update-config+ saves the busybox configuration to the
-  path specified by +BR2_PACKAGE_BUSYBOX_CONFIG+.
-* +make uclibc-update-config+ saves the uClibc configuration to the
-  path specified by +BR2_UCLIBC_CONFIG+.
-* +make barebox-update-defconfig+ saves the barebox configuration to the
-  path specified by +BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE+.
-* For at91bootstrap3, no helper exists so you have to copy the config
-  file manually to +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE+.
-
-
 === Step-by-step instructions for storing configuration
 
 To store the configuration for a specific product, device or
diff --git a/docs/manual/customize.txt b/docs/manual/customize.txt
index 4051ae0..c001cb1 100644
--- a/docs/manual/customize.txt
+++ b/docs/manual/customize.txt
@@ -39,6 +39,8 @@ include::customize-directory-structure.txt[]
 
 include::customize-outside-br.txt[]
 
+include::customize-configuration.txt[]
+
 include::customize-rootfs.txt[]
 
 include::customize-post-image.txt[]
