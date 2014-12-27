From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 15:54:15 +0100
Subject: [Buildroot] [PATCH v1 1/2] intel-gpu-tools: new package
In-Reply-To: <1419676309-850-1-git-send-email-tallubko@yahoo.com>
References: <1419676309-850-1-git-send-email-tallubko@yahoo.com>
Message-ID: <20141227155415.1f2dc816@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Tal Lubko,

On Sat, 27 Dec 2014 12:31:48 +0200, Tal Lubko wrote:
> Signed-off-by: Tal Lubko <tallubko@yahoo.com>
> ---
>  package/Config.in                          |  1 +
>  package/intel-gpu-tools/Config.in          | 13 +++++++++++++
>  package/intel-gpu-tools/intel-gpu-tools.mk | 17 +++++++++++++++++
>  3 files changed, 31 insertions(+)
>  create mode 100644 package/intel-gpu-tools/Config.in
>  create mode 100644 package/intel-gpu-tools/intel-gpu-tools.mk

Thanks for this new submission. However, there is still a number of
problems.

First, you sent two patches: one patch adding the package, and one
patch doing the fixes. You should instead send only one patch, adding
the package properly. To re-organize your patch series and merge
several patches into one, you want to learn about "interactive
rebasing" in Git.

Then, for the expression of dependencies in Config.in, the thread
dependency was duplicated. Also, I would suggest to group the "depends
on". A change like this:

@@ -1,17 +1,16 @@
 config BR2_PACKAGE_INTEL_GPU_TOOLS
        bool "intel-gpu-tools"
        select BR2_PACKAGE_LIBDRM
-       depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
-       depends on BR2_LARGEFILE # libdrm & libpciaccess
-       select BR2_PACKAGE_LIBDRM_INTEL
+       depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm, libglib2
+       depends on BR2_LARGEFILE # libdrm, libpciaccess
+       depends on BR2_USE_WCHAR # libglib2
+       depends on BR2_USE_MMU # libglib2
        depends on BR2_i386 || BR2_x86_64 # libdrm-intel
+       depends on BR2_ARCH_HAS_ATOMICS # cairo
+       select BR2_PACKAGE_LIBDRM_INTEL
        select BR2_PACKAGE_CAIRO
        select BR2_PACKAGE_CAIRO_PNG
-       depends on BR2_ARCH_HAS_ATOMICS # cairo
        select BR2_PACKAGE_LIBGLIB2
-       depends on BR2_USE_WCHAR # libglib2
-       depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
-       depends on BR2_USE_MMU # libglib2
        select BR2_PACKAGE_LIBPCIACCESS
 
        help

Then, in Config.in, the comment should only be disabled when it makes
sense. And it doesn't make sense to show it on architectures other than
x86/x86-64, on architectures that don't have a MMU, and on
architectures that don't have atomic operations:

@@ -20,5 +19,8 @@ config BR2_PACKAGE_INTEL_GPU_TOOLS
          https://01.org/linuxgraphics/
 
 comment "intel-gpu-tools needs a toolchain w/ largefile, threads, wchar"
+       depends on BR2_USE_MMU
+       depends on BR2_i386 || BR2_x86_64
+       depends on BR2_ARCH_HAS_ATOMICS
        depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || \
                !BR2_USE_WCHAR

Then, in the intel-gpu-tools.mk file, the
"INTEL_GPU_TOOLS_INSTALL_TARGET = YES" line is useless, since it is the
default, so please remove it.

Also in intel-gpu-tools.mk, please do:

-INTEL_GPU_TOOLS_CONF_OPTS = \
+INTEL_GPU_TOOLS_CONF_OPTS = --disable-selective-werror

The empty line you added was useless, and I instead modified it to pass
--disable-selective-werror. Without this, the build fails due to
-Werror being used, and some warnings appearing in the code.

But the biggest problem is clearly that intel-gpu-tools builds a tool
called intel-gen4asm and later uses it to produce some code.
Unfortunately, it builds it for the target, and then tries to run it on
the host, which cannot work. It might have worked in your case if you
were using a glibc C library for your target, since the intel-gpu-tools
can only be built for x86/x86-64, then the intel-gen4asm tool, even if
built for the target, would run fine on your host machine.

However, if you build for a target that uses uClibc, it fails, with:

make[4]: Entering directory '/home/thomas/projets/buildroot/output/build/intel-gpu-tools-1.9/debugger/system_routine'
./pre_cpp.py ./sr.g4a > sr.cpp.tmp && mv sr.cpp.tmp sr.cpp
./pre_cpp.py ./test.g4a > tiny.cpp.tmp && mv tiny.cpp.tmp tiny.cpp
  CC       eviction_macro.o
  CCLD     eviction_macro
/home/thomas/projets/buildroot/output/host/usr/bin/x86_64-linux-cpp -x assembler-with-cpp -P -DGEN_ASM -DSANDYBRIDGE -I../../lib -I. -o tiny.asm tiny.cpp
../../assembler/intel-gen4asm -g6 -a -b tiny.asm -o tiny.c
make[4]: ../../assembler/intel-gen4asm: Command not found
Makefile:685: recipe for target 'tiny.c' failed
make[4]: *** [tiny.c] Error 127
make[4]: *** Waiting for unfinished jobs....

You can reproduce this issue by using the following Buildroot
configuration:

BR2_x86_64=y
BR2_x86_core2=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-core2-full-2014.11.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_17=y
BR2_TOOLCHAIN_EXTERNAL_LARGEFILE=y
BR2_TOOLCHAIN_EXTERNAL_INET_IPV6=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_INTEL_GPU_TOOLS=y
# BR2_TARGET_ROOTFS_TAR is not set

The possible solutions are:

 * Build a host-intel-gpu-tools package and make sure intel-gpu-tools
   uses the intel-gen4asm binary built by host-intel-gpu-tools.
   Unfortunately, intel-gpu-tools has quite a lot of dependencies, so
   it's a bit annoying to also build all those dependencies for the
   host.

 * Modify the intel-gpu-tools code so that it builds intel-gen4asm with
   the host compiler.

Can you look into this, and post an updated version of the patch?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
