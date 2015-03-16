From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 22:24:58 +0100
Subject: [Buildroot] [PATCH 4/4] toolchainfile.cmake: set CXX variables
 wrt BR2_INSTALL_LIBSTDCPP value
In-Reply-To: <1425808043-32292-5-git-send-email-s.martin49@gmail.com>
References: <1425808043-32292-1-git-send-email-s.martin49@gmail.com>
 <1425808043-32292-5-git-send-email-s.martin49@gmail.com>
Message-ID: <20150316222458.4616098c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun,  8 Mar 2015 10:47:23 +0100, Samuel Martin wrote:
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

This is a non-trivial patch, and the commit log is empty. Why?

> diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
> index cd41254..395cf3f 100644
> --- a/support/misc/toolchainfile.cmake.in
> +++ b/support/misc/toolchainfile.cmake.in
> @@ -17,6 +17,7 @@ set(CMAKE_C_FLAGS "@@TARGET_CFLAGS@@ ${CMAKE_C_FLAGS}" CACHE STRING "Buildroot C
>  set(CMAKE_CXX_FLAGS "@@TARGET_CXXFLAGS@@ ${CMAKE_CXX_FLAGS}" CACHE STRING "Buildroot CXXFLAGS")
>  set(CMAKE_EXE_LINKER_FLAGS "@@TARGET_LDFLAGS@@ ${CMAKE_EXE_LINKER_FLAGS}" CACHE STRING "Buildroot LDFLAGS")
>  set(CMAKE_INSTALL_SO_NO_EXE 0)
> +set(TARGET_HAS_LIBSTDCXX @@TARGET_HAS_LIBSTDCXX@@)
>  
>  set(CMAKE_PROGRAM_PATH "${RELOCATED_HOST_DIR}/usr/bin")
>  set(CMAKE_FIND_ROOT_PATH "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
> @@ -35,25 +36,45 @@ if(DEFINED USE_CCACHE)
>  	if(USE_CCACHE)
>  		set(CMAKE_ASM_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC_NOCCACHE@@")
>  		set(CMAKE_C_COMPILER "${RELOCATED_HOST_DIR}/usr/bin/ccache")
> -		set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/usr/bin/ccache")
>  		set(CMAKE_C_COMPILER_ARG1 "${RELOCATED_HOST_DIR}/@@TARGET_CC_NOCCACHE@@")
> -		set(CMAKE_CXX_COMPILER_ARG1 "${RELOCATED_HOST_DIR}/@@TARGET_CXX_NOCCACHE@@")
> +		if(TARGET_HAS_LIBSTDCXX)
> +			set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/usr/bin/ccache")
> +			set(CMAKE_CXX_COMPILER_ARG1 "${RELOCATED_HOST_DIR}/@@TARGET_CXX_NOCCACHE@@")
> +		else()
> +			message(STATUS "Disabling C++ compiler because libstdc++ is not installed in the target filsystem")
> +			set(CMAKE_CXX_COMPILER "CMAKE_CXX_COMPILER-NOTFOUND")
> +		endif()
>  	else()
>  		set(CMAKE_C_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC_NOCCACHE@@")
> -		set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CXX_NOCCACHE@@")
> +		if(TARGET_HAS_LIBSTDCXX)
> +			set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CXX_NOCCACHE@@")
> +		else()
> +			message(STATUS "Disabling C++ compiler because libstdc++ is not installed in the target filsystem")
> +			set(CMAKE_CXX_COMPILER "CMAKE_CXX_COMPILER-NOTFOUND")
> +		endif()
>  	endif()
>  else()
>  	find_program(CCACHE ccache HINTS "${RELOCATED_HOST_DIR}/usr/bin")
>  	if(CCACHE)
>  		set(CMAKE_ASM_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC_NOCCACHE@@")
>  		set(CMAKE_C_COMPILER "${CCACHE}")
> -		set(CMAKE_CXX_COMPILER "${CCACHE}")
>  		set(CMAKE_C_COMPILER_ARG1 "${RELOCATED_HOST_DIR}/@@TARGET_CC_NOCCACHE@@")
> -		set(CMAKE_CXX_COMPILER_ARG1 "${RELOCATED_HOST_DIR}/@@TARGET_CXX_NOCCACHE@@")
> +		if(TARGET_HAS_LIBSTDCXX)
> +			set(CMAKE_CXX_COMPILER "${CCACHE}")
> +			set(CMAKE_CXX_COMPILER_ARG1 "${RELOCATED_HOST_DIR}/@@TARGET_CXX_NOCCACHE@@")
> +		else()
> +			message(STATUS "Disabling C++ compiler because libstdc++ is not installed in the target filsystem")
> +			set(CMAKE_CXX_COMPILER "CMAKE_CXX_COMPILER-NOTFOUND")
> +		endif()
>  		message(STATUS "ccache program has been found and will be used for the build.")
>  		message(STATUS "  To disable ccache, add -DUSE_CCACHE=OFF on the cmake command line.")
>  	else()
>  		set(CMAKE_C_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC_NOCCACHE@@")
> -		set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CXX_NOCCACHE@@")
> +		if(TARGET_HAS_LIBSTDCXX)
> +			set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CXX_NOCCACHE@@")
> +		else()
> +			message(STATUS "Disabling C++ compiler because libstdc++ is not installed in the target filsystem")
> +			set(CMAKE_CXX_COMPILER "CMAKE_CXX_COMPILER-NOTFOUND")
> +		endif()
>  	endif()
>  endif()

This is doing multiple times the same thing.

First of all, why do we have those two cases for the ccache support:

if(DEFINED USE_CCACHE)
        if(USE_CCACHE)
	...
	else()
	...
	endif()
else()
	find_program(CCACHE ccache HINTS "${RELOCATED_HOST_DIR}/usr/bin")
	if(CCACHE)
	...
	else()
	...
	endif()
endif()

The first case is when the toolchain file is used by Buildroot itself,
the second case when it's used outside of Buildroot. But why don't we
use the find_program() trick in both cases ?

Shouldn't we instead do:

find_program(CCACHE ccache HINTS "${RELOCATED_HOST_DIR}/usr/bin")
if (CCACHE and USE_CCACHE)
	...
else()

	...
endif()

Regarding the C++ stuff, the non-C++ case is the same between having
ccache and not having ccache, so you could factorize that a bit.

Could you rework this a bit?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
