From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 18 Sep 2014 21:39:35 +0200
Subject: [Buildroot] [PATCH 12 of 13] manual/user guide/customization:
 rework 'step-by-step instructions'
In-Reply-To: <patchbomb.1411069163@localhost>
References: <patchbomb.1411069163@localhost>
Message-ID: <c080d98118835e3c9675.1411069175@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch reworks the section 'Step-by-step instructions for storing
configuration' as follows:
- rename into 'Quick guide to storing your project-specific customizations'
  and hence make it serve as a summary to the chapter
- change the introduction to make this clear
- update paths to line-up with section 'recommended directory structure'
- recommend BR2_GLOBAL_PATCH_DIR, as is done in the section on adding
  patches.
- mention how to add packages in a project-specific directory (to be
  expanded in another patch)
- minor rewording
- rename file into customize-quick-guide.txt

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/customize-quick-guide.txt |  57 ++++++++++++++++----------
 docs/manual/customize.txt             |   2 +-
 2 files changed, 36 insertions(+), 23 deletions(-)

diff --git a/docs/manual/customize-store.txt b/docs/manual/customize-quick-guide.txt
rename from docs/manual/customize-store.txt
rename to docs/manual/customize-quick-guide.txt
--- a/docs/manual/customize-store.txt
+++ b/docs/manual/customize-quick-guide.txt
@@ -1,18 +1,17 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-=== Step-by-step instructions for storing configuration
+=== Quick guide to storing your project-specific customizations
 
-To store the configuration for a specific product, device or
-application, it is advisable to use the same conventions as for the
-board support: put the buildroot defconfig in the +configs+ directory,
-and any other files in a subdirectory of the +boards+ directory.  This
-section gives step-by-step instructions about how to do that. Of course,
-you can skip the steps that are not relevant for your use case.
+Earlier in this chapter, the different methods for making
+project-specific customizations have been described. This section will
+now summarize all this by providing step-by-step instructions to storing your
+project-specific customizations. Clearly, the steps that are not relevant to
+your project can be skipped.
 
 1. +make menuconfig+ to configure toolchain, packages and kernel.
 1. +make linux-menuconfig+ to update the kernel config, similar for
-   other configuration.
+   other configuration like busybox, uclibc, ...
 1. +mkdir -p board/<manufacturer>/<boardname>+
 1. Set the following options to +board/<manufacturer>/<boardname>/<package>.config+
    (as far as they are relevant):
@@ -25,27 +24,41 @@
    * +make linux-update-defconfig+
    * +make busybox-update-config+
    * +make uclibc-update-config+
-   * +cp <output>/build/at91bootstrap3-*/.config board/<manufacturer>/<boardname>/at91bootstrap3.config+
+   * +cp <output>/build/at91bootstrap3-*/.config
+     board/<manufacturer>/<boardname>/at91bootstrap3.config+
    * +make barebox-update-defconfig+
-1. Create +board/<manufacturer>/<boardname>/fs-overlay/+ and fill it
+1. Create +board/<manufacturer>/<boardname>/rootfs-overlay/+ and fill it
    with additional files you need on your rootfs, e.g.
-   +board/<manufacturer>/<boardname>/fs-overlay/etc/inittab+.
+   +board/<manufacturer>/<boardname>/rootfs-overlay/etc/inittab+.
    Set +BR2_ROOTFS_OVERLAY+
-   to +board/<manufacturer>/<boardname>/fs-overlay+.
+   to +board/<manufacturer>/<boardname>/rootfs-overlay+.
 1. Create a post-build script
-   +board/<manufacturer>/<boardname>/post-build.sh+.  Set
+   +board/<manufacturer>/<boardname>/post_build.sh+.  Set
    +BR2_ROOTFS_POST_BUILD_SCRIPT+ to
-   +board/<manufacturer>/<boardname>/post-build.sh+
+   +board/<manufacturer>/<boardname>/post_build.sh+
 1. If additional setuid permissions have to be set or device nodes have
    to be created, create +board/<manufacturer>/<boardname>/device_table.txt+
    and add that path to +BR2_ROOTFS_DEVICE_TABLE+.
+1. If additional user accounts have to be created, create
+   +board/<manufacturer>/<boardname>/users_table.txt+ and add that path
+   to +BR2_ROOTFS_USERS_TABLES+.
+1. To add custom patches to certain packages, set +BR2_GLOBAL_PATCH_DIR+
+   to +board/<manufacturer>/<boardname>/patches/+ and add your patches
+   for each package in a subdirectory named after the package. Each
+   patch should be called +<packagename>-<num>-<description>.patch+.
+1. Specifically for the Linux kernel, there also exists the option
+   +BR2_LINUX_KERNEL_PATCH+ with as main advantage that it can also
+   download patches from a URL. If you do not need this,
+   +BR2_GLOBAL_PATCH_DIR+ is preferred. U-Boot, Barebox, at91bootstrap
+   and at91bootstrap3 also have separate options, but these do not
+   provide any advantage over +BR2_GLOBAL_PATCH_DIR+ and will likely be
+   removed in the future.
+1. If you need to add project-specific packages, create
+   +package/<manufacturer>/+ and place your packages in that
+   directory. Create an overall +<manufacturer>.mk+ file that
+   includes the +.mk+ files of all your packages. Create an overall
+   +Config.in+ file that sources the +Config.in+ files of all your
+   packages. Include this +Config.in+ file from Buildroot's
+   +package/Config.in+ file.
 1. +make savedefconfig+ to save the buildroot configuration.
 1. +cp defconfig configs/<boardname>_defconfig+
-1. To add patches to the linux build, set +BR2_LINUX_KERNEL_PATCH+ to
-   +board/<manufacturer>/<boardname>/patches/linux/+ and add your
-   patches in that directory. Each patch should be called
-   +linux-<num>-<description>.patch+. Similar for U-Boot, barebox,
-   at91bootstrap and at91bootstrap3.
-1. If you need modifications to other packages, or if you need to add
-   packages, do that directly in the +packages/+ directory, following the
-   instructions in xref:adding-packages[].
diff --git a/docs/manual/customize.txt b/docs/manual/customize.txt
--- a/docs/manual/customize.txt
+++ b/docs/manual/customize.txt
@@ -57,4 +57,4 @@
 
 include::customize-packages.txt[]
 
-include::customize-store.txt[]
+include::customize-quick-guide.txt[]
