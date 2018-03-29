From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Thu, 29 Mar 2018 13:33:35 +0200
Subject: [Buildroot] [PATCH v4 00/11] llvm for mesa3d
Message-ID: <20180329113346.10367-1-valentin.korenblit@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

This series provides llvm support for Mesa 3D:


Changes v1 -> v2:

The series has been simplified:

*Build only backend for target architecture by default.
*Support for AMDGPU(PATCH 3/4 in v1) was removed because I cannot test
it currently. 
*Host: make options modified to build only llvm-config and llvm-tblgen
(reduces drastically build time for host).
*Target: support only x86 currently (tested), I will test on ARM soon.

Changes v2 -> v3:

* Full installation of LLVM (tools and libLLVM.so) for the host.
* Disable Mesa 3D static linking, it now links with shared lib.
* Options to disable building each tool one by one were removed.
* Support for AMDGPU.
* Support for ARM and AArch64.
*-DLLVM_HOST_TRIPLE=$(GNU_TARGET_NAME) added. This fixes the error:
"No available targets are compatible with this triple" for llvmpipe.

Changes v3 -> v4:

This series is focused on OpenCL support

* Add Clang for host (needed to build libclc)
* Add Clang for target (libOpenCL needs libclang and libLLVM)
* Add libclc
* Add OpenCL support in Mesa3D
* Add package clinfo

Regards,

Valent?n


Valentin Korenblit (11):
  package/llvm: new host package
  package/llvm: enable target variant
  package/llvm: enable AMDGPU
  package/mesa3d: enable llvm support
  package/llvm: enable ARM
  package/llvm: enable AArch64
  package/clang: new host package
  package/clang: enable target variant
  package/libclc: new package
  package/mesa3d: enable OpenCL support
  package/clinfo: new package

 DEVELOPERS                   |   6 +
 package/Config.in            |   4 +
 package/Config.in.host       |   2 +
 package/clang/Config.in      |   8 ++
 package/clang/Config.in.host |   8 ++
 package/clang/clang.hash     |   3 +
 package/clang/clang.mk       |  70 ++++++++++
 package/clinfo/Config.in     |   7 +
 package/clinfo/clinfo.hash   |   2 +
 package/clinfo/clinfo.mk     |  23 ++++
 package/libclc/Config.in     |   9 ++
 package/libclc/libclc.mk     |  38 ++++++
 package/llvm/Config.in       |  29 +++++
 package/llvm/Config.in.host  |   8 ++
 package/llvm/llvm.hash       |   3 +
 package/llvm/llvm.mk         | 302 +++++++++++++++++++++++++++++++++++++++++++
 package/mesa3d/Config.in     |  24 ++++
 package/mesa3d/mesa3d.mk     |  24 +++-
 18 files changed, 568 insertions(+), 2 deletions(-)
 create mode 100644 package/clang/Config.in
 create mode 100644 package/clang/Config.in.host
 create mode 100644 package/clang/clang.hash
 create mode 100644 package/clang/clang.mk
 create mode 100644 package/clinfo/Config.in
 create mode 100644 package/clinfo/clinfo.hash
 create mode 100644 package/clinfo/clinfo.mk
 create mode 100644 package/libclc/Config.in
 create mode 100644 package/libclc/libclc.mk
 create mode 100644 package/llvm/Config.in
 create mode 100644 package/llvm/Config.in.host
 create mode 100644 package/llvm/llvm.hash
 create mode 100644 package/llvm/llvm.mk

-- 
2.14.3
