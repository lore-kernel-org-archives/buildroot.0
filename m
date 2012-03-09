From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 9 Mar 2012 07:54:32 +0100
Subject: [Buildroot] [PATCH 11/13] cmake: move creation of toolchain
 file to package/pkg-cmaketargets.mk
In-Reply-To: <e165f3e7d58343c33b295e78c7ec60b0f6bbb839.1331148806.git.thomas.petazzoni@free-electrons.com>
References: <cover.1331148806.git.thomas.petazzoni@free-electrons.com>
 <e165f3e7d58343c33b295e78c7ec60b0f6bbb839.1331148806.git.thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LW88QiWEWG5qSTQ7Uvh_5hM1r7kQaXQ6Fs7uyimCPCP+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 7, 2012 at 8:34 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> ?Makefile ? ? ? ? ? ? ? ? ? ?| ? 17 -----------------
> ?package/pkg-cmaketargets.mk | ? 22 ++++++++++++++++++++++
> ?2 files changed, 22 insertions(+), 17 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 1986e33..ab91b10 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -339,23 +339,6 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
>
> ?world: prepare dirs dependencies $(BASE_TARGETS) $(TARGETS_ALL)
>
> -$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
> - ? ? ? mkdir -p $(@D)
> - ? ? ? @echo -en "\
> - ? ? ? set(CMAKE_SYSTEM_NAME Linux)\n\
> - ? ? ? set(CMAKE_C_COMPILER $(TARGET_CC_NOCCACHE))\n\
> - ? ? ? set(CMAKE_CXX_COMPILER $(TARGET_CXX_NOCCACHE))\n\
> - ? ? ? set(CMAKE_C_FLAGS \"\$${CMAKE_C_FLAGS} $(TARGET_CFLAGS)\" CACHE STRING \"Buildroot CFLAGS\" FORCE)\n\
> - ? ? ? set(CMAKE_CXX_FLAGS \"\$${CMAKE_CXX_FLAGS} $(TARGET_CXXFLAGS)\" CACHE STRING \"Buildroot CXXFLAGS\" FORCE)\n\
> - ? ? ? set(CMAKE_INSTALL_SO_NO_EXE 0)\n\
> - ? ? ? set(CMAKE_PROGRAM_PATH \"$(HOST_DIR)/usr/bin\")\n\
> - ? ? ? set(CMAKE_FIND_ROOT_PATH \"$(STAGING_DIR)\")\n\
> - ? ? ? set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)\n\
> - ? ? ? set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)\n\
> - ? ? ? set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)\n\
> - ? ? ? set(ENV{PKG_CONFIG_SYSROOT_DIR} \"$(STAGING_DIR)\")\n\
> - ? ? ? " > $@
> -
> ?.PHONY: all world dirs clean distclean source outputmakefile \
> ? ? ? ?$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
> ? ? ? ?$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) \
> diff --git a/package/pkg-cmaketargets.mk b/package/pkg-cmaketargets.mk
> index 1cd65e4..371ab11 100644
> --- a/package/pkg-cmaketargets.mk
> +++ b/package/pkg-cmaketargets.mk
> @@ -197,3 +197,25 @@ else
> ?$(call CMAKETARGETS_INNER,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
> ?endif
> ?endef
> +
> +################################################################################
> +# Generation of the CMake toolchain file
> +################################################################################
> +
> +$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
> + ? ? ? @mkdir -p $(@D)
> + ? ? ? @echo -en "\
> + ? ? ? set(CMAKE_SYSTEM_NAME Linux)\n\
> + ? ? ? set(CMAKE_C_COMPILER $(TARGET_CC_NOCCACHE))\n\
> + ? ? ? set(CMAKE_CXX_COMPILER $(TARGET_CXX_NOCCACHE))\n\
> + ? ? ? set(CMAKE_C_FLAGS \"\$${CMAKE_C_FLAGS} $(TARGET_CFLAGS)\" CACHE STRING \"Buildroot CFLAGS\" FORCE)\n\
> + ? ? ? set(CMAKE_CXX_FLAGS \"\$${CMAKE_CXX_FLAGS} $(TARGET_CXXFLAGS)\" CACHE STRING \"Buildroot CXXFLAGS\" FORCE)\n\
> + ? ? ? set(CMAKE_INSTALL_SO_NO_EXE 0)\n\
> + ? ? ? set(CMAKE_PROGRAM_PATH \"$(HOST_DIR)/usr/bin\")\n\
> + ? ? ? set(CMAKE_FIND_ROOT_PATH \"$(STAGING_DIR)\")\n\
> + ? ? ? set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)\n\
> + ? ? ? set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)\n\
> + ? ? ? set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)\n\
> + ? ? ? set(ENV{PKG_CONFIG_SYSROOT_DIR} \"$(STAGING_DIR)\")\n\
> + ? ? ? " > $@
> +

Currently, BASE_TARGETS is still:
$(BASE_TARGETS): dirs $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake

Now that the recipe for toolchainfile.cmake has moved, I find it a bit
strange that the 'magic' path to this file still appears here.
What about creating a nicer name and using that in BASE_TARGETS, and
let the pkg-cmaketargets.mk file resolve the nice name into the actual
path?

> --
> 1.7.4.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
