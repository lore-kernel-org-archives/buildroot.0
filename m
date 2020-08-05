From: Markus Mayer <mmayer@broadcom.com>
Date: Wed, 5 Aug 2020 11:19:18 -0700
Subject: [Buildroot] Status of LLVM
In-Reply-To: <00b3fc14-ee83-91a4-827d-988b13254bc9@gmail.com>
References: <CAGt4E5vRu+xVXtaze8+6CmWFXSmzJx2PV46bC7STiDnKCqksRw@mail.gmail.com>
 <31f39a1d-1436-0952-43e8-561135e6aa60@gmail.com>
 <e54d173f-533b-1abf-1b74-ea8286fe88a2@gmail.com>
 <20200805173122.0d201e51@windsurf.home>
 <00b3fc14-ee83-91a4-827d-988b13254bc9@gmail.com>
Message-ID: <CAGt4E5uSVzab7EFrLNPEJ8p9=d8hHSJG461DsBqH3W-4RcHXgg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 5 Aug 2020 at 08:55, Romain Naour <romain.naour@gmail.com> wrote:
>
> Hello Thomas,
>
> Le 05/08/2020 ? 17:31, Thomas Petazzoni a ?crit :
> >
> > I think it makes sense to have support for clang in Buildroot, and we
> > can certainly add testing for clang configurations in our autobuilders.
> >
> > The one thing that was still a bit unclear for me is whether it is
> > possible to build a system with just clang, without a gcc compiler at
> > all. Indeed, Buildroot isn't really suited/designed for building two
> > different compilers/toolchains.
>
> From my testing, we can build the kernel on x86, Aarch64 and riscv64 if we use a
> recent enough version (5.7 for riscv64 only with clang 10).
>
> We need the gcc toolchain to provide the libc and other object files
> (crtbegin.o) not provided by LLVM/Clang. But the series replace GCC compiler by
> clang in the package infrastructure, so we can even remove gcc from host
> directory (I tested).

It does generate the equivalents for crtbegin.o and crtend.o for the
native architecture if the project "compiler-rt" is enabled.

$ find . -name \*.o
./lib/clang/10.0.1/lib/linux/clang_rt.crtbegin-i386.o
./lib/clang/10.0.1/lib/linux/clang_rt.crtend-i386.o
./lib/clang/10.0.1/lib/linux/clang_rt.crtbegin-x86_64.o
./lib/clang/10.0.1/lib/linux/clang_rt.crtend-x86_64.o

Of course, that only helps with the host-llvm package and not the
target. There doesn't seem to be an easy way to generate the compiler
runtime for an alternate architecture. I'll see if I can find out why.

FWIW, I used this configuration to build LLVM 10:

LLVM_INSTALL_DIR='/opt/toolchains/llvm-10'
LLVM_PROJECTS='clang;libcxx;libcxxabi;libunwind;compiler-rt;lld;lldb;clang-tools-extra'
LLVM_ARCHS='X86;AArch64;ARM;Mips'

cmake -G Ninja \
    -DCMAKE_CROSSCOMPILING=True \
    -DCMAKE_INSTALL_PREFIX="${LLVM_INSTALL_DIR}" \
    -DLLVM_DEFAULT_TARGET_TRIPLE=x86_64-linux-gnu \
    -DCLANG_DEFAULT_RTLIB=compiler-rt \
    -DLLVM_TARGET_ARCH="x86_64" \
    -DLLVM_TARGETS_TO_BUILD="${LLVM_ARCHS}"  \
    -DLLVM_ENABLE_PROJECTS="${LLVM_PROJECTS}" \
    -DLLVM_LINK_LLVM_DYLIB=ON \
    -DCLANG_DEFAULT_LINKER=lld \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_COMPILER_EXTERNAL_TOOLCHAIN=/opt/toolchains/stbgcc-6.3-1.8 \
    ../llvm

This compiler defaults to generating x86_64 code, but it can also
build for ARM, ARM64, MIPS and MIPS little endian. But it needs a
glibc sys-root and the gcc runtime for those. It needs to be passed
--sysroot, -L and -B to find the proper files when used as
cross-compiler.

