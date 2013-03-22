From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 22 Mar 2013 10:40:45 +0100
Subject: [Buildroot] [PATCH 4/5] Enable ccache for cmake packages
In-Reply-To: <CAHXCMMJmuv42YoAPmo=c5G-mdOMU6dkLdPxG=ftvQvS+vXuDGA@mail.gmail.com>
References: <1362590066-5448-1-git-send-email-luca@lucaceresoli.net>
 <1362590066-5448-5-git-send-email-luca@lucaceresoli.net>
 <CAHXCMMKpKo_jagngfJFDHPKfiMeUb3+zx5wZ++tg81OjwQ_8iA@mail.gmail.com>
 <5149EEA6.1010702@lucaceresoli.net> <514B89E1.4000206@lucaceresoli.net>
 <CAHXCMMJmuv42YoAPmo=c5G-mdOMU6dkLdPxG=ftvQvS+vXuDGA@mail.gmail.com>
Message-ID: <514C271D.7010207@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel Martin wrote:
> Hi Lucas,
>
> 2013/3/21 Luca Ceresoli <luca@lucaceresoli.net>:
>> Luca Ceresoli wrote:
> [...]
>> Oh, now I see, this happens when trying to assemble a .s file.
>> With -DCMAKE_VERBOSE_MAKEFILE=ON you can see it does the wrong thing:
>>
>>>>>> rpi-userland 5e9a740a88a889dfc8a18bb1b00c17e5dd9d0108 Configuring
>>> (cd
>>> /home/murray/devel/buildroot/output/build/rpi-userland-5e9a740a88a889dfc8a18bb1b00c17e5dd9d0108/
>>> && rm -f CMakeCache.txt &&
>>> /home/murray/devel/buildroot/output/host/usr/bin/cmake
>>> /home/murray/devel/buildroot/output/build/rpi-userland-5e9a740a88a889dfc8a18bb1b00c17e5dd9d0108/
>>> -DCMAKE_TOOLCHAIN_FILE="/home/murray/devel/buildroot/output/host/usr/share/buildroot/toolchainfile.cmake"
>>> -DCMAKE_INSTALL_PREFIX="/usr" -DVMCS_INSTALL_PREFIX=/usr )
>>> Re-run cmake no build system arguments
>>> -- The C compiler identification is GNU 4.7.3
>>> -- The CXX compiler identification is GNU 4.7.3
>>> -- Check for working C compiler:
>>> /home/murray/devel/buildroot/output/host/usr/bin/ccache
>>> -- Check for working C compiler:
>>> /home/murray/devel/buildroot/output/host/usr/bin/ccache -- works
>>> -- Detecting C compiler ABI info
>>> -- Detecting C compiler ABI info - done
>>> -- Check for working CXX compiler:
>>> /home/murray/devel/buildroot/output/host/usr/bin/ccache
>>> -- Check for working CXX compiler:
>>> /home/murray/devel/buildroot/output/host/usr/bin/ccache -- works
>>> -- Detecting CXX compiler ABI info
>>> -- Detecting CXX compiler ABI info - done
>>> -- Looking for execinfo.h
>>> -- Looking for execinfo.h - found
>>> -- The ASM compiler identification is GNU
>>> -- Found assembler:
>>> /home/murray/devel/buildroot/output/host/usr/bin/ccache
>>> CMake Warning at interface/usbdk/CMakeLists.txt:2 (message):
>>>    usbdk: using stubbed out hostreq, HDMI buttons and gestures code
>>>
>>>
>>> -- Configuring done
>>> -- Generating done
>>> -- Build files have been written to:
>>> /home/murray/devel/buildroot/output/build/rpi-userland-5e9a740a88a889dfc8a18bb1b00c17e5dd9d0108
>>> touch
>>> /home/murray/devel/buildroot/output/build/rpi-userland-5e9a740a88a889dfc8a18bb1b00c17e5dd9d0108/.stamp_configured
>>>>>> rpi-userland 5e9a740a88a889dfc8a18bb1b00c17e5dd9d0108 Building
>> ...
>>> [  1%] Building C object
>>> interface/vcos/pthreads/CMakeFiles/vcos.dir/vcos_pthreads.c.o
>>> cd
>>> /home/murray/devel/buildroot/output/build/rpi-userland-5e9a740a88a889dfc8a18bb1b00c17e5dd9d0108/interface/vcos/pthreads
>>> && /home/murray/devel/buildroot/output/host/usr/bin/ccache
>>> /home/murray/devel/buildroot/output/host/usr/bin/arm-linux-gnueabihf-gcc
>>> <blah blah>
>> ...
>>>
>>> [ 17%] Building ASM object
>>> interface/khronos/CMakeFiles/khrn_client.dir/common/khrn_int_hash_asm.s.o
>>> cd
>>> /home/murray/devel/buildroot/output/build/rpi-userland-5e9a740a88a889dfc8a18bb1b00c17e5dd9d0108/interface/khronos
>>> && /home/murray/devel/buildroot/output/host/usr/bin/ccache
>>> -DEGL_SERVER_DISPMANX -DHAVE_CMAKE_CONFIG <blah blah>
>>
>> Note in the above line the assembler executable is missing.
>> Apparently CMake automagically set CMAKE_ASM_COMPILER equal to
>> CMAKE_C_COMPILER or so, but it looks like CMAKE_ASM_COMPILER_ARG1 is empty.
>>
>> So I set CMAKE_ASM_COMPILER{,_ARG1}just like I did for C and CXX:
> AFAIK, ccache only supports C, C++, Objective-C and Objective-C++.
> So, I think, it is useless to set it for anything else.

