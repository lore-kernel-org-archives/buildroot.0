From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 16 Nov 2014 15:20:32 +0100
Subject: [Buildroot] [PATCH v2] pkg-cmake.mk: Set CMAKE_SYSTEM_PROCESSOR.
In-Reply-To: <1416138927-7857-1-git-send-email-volker.krause@kdab.com>
References: <1416138927-7857-1-git-send-email-volker.krause@kdab.com>
Message-ID: <CAHXCMMKtKeWjPLpo_DEB2Gw0xwpeH642MAD9G3_ZEXG-xaVKiw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Volker, all,

On Sun, Nov 16, 2014 at 12:55 PM, Volker Krause <volker.krause@kdab.com> wrote:
> This is rarely needed by packages, but convenient to have when it is.
>
> Signed-off-by: Volker Krause <volker.krause@kdab.com>
> ---
> Changes v1 -> v2:
>   - added missing qstrip
>   - set the correct ARM variant as done in
>     http://patchwork.ozlabs.org/patch/408501/
>
>  package/pkg-cmake.mk                | 15 +++++++++++++++
>  support/misc/toolchainfile.cmake.in |  1 +
>  2 files changed, 16 insertions(+)
>
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index c8735ef..619da9b 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -180,6 +180,20 @@ host-cmake-package = $(call inner-cmake-package,host-$(pkgname),$(call UPPERCASE
>  # Generation of the CMake toolchain file
>  ################################################################################
>
> +# CMAKE_SYSTEM_PROCESSOR should match uname -m
> +ifeq ($(BR2_ARM_CPU_ARMV5),y)
> +CMAKE_SYSTEM_PROCESSOR = armv5

I'm not a big fan of the name of this variable...
Let's see what others think about it.

> +endif
> +ifeq ($(BR2_ARM_CPU_ARMV6),y)
> +CMAKE_SYSTEM_PROCESSOR = armv6l
> +endif
> +ifeq ($(BR2_ARM_CPU_ARMV7A),y)
> +CMAKE_SYSTEM_PROCESSOR = armv7l
> +endif
> +ifndef CMAKE_SYSTEM_PROCESSOR
> +CMAKE_SYSTEM_PROCESSOR = $(BR2_ARCH)
> +endif
> +
>  # In order to allow the toolchain to be relocated, we calculate the HOST_DIR
>  # based on the toolchainfile.cmake file's location: $(HOST_DIR)/usr/share/buildroot
>  # In all the other variables, HOST_DIR will be replaced by RELOCATED_HOST_DIR,
> @@ -193,5 +207,6 @@ $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
>                 -e 's:@@TARGET_LDFLAGS@@:$(call qstrip,$(TARGET_LDFLAGS)):' \
>                 -e 's:@@TARGET_CC_NOCCACHE@@:$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_CC_NOCCACHE))):' \
>                 -e 's:@@TARGET_CXX_NOCCACHE@@:$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_CXX_NOCCACHE))):' \
> +               -e 's:@@CMAKE_SYSTEM_PROCESSOR@@:$(call qstrip,$(CMAKE_SYSTEM_PROCESSOR)):' \
>                 $(TOPDIR)/support/misc/toolchainfile.cmake.in \
>                 > $@
> diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
> index 4ca3d35..816af13 100644
> --- a/support/misc/toolchainfile.cmake.in
> +++ b/support/misc/toolchainfile.cmake.in
> @@ -11,6 +11,7 @@
>  string(REPLACE "/usr/share/buildroot" "" RELOCATED_HOST_DIR ${CMAKE_CURRENT_LIST_DIR})
>
>  set(CMAKE_SYSTEM_NAME Linux)
> +set(CMAKE_SYSTEM_PROCESSOR @@CMAKE_SYSTEM_PROCESSOR@@)
>
>  set(CMAKE_C_FLAGS "@@TARGET_CFLAGS@@ ${CMAKE_C_FLAGS}" CACHE STRING "Buildroot CFLAGS")
>  set(CMAKE_CXX_FLAGS "@@TARGET_CXXFLAGS@@ ${CMAKE_CXX_FLAGS}" CACHE STRING "Buildroot CXXFLAGS")
> --
> 1.8.4.5

Anyway, this looks good, so:

Reviewed-by: Samuel Martin <s.martin49@gmail.com>


Regards,

-- 
Samuel