Natively, it'll use LLVM's crtbegin and crtend, because
CLANG_DEFAULT_RTLIB=compiler-rt was set. crt1.o, crti.o and crtn.o are
from glibc. It finds those on its own ("Found candidate GCC
installation").

$ /opt/toolchains/llvm-10/bin/clang -o h -v h.c
clang version 10.0.1 (/storage/git/llvm.git
ef32c611aa214dea855364efd7ba451ec5ec3f74)
Target: x86_64-unknown-linux-gnu
Thread model: posix
InstalledDir: /opt/toolchains/llvm-10/bin
Found candidate GCC installation: /usr/lib/gcc/x86_64-linux-gnu/9
Selected GCC installation: /usr/lib/gcc/x86_64-linux-gnu/9
Candidate multilib: .;@m64
Candidate multilib: 32;@m32
Candidate multilib: x32;@mx32
Selected multilib: .;@m64
 "/opt/toolchains/llvm-10/bin/clang-10" -cc1 -triple
x86_64-unknown-linux-gnu -emit-obj -mrelax-all -disable-free
-disable-llvm-verifier -discard-value-names -main-file-name h.c
-mrelocation-model static -mthread-model posix -mframe-pointer=all
-fmath-errno -fno-rounding-math -masm-verbose -mconstructor-aliases
-munwind-tables -target-cpu x86-64 -dwarf-column-info
-fno-split-dwarf-inlining -debugger-tuning=gdb -v -resource-dir
/opt/toolchains/llvm-10/lib/clang/10.0.1 -internal-isystem
/usr/local/include -internal-isystem
/opt/toolchains/llvm-10/lib/clang/10.0.1/include
-internal-externc-isystem /usr/include/x86_64-linux-gnu
-internal-externc-isystem /include -internal-externc-isystem
/usr/include -fdebug-compilation-dir /tmp -ferror-limit 19
-fmessage-length 0 -fgnuc-version=4.2.1 -fobjc-runtime=gcc
-fdiagnostics-show-option -fcolor-diagnostics -faddrsig -o
/tmp/h-a88421.o -x c h.c
clang -cc1 version 10.0.1 based upon LLVM 10.0.1 default target x86_64-linux-gnu
ignoring nonexistent directory "/include"
#include "..." search starts here:
#include <...> search starts here:
 /usr/local/include
 /opt/toolchains/llvm-10/lib/clang/10.0.1/include
 /usr/include/x86_64-linux-gnu
 /usr/include
End of search list.
 "/opt/toolchains/llvm-10/bin/ld.lld" -z relro --hash-style=gnu
--eh-frame-hdr -m elf_x86_64 -dynamic-linker
/lib64/ld-linux-x86-64.so.2 -o h
/usr/lib/gcc/x86_64-linux-gnu/9/../../../x86_64-linux-gnu/crt1.o
/usr/lib/gcc/x86_64-linux-gnu/9/../../../x86_64-linux-gnu/crti.o
/opt/toolchains/llvm-10/lib/clang/10.0.1/lib/linux/clang_rt.crtbegin-x86_64.o
-L/usr/lib/gcc/x86_64-linux-gnu/9
-L/usr/lib/gcc/x86_64-linux-gnu/9/../../../x86_64-linux-gnu
-L/usr/lib/gcc/x86_64-linux-gnu/9/../../../../lib64
-L/lib/x86_64-linux-gnu -L/lib/../lib64 -L/usr/lib/x86_64-linux-gnu
-L/usr/lib/../lib64 -L/usr/lib/x86_64-linux-gnu/../../lib64
-L/usr/lib/gcc/x86_64-linux-gnu/9/../../..
-L/opt/toolchains/llvm-10/bin/../lib -L/lib -L/usr/lib /tmp/h-a88421.o
/opt/toolchains/llvm-10/lib/clang/10.0.1/lib/linux/libclang_rt.builtins-x86_64.a
-lc /opt/toolchains/llvm-10/lib/clang/10.0.1/lib/linux/libclang_rt.builtins-x86_64.a
/opt/toolchains/llvm-10/lib/clang/10.0.1/lib/linux/clang_rt.crtend-x86_64.o
/usr/lib/gcc/x86_64-linux-gnu/9/../../../x86_64-linux-gnu/crtn.o

$ dpkg -S /usr/lib/x86_64-linux-gnu/crtn.o
libc6-dev:amd64: /usr/lib/x86_64-linux-gnu/crtn.o

> We don't need to build a toolchain with Buildroot, we can use an external
> toolchain (I used the Bootlin riscv64 prebuilt toolchain).

We will definitely be using an external toolchain. Rebuilding LLVM (or
GCC) for every target would take way too long. Also, we want to ensure
that there aren't unexpected toolchain upgrades after pulling in new
Buildroot changes.

> For now, we are building host-llvm and host-clang for each build.
> It would be interesting to allow an external prebuilt Clang toolchain.

If you have anything that I can give a try using LLVM as an external
toolchain, I'll gladly give it a try. I'll also look at the patches
you already submitted.

> About bootloaders, I didn't test to build them with clang.
> Maybe for some packages, we still need a gcc compiler.

Regards,
-Markus
