From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Jan 2019 22:16:26 +0100
Subject: [Buildroot] [PATCH 1/2] pkg-cmake: add CMAKE_SYSTEM_VERSION to
 toolchainfile.cmake
In-Reply-To: <20190110230529.29852-1-arnout@mind.be>
References: <20190110230529.29852-1-arnout@mind.be>
Message-ID: <20190111211626.GD2428@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-01-11 00:05 +0100, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> Quoting the CMake documentation:
> 
>   When the CMAKE_SYSTEM_NAME variable is set explicitly to enable cross
>   compiling then the value of CMAKE_SYSTEM_VERSION must also be set
>   explicitly to specify the target system version.
> 
> Thus, we should also set CMAKE_SYSTEM_VERSION in toolchainfile.cmake. It
> is supposed to be set to the value of `uname -r` on the target. We don't
> have that exact value available (unless we build the kernel), but

> the
> value of BR2_TOOLCHAIN_HEADERS_AT_LEAST contains the (minimum) version
> of the kernel it will run on,

That is not true.

glibc for example will by default carry fallback mechanisms to emulate
some features when it is running on a kernel older than the headers it
was compiled against. In Buildroot we explictly disable that feature by
passing --enable-kernel=$(BR2_TOOLCHAIN_HEADERS_AT_LEAST).

But for external toolchains, we don't know (and can't know) iw they did
pass that option or not, and if they did, what version they requested,
and if they did not, what version glibc uses.

This backward compatibility of glibc can extend quite a bit in the past,
so kernels we would consider pretty old might still be usable with such
toolchains. For example, on glibc-2.24, the minimum required headers
were 3.2, but the runtime could be 2.6.32 on x86_64.

So, we could very well end up building a Buildroot system that runs on a
kernel older than the headers of the toolchain.

Regards,
Yann E. MORIN.

> so it should be OK for all practical
> purposes.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/pkg-cmake.mk                | 1 +
>  support/misc/toolchainfile.cmake.in | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index 51a1929ebb..dd048b0949 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -264,6 +264,7 @@ define TOOLCHAIN_CMAKE_INSTALL_FILES
>  		-e 's#@@TARGET_CC@@#$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_CC)))#' \
>  		-e 's#@@TARGET_CXX@@#$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_CXX)))#' \
>  		-e 's#@@TARGET_FC@@#$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_FC)))#' \
> +		-e 's#@@CMAKE_SYSTEM_VERSION@@#$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))#' \
>  		-e 's#@@CMAKE_SYSTEM_PROCESSOR@@#$(call qstrip,$(CMAKE_SYSTEM_PROCESSOR))#' \
>  		-e 's#@@TOOLCHAIN_HAS_FORTRAN@@#$(if $(BR2_TOOLCHAIN_HAS_FORTRAN),1,0)#' \
>  		-e 's#@@CMAKE_BUILD_TYPE@@#$(if $(BR2_ENABLE_DEBUG),Debug,Release)#' \
> diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
> index 6f3c8ca971..276b36629f 100644
> --- a/support/misc/toolchainfile.cmake.in
> +++ b/support/misc/toolchainfile.cmake.in
> @@ -15,6 +15,7 @@ string(REPLACE "/share/buildroot" "" RELOCATED_HOST_DIR ${CMAKE_CURRENT_LIST_DIR
>  list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR})
>  
>  set(CMAKE_SYSTEM_NAME Buildroot)
> +set(CMAKE_SYSTEM_VERSION @@CMAKE_SYSTEM_VERSION@@)
>  set(CMAKE_SYSTEM_PROCESSOR @@CMAKE_SYSTEM_PROCESSOR@@)
>  
>  # Set the {C,CXX}FLAGS appended by CMake depending on the build type
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
