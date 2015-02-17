From: Paul Cercueil <paul@crapouillou.net>
Date: Tue, 17 Feb 2015 23:02:54 +0100
Subject: [Buildroot] [RFC] LLVM
Message-ID: <1424210576-18526-1-git-send-email-paul@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This set of patches adds a very preliminary support for compiling a LLVM
cross-compiler within Buildroot.

While this is not the full LLVM+Clang stack, it already permits to compile
LLVM bitcode into executables.

For instance, to compile a helloworld for a mipsel CPU (using my PC's "clang"
as it is not yet available in Buildroot):

clang hello.c -target mipsel-buildroot-linux-uclibc -c -emit-llvm -o hello.bc
mipsel-buildroot-linux-uclibc-llc hello.bc -o hello.S
mipsel-buildroot-linux-uclibc-gcc hello.S -o hello

Note that this requires host-binutils v2.24 (at least for MIPS).

The second patch adds support for LLVM to the Mesa3d package. It permits to
use LLVM as the shader compiler for Radeon video cards when the R600 Gallium
driver is used. This is mostly for reference to demonstrate how the LLVM
cross-compiler can be also used by the cross-compiled packages.
