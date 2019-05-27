From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 27 May 2019 19:20:55 +0200
Subject: [Buildroot] [PATCH v2 05/12] package/flare-engine: fix
 BUG_85180 build timeout
In-Reply-To: <20190524223027.6d05ee4c@windsurf.home>
References: <20190521133932.81841-1-giulio.benetti@micronovasrl.com>
 <20190521133932.81841-6-giulio.benetti@micronovasrl.com>
 <20190524215853.4ee3ddbc@windsurf.home>
 <6fbb9a9d-b836-97dd-5bd2-f9d3dcb06a57@micronovasrl.com>
 <20190524223027.6d05ee4c@windsurf.home>
Message-ID: <72277a65-f760-226c-0f65-3658b2751390@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Il 24/05/2019 22:30, Thomas Petazzoni ha scritto:
> On Fri, 24 May 2019 22:05:12 +0200
> Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
> 
>>> Why does flare-engine need this, but not jasper, which is also a
>>> CMake-based package ?
>>
>> Because in flare-engine CMakeLists.txt there is no fallback to -O0, so
>> that was the only decent way to force CMake to generate Makefiles
>> without optimizations.
> 
> Could you be more specific ? How does it work for jasper and
> libcpprestsdk, which are also based on CMake ?

Yes, the problem here is that even if there's the way to append 
something to CMAKE_CXX_FLAGS, then any other CMAKE_CXX_FLAGS_* will be 
appended, so if I set CMAKE_CXX_FLAGS to -O0, I will obtain "-O0 -O2 -g".

This is due to the fact that we fall into one of the cases of the next 
if-elseif statements(in CMakeLists.txt):
"
if(CMAKE_BUILD_TYPE STREQUAL "Release")
   set(CMAKE_CXX_FLAGS_RELEASE "-O2 -g0")
   if(MINGW)
     set(CMAKE_CXX_FLAGS_RELEASE "-Wl,-subsystem,windows 
${CMAKE_CXX_FLAGS_RELEASE}")
   endif()
elseif(CMAKE_BUILD_TYPE STREQUAL "RelWithDebInfo")
   set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-O2 -g")
elseif(CMAKE_BUILD_TYPE STREQUAL "MinSizeRel")
   set(CMAKE_CXX_FLAGS_MINSIZEREL "-Os -g0")
elseif(CMAKE_BUILD_TYPE STREQUAL "Debug")
   set(CMAKE_CXX_FLAGS_DEBUG "-O0 -g3 -pg")
   set(CMAKE_EXE_LINKER_FLAGS_DEBUG "-pg")
   set(CMAKE_SHARED_LINKER_FLAGS_DEBUG "-pg")
   set(CMAKE_MODULE_LINKER_FLAGS_DEBUG "-pg")
endif()
"
where Release is the default and if BR2_ENABLE_DEBUG=y 
CMAKE_BUILD_TYPE=RelWithDebInfo according to flare-engine.mk
So I thought to set CMAKE_BUILD_TYPE to "Dummy" to jump over that 
if-elseif. But just right now I've realized that's enough to give 
-DCMAKE_BUILD_TYPE=
Empty is enough to jump over if-elseif.
Another way would be to patch CMakeLists.txt adding a fallback "else" to 
those if-elseif

What do you think?

Best regards
-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
