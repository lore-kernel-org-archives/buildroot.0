From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 14:51:26 +0200
Subject: [Buildroot] [PATCH v6 1/4] package/clang: new package
In-Reply-To: <20180411161452.25043-2-valentin.korenblit@smile.fr>
References: <20180411161452.25043-1-valentin.korenblit@smile.fr>
 <20180411161452.25043-2-valentin.korenblit@smile.fr>
Message-ID: <20180428145126.4bf9c0b4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Valentin,

On Wed, 11 Apr 2018 18:14:49 +0200, Valentin Korenblit wrote:
> This patch provides Clang tools and libraries for the host and libclang
> for the target.
> 
> host-clang is needed to build libclc, which is also provided in a follup patch.
> 
> We need libclang for the target because it is used by most of OpenCL implementations.
> 
> A later patch in this series will enable Clover, the OpenCl implementation part
> of Mesa3D, which requires libclang.
> 
> clang-tblgen must be copied to HOST_DIR as it is not installed by default but is needed
> for cross-compilation: http://lists.llvm.org/pipermail/cfe-dev/2015-June/043318.html
> 
> Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
> ---
>  DEVELOPERS               |  1 +
>  package/Config.in        |  1 +
>  package/clang/Config.in  | 22 +++++++++++++++
>  package/clang/clang.hash |  3 ++
>  package/clang/clang.mk   | 72 ++++++++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 99 insertions(+)
>  create mode 100644 package/clang/Config.in
>  create mode 100644 package/clang/clang.hash
>  create mode 100644 package/clang/clang.mk

I've applied to master, after doing the following changes:

    [Thomas:
     - Add Config.in comment about BR2_TOOLCHAIN_HAS_GCC_BUG_64735
     - Minor reformatting/rewrapping of comments in .mk file]

However, I've noticed that a lot of stuff gets installed in the target,
which doesn't seem very useful (see below). At least the heders
in /usr/lib/clang don't see very useful. There's a bunch of Python
script and Javascript files as well. Do you think some of these could
be removed, perhaps through post-install target hooks ?

