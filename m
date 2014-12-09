From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 9 Dec 2014 22:53:39 +0100
Subject: [Buildroot] [PATCH v3] pkg-cmake.mk: Set CMAKE_SYSTEM_PROCESSOR.
In-Reply-To: <1416254561-12691-1-git-send-email-volker.krause@kdab.com>
References: <1416254561-12691-1-git-send-email-volker.krause@kdab.com>
Message-ID: <CAHXCMM+EL5UvxSxpdVw2q9i1L43hrq_sEQ9th6cJH_aswisvYQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 17, 2014 at 9:02 PM, Volker Krause <volker.krause@kdab.com> wrote:
> This is rarely needed by packages, but convenient to have when it is.
>
> Signed-off-by: Volker Krause <volker.krause@kdab.com>

Acked-by: Samuel Martin <s.martin49@gmail.com>

> ---
> Changes v2 -> v3:
>   - fixed endianess handling for ARM v4-v7
>   - coding style
>
> Changes v1 -> v2:
>   - added missing qstrip
>   - set the correct ARM variant as done in
>     http://patchwork.ozlabs.org/patch/408501/
>
>  package/pkg-cmake.mk                | 22 ++++++++++++++++++++++
>  support/misc/toolchainfile.cmake.in |  1 +
>  2 files changed, 23 insertions(+)
>
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index c8735ef..85fda86 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -180,6 +180,27 @@ host-cmake-package = $(call inner-cmake-package,host-$(pkgname),$(call UPPERCASE
>  # Generation of the CMake toolchain file
>  ################################################################################
>
> +# CMAKE_SYSTEM_PROCESSOR should match uname -m
> +ifeq ($(BR2_ARM_CPU_ARMV4),y)
> +ARM_VARIANT = armv4
> +else ifeq ($(BR2_ARM_CPU_ARMV5),y)
> +ARM_VARIANT = armv5
> +else ifeq ($(BR2_ARM_CPU_ARMV6),y)
> +ARM_VARIANT = armv6
> +else ifeq ($(BR2_ARM_CPU_ARMV7A),y)
> +ARM_VARIANT = armv7
> +endif
> +
> +ifeq ($(BR2_arm),y)
> +CMAKE_SYSTEM_PROCESSOR = $(ARM_VARIANT)l
> +else ifeq ($(BR2_armeb),y)
> +CMAKE_SYSTEM_PROCESSOR = $(ARM_VARIANT)b
> +endif
> +
> +ifndef CMAKE_SYSTEM_PROCESSOR
> +CMAKE_SYSTEM_PROCESSOR = $(BR2_ARCH)
> +endif
> +
>  # In order to allow the toolchain to be relocated, we calculate the HOST_DIR
>  # based on the toolchainfile.cmake file's location: $(HOST_DIR)/usr/share/buildroot
>  # In all the other variables, HOST_DIR will be replaced by RELOCATED_HOST_DIR,
> @@ -193,5 +214,6 @@ $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
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
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Samuel
