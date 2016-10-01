From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 1 Oct 2016 11:44:04 +0200
Subject: [Buildroot] [PATCH 1/2] toolchainfile.cmake: force setting
 CMAKE_{C, CXX, LINKER}_FLAGS
In-Reply-To: <b62decdd-88a9-6645-c2e0-82cf24b9ccdf@mind.be>
References: <20160930220832.24482-1-s.martin49@gmail.com>
 <b62decdd-88a9-6645-c2e0-82cf24b9ccdf@mind.be>
Message-ID: <CAHXCMMLs08iQJW-rpLDnAdn3vhp4kCQueF4tmH2HevOcSum_Dw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Oct 1, 2016 at 2:27 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 01-10-16 00:08, Samuel Martin wrote:
>> According to the build configuration, Buildroot defines some
>> compiler/linker flags.
>>
>> For CMake packages, these flags are passed thanks to the
>> toolchainfile.cmake file, which is filled by Buildroot.
>>
>> The toolchainfile.cmake should make sure the flags preset by Buildroot
>> are correctly passed to the compiler, while it should also allow passing
>> per-package flags using the standard CMake variables for this.
>>
>> This is achieved using the 'set' CMake command to extend the standard
>> CMAKE_{C,CXX,LINKER}_FLAGS variables.
>> However, we have to be careful with the option passed to the 'set'
>> command [1] to make sure even these cache entry will be
>> extended/overwritten; otherwise the preset value will take precedence
>> (the per-package flags in Buildroot case) and the variable will not be
>> extended.
>>
>> So, this change makes sure the toolchainfile.camke file will actually
>> extend/overwrite the compiler and linker flags with the Buildroot's
>> predefined flags.
>
>  I was going to ack this, and then I noticed that it reverts
> 47544e43a5e36f6c4ee1acb06315ab974cde78b4:

This is unfortunate :-/ What bug is the worst?...

> Author: Samuel Martin <s.martin49@gmail.com>
> Date:   Thu Aug 21 22:45:20 2014
>
>     toolchainfile.cmake.in: do not force the CMAKE_{C, CXX}_FLAGS to the cache
>
>     Fix #7280 [1]
>
>     When the FORCE option is passed to the set command, the variable is
>     added/updated in the CMake cache every single time CMake processes this
>     command.
>
>     Because the toolchainfile.cmake prepends architecture/toolchain flags
>     to the CMAKE_{C,CXX}_FLAGS, this makes the CFLAGS being updated in the
>     generated Makefiles each time one reconfigures its project. So it
>     forces the compilation of everything, even when nothing has changed.
>
>     [1] https://bugs.busybox.net/show_bug.cgi?id=7280
>
> And indeed, with this change the CMakeCache.txt in opencv3 has the CXXFLAGS
> twice. I don't really understand why, though, because cmake runs only once and
> before it runs, CMakeCache.txt is removed. And to make it really weird: when I
> run opencv3-reconfigure, it appears only once... I tried with a different
> package too (flann), same behaviour.
>
>  Anyway, I think the doubling of CXXFLAGS isn't that bad, and adding the FORCE
> actually solves something. So
>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
> but we really should try to find out why the options are doubled...

Actually, I learned it yesterday. The toolchain file is parsed once
per active language, so twice in opencv because C and C++ are enabled.
I'll see if I can figure out something to avoid this side effect.

Regards,

>
>  Regards,
>  Arnout
>
>
>>
>> [1] https://cmake.org/cmake/help/v3.6/command/set.html
>>
>> Fixes:
>>   http://autobuild.buildroot.net/results/7f1c96abd8fbb5b358a07100ab623316e9bb9dcd
>>   http://autobuild.buildroot.net/results/e0c93d0f6d1da0d62d4dbba211a275bfe75e9645
>>   http://autobuild.buildroot.net/results/53e7e4b4b6a7b48b8012799d7507f7594dbf01b2
>>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>> Cc: Max Filippov <jcmvbkbc@gmail.com>
>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> ---
>>  support/misc/toolchainfile.cmake.in | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
>> index 649b52d..eddea56 100644
>> --- a/support/misc/toolchainfile.cmake.in
>> +++ b/support/misc/toolchainfile.cmake.in
>> @@ -13,9 +13,9 @@ string(REPLACE "/usr/share/buildroot" "" RELOCATED_HOST_DIR ${CMAKE_CURRENT_LIST
>>  set(CMAKE_SYSTEM_NAME Linux)
>>  set(CMAKE_SYSTEM_PROCESSOR @@CMAKE_SYSTEM_PROCESSOR@@)
>>
>> -set(CMAKE_C_FLAGS "@@TARGET_CFLAGS@@ ${CMAKE_C_FLAGS}" CACHE STRING "Buildroot CFLAGS")
>> -set(CMAKE_CXX_FLAGS "@@TARGET_CXXFLAGS@@ ${CMAKE_CXX_FLAGS}" CACHE STRING "Buildroot CXXFLAGS")
>> -set(CMAKE_EXE_LINKER_FLAGS "@@TARGET_LDFLAGS@@ ${CMAKE_EXE_LINKER_FLAGS}" CACHE STRING "Buildroot LDFLAGS")
>> +set(CMAKE_C_FLAGS "@@TARGET_CFLAGS@@ ${CMAKE_C_FLAGS}" CACHE STRING "Buildroot CFLAGS" FORCE)
>> +set(CMAKE_CXX_FLAGS "@@TARGET_CXXFLAGS@@ ${CMAKE_CXX_FLAGS}" CACHE STRING "Buildroot CXXFLAGS" FORCE)
>> +set(CMAKE_EXE_LINKER_FLAGS "@@TARGET_LDFLAGS@@ ${CMAKE_EXE_LINKER_FLAGS}" CACHE STRING "Buildroot LDFLAGS" FORCE)
>>  set(CMAKE_INSTALL_SO_NO_EXE 0)
>>
>>  set(CMAKE_PROGRAM_PATH "${RELOCATED_HOST_DIR}/usr/bin")
>> @@ -31,6 +31,6 @@ set(ENV{PKG_CONFIG_SYSROOT_DIR} "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
>>  set(CMAKE_C_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC@@")
>>  set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CXX@@")
>>  if(@@TOOLCHAIN_HAS_FORTRAN@@)
>> -  set(CMAKE_Fortran_FLAGS "@@TARGET_FCFLAGS@@ ${CMAKE_Fortran_FLAGS}" CACHE STRING "Buildroot FCFLAGS")
>> +  set(CMAKE_Fortran_FLAGS "@@TARGET_FCFLAGS@@ ${CMAKE_Fortran_FLAGS}" CACHE STRING "Buildroot FCFLAGS" FORCE)
>>    set(CMAKE_Fortran_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_FC@@")
>>  endif()
>>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF



-- 
Samuel
