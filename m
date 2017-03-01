From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 1 Mar 2017 08:58:31 +0100
Subject: [Buildroot] [PATCH 1/5] core/pkg-cmake: provide our own
 platform description
In-Reply-To: <f25e9ff7873418c0b323528d6a9c2482c752cd31.1488305206.git.yann.morin.1998@free.fr>
References: <cover.1488305206.git.yann.morin.1998@free.fr>
 <f25e9ff7873418c0b323528d6a9c2482c752cd31.1488305206.git.yann.morin.1998@free.fr>
Message-ID: <e36f8ee2-22d1-318b-178a-9ce84f31a03a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28-02-17 19:07, Yann E. MORIN wrote:
> The handling of RPATH in cmake-3.7 has changed drastically, causing a
> slew of build failures dues to libraries from the host being pulled in:
[snip]
>   - we add a new platfom definitions that inherits from the Linux one,
>     then overrides the problematic settings;

 Not mentioned in the commit log but important to note: this platform file is
only used for target CMake packages, not host packages.

[snip]
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index a7c8dc3..77fa1dc 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -87,6 +87,7 @@ define $(2)_CONFIGURE_CMDS
>  	PATH=$$(BR_PATH) \
>  	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
>  		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
> +		-DCMAKE_MODULE_PATH="$$(HOST_DIR)/usr/share/buildroot" \

 Since you don't do any processing on the file, you could just use

		-DCMAKE_MODULE_PATH="$$(TOPDIR)/support/misc" \

and avoid copying the file around. Of course, in that case, support/cmake is
probably a better place to put the file :-)

 On the other hand, in the future we may want to add other stuff to the cmake
module path, and that stuff might get processed. I don't really like adding
complexity for some unknown future use, but it does make some kind of sense.

 If you do copy the file, it should IMHO go into STAGING_DIR, not HOST_DIR. I
think the location of toolchainfile.cmake is incorrect as well. We briefly
discussed this at some BR developer meeting IIRC but nobody took action on it.

 Regards,
 Arnout

>  		-DCMAKE_INSTALL_PREFIX="/usr" \
>  		-DCMAKE_COLOR_MAKEFILE=OFF \
>  		-DBUILD_DOC=OFF \
> @@ -249,3 +250,6 @@ $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
>  		-e 's#@@CMAKE_BUILD_TYPE@@#$(if $(BR2_ENABLE_DEBUG),Debug,Release)#' \
>  		$(TOPDIR)/support/misc/toolchainfile.cmake.in \
>  		> $@
> +
> +$(HOST_DIR)/usr/share/buildroot/Platform/Buildroot.cmake:
> +	$(Q)$(INSTALL) -D -m 0644 support/misc/Buildroot.cmake $(@)
> diff --git a/support/misc/Buildroot.cmake b/support/misc/Buildroot.cmake
> new file mode 100644
> index 0000000..b0046b3
> --- /dev/null
> +++ b/support/misc/Buildroot.cmake
> @@ -0,0 +1,3 @@
> +include(Platform/Linux)
> +set_property(GLOBAL PROPERTY FIND_LIBRARY_USE_LIB32_PATHS FALSE)
> +set_property(GLOBAL PROPERTY FIND_LIBRARY_USE_LIB64_PATHS FALSE)
> diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
> index d4252dd..5a42644 100644
> --- a/support/misc/toolchainfile.cmake.in
> +++ b/support/misc/toolchainfile.cmake.in
> @@ -10,7 +10,7 @@
>  # RELOCATED_HOST_DIR variable.
>  string(REPLACE "/usr/share/buildroot" "" RELOCATED_HOST_DIR ${CMAKE_CURRENT_LIST_DIR})
>  
> -set(CMAKE_SYSTEM_NAME Linux)
> +set(CMAKE_SYSTEM_NAME Buildroot)
>  set(CMAKE_SYSTEM_PROCESSOR @@CMAKE_SYSTEM_PROCESSOR@@)
>  
>  # Set the {C,CXX}FLAGS appended by CMake depending on the build type
> diff --git a/toolchain/toolchain/toolchain.mk b/toolchain/toolchain/toolchain.mk
> index b16db01..e298373 100644
> --- a/toolchain/toolchain/toolchain.mk
> +++ b/toolchain/toolchain/toolchain.mk
> @@ -38,3 +38,4 @@ endif
>  $(eval $(virtual-package))
>  
>  toolchain: $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
> +toolchain: $(HOST_DIR)/usr/share/buildroot/Platform/Buildroot.cmake
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
