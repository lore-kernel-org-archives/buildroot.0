From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 19:41:12 +0200
Subject: [Buildroot] [git commit] manual/user guide/customization: rework
	section on storing configuration
Message-ID: <20140921174201.3F4549D488@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=75de9ac6f286a53b10b1a6dd6ddde286fb61d4de
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch promotes the sections on Buildroot configuration and the
configuration of other components to top-level sections, to match the
overview in the introduction of the chapter. The introduction of the
original section is removed as it does not bring additional info anymore.

Some rewording is done as well.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/customize-configuration.txt |   54 ++++++++++++++-----------------
 1 files changed, 24 insertions(+), 30 deletions(-)

diff --git a/docs/manual/customize-configuration.txt b/docs/manual/customize-configuration.txt
index d118cad..5723302 100644
--- a/docs/manual/customize-configuration.txt
+++ b/docs/manual/customize-configuration.txt
@@ -1,50 +1,44 @@
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
 [[customize-store-buildroot-config]]
-==== Buildroot configuration
+=== Storing the Buildroot configuration
 
-For storing the buildroot configuration itself, buildroot offers the
-following command: +make savedefconfig+.
+The Buildroot configuration can be stored using the command
+ +make savedefconfig+.
 
-This strips the buildroot configuration down by removing configuration
+This strips the Buildroot configuration down by removing configuration
 options that are at their default value. The result is stored in a file
-called +defconfig+.  If you want to save it in another place, change
-the +BR2_DEFCONFIG+ option, or call make with +make savedefconfig
-BR2_DEFCONFIG=<path-to-defconfig>+.  The usual place is
-+configs/<boardname>_defconfig+. The configuration can then be rebuilt by
+called +defconfig+. If you want to save it in another place, change the
++BR2_DEFCONFIG+ option in the Buildroot configuration itself, or call
+make with +make savedefconfig BR2_DEFCONFIG=<path-to-defconfig>+.
+
+The recommended place to store this defconfig is
++configs/<boardname>_defconfig+. If you follow this recommendation, the
+configuration will be listed in +make help+ and can be set again by
 running +make <boardname>_defconfig+.
 
 Alternatively, you can copy the file to any other place and rebuild with
 +make defconfig BR2_DEFCONFIG=<path-to-defconfig-file>+.
 
-
 [[customize-store-package-config]]
-==== Other package configuration
+=== Storing the configuration of other components
+
+The configuration files for BusyBox, the Linux kernel, Barebox and
+uClibc should be stored as well if changed. For each of these
+components, a Buildroot configuration option exists to point to an input
+configuration file, e.g. +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE+. To store
+their configuration, set these configuration options to a path where you
+want to save the configuration files, and then use the helper targets
+described below to actually store the configuration.
 
-The configuration files for busybox, the linux kernel, barebox and
-uClibc should be stored as well if changed. For each of these, a
-buildroot configuration option exists to point to an input
-configuration file, e.g. +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE+.  To
-save their configuration, set those configuration options to a path
-outside your output directory,
-e.g. +board/<manufacturer>/<boardname>/linux.config+.  Then, copy the
-configuration files to that path.
+As explained in xref:customize-dir-structure[], the recommended path to
+store these configuration files is
++board/<company>/<boardname>/foo.config+.
 
 Make sure that you create a configuration file 'before' changing
 the +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE+ etc. options.  Otherwise,
-buildroot will try to access this config file, which doesn't exist
+Buildroot will try to access this config file, which doesn't exist
 yet, and will fail. You can create the configuration file by running
 +make linux-menuconfig+ etc.
 
