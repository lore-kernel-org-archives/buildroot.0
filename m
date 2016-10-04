From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Oct 2016 23:12:15 +0200
Subject: [Buildroot] [PATCH v2 2/2] toolchainfile.cmake: rework the
 Buildroot flags addition
In-Reply-To: <20161003231809.1b84ec79@free-electrons.com>
References: <20161001163314.10173-1-s.martin49@gmail.com>
 <20161001163314.10173-2-s.martin49@gmail.com>
 <20161003231809.1b84ec79@free-electrons.com>
Message-ID: <c2301830-d494-c809-ad11-c733aa210ce4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-10-16 23:18, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat,  1 Oct 2016 18:33:14 +0200, Samuel Martin wrote:
> 
>> Thus, due to these CMake specifics, the implementation should take care
>> of a couple of things:
>> - keeping the per-package customization of the standard CMake flags;
>> - making sure the Buildroot's flags are added into the standard CMake
>>   flags;
>> - avoid introducing duplicates in resulting CMake flags.
>>
>> So, this change introduces an helper in the toolchainfile.cmake file
>> that will extend the standard CMake flags variables with the flags
>> defined by Buildroot only when they are not already present (i.e. only
>> the first time the toolchain file is processed by CMake when configuring
>> a project).
>> Then, this helper is used to extend any standard CMake flags variables.
> 
> This looks very complicated. What about not passing those
> CFLAGS/CXXFLAGS at all from the toolchain file?
> 
> After all, for other packages (generic-package or autotools-package),
> we are currently:
> 
>  * Passing some of the CFLAGS/CXXFLAGS hardcoded into the wrapper. This
>    also applies and works well for CMake packages.
> 
>  * Passing some of the CFLAGS/CXXFLAGS in the environment, when
>    configuring/building. There is no reason why this shouldn't be done
>    for CMake as well.
> 
> So what about giving up on passing TARGET_CFLAGS/TARGET_CXXFLAGS in the
> CMake toolchain file, and instead pass them explicitly when configuring
> CMake, in the <pkg>_CONFIGURE_CMDS of pkg-cmake.mk.

 I was going to make a similar remark: we should perhaps move all the
CFLAGS/CXXFLAGS/FCFLAGS to the wrapper.

 However, that doesn't work for the LDFLAGS, because we don't wrap LD yet, and
we (currently) have no way of detecting if the wrapper call is for compile or
for link. Hm, actually, it looks like gcc just ignores any linker options if you
call it with -c, so perhaps we can just pass LDFLAGS unconditionally in the wrapper.

 Let's make it our mission to apply http://patchwork.ozlabs.org/patch/606688/
next week :-)

 Regards,
 Arnout

> 
> Would this solve the problem without this awfully complicated CMake
> toolchain file?
> 
> Best regards,
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
