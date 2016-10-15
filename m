From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 15 Oct 2016 17:52:10 +0200
Subject: [Buildroot] [PATCH v3 8/8] toochainfile.cmake: rework the way
 Buildroot sets flags
In-Reply-To: <20161015094437.6989-9-s.martin49@gmail.com>
References: <20161015094437.6989-1-s.martin49@gmail.com>
 <20161015094437.6989-9-s.martin49@gmail.com>
Message-ID: <510faeee-e1c8-88a3-4d60-af9c8fe8102e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-10-16 11:44, Samuel Martin wrote:
>>From the build configuration, Buildroot defines and set some compiler
> and linker flags that should be passed to any packages build-system.
> 
> For package using the cmake-package infrastructure, this is achieved
> via the toolchainfile.cmake.
> 
> This change simplifies the way the toolchainfile.cmake file handles
> these flags: it now just sets them, without any attempt to extend them
> with those Buildroot defined.
> 
> So, now, when a CMake-based package needs to extend them, they should
> be fully set from the package *.mk file. This behavior is consistent
> with what is done for others package infrastructures.
> 
> This change should not pull any regression WRT the bug #7280 [1].
> 
> However, now, when someone uses the toolchainfile.cmake file outside of
> Buildroot, he/she must overload all compiler/linker flags (including the
> ones Buildroot sets since they no longer get automatically added).
> 
> [1] https://bugs.busybox.net/show_bug.cgi?id=7280
> 
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  CHANGES                             |  6 ++++++
>  support/misc/toolchainfile.cmake.in | 15 +++++++++++----
>  2 files changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/CHANGES b/CHANGES
> index b4bd5fe..9a5dd50 100644
> --- a/CHANGES
> +++ b/CHANGES
> @@ -1,3 +1,9 @@
> +2016.11-rc1,
> +
> +    toolchainfile.cmake: when used outside of Buildroot with custom
> +    compiler/linker flags, the Buildroot flags should be set along side
> +    with the custom ones.
> +
>  2016.08, Released September 1st, 2016
>  
>  	Minor fixes.
> diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
> index 649b52d..7747199 100644
> --- a/support/misc/toolchainfile.cmake.in
> +++ b/support/misc/toolchainfile.cmake.in
> @@ -13,9 +13,15 @@ string(REPLACE "/usr/share/buildroot" "" RELOCATED_HOST_DIR ${CMAKE_CURRENT_LIST
>  set(CMAKE_SYSTEM_NAME Linux)
>  set(CMAKE_SYSTEM_PROCESSOR @@CMAKE_SYSTEM_PROCESSOR@@)
>  
> -set(CMAKE_C_FLAGS "@@TARGET_CFLAGS@@ ${CMAKE_C_FLAGS}" CACHE STRING "Buildroot CFLAGS")
> -set(CMAKE_CXX_FLAGS "@@TARGET_CXXFLAGS@@ ${CMAKE_CXX_FLAGS}" CACHE STRING "Buildroot CXXFLAGS")
> -set(CMAKE_EXE_LINKER_FLAGS "@@TARGET_LDFLAGS@@ ${CMAKE_EXE_LINKER_FLAGS}" CACHE STRING "Buildroot LDFLAGS")
> +# Buildroot defaults flags.
> +# If you are using this toolchainfile.cmake file outside of Buildroot and
> +# want to customize the compiler/linker flags, set them all on the cmake command
> +# line, e.g.:

# line or in the CMakeLists.txt, e.g.:

> +#   cmake -DCMAKE_C_FLAGS="@@TARGET_CFLAGS@@ -Dsome_custom_flag" ...
#   set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Dsome_custom_flag")


 Otherwise looks OK to me but I'm not so confident so no official tag.

 Regards,
 Arnout

> +set(CMAKE_C_FLAGS "@@TARGET_CFLAGS@@")
> +set(CMAKE_CXX_FLAGS "@@TARGET_CXXFLAGS@@")
> +set(CMAKE_EXE_LINKER_FLAGS "@@TARGET_LDFLAGS@@")
> +
>  set(CMAKE_INSTALL_SO_NO_EXE 0)
>  
>  set(CMAKE_PROGRAM_PATH "${RELOCATED_HOST_DIR}/usr/bin")
> @@ -31,6 +37,7 @@ set(ENV{PKG_CONFIG_SYSROOT_DIR} "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
>  set(CMAKE_C_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC@@")
>  set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CXX@@")
>  if(@@TOOLCHAIN_HAS_FORTRAN@@)
> -  set(CMAKE_Fortran_FLAGS "@@TARGET_FCFLAGS@@ ${CMAKE_Fortran_FLAGS}" CACHE STRING "Buildroot FCFLAGS")
> +  # Buildroot defaults flags.
> +  set(CMAKE_Fortran_FLAGS "@@TARGET_FCFLAGS@@")
>    set(CMAKE_Fortran_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_FC@@")
>  endif()
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
