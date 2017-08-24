From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Aug 2017 23:39:35 +0200
Subject: [Buildroot] BR2_ENABLE_DEBUG is (incorrectly) using `Debug` for
 CMAKE_BUILD_TYPE instead of `RelWithDebInfo`
In-Reply-To: <CANF-O=aDUs4yojV3sLBG6AiNFcA4C16u90-YJ9+emiTfojFsOA@mail.gmail.com>
References: <CANF-O=aDUs4yojV3sLBG6AiNFcA4C16u90-YJ9+emiTfojFsOA@mail.gmail.com>
Message-ID: <d3f95fb4-acd1-83fa-e1fd-f33ed850249b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-08-17 11:45, Mehdi AMINI wrote:
[snip]
> Two practical examples of packages that shows what can go wrong:
> 
> 1) ceres-solver ( https://github.com/ceres-solver/ceres-solver )
> 
> When configured with CMAKE_BUILD_TYPE=Release, it'll generate:
> 
>     lib/libceres.a
> 
> However with CMAKE_BUILD_TYPE=Debug we end up with:
> 
>     lib/libceres-debug.a
> 
> 
> 2) the LLVM compiler is doing special casing based on the value of
> CMAKE_BUILD_TYPE. For example:
> 
>     if (NOT uppercase_CMAKE_BUILD_TYPE STREQUAL "DEBUG" AND
>         NOT uppercase_CMAKE_BUILD_TYPE STREQUAL "RELWITHDEBINFO")
>       add_flag_if_supported("-gline-tables-only" GLINE_TABLES_ONLY)
>     endif()
>     # Use -O1 even in debug mode, otherwise sanitizers slowdown is too large.
>     if (uppercase_CMAKE_BUILD_TYPE STREQUAL "DEBUG")
>       add_flag_if_supported("-O1" O1)
>     endif()
> 
> Or also:
> 
> if( NOT uppercase_CMAKE_BUILD_TYPE STREQUAL "DEBUG" )
>   option(LLVM_ENABLE_ASSERTIONS "Enable assertions" OFF)
> else()
>   option(LLVM_ENABLE_ASSERTIONS "Enable assertions" ON)
> endif()
> 
> 
> In my experience it has been quite common for CMake projects to use
> CMAKE_BUILD_TYPE to differentiate on more than just default optimization level.

 I think this is exactly why we should use Debug/Release instead of always using
Release: the CmakeLists.txt may enable some other things conditional on debug,
and when you choose BR2_ENABLE_DEBUG, you typically want those other things.
Like the assertions in LLVM.

 The ceres solver is something else. That package is just doing the wrong thing.
It needs to be patched to remove that -debug suffix. We do something similar for
synergy, for instance.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
