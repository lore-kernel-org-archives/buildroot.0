From: Mark Corbin <mark.corbin@embecosm.com>
Date: Wed, 12 Sep 2018 11:22:50 +0100
Subject: [Buildroot] [PATCH v2 0/6] Add RISC-V 64-bit architecture support
Message-ID: <20180912102256.3164-1-mark.corbin@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch set adds support for the RISC-V 64-bit architecture.

Full RISC-V support is not expected in the upstream kernel until
the 4.19 release. As a result the ability to select custom toolchain
headers has been added. This allows a RISC-V toolchain to be built
against kernel headers from a git repository without having to build
a kernel.

A new method for overriding the BR2_GCC_TARGET_* settings has been
added. These variables are copied to corresponding GCC_TARGET_*
variables which may then be modified using architecture specific
makefiles (arch/arch.mk.<arch>). This allows a custom architecture
string to be built for the RISC-V from the various optional ISA
extensions. All package makefiles that were using the BR2_GCC_TARGET_*
variables have been updated to use the GCC_TARGET_* versions. Any new
makefiles must use the new variables.

The default glibc library paths for RISC-V are /lib64/<abi> and
/usr/lib64/<abi>. An architecture specific patch has been applied
to glibc.mk to override these settings and allow shared libraries to
be located by packages at runtime.

The riscv-pk (Proxy Kernel) package has been added to provide the
Berkeley Boot Loader (BBL) for booting RISC-V kernels.

A new defconfig has been added which can build a qemu-bootable
RISC-V 64-bit system.

Mark Corbin (6):
  linux: add hash file
  package/linux-headers: add support for custom headers
  arch: allow GCC target options to be optionally overwritten
  arch: add support for RISC-V 64-bit (riscv64) architecture
  boot/riscv-pk: add bootloader for RISC-V architecture
  configs/qemu: add qemu_riscv64_virt_defconfig

 DEVELOPERS                                    |   7 ++
 Makefile                                      |   5 +-
 arch/Config.in                                |  15 +++
 arch/Config.in.riscv                          | 104 ++++++++++++++++++
 arch/arch.mk                                  |  17 +++
 arch/arch.mk.riscv                            |  30 +++++
 board/qemu/riscv64-virt/linux.config          |  23 ++++
 board/qemu/riscv64-virt/readme.txt            |   7 ++
 boot/Config.in                                |   1 +
 boot/riscv-pk/Config.in                       |  13 +++
 boot/riscv-pk/riscv-pk.mk                     |  33 ++++++
 configs/qemu_riscv64_virt_defconfig           |  24 ++++
 linux/linux.hash                              |   9 ++
 package/binutils/Config.in.host               |   2 +
 package/ffmpeg/ffmpeg.mk                      |   8 +-
 package/freerdp/freerdp.mk                    |   2 +-
 package/gcc/gcc.mk                            |  27 ++---
 package/glibc/glibc.mk                        |  30 +++--
 package/kodi/kodi.mk                          |   2 +-
 package/kvm-unit-tests/kvm-unit-tests.mk      |   2 +-
 package/linux-headers/Config.in.host          |  45 +++++++-
 package/linux-headers/linux-headers.hash      |   1 +
 package/linux-headers/linux-headers.mk        |  94 +++++++++-------
 package/meson/meson.mk                        |   2 +-
 package/nodejs/nodejs.mk                      |   2 +-
 package/tvheadend/tvheadend.mk                |   2 +-
 package/valgrind/valgrind.mk                  |   2 +-
 toolchain/toolchain-buildroot/Config.in       |   6 +-
 .../pkg-toolchain-external.mk                 |  22 ++--
 29 files changed, 447 insertions(+), 90 deletions(-)
 create mode 100644 arch/Config.in.riscv
 create mode 100644 arch/arch.mk
 create mode 100644 arch/arch.mk.riscv
 create mode 100644 board/qemu/riscv64-virt/linux.config
 create mode 100644 board/qemu/riscv64-virt/readme.txt
 create mode 100644 boot/riscv-pk/Config.in
 create mode 100644 boot/riscv-pk/riscv-pk.mk
 create mode 100644 configs/qemu_riscv64_virt_defconfig
 create mode 100644 linux/linux.hash
 create mode 120000 package/linux-headers/linux-headers.hash

-- 
2.17.1
