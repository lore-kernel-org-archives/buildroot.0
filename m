From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 31 Jul 2020 13:40:51 -0700
Subject: [Buildroot] [PATCH 0/9] package/libselinux: kernel munging fixups
Message-ID: <20200731204100.1171427-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

There are currently two issues with our current kernel munging implimentation
for libselinux:

1) As of kernel 5.1, CONFIG_SECURITY_SELINUX no longer enables SELinux.
   Instead, the kernel now has the new option CONFIG_LSM, which is a
   comma-separated list of linux-security modules in which the kernel enables
   in order.

  The first patch sets CONFIG_LSM to "selinux" to fix SELinux not starting on
  kernels >= 5.1.

2) Many filesystems need SELinux support explicitly enabled in the kernel for
   SELinux to work correctly. The subsequent patches check the config options
   BR2_TARGET_ROOTFS_${FS_NAME} and then set the necessary kernel options to
   enable SELinux support for the given enabled filesystems.

  However, I have chosen not to go so far as to enable the filesystem itself in
  the kernel, as this seems to not be the standard practice in Buildroot.

  It would also greatly complicate the logic, as ext2 has to be enabled for a
  user to select ext4 support. If a user were to select ext4, then the
  libselinux package would enable ext2 and ext4, which may not be desirable.

With these patches, if a user selects the libselinux and refpolicy packages,
then they will get a system that boots with selinux running, which is a
massive improvement over what happens now.


Adam Duskett (9):
  package/libselinux: set the config_lsm kernel config option to selinux
  package/libselinux: enable kernel selinux support for erofs images
  package/libselinux: enable kernel selinux support for ext2 images
  package/libselinux: enable kernel selinux support for ext3 images
  package/libselinux: enable kernel selinux support for ext4 images
  package/libselinux: enable kernel selinux support for f2fs images
  package/libselinux: enable kernel selinux support for jffs2 images
  package/libselinux: enable kernel selinux support for squashfs images
  package/libselinux: enable kernel selinux support for ubifs images

 package/libselinux/libselinux.mk | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

-- 
2.26.2
