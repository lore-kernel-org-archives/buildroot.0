From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 16 Oct 2016 21:09:49 +0200
Subject: [Buildroot] [PATCH v6 3/9] toolchainfile.cmake: set per-config
 appended {C, CXX}FLAGS
In-Reply-To: <20161016111245.1847-4-s.martin49@gmail.com>
References: <20161016111245.1847-1-s.martin49@gmail.com>
 <20161016111245.1847-4-s.martin49@gmail.com>
Message-ID: <e248e02e-bdea-2498-8b80-bf7c5c698845@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16-10-16 13:12, Samuel Martin wrote:
> When a build type is set, CMake does append some flags that can override
> those set by Buildroot due to the gcc option parser (in which the last
> argument controling an option wins).
> 
> Hereafter is a summary of the optimization and debug flags set by
> Buildroot and appended by CMake.
> 
> * Flags set by Buildroot depending on the configuration:
> 
>   BR2_ENABLE_DEBUG | Optim. level        | Buildroot {C,CXX}FLAGS
>   =================+=====================+=======================
>           y        | BR2_OPTIMIZE_S      | -Os -gx
>           y        | BR2_OPTIMIZE_G      | -Og -gx
>           y        | BR2_OPTIMIZE_{0..3} | -On -gx
>           n        | BR2_OPTIMIZE_S      | -Os
>           n        | BR2_OPTIMIZE_G      | -Og
>           n        | BR2_OPTIMIZE_{0..3} | -On
> 
> * Default flags appended by CMake depending on the build type:
> 
>   Build type     | Flags           | Effects on {C,CXX}FLAGS
>   ===============+=================+===========================================
>   Debug          | -g              | Force -g, compatible with BR2_ENABLE_DEBUG
>   MinSizeRel     | -Os -DNDEBUG    | Set -Os, compatible with BR2_OPTIMIZE_S
>   Release        | -O3 -DNDEBUG    | Set -O3, closest to the others cases,
>                  |                 | though the optimization level is forced.
>   RelWithDebInfo | -O2 -g -DNDEBUG | Force -g and set -O2, not friendly with BR
> 
> To avoid the CMake flags take precedence over the Buildroot ones, this
> change sets in toolchainfile.cmake the per-config compiler flags CMake
> can append depending on the build type Buildroot defined.
> So, CMake does not mess up with the compilation flags Buildroot sets.
> 
> It is still possible to override these per-config flags on the cmake
> command line.
> 
> Note:
>   If a CMake-based project forces the compiler and/or linker flag
>   definitions (the default ones or the per-config ones - e.g.
>   CMAKE_C_FLAGS/CMAKE_C_FLAGS_{DEBUG,RELEASE}), there is not much
>   Buildroot can do about it.
>   So, the flags will be overwritten anyway in these cases.
> 
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Small improvement in the comment is still possible...

> 
> ---
> changes v5->v6:
> - reword commit log
> 
> changes v4->v5:
> - fix cmake set call
> 
> changes v3->v4:
> - new patch
> ---
>  support/misc/toolchainfile.cmake.in | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
> index 1c5031f..2ace940 100644
> --- a/support/misc/toolchainfile.cmake.in
> +++ b/support/misc/toolchainfile.cmake.in
> @@ -13,6 +13,17 @@ string(REPLACE "/usr/share/buildroot" "" RELOCATED_HOST_DIR ${CMAKE_CURRENT_LIST
>  set(CMAKE_SYSTEM_NAME Linux)
>  set(CMAKE_SYSTEM_PROCESSOR @@CMAKE_SYSTEM_PROCESSOR@@)
>  
> +# Set the {C,CXX}FLAGS appended by CMake depending on the build type
> +# sets by Buildroot.

 Add:

CMake defaults these variables with -g and/or -O options, and they are appended
at the end of the argument list, so the Buildroot options are overridden.
Therefore these variables have to be cleared, so the options in CMAKE_C_FLAGS do
apply.

> +#
> +# Note:
> +#   if the project forces some of these flag variables, Buildroot is
> +#   screwed up and there is nothing Buildroot can do about that :(
> +set(CMAKE_C_FLAGS_DEBUG "" CACHE STRING "Debug CFLAGS")
> +set(CMAKE_CXX_FLAGS_DEBUG "" CACHE STRING "Debug CXXFLAGS")
> +set(CMAKE_C_FLAGS_RELEASE " -DNEBUG" CACHE STRING "Release CFLAGS")
> +set(CMAKE_CXX_FLAGS_RELEASE " -DNEBUG" CACHE STRING "Release CXXFLAGS")

 Shouldn't CMAKE_FC_FLAGS_* be overridden as well?

 Regards,
 Arnout

> +
>  # Build type from the Buildroot configuration
>  set(CMAKE_BUILD_TYPE @@CMAKE_BUILD_TYPE@@ CACHE STRING "Buildroot build configuration")
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
