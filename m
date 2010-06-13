From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Jun 2010 20:50:04 +0200
Subject: [Buildroot] [pull request] Pull request for branch linux-cleanup
Message-ID: <cover.1276454802.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a set of 10 patches that completely rewrites the Linux kernel
compilation process in Buildroot. It is supposed to be applied on top
of the bootloaders-cleanup branch I've sent yesterday.

I've fairly drastically reduced the number of options to configure the
kernel, and particulary removed the horrible mess of version
selection. See the first commit in this branch for what remains in
terms of configuration options for the kernel. As I've removed quite a
few things, I'm interested to know how you're using Buildroot to build
your kernel, and whether this proposal still matches your use cases.

Peter: for me, this patch set is ready for inclusion, unless there are
comments, of course.

Thomas

The following changes since commit fa2a311b7756fc458ae55b5aa90ac865cef6c498:
  Thomas Petazzoni (1):
        linux: fix dependency on mkimage

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot linux-cleanup

Thomas Petazzoni (10):
      New, simpler, infrastructure for building the Linux kernel
      Remove old Linux infrastructure
      iso9660: take into account the linux changes
      module-init-tools: remove support for cross-depmod
      module-init-tools: bump version + convert to autotools
      linux: Add dependency on host-module-init-tools
      Add generic functions to enable/set/disable options in kconfig files
      linux: adjust kernel config according to the Buildroot configuration
      linux: add support for linux26-{menuconfig,xconfig,gconfig} targets
      linux: add support for initramfs

 Config.in                                          |    2 +-
 Makefile                                           |    5 +-
 fs/common.mk                                       |    6 +-
 fs/initramfs/initramfs.mk                          |    2 +
 fs/iso9660/Config.in                               |    4 +-
 fs/iso9660/iso9660.mk                              |    6 +-
 linux/Config.in                                    |  129 +++++
 linux/linux.mk                                     |  169 +++++++
 package/Makefile.package.in                        |   15 +
 ...nit-tools-3.11-add-manpages-config-option.patch |   47 ++
 .../module-init-tools-remove-index.patch           |   12 -
 package/module-init-tools/module-init-tools.mk     |  124 +-----
 package/module-init-tools/module-init-tools.patch  |   77 ---
 target/Makefile.in                                 |   16 -
 target/linux/Config.in                             |   33 --
 target/linux/Config.in.advanced                    |  463 -----------------
 target/linux/Config.in.versions                    |   62 ---
 target/linux/Makefile.in                           |  250 ---------
 target/linux/Makefile.in.advanced                  |  532 --------------------
 19 files changed, 385 insertions(+), 1569 deletions(-)
 create mode 100644 linux/Config.in
 create mode 100644 linux/linux.mk
 create mode 100644 package/module-init-tools/module-init-tools-3.11-add-manpages-config-option.patch
 delete mode 100644 package/module-init-tools/module-init-tools-remove-index.patch
 delete mode 100644 package/module-init-tools/module-init-tools.patch
 delete mode 100644 target/linux/Config.in
 delete mode 100644 target/linux/Config.in.advanced
 delete mode 100644 target/linux/Config.in.versions
 delete mode 100644 target/linux/Makefile.in
 delete mode 100644 target/linux/Makefile.in.advanced

Thanks,
-- 
Thomas Petazzoni
