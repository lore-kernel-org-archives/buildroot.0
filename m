From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 1 Jul 2016 17:47:04 +0200
Subject: [Buildroot] [PATCH v2] Don't build host-cmake if it is
 available on the build host
In-Reply-To: <56C353FF.1030907@lucaceresoli.net>
References: <1454670476-20635-1-git-send-email-luca@lucaceresoli.net>
 <CAHXCMMK33AqXM7wEQPCDycgiRWJJMxDcUH-+ZWW0pX7tYmAq-Q@mail.gmail.com>
 <56C33B6F.8080704@mind.be> <56C353FF.1030907@lucaceresoli.net>
Message-ID: <57769078.8000407@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 16/02/2016 17:53, Luca Ceresoli wrote:
[...]
>>>
>>> I'm not sure what it the best and clean way to handle this...
>>> Maybe $(BUILD_HOST_CMAKE) != YES should be use to noop the
>>> HOST_CMAKE_{CONFIGURE,BUILD,INSTALLL}_CMDS commands, but we keep the
>>> dependency on host-cmake, so we don't lose host-cmake's dependencies.
>>>
>>> Any thought about this?
>>
>>  The correct approach would be to add explicit dependencies on host-pkgconf for
>> packages that need it, just like we do for autotools packages.
>>
>>  The difficulty is of course finding out which packages need host-pkgconf. It
>> seems it's not as simple as searching for FindPkgConfig in the CMakeLists.txt
>> files of each cmake package, because there are other modules that implicitly use
>> this. So we'd have to make a list of all those modules and check for all of
>> them. And then of course there are the packages that install new cmake modules
>> that use this, but which don't use FindPkgConfig (or even cmake) themselves...
>>
>>  In 3d475ee0 you added the unconditional host-pkgconf dependency to work around
>> this problem. If we remove that dependency, the autobuilders should detect the
>> missing host-pkgconf dependencies even when host-cmake is used.
> 
> The workaround Samuel added in that commit is in package/cmake/cmake.mk:
> 
>   +HOST_CMAKE_DEPENDENCIES = host-pkgconf
> 
> This could probably ported to my patch in package/pkg-cmake.mk:
> 
>   +ifeq ($$(BUILD_HOST_CMAKE),YES)
>    $(2)_DEPENDENCIES += host-cmake
>   +else
>   +$(2)_DEPENDENCIES += host-pkgconf
>   +endif

I'm reviving this old patch, and after speaking with Thomas I chose the
above strategy. It solves the issue raised by Samuel, thus my patch can
work properly. It does not fix the specific packages depending on
host-pkgconf, but that's a separate issue so I left it for another series.

v3 on the way.

-- 
Luca