`-- usr
    |-- bin
    |   |-- c-index-test
    |   |-- git-clang-format
    |   |-- scan-build
    |   `-- scan-view
    |-- lib
    |   |-- LLVMHello.so
    |   |-- clang
    |   |   `-- 5.0.1
    |   |       `-- include
    |   |           |-- __clang_cuda_builtin_vars.h
    |   |           |-- __clang_cuda_cmath.h
    |   |           |-- __clang_cuda_complex_builtins.h
    |   |           |-- __clang_cuda_intrinsics.h
    |   |           |-- __clang_cuda_math_forward_declares.h
    |   |           |-- __clang_cuda_runtime_wrapper.h
    |   |           |-- __stddef_max_align_t.h
    |   |           |-- __wmmintrin_aes.h
    |   |           |-- __wmmintrin_pclmul.h
    |   |           |-- adxintrin.h
    |   |           |-- altivec.h
    |   |           |-- ammintrin.h
    |   |           |-- arm_acle.h
    |   |           |-- arm_neon.h
    |   |           |-- armintr.h
    |   |           |-- avx2intrin.h
    |   |           |-- avx512bwintrin.h
    |   |           |-- avx512cdintrin.h
    |   |           |-- avx512dqintrin.h
    |   |           |-- avx512erintrin.h
    |   |           |-- avx512fintrin.h
    |   |           |-- avx512ifmaintrin.h
    |   |           |-- avx512ifmavlintrin.h
    |   |           |-- avx512pfintrin.h
    |   |           |-- avx512vbmiintrin.h
    |   |           |-- avx512vbmivlintrin.h
    |   |           |-- avx512vlbwintrin.h
    |   |           |-- avx512vlcdintrin.h
    |   |           |-- avx512vldqintrin.h
    |   |           |-- avx512vlintrin.h
    |   |           |-- avx512vpopcntdqintrin.h
    |   |           |-- avxintrin.h
    |   |           |-- bmi2intrin.h
    |   |           |-- bmiintrin.h
    |   |           |-- clflushoptintrin.h
    |   |           |-- clzerointrin.h
    |   |           |-- cpuid.h
    |   |           |-- cuda_wrappers
    |   |           |   |-- algorithm
    |   |           |   |-- complex
    |   |           |   `-- new
    |   |           |-- emmintrin.h
    |   |           |-- f16cintrin.h
    |   |           |-- float.h
    |   |           |-- fma4intrin.h
    |   |           |-- fmaintrin.h
    |   |           |-- fxsrintrin.h
    |   |           |-- htmintrin.h
    |   |           |-- htmxlintrin.h
    |   |           |-- ia32intrin.h
    |   |           |-- immintrin.h
    |   |           |-- intrin.h
    |   |           |-- inttypes.h
    |   |           |-- iso646.h
    |   |           |-- limits.h
    |   |           |-- lwpintrin.h
    |   |           |-- lzcntintrin.h
    |   |           |-- mm3dnow.h
    |   |           |-- mm_malloc.h
    |   |           |-- mmintrin.h
    |   |           |-- module.modulemap
    |   |           |-- msa.h
    |   |           |-- mwaitxintrin.h
    |   |           |-- nmmintrin.h
    |   |           |-- opencl-c.h
    |   |           |-- pkuintrin.h
    |   |           |-- pmmintrin.h
    |   |           |-- popcntintrin.h
    |   |           |-- prfchwintrin.h
    |   |           |-- rdseedintrin.h
    |   |           |-- rtmintrin.h
    |   |           |-- s390intrin.h
    |   |           |-- shaintrin.h
    |   |           |-- smmintrin.h
    |   |           |-- stdalign.h
    |   |           |-- stdarg.h
    |   |           |-- stdatomic.h
    |   |           |-- stdbool.h
    |   |           |-- stddef.h
    |   |           |-- stdint.h
    |   |           |-- stdnoreturn.h
    |   |           |-- tbmintrin.h
    |   |           |-- tgmath.h
    |   |           |-- tmmintrin.h
    |   |           |-- unwind.h
    |   |           |-- vadefs.h
    |   |           |-- varargs.h
    |   |           |-- vecintrin.h
    |   |           |-- wmmintrin.h
    |   |           |-- x86intrin.h
    |   |           |-- xmmintrin.h
    |   |           |-- xopintrin.h
    |   |           |-- xsavecintrin.h
    |   |           |-- xsaveintrin.h
    |   |           |-- xsaveoptintrin.h
    |   |           |-- xsavesintrin.h
    |   |           `-- xtestintrin.h
    |   |-- libLLVM-5.0.1.so -> libLLVM-5.0.so
    |   |-- libLLVM-5.0.so
    |   |-- libLLVM.so -> libLLVM-5.0.so
    |   |-- libLTO.so -> libLTO.so.5
    |   |-- libLTO.so.5 -> libLTO.so.5.0.1
    |   |-- libLTO.so.5.0.1
    |   |-- libclang.so -> libclang.so.5
    |   |-- libclang.so.5 -> libclang.so.5.0
    |   |-- libclang.so.5.0
    |   |-- libstdc++.so.6 -> libstdc++.so.6.0.22
    |   |-- libstdc++.so.6.0.22
    |   |-- libstdc++.so.6.0.22-gdb.py
    |   `-- os-release
    |-- lib64 -> lib
    |-- libexec
    |   |-- c++-analyzer
    |   `-- ccc-analyzer
    |-- sbin
    `-- share
        |-- clang
        |   |-- bash-autocomplete.sh
        |   |-- clang-format-bbedit.applescript
        |   |-- clang-format-diff.py
        |   |-- clang-format-sublime.py
        |   |-- clang-format.el
        |   |-- clang-format.py
        |   |-- clang-rename.el
        |   `-- clang-rename.py
        |-- opt-viewer
        |   |-- opt-diff.py
        |   |-- opt-stats.py
        |   |-- opt-viewer.py
        |   |-- optpmap.py
        |   |-- optrecord.py
        |   `-- style.css
        |-- scan-build
        |   |-- scanview.css
        |   `-- sorttable.js
        `-- scan-view
            |-- FileRadar.scpt
            |-- GetRadarVersion.scpt
            |-- Reporter.py
            |-- ScanView.py
            |-- bugcatcher.ico
            `-- startfile.py

Also, I must say I was impressed by the size of the libLLVM and
libclang libraries. libLLVM is 23MB, while libclang is 22MB. What seems
weird however is that libclang is not linked against libLLVM:

$ readelf -d libclang.so.5.0   

Dynamic section at offset 0x15ebbd0 contains 31 entries:
  Tag        Type                         Name/Value
 0x0000000000000001 (NEEDED)             Shared library: [libstdc++.so.6]
 0x0000000000000001 (NEEDED)             Shared library: [libgcc_s.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [ld64-uClibc.so.1]
 0x000000000000000e (SONAME)             Library soname: [libclang.so.5]
 0x000000000000001d (RUNPATH)            Library runpath: []

Is libclang statically linked against libLLVM, causing a huge
duplication of code size ?

Looking at the build output of libclang, it indeed seems like it uses
the .a libraries from LLVM, and not the dynamic library. So the LLVM
code is present twice: once in libLLVM.so, and a second time in
libclang.so. This isn't nice at all. Could you look into this ?

I've pasted the command line used by the clang package to produce its
libclang.so library at http://code.bulix.org/li1n6r-325499?raw. You can
see it uses the LLVM .a files directly.

My defconfig was:

BR2_x86_64=y
BR2_x86_core2=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-core2-full-2018.02-891-g046c5e2.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_16=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_CLANG=y
# BR2_TARGET_ROOTFS_TAR is not set

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
