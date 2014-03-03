From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 03 Mar 2014 08:05:39 +0100
Subject: [Buildroot] [PATCH] pkg-cmaketargets.mk: do not hardcode
 absolute path in toolchainfile.cmake
In-Reply-To: <1393694162-21952-1-git-send-email-s.martin49@gmail.com>
References: <1393694162-21952-1-git-send-email-s.martin49@gmail.com>
Message-ID: <531429C3.80801@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/03/14 18:16, Samuel Martin wrote:
> The patch allows sharing or moving the toolchains.
> 
> This is a step toward making the toolchain/sdk relocatable.
> 
> Closes #6818
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: Uwe Strempel <u.strempel@googlemail.com>
> ---
>  package/pkg-cmake.mk | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index f7e454b..4effb15 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -159,16 +159,18 @@ host-cmake-package = $(call inner-cmake-package,host-$(pkgname),$(call UPPERCASE
>  $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
>  	@mkdir -p $(@D)
>  	@echo -en "\
> +	get_filename_component(_HOST_DIR \$${CMAKE_CURRENT_LIST_FILE} PATH)\n\
> +	set(_HOST_DIR \"\$${_HOST_DIR}/../../..\")\n\
>  	set(CMAKE_SYSTEM_NAME Linux)\n\
> -	set(CMAKE_C_COMPILER $(TARGET_CC_NOCCACHE))\n\
> -	set(CMAKE_CXX_COMPILER $(TARGET_CXX_NOCCACHE))\n\
> +	set(CMAKE_C_COMPILER \"\$${_HOST_DIR}/$(subst $(HOST_DIR)/,,$(TARGET_CROSS))gcc\")\n\

 Wouldn't it be more natural to write

set(CMAKE_C_COMPILER \"$(subst $(HOST_DIR)/,\$${_HOST_DIR}/,$(TARGET_CC_NOCCACHE)\")\n\

?

 And BTW this entire piece of code could benefit from a
change in quoting style (' instead of ") and using printf
instead of echo -en. But that's of course unrelated :-)


 Regards,
 Arnout

> +	set(CMAKE_CXX_COMPILER \"\$${_HOST_DIR}/$(subst $(HOST_DIR)/,,$(TARGET_CROSS))g++\")\n\
>  	set(CMAKE_C_FLAGS \"\$${CMAKE_C_FLAGS} $(TARGET_CFLAGS)\" CACHE STRING \"Buildroot CFLAGS\" FORCE)\n\
>  	set(CMAKE_CXX_FLAGS \"\$${CMAKE_CXX_FLAGS} $(TARGET_CXXFLAGS)\" CACHE STRING \"Buildroot CXXFLAGS\" FORCE)\n\
>  	set(CMAKE_INSTALL_SO_NO_EXE 0)\n\
> -	set(CMAKE_PROGRAM_PATH \"$(HOST_DIR)/usr/bin\")\n\
> -	set(CMAKE_FIND_ROOT_PATH \"$(STAGING_DIR)\")\n\
> +	set(CMAKE_PROGRAM_PATH \"\$${_HOST_DIR}/usr/bin\")\n\
> +	set(CMAKE_FIND_ROOT_PATH \"\$${_HOST_DIR}/$(STAGING_SUBDIR)\")\n\
>  	set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)\n\
>  	set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)\n\
>  	set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)\n\
> -	set(ENV{PKG_CONFIG_SYSROOT_DIR} \"$(STAGING_DIR)\")\n\
> +	set(ENV{PKG_CONFIG_SYSROOT_DIR} \"\$${_HOST_DIR}/$(STAGING_SUBDIR)\")\n\
>  	" > $@
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
