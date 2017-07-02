From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  2 Jul 2017 15:41:03 +0200
Subject: [Buildroot] [PATCH 0/4] Solving the musl dynamic linker issues
Message-ID: <20170702134107.11488-1-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

We currently have two outstanding musl dynamic linker issues:

 1. We don't handle all musl dynamic linker names for all
    architectures. I proposed a patch solving this at
    https://patchwork.ozlabs.org/patch/780411/, where the approach was
    to build a dummy program and use readelf to find the dynamic
    linker name, and therefore the symlink to libc.so that we need to
    create.

 2. We don't support Crosstool-NG musl toolchains, because they put
    libc.so in /usr/lib and not /lib, and therefore our current
    creation logic that makes the dynamic linker point to /lib/libc.so
    incorrect. Ilya Kuzmich <ilya.kuzmich@gmail.com> proposed patches
    (https://patchwork.ozlabs.org/patch/763977/
    https://patchwork.ozlabs.org/patch/748974/) to solve this.

After discussion with Arnout, we realized that all our messy logic for
creating the musl dynamic linker symbolic link is useless. The correct
symbolic link already exists in the original toolchain sysroot, so we
should just copy it from the sysroot, just like we do for glibc/uClibc.

This series of patches implements just that, with the main patch being
PATCH 3/4.

The first patch just adds more external toolchain tests to our runtime
tests infrastructure, to validate that the changes in this series
don't break things.

The second patch prepares the copy_toolchain_lib_root for copying a
symlink in /lib that potentially points to a file in /usr/lib (which
it currently doesn't handle).

The third patch is the core of the solution, basically putting ld*.so*
unconditionally in TOOLCHAIN_EXTERNAL_LIBS.

The fourth patch is a minor refactoring.

Thanks,

Thomas

Thomas Petazzoni (4):
  support/testing: add tests for musl and uclibc toolchains
  toolchain/helpers.mk: re-evaluate DESTDIR in copy_toolchain_lib_root
  toolchain-external: copy ld*.so* for all C libraries
  toolchain-external: also put libgcc_s.so unconditionally in
    TOOLCHAIN_EXTERNAL_LIBS

 support/testing/tests/toolchain/test_external.py   | 75 ++++++++++++++++++++++
 toolchain/helpers.mk                               |  2 +-
 .../toolchain-external/pkg-toolchain-external.mk   | 36 ++---------
 3 files changed, 81 insertions(+), 32 deletions(-)

-- 
2.9.4
