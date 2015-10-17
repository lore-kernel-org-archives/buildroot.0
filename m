From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Oct 2015 15:09:07 +0200
Subject: [Buildroot] [PATCH 0/3] Fix SSP related build failures
Message-ID: <1445087350-4947-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This set of patches aim at fixing the SSP related build failures that
occur with uClibc configurations that don't have SSP support enabled.

The original problem starts when uClibc-ng recently changed the glibc
minor version it pretends to be. Due to this change, gcc know believe
that uClibc always has SSP support (because the corresponding glibc
minor version always has SSP support). This was causing build failures
in programs such as "sudo", which are using SSP support:

  http://autobuild.buildroot.org/results/778/778e6309ba834cc70f8243a4f6c664c0bcaeb7c5/

In order to fix this, we explicitly pass the appropriate autoconf
variable to gcc to tell whether the C library has SSP support or
not. It was already done during gcc-initial (because the C library
isn't available at that time), but is now also done at gcc-final time.

It was tested with:

 - internal toolchain with glibc. SSP support is properly generated,
   and 'sudo' is indeed using it.

 - internal toolchain with uClibc and SSP enabled. Same test: sudo
   builds fine, and uses SSP.

 - internal toolchain with uClibc, SSP disabled. Same test: sudo
   builds fine, but of course doesn't use SSP support.

 - internal toolchain with musl. SSP support is properly generated,
   and 'sudo' is using it.

Best regards,

Thomas

Thomas Petazzoni (3):
  toolchain: like glibc, musl always provides SSP support
  gcc: pass explicit gcc_cv_libc_provides_ssp also to gcc-final
  gcc: simplify musl patches for SSP support

 package/gcc/4.7.4/900-musl-support.patch     | 36 ----------------------------
 package/gcc/4.8.5/900-musl-support.patch     | 36 ----------------------------
 package/gcc/4.9.3/900-musl-support.patch     | 36 ----------------------------
 package/gcc/5.2.0/904-musl-libc-config.patch | 36 ----------------------------
 package/gcc/gcc-final/gcc-final.mk           |  2 ++
 package/gcc/gcc-initial/gcc-initial.mk       |  5 +---
 package/gcc/gcc.mk                           | 10 ++++++++
 toolchain/Config.in                          |  1 +
 8 files changed, 14 insertions(+), 148 deletions(-)

-- 
2.6.2
