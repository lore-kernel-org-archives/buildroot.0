From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 20 Mar 2013 18:15:18 +0100
Subject: [Buildroot] [PATCH 4/5] Enable ccache for cmake packages
In-Reply-To: <CAHXCMMKpKo_jagngfJFDHPKfiMeUb3+zx5wZ++tg81OjwQ_8iA@mail.gmail.com>
References: <1362590066-5448-1-git-send-email-luca@lucaceresoli.net>
 <1362590066-5448-5-git-send-email-luca@lucaceresoli.net>
 <CAHXCMMKpKo_jagngfJFDHPKfiMeUb3+zx5wZ++tg81OjwQ_8iA@mail.gmail.com>
Message-ID: <5149EEA6.1010702@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel Martin wrote:
 > Hi Lucas,
 >
 > 2013/3/6 Luca Ceresoli <luca@lucaceresoli.net>:
 >> CMake fails in detecting the compiler when ccache is used. Add a wrapper
 >> script to make it happy.
 >
 > It is possible to do this without any wrapper, setting
 > CMAKE_C_COMPILER and CMAKE_CXX_COMPILER to the ccache binary path, and
 > CMAKE_C_COMPILER_ARG1 and CMAKE_CXX_COMPILER_ARG1 to the actual
 > C-compiler, respectively to the C++-compiler.

Do you meansomething like this?

  $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
         @mkdir -p $(@D)
         @echo -en "\
         set(CMAKE_SYSTEM_NAME Linux)\n\
-       set(CMAKE_C_COMPILER $(TARGET_CC_NOCCACHE))\n\
-       set(CMAKE_CXX_COMPILER $(TARGET_CXX_NOCCACHE))\n\
+       set(CMAKE_C_COMPILER $(CCACHE))\n\
+       set(CMAKE_CXX_COMPILER $(CCACHE))\n\
+       set(CMAKE_C_COMPILER_ARG1 $(TARGET_CC_NOCCACHE))\n\
+       set(CMAKE_CXX_COMPILER_ARG1 $(TARGET_CXX_NOCCACHE))\n\
         set(CMAKE_C_FLAGS \"\$${CMAKE_C_FLAGS} $(TARGET_CFLAGS)\" CACHE 
STRING \"Buildroot CFLAGS\" FORCE)\n\
         set(CMAKE_CXX_FLAGS \"\$${CMAKE_CXX_FLAGS} $(TARGET_CXXFLAGS)\" 
CACHE STRING \"Buildroot CXXFLAGS\" F
         set(CMAKE_INSTALL_SO_NO_EXE 0)\n\
         set(CMAKE_PROGRAM_PATH \"$(HOST_DIR)/usr/bin\")\n\

This is undocumented in the official CMake manual, yet OpenWRT uses it,
so it looks like a serious thing. And it actually works, except it breaks
rpi-userland:


$ LANG= make V=1 rpi-userland{-dirclean,}
...
 >>> rpi-userland 5e9a740a88a889dfc8a18bb1b00c17e5dd9d0108 Configuring
(cd 
/home/murray/devel/buildroot/output/build/rpi-userland-5e9a740a88a889dfc8a18bb1b00c17e5dd9d0108/ 
&& rm -f CMakeCache.txt && 
/home/murray/devel/buildroot/output/host/usr/bin/cmake 
/home/murray/devel/buildroot/output/build/rpi-userland-5e9a740a88a889dfc8a18bb1b00c17e5dd9d0108/ 
-DCMAKE_TOOLCHAIN_FILE="/home/murray/devel/buildroot/output/host/usr/share/buildroot/toolchainfile.cmake" 
-DCMAKE_INSTALL_PREFIX="/usr" -DVMCS_INSTALL_PREFIX=/usr )
Re-run cmake no build system arguments
-- The C compiler identification is GNU 4.7.3
-- The CXX compiler identification is GNU 4.7.3
...
 >>> rpi-userland 5e9a740a88a889dfc8a18bb1b00c17e5dd9d0108 Building
PATH="/home/murray/devel/buildroot/output/host/bin:/home/murray/devel/buildroot/output/host/usr/bin:/home/murray/devel/buildroot/output/host/usr/sbin/:/home/murray/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games" 
PERLLIB="/home/murray/devel/buildroot/output/host/usr/lib/perl" 
/usr/bin/make -j8  -C 
/home/murray/devel/buildroot/output/build/rpi-userland-5e9a740a88a889dfc8a18bb1b00c17e5dd9d0108/
...
[  8%] [  8%] /home/murray/devel/buildroot/output/host/usr/bin/cmake -E 
cmake_progress_report 
/home/murray/devel/buildroot/output/build/rpi-userland-5e9a740a88a889dfc8a18bb1b00c17e5dd9d0108/CMakeFiles
/home/murray/devel/buildroot/output/host/usr/bin/ccache: invalid option 
-- 'D'
Usage:
     ccache [options]
     ccache compiler [compiler options]
     compiler [compiler options]          (via symbolic link)

Options:
     -c, --cleanup         delete old files and recalculate size counters
                           (normally not needed as this is done 
automatically)
     -C, --clear           clear the cache completely
     -F, --max-files=N     set maximum number of files in cache to N 
(use 0 for
                           no limit)
     -M, --max-size=SIZE   set maximum size of cache to SIZE (use 0 for no
                           limit; available suffixes: G, M and K; default
                           suffix: G)
     -s, --show-stats      show statistics summary
     -z, --zero-stats      zero statistics counters

     -h, --help            print this help text
     -V, --version         print version and copyright information

See also <http://ccache.samba.org>.
make[3]: *** 
[interface/khronos/CMakeFiles/khrn_client.dir/common/khrn_int_hash_asm.s.o] 
Error 1
...


I don't know if rpi-userland is doing something wrong or the _ARG1
implementation is unreliable. I'll investigate on that, but if you
have any clues they would be helpful. I am no CMake guru.

Luca