Ouch, right!
The fix is as easy as:
 >     set(CMAKE_ASM_COMPILER $(TARGET_CC_NOCCACHE))\n\

Now when ccache is enabled it all works OK.

> BTW, I also use to set most of the binutils/gcc binaries in my CMake
> toolchain files,
> this includes setting the following variables:
> CMAKE_{LINKER,AR,RANDLIB,NM,OBJCOPY,OBJDUMP,STRIP}.
>
> So, IMHO, it is not stupid to set CMAKE_ASM_COMPILER as well, though I
> never need it so far.
>
> [...]
>> Now it compiles correctly but with two bad side effects.
>>
>> First, when building without ccache, CMake detects /usr/bin/cc as the
>> (supposedly cross-) compiler, leading to an obvious link failure.
>> Ok, this can be worked around by generating a different
>> toolchainfile.cmake for the ccache and non-ccache cases, although it
>> is annoying.
> Well, here I use to conditionnaly enable ccache if found using
> something like this:
>
> --
> find_program(CCACHE "ccache")
> if (CCACHE)
>    message( STATUS "Using ccache")
> endif(CCACHE)
>
> if (CCACHE AND NOT FORCE_NO_CCACHE)
>    set(CMAKE_C_COMPILER "${CCACHE}" CACHE FILEPATH "" FORCE)
>    set(CMAKE_CXX_COMPILER "${CCACHE}" CACHE FILEPATH "" FORCE)
>    set(CMAKE_C_COMPILER_ARG1 "${HOST_DIR}/usr/bin/${TARGET_TUPLE}-gcc")
>    set(CMAKE_CXX_COMPILER_ARG1 "${HOST_DIR}/usr/bin/${TARGET_TUPLE}-g++")
> else(CCACHE AND NOT FORCE_NO_CCACHE)
>    set(CMAKE_C_COMPILER "${HOST_DIR}/usr/bin/${TARGET_TUPLE}-gcc")
>    set(CMAKE_CXX_COMPILER "${HOST_DIR}/usr/bin/${TARGET_TUPLE}-g++")
> endif(CCACHE AND NOT FORCE_NO_CCACHE)
> --

I'm not following you here. This would require patching the
CMakeLists.txt file for every CMake package, right?

If we want to solve this cleanly, it should be in the BR infrastructure.
I think we shouldgenerate the toolchainfile.cmakefile with a different
content for the two cases (ccache/no-ccache). But we also should generate
it unconditionally at every build, in case the user changes the BR2_CCACHE
setting.

Luca
