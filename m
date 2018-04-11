From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Wed, 11 Apr 2018 18:14:48 +0200
Subject: [Buildroot] [PATCH v6 0/4] llvm for mesa3d
Message-ID: <20180411161452.25043-1-valentin.korenblit@smile.fr>
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

Changes v4 -> v5:

The changes suggested after the Buildroot hackathon were applied:

* No Config.in.host for llvm and clang.
* ARM and Aarch64 now in PATCH 1
* Unnecessary comments were removed
* clang-tblgen wasn't being installed in HOST_DIR, now solved
* LLVM_TARGETS_TO_BUILD is now easily extensible for new backends
* llvm-tblgen was being installed on the target, now removed

Changes v5 -> v6:

With LLVM package applied to master and while some bugs are being
fixed, this series provides OpenCL support for AMD GPUs using Gallium
R600 driver.

* LLVM dependencies propagated to clang and libclc
* Use llvm-tblgen from host to cross-compile clang. 
* libclc headers now installed to /usr/local/include


Regards,

Valent?n


Valentin Korenblit (4):
  package/clang: new package
  package/libclc: new package
  package/mesa3d: enable OpenCL support
  package/clinfo: new package

 DEVELOPERS                 |  3 ++
 package/Config.in          |  3 ++
 package/clang/Config.in    | 22 ++++++++++++++
 package/clang/clang.hash   |  3 ++
 package/clang/clang.mk     | 72 ++++++++++++++++++++++++++++++++++++++++++++++
 package/clinfo/Config.in   |  9 ++++++
 package/clinfo/clinfo.hash |  2 ++
 package/clinfo/clinfo.mk   | 23 +++++++++++++++
 package/libclc/Config.in   | 22 ++++++++++++++
 package/libclc/libclc.hash |  3 ++
 package/libclc/libclc.mk   | 42 +++++++++++++++++++++++++++
 package/mesa3d/Config.in   |  8 ++++++
 package/mesa3d/mesa3d.mk   |  9 ++++++
 13 files changed, 221 insertions(+)
 create mode 100644 package/clang/Config.in
 create mode 100644 package/clang/clang.hash
 create mode 100644 package/clang/clang.mk
 create mode 100644 package/clinfo/Config.in
 create mode 100644 package/clinfo/clinfo.hash
 create mode 100644 package/clinfo/clinfo.mk
 create mode 100644 package/libclc/Config.in
 create mode 100644 package/libclc/libclc.hash
 create mode 100644 package/libclc/libclc.mk

-- 
2.14.3
