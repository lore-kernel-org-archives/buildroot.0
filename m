From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 1 Oct 2016 00:07:34 +0200
Subject: [Buildroot] [PATCH] package/opencv3: fix CMAKE_CXX_FLAGS
In-Reply-To: <CAMo8BfLX2teRjUXNyjhgc73F5Qt6OviZBr+ShMcPXq+e5_6kig@mail.gmail.com>
References: <1475088032-30321-1-git-send-email-jcmvbkbc@gmail.com>
 <20160929112736.27dc4474@free-electrons.com>
 <CAMo8BfKyMkgwNih1MSGh+qrKtRMob4_j8neOi3v4e5xEaJKnBg@mail.gmail.com>
 <20160930101034.4adf4d7e@free-electrons.com>
 <CAMo8BfLX2teRjUXNyjhgc73F5Qt6OviZBr+ShMcPXq+e5_6kig@mail.gmail.com>
Message-ID: <CAHXCMM+jmUvDWGebiNyTfyAy=eOGtQFFtJndt1m5N84J6u6+pw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Fri, Sep 30, 2016 at 6:32 PM, Max Filippov <jcmvbkbc@gmail.com> wrote:
> On Fri, Sep 30, 2016 at 1:10 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> On Thu, 29 Sep 2016 09:14:41 -0700, Max Filippov wrote:
>>> > There is something fishy going on here. Indeed,
>>> > support/misc/toolchainfile.cmake.in contains:
>>> >
>>> >   set(CMAKE_CXX_FLAGS "@@TARGET_CXXFLAGS@@ ${CMAKE_CXX_FLAGS}" CACHE STRING "Buildroot CXXFLAGS")
>>> >
>>> > So it should normally always prefix CMAKE_CXX_FLAGS with
>>> > TARGET_CXXFLAGS. Can you check the toolchain.cmake file that gets
>>> > generated during your build? Does it contains the Xtensa specific
>>> > CXXFLAGS ?
>>>
>>> Yes, it does.
>>
>> So if it does, why is your patch necessary? I'm not following here.
>> Do you mean that the Xtensa-specific flags are present in the
>> toolchain.cmake file, but are in the end not used during the build ?
>
> Right. The file
>   host/usr/share/buildroot/toolchainfile.cmake
> exists and contains the following (correct) lines:
>
> set(CMAKE_C_FLAGS "-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -Os
> ${CMAKE_C_FLAGS}" CACHE STRING "Buildroot CFLAGS")
> set(CMAKE_CXX_FLAGS "-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -Os
> ${CMAKE_CXX_FLAGS}" CACHE STRING "Buildroot CXXFLAGS")
>
> But the file
>   build/opencv3-3.1.0/CMakeCache.txt
> that governs opencv3 build contains the following lines:
>
> //Buildroot CXXFLAGS
> CMAKE_CXX_FLAGS:STRING=-latomic
> //Buildroot CFLAGS
> CMAKE_C_FLAGS:STRING='-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -Os '
>
> Below is the output that I see during the failing opencv3 build:
>
> --     C++ flags (Release):         -latomic   -fsigned-char -W -Wall
> -Werror=return-type -Werror=non-virtual-dtor -Werror=address
> -Werror=sequence-point -Wformat -Werror=format-security
> -Wmissing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow
> -Wsign-promo -Wno-narrowing -Wno-delete-non-virtual-dtor
> -fdiagnostics-show-option -pthread -fomit-frame-pointer
> -ffunction-sections -fvisibility=hidden -fvisibility-inlines-hidden
> -O3 -DNDEBUG  -DNDEBUG
> --     C++ flags (Debug):           -latomic   -fsigned-char -W -Wall
> -Werror=return-type -Werror=non-virtual-dtor -Werror=address
> -Werror=sequence-point -Wformat -Werror=format-security
> -Wmissing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow
> -Wsign-promo -Wno-narrowing -Wno-delete-non-virtual-dtor
> -fdiagnostics-show-option -pthread -fomit-frame-pointer
> -ffunction-sections -fvisibility=hidden -fvisibility-inlines-hidden -g
>  -O0 -DDEBUG -D_DEBUG
> --     C Compiler:
> /home/jcmvbkbc/tmp/br/build-20160928-reproduce-opencv/host/usr/bin/xtensa-linux-gcc
> --     C flags (Release):           -D_LARGEFILE_SOURCE
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls
> -mauto-litpools -Os    -fsigned-char -W -Wall -Werror=return-type
> -Werror=non-virtual-dtor -Werror=address -Werror=sequence-point
> -Wformat -Werror=format-security -Wmissing-declarations
> -Wmissing-prototypes -Wstrict-prototypes -Wundef -Winit-self
> -Wpointer-arith -Wshadow -Wno-narrowing -fdiagnostics-show-option
> -pthread -fomit-frame-pointer -ffunction-sections -fvisibility=hidden
> -O3 -DNDEBUG  -DNDEBUG
> --     C flags (Debug):             -D_LARGEFILE_SOURCE
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls
> -mauto-litpools -Os    -fsigned-char -W -Wall -Werror=return-type
> -Werror=non-virtual-dtor -Werror=address -Werror=sequence-point
> -Wformat -Werror=format-security -Wmissing-declarations
> -Wmissing-prototypes -Wstrict-prototypes -Wundef -Winit-self
> -Wpointer-arith -Wshadow -Wno-narrowing -fdiagnostics-show-option
> -pthread -fomit-frame-pointer -ffunction-sections -fvisibility=hidden
> -g  -O0 -DDEBUG -D_DEBUG
>
> Notice the difference between the C and the C++ flags.

Indeed, there is a bug in the way we are currently setting/expending
{C,CXX}FLAGS in the CMake toolchain file.
I'll post a patch fixing it quickly.

Regards,

-- 
Samuel
