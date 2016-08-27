From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 27 Aug 2016 12:40:45 +0200
Subject: [Buildroot] [PATCH] package/kmsxx: add patch to fix LTO support
In-Reply-To: <C235CE6F-F057-45DA-840A-5C5B7944FCE1@gmail.com>
References: <20160826213442.19246-1-arnout@mind.be>
 <C235CE6F-F057-45DA-840A-5C5B7944FCE1@gmail.com>
Message-ID: <100a6de7-e6d0-5b88-950d-ddfb4d9f3589@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27-08-16 11:03, Samuel Martin wrote:
> Hi all,
> 
> On August 26, 2016 11:34:42 PM GMT+02:00, "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> wrote:
>> The LTO support in the kmsxx package uses the host gcc-ar and
>> gcc-ranlib
>> instead of the ones from the cross-toolchain. Add a patch that tries to
>> find the right one based on CMAKE_C_COMPILER.
[snip]
>> +     if (HAS_LTO_FLAG)
>> +-        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -flto")
>> +-        set(CMAKE_AR gcc-ar)
>> +-        set(CMAKE_RANLIB gcc-ranlib)
>> ++        find_program(LTO_AR NAMES "${CMAKE_C_COMPILER}-ar" gcc-ar)
>> ++        find_program(LTO_RANLIB NAMES "${CMAKE_C_COMPILER}-ranlib"
>> /usr/bin/gcc-ranlib)
>> ++        if (LTO_AR AND LTO_RANLIB)
>> ++            set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -flto")
>> ++            set(CMAKE_AR "${LTO_AR}")
>> ++            set(CMAKE_RANLIB "${LTO_RANLIB}")
> 
> These definitions belong to the toolchainfile.cmake file IMHO, but it can be moved there in a follow-up patch.

 Well, even if it is in toolchainfile.cmake, this patch is needed because the
CMakeLists.txt will just blindly override the defaults.

 But at the moment, we don't have global LTO support. We can build an internal
toolchain with LTO support, but it's up to individual packages to enable/use it.
Which makes sense, because LTO is still a bit experimental and possibly breaks
things.

 So we could add a global LTO_AR and LTO_RANLIB to our toolchainfile.cmake, but
since no package would make use of it, it wouldn't make a whole lot of sense.

 Regards,
 Arnout


> 
> Regards,
> 
>> ++        else()
>> ++            message(STATUS "gcc-ar or gcc-ranlib not found, disabling
>> LTO")
>> ++        endif()
>> +     endif()
>> + endif()
>> + 
>> +-- 
>> +2.9.3
>> +
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
