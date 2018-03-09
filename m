From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Fri,  9 Mar 2018 17:49:33 +0100
Subject: [Buildroot] [PATCH v3 0/6] llvm for mesa3d
Message-ID: <20180309164939.16075-1-valentin.korenblit@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

This series provides llvm support for Mesa 3D.

With respect to the previous two versions, the biggest change is that
it now provides a full installation of host-llvm. The reason for this
is explained in PATCH 1/6.


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

Regards,

Valent?n

Valentin Korenblit (6):
  package/llvm: new host package
  package/llvm: enable target variant
  package/llvm: enable AMDGPU
  package/mesa3d: enable llvm support
  package/llvm: enable ARM
  package/llvm: enable AArch64

 package/Config.in           |   1 +
 package/Config.in.host      |   1 +
 package/llvm/Config.in      |  31 +++++
 package/llvm/Config.in.host |   8 ++
 package/llvm/llvm.hash      |   3 +
 package/llvm/llvm.mk        | 302 ++++++++++++++++++++++++++++++++++++++++++++
 package/mesa3d/Config.in    |   8 ++
 package/mesa3d/mesa3d.mk    |  17 ++-
 8 files changed, 368 insertions(+), 3 deletions(-)
 create mode 100644 package/llvm/Config.in
 create mode 100644 package/llvm/Config.in.host
 create mode 100644 package/llvm/llvm.hash
 create mode 100644 package/llvm/llvm.mk

-- 
2.14.3
