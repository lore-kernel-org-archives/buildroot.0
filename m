From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 6 Mar 2017 23:02:21 +0100
Subject: [Buildroot] [PATCH 1/5] core/pkg-cmake: provide our own
 platform description
In-Reply-To: <20170306170031.GA3976@free.fr>
References: <cover.1488305206.git.yann.morin.1998@free.fr>
 <f25e9ff7873418c0b323528d6a9c2482c752cd31.1488305206.git.yann.morin.1998@free.fr>
 <e36f8ee2-22d1-318b-178a-9ce84f31a03a@mind.be>
 <20170301091731.5102e061@free-electrons.com>
 <19fbcec2-68a4-a287-a20f-522c94ede5e7@mind.be>
 <20170301184343.GB3578@free.fr>
 <618fb94d-0c2a-c634-3529-5a9ad5737e03@mind.be>
 <20170306170031.GA3976@free.fr>
Message-ID: <13617666-4c42-5f59-aad8-0ff15cf08e99@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-03-17 18:00, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2017-03-06 00:27 +0100, Arnout Vandecappelle spake thusly:
>> On 01-03-17 19:43, Yann E. MORIN wrote:
[snip]
>>> Why would you want it in staging? When we build our own internal cmake,
>>> the moduels it installs are so installed in host, not staging. They are
>>> build-description files, not target files.
>>>
>>> Ergo, they should be in host, not staging.
>>
>>  I was looking at it like the .pc files, which are in staging because they talk
>> about the target.
> 
> But it is not like a .pc file.  It does not describe libs to link with
> (-l), or where to lok for headers and libs (-I and -L).

 How is the specification of the sysroot different from the path to headers and
libs?


> It is more like the toolchain file itself; but see below...

 If with the toolchain file you mean toolchainfile.cmake, that's exactly my
point: I think toolchainfile.cmake should be in staging.


>>  About the modules: in fact, packages that install .cmake files will do that in
>> staging, not in host. So I do hope that cmake looks for them in staging as
>> well... That's what CMAKE_FIND_ROOT_PATH is for, isn't it?
>>
>>  In fact, the only .cmake files I see installed in the host dir are:
>>
>> - the Modules from CMake itself, but these are more related to the CMake
>> language, e.g. CheckIncludeFiles.cmake;
> 
> And what about all the modules describing platforms:
> 
>     host/usr/share/cmake-3.7/Modules/Platform/

 They are not directly related to the target. They contain all the possible
platforms.


> and the file that actually sources the platform description:
> 
>     host/usr/share/cmake-3.7/Modules/CMakeSystemSpecificInformation.cmake

 Note that there is nothing system specific in this file :-)

 Anyway, enough bikeshedding, let's just keep things as they are.

 Regards,
 Arnout

> 
>> - the CMake files added by *host* packages;
>>
>> - the CMake files added by buildroot which talk about *target* packages.
>>
>>  So I stand by my original statement: I think the cmake files should move from
>> HOST/usr/share/buildroot to STAGING/usr/lib/cmake.
> 
> Still not convinced... ;-)
> 
> Regards,
> Yann E. MORIN.
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
