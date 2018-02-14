From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Wed, 14 Feb 2018 16:30:24 +0100
Subject: [Buildroot] Adding package libgit2
In-Reply-To: <20180214160622.789eb7e9@windsurf.lan>
References: <20180214111351.4801-1-nicolas.cavallari@green-communications.fr>
 <20180214160622.789eb7e9@windsurf.lan>
Message-ID: <f909d627-970f-490b-0c9f-678bb3461bc9@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Seems like git send-email scrubbed my CC to the maintainers

On 14/02/2018 16:06, Thomas Petazzoni wrote:
>> 4) zlib-ng (all other toolchains)
>>
>> -- The following features have been enabled:
>> [...]
>>  * SSE2 , Support the SSE2 instruction set, using "-msse2"
>> [...]
>> /home/cavallar/br-test-pkg/br-arcle-hs38/build/zlib-ng-a17fefa147942edbf80ab22a16bcbc2419def12d/arch/x86/x86.c:17:10: fatal error: cpuid.h: No such file or directory
>>  #include <cpuid.h>
>>           ^~~~~~~~~
>> compilation terminated.
> 
> Can you check what is the value of ${ARCH} in the CMakeLists.txt when
> such problem occurs ? It is printed in the configure output:
> 
> message(STATUS "Architecture: ${ARCH}")

It is correct, e.g. "-- Architecture: or1k" for openrisc.

> ARCH is set to ${CMAKE_SYSTEM_PROCESSOR}, and CMAKE_SYSTEM_PROCESSOR is
> explicitly passed by Buildroot in package/pkg-cmake.mk. So it should be
> correct. zlib-ng CMakeLists.txt uses its ${ARCH} variable to decide
> whether the x86 code should be built or not:
> 
> if("${ARCH}" MATCHES "x86_64" OR "${ARCH}" MATCHES "AMD64")
>     set(ARCHDIR "arch/x86")
>     add_definitions(-DX86_64 -DX86_NOCHECK_SSE2 -DUNALIGNED_OK -DUNROLL_LESS)
>     add_feature_info(SSE2 1 "Use the SSE2 instruction set, using \"${SSE2FLAG}\"")

I have added --trace to cmake.  There is this gem a few lines below:

else()
    set(ARCHDIR "arch/x86")
    add_definitions(-DX86 -DUNALIGNED_OK -DUNROLL_LESS)
    add_feature_info(SSE2 1 "Support the SSE2 instruction set, using
\"${SSE2FLAG}\"")
endif()

So anything not arm/aarch64/x86 is treated like x86 anyway...
