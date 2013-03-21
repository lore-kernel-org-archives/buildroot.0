From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 21 Mar 2013 23:29:53 +0100
Subject: [Buildroot] [PATCH 4/5] Enable ccache for cmake packages
In-Reply-To: <5149EEA6.1010702@lucaceresoli.net>
References: <1362590066-5448-1-git-send-email-luca@lucaceresoli.net>
 <1362590066-5448-5-git-send-email-luca@lucaceresoli.net>
 <CAHXCMMKpKo_jagngfJFDHPKfiMeUb3+zx5wZ++tg81OjwQ_8iA@mail.gmail.com>
 <5149EEA6.1010702@lucaceresoli.net>
Message-ID: <514B89E1.4000206@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca Ceresoli wrote:
> Samuel Martin wrote:
> > Hi Lucas,
> >
> > 2013/3/6 Luca Ceresoli <luca@lucaceresoli.net>:
> >> CMake fails in detecting the compiler when ccache is used. Add a 
> wrapper
> >> script to make it happy.
> >
> > It is possible to do this without any wrapper, setting
> > CMAKE_C_COMPILER and CMAKE_CXX_COMPILER to the ccache binary path, and
> > CMAKE_C_COMPILER_ARG1 and CMAKE_CXX_COMPILER_ARG1 to the actual
> > C-compiler, respectively to the C++-compiler.
>
> Do you meansomething like this?
>
>  $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
>         @mkdir -p $(@D)
>         @echo -en "\
>         set(CMAKE_SYSTEM_NAME Linux)\n\
> -       set(CMAKE_C_COMPILER $(TARGET_CC_NOCCACHE))\n\
> -       set(CMAKE_CXX_COMPILER $(TARGET_CXX_NOCCACHE))\n\
> +       set(CMAKE_C_COMPILER $(CCACHE))\n\
> +       set(CMAKE_CXX_COMPILER $(CCACHE))\n\
> +       set(CMAKE_C_COMPILER_ARG1 $(TARGET_CC_NOCCACHE))\n\
> +       set(CMAKE_CXX_COMPILER_ARG1 $(TARGET_CXX_NOCCACHE))\n\
>         set(CMAKE_C_FLAGS \"\$${CMAKE_C_FLAGS} $(TARGET_CFLAGS)\" 
> CACHE STRING \"Buildroot CFLAGS\" FORCE)\n\
>         set(CMAKE_CXX_FLAGS \"\$${CMAKE_CXX_FLAGS} 
> $(TARGET_CXXFLAGS)\" CACHE STRING \"Buildroot CXXFLAGS\" F
>         set(CMAKE_INSTALL_SO_NO_EXE 0)\n\
>         set(CMAKE_PROGRAM_PATH \"$(HOST_DIR)/usr/bin\")\n\
>
> This is undocumented in the official CMake manual, yet OpenWRT uses it,
> so it looks like a serious thing. And it actually works, except it breaks
> rpi-userland:
>
>
> $ LANG= make V=1 rpi-userland{-dirclean,}
> ...
> >>> rpi-userland 5e9a740a88a889dfc8a18bb1b00c17e5dd9d0108 Configuring
> (cd 
> /home/murray/devel/buildroot/output/build/rpi-userland-5e9a740a88a889dfc8a18bb1b00c17e5dd9d0108/ 
> && rm -f CMakeCache.txt && 
> /home/murray/devel/buildroot/output/host/usr/bin/cmake 
> /home/murray/devel/buildroot/output/build/rpi-userland-5e9a740a88a889dfc8a18bb1b00c17e5dd9d0108/ 
> -DCMAKE_TOOLCHAIN_FILE="/home/murray/devel/buildroot/output/host/usr/share/buildroot/toolchainfile.cmake" 
> -DCMAKE_INSTALL_PREFIX="/usr" -DVMCS_INSTALL_PREFIX=/usr )
> Re-run cmake no build system arguments
> -- The C compiler identification is GNU 4.7.3
> -- The CXX compiler identification is GNU 4.7.3
> ...
> >>> rpi-userland 5e9a740a88a889dfc8a18bb1b00c17e5dd9d0108 Building
> PATH="/home/murray/devel/buildroot/output/host/bin:/home/murray/devel/buildroot/output/host/usr/bin:/home/murray/devel/buildroot/output/host/usr/sbin/:/home/murray/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games" 
> PERLLIB="/home/murray/devel/buildroot/output/host/usr/lib/perl" 
> /usr/bin/make -j8  -C 
> /home/murray/devel/buildroot/output/build/rpi-userland-5e9a740a88a889dfc8a18bb1b00c17e5dd9d0108/
> ...
> [  8%] [  8%] /home/murray/devel/buildroot/output/host/usr/bin/cmake 
> -E cmake_progress_report 
> /home/murray/devel/buildroot/output/build/rpi-userland-5e9a740a88a889dfc8a18bb1b00c17e5dd9d0108/CMakeFiles
> /home/murray/devel/buildroot/output/host/usr/bin/ccache: invalid 
> option -- 'D'
> Usage:
>     ccache [options]
>     ccache compiler [compiler options]
>     compiler [compiler options]          (via symbolic link)
>
> Options:
>     -c, --cleanup         delete old files and recalculate size counters
>                           (normally not needed as this is done 
> automatically)
>     -C, --clear           clear the cache completely
>     -F, --max-files=N     set maximum number of files in cache to N 
> (use 0 for
>                           no limit)
>     -M, --max-size=SIZE   set maximum size of cache to SIZE (use 0 for no
>                           limit; available suffixes: G, M and K; default
>                           suffix: G)
>     -s, --show-stats      show statistics summary
>     -z, --zero-stats      zero statistics counters
>
>     -h, --help            print this help text
>     -V, --version         print version and copyright information
>
> See also <http://ccache.samba.org>.
> make[3]: *** 
> [interface/khronos/CMakeFiles/khrn_client.dir/common/khrn_int_hash_asm.s.o] 
> Error 1
> ...

Oh, now I see, this happens when trying to assemble a .s file.
With -DCMAKE_VERBOSE_MAKEFILE=ON you can see it does the wrong thing:

> >>> rpi-userland 5e9a740a88a889dfc8a18bb1b00c17e5dd9d0108 Configuring
> (cd 
> /home/murray/devel/buildroot/output/build/rpi-userland-5e9a740a88a889dfc8a18bb1b00c17e5dd9d0108/ 
> && rm -f CMakeCache.txt && 
> /home/murray/devel/buildroot/output/host/usr/bin/cmake 
> /home/murray/devel/buildroot/output/build/rpi-userland-5e9a740a88a889dfc8a18bb1b00c17e5dd9d0108/ 
> -DCMAKE_TOOLCHAIN_FILE="/home/murray/devel/buildroot/output/host/usr/share/buildroot/toolchainfile.cmake" 
> -DCMAKE_INSTALL_PREFIX="/usr" -DVMCS_INSTALL_PREFIX=/usr )
> Re-run cmake no build system arguments
> -- The C compiler identification is GNU 4.7.3
> -- The CXX compiler identification is GNU 4.7.3
> -- Check for working C compiler: 
> /home/murray/devel/buildroot/output/host/usr/bin/ccache
> -- Check for working C compiler: 
> /home/murray/devel/buildroot/output/host/usr/bin/ccache -- works
> -- Detecting C compiler ABI info
> -- Detecting C compiler ABI info - done
> -- Check for working CXX compiler: 
> /home/murray/devel/buildroot/output/host/usr/bin/ccache
> -- Check for working CXX compiler: 
> /home/murray/devel/buildroot/output/host/usr/bin/ccache -- works
> -- Detecting CXX compiler ABI info
> -- Detecting CXX compiler ABI info - done
> -- Looking for execinfo.h
> -- Looking for execinfo.h - found
> -- The ASM compiler identification is GNU
> -- Found assembler: 
> /home/murray/devel/buildroot/output/host/usr/bin/ccache
> CMake Warning at interface/usbdk/CMakeLists.txt:2 (message):
>   usbdk: using stubbed out hostreq, HDMI buttons and gestures code
>
>
> -- Configuring done
> -- Generating done
> -- Build files have been written to: 
> /home/murray/devel/buildroot/output/build/rpi-userland-5e9a740a88a889dfc8a18bb1b00c17e5dd9d0108
> touch 
> /home/murray/devel/buildroot/output/build/rpi-userland-5e9a740a88a889dfc8a18bb1b00c17e5dd9d0108/.stamp_configured
> >>> rpi-userland 5e9a740a88a889dfc8a18bb1b00c17e5dd9d0108 Building
...
> [  1%] Building C object 
> interface/vcos/pthreads/CMakeFiles/vcos.dir/vcos_pthreads.c.o
> cd 
> /home/murray/devel/buildroot/output/build/rpi-userland-5e9a740a88a889dfc8a18bb1b00c17e5dd9d0108/interface/vcos/pthreads 
> && /home/murray/devel/buildroot/output/host/usr/bin/ccache 
> /home/murray/devel/buildroot/output/host/usr/bin/arm-linux-gnueabihf-gcc 
> <blah blah>
...
>
> [ 17%] Building ASM object 
> interface/khronos/CMakeFiles/khrn_client.dir/common/khrn_int_hash_asm.s.o
> cd 
> /home/murray/devel/buildroot/output/build/rpi-userland-5e9a740a88a889dfc8a18bb1b00c17e5dd9d0108/interface/khronos 
> && /home/murray/devel/buildroot/output/host/usr/bin/ccache 
> -DEGL_SERVER_DISPMANX -DHAVE_CMAKE_CONFIG <blah blah>

Note in the above line the assembler executable is missing.
Apparently CMake automagically set CMAKE_ASM_COMPILER equal to
CMAKE_C_COMPILER or so, but it looks like CMAKE_ASM_COMPILER_ARG1 is empty.

So I set CMAKE_ASM_COMPILER{,_ARG1}just like I did for C and CXX:

-       set(CMAKE_C_COMPILER $(TARGET_CC_NOCCACHE))\n\
-       set(CMAKE_CXX_COMPILER $(TARGET_CXX_NOCCACHE))\n\
+       set(CMAKE_ASM_COMPILER $(CCACHE))\n\
+       set(CMAKE_C_COMPILER $(CCACHE))\n\
+       set(CMAKE_CXX_COMPILER $(CCACHE))\n\
+       set(CMAKE_ASM_COMPILER_ARG1 $(TARGET_CC_NOCCACHE))\n\
+       set(CMAKE_C_COMPILER_ARG1 $(TARGET_CC_NOCCACHE))\n\
+       set(CMAKE_CXX_COMPILER_ARG1 $(TARGET_CXX_NOCCACHE))\n\

Now it compiles correctly but with two bad side effects.

First, when building without ccache, CMake detects /usr/bin/cc as the
(supposedly cross-) compiler, leading to an obvious link failure.
Ok, this can be worked around by generating a different
toolchainfile.cmake for the ccache and non-ccache cases, although it
is annoying.

Second, during both the staging install and the target install phases,
it complains saying:

 > Re-run cmake: build system dependency is missing
 > -- The ASM compiler identification is unknown
 > -- Found assembler: 
/home/murray/devel/buildroot/output/host/usr/bin/ccache
 > -- Warning: Did not find file Compiler/-ASM
 > CMake Warning at interface/usbdk/CMakeLists.txt:2 (message):
 >   usbdk: using stubbed out hostreq, HDMI buttons and gestures code
 >
 >
 > -- Configuring done
 > -- Generating done
 > -- Build files have been written to: 
/home/murray/devel/buildroot/output/build/rpi-userland-5e9a740a88a889dfc8a18bb1b00c17e5dd9d0108

and recompiles the whole package again. These amount to three
compilations! And they are ccached separately, so the first compilation
actually takes an unreasonably long time. Well, during subsequent
compilations with a full ccache the time loss is not more than 15
seconds on a dual core i5, but this clearly shows something is not
working properly.

Samuel, your idea was certainly good, but I think CMake is thinking
too much instead of just doing what it should... the result is a mess
I have no time to dig into. I guess I'll stay with my stupid (but
working) shell wrappers for the moment. :-(

Luca
