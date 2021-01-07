From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Date: Thu, 7 Jan 2021 17:59:31 +0100
Subject: [Buildroot] Upgrading LLVM and Clang to version 11.0.0... issue
 with libclc
Message-ID: <1ff5aafd-9aeb-2cf0-8e90-333c7c39cbaa@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm trying to bump up the versions of LLVM, Clang and lld to 11.0.0
instead of 9.x currently. The end goal is to test and share a new
iteration of Matthew Weber's patches for compiler-rt support.

Though the upgrades were effortless, this broke support for libclc which
source code has been included in the llvm-project git repository. The
libclc sources are still available as a separate archive (for projects
such as Buildroot that want to build each component separately), but
configure.py script has been replaced by CMake used by LLVM.

Here's what libclc.mk looks like so far:

################################################################################
#
# libclc
#
################################################################################

# LLVM, Clang, lld and libclc should be version bumped together
LIBCLC_VERSION = 11.0.0
LIBCLC_SITE =
https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LIBCLC_VERSION)
LIBCLC_SOURCE = libclc-$(LIBCLC_VERSION).src.tar.xz
LIBCLC_LICENSE = BSD-like or MIT
LIBCLC_LICENSE_FILES = LICENSE.TXT

LIBCLC_DEPENDENCIES = host-clang host-llvm
LIBCLC_INSTALL_STAGING = YES

$(eval $(cmake-package))

Unfortunately, I haven't managed to build libclc yet. Its configuration
step fails as follows (see the full log at the end of this e-mail):

-- Check for working CLC compiler:
/home/mike/buildroot/output/host/bin/clang -- broken
CMake Error at cmake/CMakeTestCLCCompiler.cmake:40 (message):
? The CLC compiler "/home/mike/buildroot/output/host/bin/clang" is not able
? to compile a simple test program.

How would I be supposed to add CLC support to Clang when the Clang and
LLVM source archives that we build don't contain libclc code?

This sounds like a chicken and egg issue. It would be so much easier to
grab the whole llvm-project sources and compile LLVM and Clang with all
the features that we want. But hey, there must be good reasons for
building components separately.

Thanks in advance for any light shed on this topic...

Cheers,

Michael.

-- 
Michael Opdenacker, CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
