From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  3 Jul 2017 12:18:37 +0200
Subject: [Buildroot] [RFC 0/9] Add llvm/clang + openCL
Message-ID: <20170703101846.1158-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This work is initially based on the series posted on the mailing list by Paul
Cercueil [1] and completed to add a more complete LLVM+Clang stack. Some
additional tools or libraries are missing (compiler-rt, clang-tools-extra...)

The series has been updated to use the latest llvm/clang release (4.0.1) and
taking into account some comments given to the Adrian Perez de Castro series
[2].

So, the five first patches add llvm and clang for the host and the target.
host-llvm and host-clang provide host-compiler and libraries used as
cross-compilation tools.
Target variant provide llvm/clang libraries needed at runtime on the target.

As also noticed by Adian, copy llvm-config (host variant) to STAGING_DIR since
llvm-config provided by llvm target variant can't run on the host.

Also llvm-config (host variant) return include and lib directories for the host
if it's installed in host/usr/bin:

output/host/usr/bin/llvm-config --includedir
output/host/usr/include

When istalled in STAGING_DIR llvm-config return include and lib directories
from STAGING_DIR:

output/staging/usr/bin/llvm-config --includedir
output/staging/usr/include

As soon as we have host-llvm and llvm package, we can enable llvm as the shader
compiler for Radeon video cards (HD6310) when the R600 Gallium driver is used.

The sixth patch add the support for AMDGPU llvm target in order to allow
enabling llvm support in mesa3d.

The last two patches allow to enable openCL in mesa3d using libclc.

This is the first version published on the mailing list for review.

Best regards,
Romain

[1] http://lists.busybox.net/pipermail/buildroot/2015-February/119564.html
    http://patchwork.ozlabs.org/patch/440715/
    http://patchwork.ozlabs.org/patch/440716/

[2] http://lists.busybox.net/pipermail/buildroot/2017-June/194745.html
    http://patchwork.ozlabs.org/patch/777949/
    http://patchwork.ozlabs.org/patch/777947/

Romain Naour (9):
  package/llvm: new host package
  package/clang: new host package
  package/llvm: enable target variant
  package/llvm: RFC: install llvm-config in staging
  package/clang: enable target variant
  package/llvm: add AMDGPU support
  package/mesa3d: enable llvm support
  package/libclc: new package
  package/mesa3d: enable openCL support

 package/Config.in                                  |   2 +
 package/Config.in.host                             |   2 +
 package/clang/Config.in.host                       |   8 +
 package/clang/clang.hash                           |   2 +
 package/clang/clang.mk                             |  57 +++++
 ...y-allow-to-define-llvm-bindir-for-cross-c.patch |  37 +++
 package/libclc/Config.in                           |  10 +
 package/libclc/libclc.mk                           |  40 +++
 package/llvm/Config.in                             |  38 +++
 package/llvm/Config.in.host                        |   8 +
 package/llvm/llvm.hash                             |   2 +
 package/llvm/llvm.mk                               | 285 +++++++++++++++++++++
 package/mesa3d/Config.in                           |  23 ++
 package/mesa3d/mesa3d.mk                           |  24 +-
 14 files changed, 536 insertions(+), 2 deletions(-)
 create mode 100644 package/clang/Config.in.host
 create mode 100644 package/clang/clang.hash
 create mode 100644 package/clang/clang.mk
 create mode 100644 package/libclc/0001-configure.py-allow-to-define-llvm-bindir-for-cross-c.patch
 create mode 100644 package/libclc/Config.in
 create mode 100644 package/libclc/libclc.mk
 create mode 100644 package/llvm/Config.in
 create mode 100644 package/llvm/Config.in.host
 create mode 100644 package/llvm/llvm.hash
 create mode 100644 package/llvm/llvm.mk

-- 
2.9.4
