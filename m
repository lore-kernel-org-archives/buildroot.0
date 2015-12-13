From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 14:07:30 +0100
Subject: [Buildroot] [PATCH v2] assimp: new package
In-Reply-To: <1449440276-6133-1-git-send-email-ps.report@gmx.net>
References: <1449440276-6133-1-git-send-email-ps.report@gmx.net>
Message-ID: <20151213140730.70890ee3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Sun,  6 Dec 2015 23:17:55 +0100, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ----
> Changes v1 -> v2:
>   - use github helper (thanks to J?rg Krause)

It seems that it needs a C++ compiler, so you need to add this
dependency, otherwise the build fails with:

CMake Error at CMakeLists.txt:3 (PROJECT):
  The CMAKE_CXX_COMPILER:

    /home/thomas/projets/outputs/assimp-minimal/host/usr/bin/arm-linux-g++

  is not a full path to an existing compiler tool.

  Tell CMake where to find the compiler by setting either the environment
  variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full path
  to the compiler, or to the compiler name if it is in the PATH.

Also, it fails to build with musl, with the following error:

In file included from /home/thomas/projets/outputs/assimp-musl/build/assimp-v3.2/contrib/irrXML/irrXML.cpp:10:0:
/home/thomas/projets/outputs/assimp-musl/build/assimp-v3.2/contrib/irrXML/irrString.h: In member function ?irr::core::string<char_type> irr::io::CXMLReaderImpl<char_type, superclass>::replaceSpecialCharacters(irr::core::string<char_type>&) [with char_type = char; superclass = irr::io::IXMLBase]?:
/home/thomas/projets/outputs/assimp-musl/build/assimp-v3.2/contrib/irrXML/irrString.h:639:3: warning: assuming signed overflow does not occur when assuming that (X + c) < X is always false [-Wstrict-overflow]
   if (allocated < used)
   ^
[ 96%] Linking CXX shared library ../lib/libassimp.so
/home/thomas/projets/outputs/assimp-musl/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-musleabihf/4.9.3/../../../../arm-buildroot-linux-musleabihf/bin/ld: ../lib/libzlibstatic.a(compress.o): relocation R_ARM_MOVW_ABS_NC against `a local symbol' can not be used when making a shared object; recompile with -fPIC
../lib/libzlibstatic.a: error adding symbols: Bad value
collect2: error: ld returned 1 exit status
code/CMakeFiles/assimp.dir/build.make:4307: recipe for target 'lib/libassimp.so.3.2.0' failed
make[4]: *** [lib/libassimp.so.3.2.0] Error 1
CMakeFiles/Makefile2:172: recipe for target 'code/CMakeFiles/assimp.dir/all' failed
make[3]: *** [code/CMakeFiles/assimp.dir/all] Error 2
Makefile:127: recipe for target 'all' failed
make[2]: *** [all] Error 2
package/pkg-generic.mk:196: recipe for target '/home/thomas/projets/outputs/assimp-musl/build/assimp-v3.2/.stamp_built' failed
make[1]: *** [/home/thomas/projets/outputs/assimp-musl/build/assimp-v3.2/.stamp_built] Error 2
Makefile:16: recipe for target '_all' failed
make: *** [_all] Error 2

Defconfig to reproduce:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_EABIHF=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-musl-2015.11-rc1-71-g90d1299.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_3=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_ASSIMP=y
# BR2_TARGET_ROOTFS_TAR is not set

Can you look into these issues and send an updated version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
