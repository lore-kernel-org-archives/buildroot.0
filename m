From: Luca Ceresoli <list@lucaceresoli.net>
Date: Fri, 22 Mar 2013 23:41:34 +0100
Subject: [Buildroot] [PATCH 4/5] Enable ccache for cmake packages
In-Reply-To: <CAHXCMMJcUDVKP38GZ_-roGCfuTrCLyxUJRqGh1HC-Fe5yRakkQ@mail.gmail.com>
References: <1362590066-5448-1-git-send-email-luca@lucaceresoli.net>
 <1362590066-5448-5-git-send-email-luca@lucaceresoli.net>
 <CAHXCMMKpKo_jagngfJFDHPKfiMeUb3+zx5wZ++tg81OjwQ_8iA@mail.gmail.com>
 <5149EEA6.1010702@lucaceresoli.net> <514B89E1.4000206@lucaceresoli.net>
 <CAHXCMMJmuv42YoAPmo=c5G-mdOMU6dkLdPxG=ftvQvS+vXuDGA@mail.gmail.com>
 <514C271D.7010207@lucaceresoli.net>
 <CAHXCMMJcUDVKP38GZ_-roGCfuTrCLyxUJRqGh1HC-Fe5yRakkQ@mail.gmail.com>
Message-ID: <514CDE1E.8040107@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel Martin wrote:
> Lucas,
>
> 2013/3/22 Luca Ceresoli <luca@lucaceresoli.net>:
>> Samuel Martin wrote:
>>> Hi Lucas,
>>>
>>> 2013/3/21 Luca Ceresoli <luca@lucaceresoli.net>:
> [...]
>>> AFAIK, ccache only supports C, C++, Objective-C and Objective-C++.
>>> So, I think, it is useless to set it for anything else.
>>
>> Ouch, right!
>> The fix is as easy as:
>>>      set(CMAKE_ASM_COMPILER $(TARGET_CC_NOCCACHE))\n\
>> Now when ccache is enabled it all works OK.
>>
>>
>>> BTW, I also use to set most of the binutils/gcc binaries in my CMake
>>> toolchain files,
>>> this includes setting the following variables:
>>> CMAKE_{LINKER,AR,RANDLIB,NM,OBJCOPY,OBJDUMP,STRIP}.
>>>
>>> So, IMHO, it is not stupid to set CMAKE_ASM_COMPILER as well, though I
>>> never need it so far.
>>>
>>> [...]
>>>> Now it compiles correctly but with two bad side effects.
>>>>
>>>> First, when building without ccache, CMake detects /usr/bin/cc as the
>>>> (supposedly cross-) compiler, leading to an obvious link failure.
>>>> Ok, this can be worked around by generating a different
>>>> toolchainfile.cmake for the ccache and non-ccache cases, although it
>>>> is annoying.
>>> Well, here I use to conditionnaly enable ccache if found using
>>> something like this:
>>>
>>> --
>>> find_program(CCACHE "ccache")
>>> if (CCACHE)
>>>     message( STATUS "Using ccache")
>>> endif(CCACHE)
>>>
>>> if (CCACHE AND NOT FORCE_NO_CCACHE)
>>>     set(CMAKE_C_COMPILER "${CCACHE}" CACHE FILEPATH "" FORCE)
>>>     set(CMAKE_CXX_COMPILER "${CCACHE}" CACHE FILEPATH "" FORCE)
>>>     set(CMAKE_C_COMPILER_ARG1 "${HOST_DIR}/usr/bin/${TARGET_TUPLE}-gcc")
>>>     set(CMAKE_CXX_COMPILER_ARG1 "${HOST_DIR}/usr/bin/${TARGET_TUPLE}-g++")
>>> else(CCACHE AND NOT FORCE_NO_CCACHE)
>>>     set(CMAKE_C_COMPILER "${HOST_DIR}/usr/bin/${TARGET_TUPLE}-gcc")
>>>     set(CMAKE_CXX_COMPILER "${HOST_DIR}/usr/bin/${TARGET_TUPLE}-g++")
>>> endif(CCACHE AND NOT FORCE_NO_CCACHE)
>>> --
>>
>> I'm not following you here. This would require patching the
>> CMakeLists.txt file for every CMake package, right?
> Nope, just the toolchainfile.cmake.
> And when ccache is disabled, we can just force it by setting
> FORCE_NO_CCACHE in the CMake infra.

Ahh, now I got you idea! Thanks!

I worked on it, and although it was a bit tricky (probably because of my
limited experience with CMake) it seems to be working.
Even if it is not yet fully tested, I'm submitting a v2 patch now to let you
have a preliminary look at this work.

Luca
