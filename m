From: Mehdi AMINI <joker.eph@gmail.com>
Date: Sun, 3 Sep 2017 03:05:53 -0700
Subject: [Buildroot] BR2_ENABLE_DEBUG is (incorrectly) using `Debug` for
 CMAKE_BUILD_TYPE instead of `RelWithDebInfo`
In-Reply-To: <CANF-O=Y3HWoBepd+AFZoe_Hm5o5+r1WC95Z8PeLrS6qpGvrdbQ@mail.gmail.com>
References: <CANF-O=aDUs4yojV3sLBG6AiNFcA4C16u90-YJ9+emiTfojFsOA@mail.gmail.com>
 <d3f95fb4-acd1-83fa-e1fd-f33ed850249b@mind.be>
 <CANF-O=Y3HWoBepd+AFZoe_Hm5o5+r1WC95Z8PeLrS6qpGvrdbQ@mail.gmail.com>
Message-ID: <CANF-O=aBbex8Wt+8Lu4Ex+PQe-hTWD_Y-y_PRh+GbHXAxa2UbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Patch attached!

(Let me know if I should start a separate thread instead)

Best,


-- 
Mehdi


2017-08-24 18:47 GMT-07:00 Mehdi AMINI <joker.eph@gmail.com>:

>
>
> 2017-08-24 14:39 GMT-07:00 Arnout Vandecappelle <arnout@mind.be>:
>
>>
>>
>> On 23-08-17 11:45, Mehdi AMINI wrote:
>> [snip]
>> > Two practical examples of packages that shows what can go wrong:
>> >
>> > 1) ceres-solver ( https://github.com/ceres-solver/ceres-solver )
>> >
>> > When configured with CMAKE_BUILD_TYPE=Release, it'll generate:
>> >
>> >     lib/libceres.a
>> >
>> > However with CMAKE_BUILD_TYPE=Debug we end up with:
>> >
>> >     lib/libceres-debug.a
>> >
>> >
>> > 2) the LLVM compiler is doing special casing based on the value of
>> > CMAKE_BUILD_TYPE. For example:
>> >
>> >     if (NOT uppercase_CMAKE_BUILD_TYPE STREQUAL "DEBUG" AND
>> >         NOT uppercase_CMAKE_BUILD_TYPE STREQUAL "RELWITHDEBINFO")
>> >       add_flag_if_supported("-gline-tables-only" GLINE_TABLES_ONLY)
>> >     endif()
>> >     # Use -O1 even in debug mode, otherwise sanitizers slowdown is too
>> large.
>> >     if (uppercase_CMAKE_BUILD_TYPE STREQUAL "DEBUG")
>> >       add_flag_if_supported("-O1" O1)
>> >     endif()
>> >
>> > Or also:
>> >
>> > if( NOT uppercase_CMAKE_BUILD_TYPE STREQUAL "DEBUG" )
>> >   option(LLVM_ENABLE_ASSERTIONS "Enable assertions" OFF)
>> > else()
>> >   option(LLVM_ENABLE_ASSERTIONS "Enable assertions" ON)
>> > endif()
>> >
>> >
>> > In my experience it has been quite common for CMake projects to use
>> > CMAKE_BUILD_TYPE to differentiate on more than just default
>> optimization level.
>>
>>  I think this is exactly why we should use Debug/Release instead of
>> always using
>> Release: the CmakeLists.txt may enable some other things conditional on
>> debug,
>> and when you choose BR2_ENABLE_DEBUG, you typically want those other
>> things.
>> Like the assertions in LLVM.
>>
>
> This is not what the documentation / description of the option says I
> believe. I wouldn't expect the generated code to be any different when
> enabling BR2_ENABLE_DEBUG personally (other than the added DWARF section).
> My reading of the description is that I should be able to turn it on and
> the binaries in the target directory should be bit-to-bit identical
> (assuming the rest of the build and the compiler is deterministic).
>
> If that's not the intent behind BR2_ENABLE_DEBUG, it seems to me that
> another option could be useful to provide exactly this mode: getting debug
> info in the staging directory without affecting anything in the target.
>
> Hope this makes sense.
>
> Best,
>
> --
> Mehdi
>
>
>
>>
>>  The ceres solver is something else. That package is just doing the wrong
>> thing.
>> It needs to be patched to remove that -debug suffix. We do something
>> similar for
>> synergy, for instance.
>>
>>  Regards,
>>  Arnout
>>
>>
>> --
>> Arnout Vandecappelle                          arnout at mind be
>> Senior Embedded Software Architect            +32-16-286500
>> Essensium/Mind                                http://www.mind.be
>> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
>> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
>> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170903/9c383c56/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Fix-BR2_ENABLE_DEBUG-handling-for-cmake-packages.patch
Type: application/octet-stream
Size: 2097 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170903/9c383c56/attachment.obj>
