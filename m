From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 16 Feb 2016 17:53:19 +0100
Subject: [Buildroot] [PATCH v2] Don't build host-cmake if it is
 available on the build host
In-Reply-To: <56C33B6F.8080704@mind.be>
References: <1454670476-20635-1-git-send-email-luca@lucaceresoli.net>
 <CAHXCMMK33AqXM7wEQPCDycgiRWJJMxDcUH-+ZWW0pX7tYmAq-Q@mail.gmail.com>
 <56C33B6F.8080704@mind.be>
Message-ID: <56C353FF.1030907@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel, Arnout,

On 16/02/2016 16:08, Arnout Vandecappelle wrote:
> 
> 
> On 16-02-16 14:55, Samuel Martin wrote:
>> Hi Luca, all,
>>
>> On Fri, Feb 5, 2016 at 12:07 PM, Luca Ceresoli <luca@lucaceresoli.net> wrote:
> [snip]
>>>> Finally, we do skip adding the dependency on host-cmake for all cmake
>>>> packages when $(BUILD_HOST_CMAKE) != YES.
>> Sorry for not spotting this earlier, but:
>> host-cmake has a dependency on host-pkgconf, which cmake (the host
>> program) may use at runtime to find the dependencies when it is
>> configuring a project.
>> In the BR host tree, pkg-config is a wrapper with environment
>> variables correctly preset to find stuff in the sysroot tree by
>> default.
>>
>> Here is a test case:
>>
>> A is a cmake-package depending on B.
>> B is a generic-package providing a *.pc file.
>> CMake uses its FindPkgConfig module to detect B.
>>
>> So, currently we got:
>> - A depends on: B and host-cmake
>> - host-cmake depends on host-pkgconf
>> - When configuring A, host-cmake should use host-pkgconf to find B
>>
>> With this patch, in the case cmake build is skipped, we get:
>> - A depends on: B
>> - When configuring A, cmake (from the host system) may use pkg-config
>> (from the host system) to find B, but this pkg-config won't have the
>> env. vars. correctly set to find B in the sysroot. In the best case,
>> it won't find B, in the worst case it will try to link against B from
>> the host system.

Thanks for the insight.

I wonder whether we can do anything in toolchainfile.cmake to prevent
cmake from using the pkg-config on the system. Don't the following lines
already do it? [Disclaimer: I'm in a hurry and checking the docs _now_
would take too long]

  set(CMAKE_PROGRAM_PATH "${RELOCATED_HOST_DIR}/usr/bin")
  set(CMAKE_FIND_ROOT_PATH "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
  set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
  set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
  set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
  set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)


>>
>> I'm not sure what it the best and clean way to handle this...
>> Maybe $(BUILD_HOST_CMAKE) != YES should be use to noop the
>> HOST_CMAKE_{CONFIGURE,BUILD,INSTALLL}_CMDS commands, but we keep the
>> dependency on host-cmake, so we don't lose host-cmake's dependencies.
>>
>> Any thought about this?
> 
>  The correct approach would be to add explicit dependencies on host-pkgconf for
> packages that need it, just like we do for autotools packages.
> 
>  The difficulty is of course finding out which packages need host-pkgconf. It
> seems it's not as simple as searching for FindPkgConfig in the CMakeLists.txt
> files of each cmake package, because there are other modules that implicitly use
> this. So we'd have to make a list of all those modules and check for all of
> them. And then of course there are the packages that install new cmake modules
> that use this, but which don't use FindPkgConfig (or even cmake) themselves...
> 
>  In 3d475ee0 you added the unconditional host-pkgconf dependency to work around
> this problem. If we remove that dependency, the autobuilders should detect the
> missing host-pkgconf dependencies even when host-cmake is used.

The workaround Samuel added in that commit is in package/cmake/cmake.mk:

  +HOST_CMAKE_DEPENDENCIES = host-pkgconf

This could probably ported to my patch in package/pkg-cmake.mk:

  +ifeq ($$(BUILD_HOST_CMAKE),YES)
   $(2)_DEPENDENCIES += host-cmake
  +else
  +$(2)_DEPENDENCIES += host-pkgconf
  +endif

But I agree with Arnout that if a package actually uses pkg-conf, it
should depend on it. Of course this means it must fail when the
dependency is missing, not use the system pkg-conf.

-- 
Luca
