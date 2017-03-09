From: Daniel Black <daniel.black@au1.ibm.com>
Date: Thu, 9 Mar 2017 16:12:56 +1100
Subject: [Buildroot] [PATCH 1/1] package/pkg-cmake: Use
 CMAKE_<LANG>_COMPILER_LAUNCHER for ccache
In-Reply-To: <20170309042720.or2hhr4zvgmrwcd2@tarshish>
References: <20170309010911.1960-1-daniel.black@au.ibm.com>
 <20170309042720.or2hhr4zvgmrwcd2@tarshish>
Message-ID: <d8c00c99-b7fc-3234-bba7-0e4a00bab102@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09/03/17 15:27, Baruch Siach wrote:
> Hi Daniel,
> 
> On Thu, Mar 09, 2017 at 12:09:11PM +1100, Daniel Black wrote:
>> Since cmake version 3.4.3 CMAKE_<LANG>_COMPILER_LAUNCHER is used as
>> the way to invoke things like ccache. We set this to ccache for
>> the host and for cross compilers in toolchain.cmake.in. This
>> leaves CMAKE_<C,CXX>_COMPILER pointing at the real compiler and
>> still uses ccache.
>>
>> ref: https://cmake.org/cmake/help/v3.4/variable/CMAKE_LANG_COMPILER_LAUNCHER.html
> 
> Currently the oldest version of host installed cmake version that Buildroot 
> supports is 3.1. If the dependency checker finds cmake 3.1 and newer installed 
> on the host, Buildroot will use it. For your patch to work, you need to bump 
> the minimum to 3.4.3. See support/dependencies/check-host-cmake.mk.

Thanks Baruch,

Seems that this version can only handle one decimal place however
looking closer at cmake it is in the 3.4.0 version and not in the
earlier 3.3.1 release.

~/repos/cmake ((v3.3.1))]$ git checkout v3.4.0
Previous HEAD position was 4a6fe02... CMake 3.3.1
HEAD is now at b4a2ada... CMake 3.4.0

~/repos/cmake ((v3.4.0))]$ grep -r _COMPILER_LAUNCHER .
...

./Help/prop_tgt/LANG_COMPILER_LAUNCHER.rst:<LANG>_COMPILER_LAUNCHER
...
./Source/cmMakefileTargetGenerator.cxx:    std::string const
clauncher_prop = lang + "_COMPILER_LAUNCHER";
./Source/cmNinjaTargetGenerator.cxx:    std::string const clauncher_prop
= lang + "_COMPILER_LAUNCHER";
