From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Sep 2009 14:47:35 +0200
Subject: [Buildroot] [git commit master] Remove the "project" feature
Message-ID: <20090919152747.4F56477737@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=397fe5cc0b091c997794d755d27a72848ad210ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The "project" feature was designed to allow to several projects to be
built inside the same Buildroot source tree and allowing the toolchain
and non-configurable packages to be shared between the different
projects on the same architecture. While being interesting in theory,
this feature adds a level of complexity to Buildroot, both from an
user perspective and from a developer perspective, while one of the
main Buildroot strengh is to be simple. Moreover, this feature is only
seldomly used by our users.

From a user-level perspective, this for example allows to remove the
project_build_ARCH directory, which was very confusing. The
autotools-stamps directory is also removed, since these stamps are
back at their normal location.

Description of the changes involved :

 * project/, directory removed

 * Makefile

    - Don't include project/Makefile.in and project/project.mk anymore

    - Grab a copy of the contents of project/Makefile.in at the
      location it was imported, but remove the definition related to
      PROJECT_BUILD_DIR. The TARGET_DIR is now in
      $(BUILD_DIR)/target_dir

    - Remove the creation/removal of the $(PROJECT_BUILD_DIR) and
      $(PROJECT_BUILD_DIR)/autotools-stamps directories

    - Don't make world depends on target-host-info. This target was
      defined by project/project.mk to customize /etc/issue,
      /etc/hostname and create /etc/br-version depending on the
      project definitions. We can of course imagine re-adding such a
      feature later.

    - Replace PROJECT_BUILD_DIR by BUILD_DIR everywhere

    - Remove the update, log and lognr.$(PROJECT) target, they were
      specific to the project feature.

 * package/Makefile.autotools.in

    - Replace PROJECT_BUILD_DIR by BUILD_DIR for the location of the
      configure cache

    - Move the INSTALL_TARGET and HOOK_POST_INSTALL stamps to the same
      directory as the other stamps (i.e, in the package directory).

 * package/Makefile.in

    - Replace PROJECT_BUILD_DIR by BUILD_DIR for the location of the
      configure cache

 * package/at/at.mk,
   package/busybox/busybox.mk,
   package/busybox/initramfs.mk,
   package/customize/customize.mk,
   package/linux-fusion/linux-fusion.mk,
   package/ltp-testsuite/ltp-testsuite.mk,
   package/nfs-utils/nfs-utils.mk,
   target/cpio/cpioroot.mk,
   target/cramfs/cramfs.mk,
   target/device/Atmel/DataFlashBoot/DataflashBoot.mk,
   target/device/Atmel/Makefile.in,
   target/device/Atmel/at91bootstrap/at91bootstrap.mk,
   target/device/KwikByte/Makefile.in,
   target/ext2/ext2root.mk,
   target/initramfs/initramfs.mk,
   target/iso9660/iso9660.mk,
   target/jffs2/jffs2root.mk,
   target/linux/Makefile.in,
   target/romfs/romfs.mk,
   target/squashfs/squashfsroot.mk,
   target/tar/tarroot.mk,
   target/ubifs/ubifsroot.mk

    - Replace PROJECT_BUILD_DIR by BUILD_DIR

 * target/device/Config.in

    - Do not include project/Config.in anymore

 * target/linux/Makefile.in.advanced

    - Replace PROJECT_BUILD_DIR by BUILD_DIR

    - Store the stamps file in $(STAMP_DIR) instead of
      $(PROJECT_BUILD_DIR)/autotools-stamps

 * target/u-boot/Makefile.in

    - Replace PROJECT_BUILD_DIR by BUILD_DIR

    - Remove $(PROJECT) from the U-Boot target binary name

    - Remove the insertion in the configuration of the project name as
      the hostname

    - The u-boot-autoscript target now generates
      $(U_BOOT_AUTOSCRIPT).img instead of
      $(U_BOOT_AUTOSCRIPT).$(PROJECT)

 * toolchain/gcc/gcc-uclibc-3.x.mk
   toolchain/gcc/gcc-uclibc-4.x.mk

    - Move the stamps files to $(STAMP_DIR)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Patch is too large, so refusing to show it
