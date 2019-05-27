From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 27 May 2019 23:03:29 +0200
Subject: [Buildroot] [PATCH v2 05/12] package/flare-engine: fix
 BUG_85180 build timeout
In-Reply-To: <72277a65-f760-226c-0f65-3658b2751390@micronovasrl.com>
References: <20190521133932.81841-1-giulio.benetti@micronovasrl.com>
 <20190521133932.81841-6-giulio.benetti@micronovasrl.com>
 <20190524215853.4ee3ddbc@windsurf.home>
 <6fbb9a9d-b836-97dd-5bd2-f9d3dcb06a57@micronovasrl.com>
 <20190524223027.6d05ee4c@windsurf.home>
 <72277a65-f760-226c-0f65-3658b2751390@micronovasrl.com>
Message-ID: <a183161b-648b-7e13-7f06-6a6a9a973354@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27/05/2019 19:20, Giulio Benetti wrote:
> Hello Thomas,
> 
> Il 24/05/2019 22:30, Thomas Petazzoni ha scritto:
>> On Fri, 24 May 2019 22:05:12 +0200
>> Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
>>
>>>> Why does flare-engine need this, but not jasper, which is also a
>>>> CMake-based package ?
>>>
>>> Because in flare-engine CMakeLists.txt there is no fallback to -O0, so
>>> that was the only decent way to force CMake to generate Makefiles
>>> without optimizations.
>>
>> Could you be more specific ? How does it work for jasper and
>> libcpprestsdk, which are also based on CMake ?
> 
> Yes, the problem here is that even if there's the way to append something to
> CMAKE_CXX_FLAGS, then any other CMAKE_CXX_FLAGS_* will be appended, so if I set
> CMAKE_CXX_FLAGS to -O0, I will obtain "-O0 -O2 -g".
> 
> This is due to the fact that we fall into one of the cases of the next if-elseif
> statements(in CMakeLists.txt):
> "
> if(CMAKE_BUILD_TYPE STREQUAL "Release")
> ? set(CMAKE_CXX_FLAGS_RELEASE "-O2 -g0")

 Note that you could also get away without overriding CMAKE_BUILD_TYPE, and just
setting CMAKE_CXX_FLAGS_RELEASE. Definitions passed on the command line will
override the ones in CMakeFiles.txt (at least, I think so...).

 However, since we now still set CMAKE_BUILD_TYPE based on BR2_ENABLE_DEBUG,
that won't work :-(


> ? if(MINGW)
> ??? set(CMAKE_CXX_FLAGS_RELEASE "-Wl,-subsystem,windows
> ${CMAKE_CXX_FLAGS_RELEASE}")
> ? endif()
> elseif(CMAKE_BUILD_TYPE STREQUAL "RelWithDebInfo")
> ? set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-O2 -g")
> elseif(CMAKE_BUILD_TYPE STREQUAL "MinSizeRel")
> ? set(CMAKE_CXX_FLAGS_MINSIZEREL "-Os -g0")
> elseif(CMAKE_BUILD_TYPE STREQUAL "Debug")
> ? set(CMAKE_CXX_FLAGS_DEBUG "-O0 -g3 -pg")
> ? set(CMAKE_EXE_LINKER_FLAGS_DEBUG "-pg")
> ? set(CMAKE_SHARED_LINKER_FLAGS_DEBUG "-pg")
> ? set(CMAKE_MODULE_LINKER_FLAGS_DEBUG "-pg")
> endif()
> "
> where Release is the default and if BR2_ENABLE_DEBUG=y
> CMAKE_BUILD_TYPE=RelWithDebInfo according to flare-engine.mk
> So I thought to set CMAKE_BUILD_TYPE to "Dummy" to jump over that if-elseif. But
> just right now I've realized that's enough to give -DCMAKE_BUILD_TYPE=
> Empty is enough to jump over if-elseif.
> Another way would be to patch CMakeLists.txt adding a fallback "else" to those
> if-elseif

 Another interesting example to consider how we should handle the
CMAKE_BUILD_TYPE...

 We could just always set CMAKE_BUILD_TYPE to Dummy or empty or whatever.
However, I'm not sure if that's the right thing to do. For other package infras,
we pass the optimisation options in CFLAGS, which still gives packages the
opportunity to change or override them. Looking at a few autotools packages,
they seem to generally append stuff to CFLAGS, but not really override it - and
autoconf itself takes care of not overriding user-passed CFLAGS. CMake packages,
on the other hand, seem to mess a lot more with optimisation flags (like the
example above). Also, I have the impression that CMake packages tend to also
override CMAKE_C_FLAGS (rather than append to it or override CMAKE_C_FLAGS_RELEASE).

 My feeling *at this time* is that the best option would be to set:

CMAKE_BUILD_TYPE=Buildroot
CMAKE_C_FLAGS_BUILDROOT=@TARGET_CFLAGS@

and not set CMAKE_C_FLAGS at all. For packages that do something sensible and
necessary under a BUILD_TYPE == Release condition, we can still do
package-specific override of BUILD_TYPE. And for packages that need something
extra, we can pass -DCMAKE_C_FLAGS_BUILDROOT="$(TARGET_CFLAGS) -O0"

 But it's very hard to be sure what is the best way, and what will cause the
least amount of breakage... So, to have the least amount of breakage, it would
be better to stick to CMAKE_BUILD_TYPE=Release and live with the fact that many
packages will override the optimisation flags...

 Bwerk, difficult to decide...

 Let's add Yann to the already huge Cc list :-)

 Regards,
 Arnout
