From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 12 Mar 2015 00:14:44 +0100
Subject: [Buildroot] [PATCH v6 3/3] GNURadio: new package
In-Reply-To: <1426076003-12088-3-git-send-email-gwenj@trabucayre.com>
References: <1426076003-12088-1-git-send-email-gwenj@trabucayre.com>
 <1426076003-12088-3-git-send-email-gwenj@trabucayre.com>
Message-ID: <5500CC64.50501@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/03/15 13:13, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

 Unfortunately I still have a few comments. But I think GNURadio is a really
useful package for buildroot (or vice versa :-).

> ---

[snip]
> diff --git a/package/gnuradio/0001-suppress-boost_unitest-detection.patch b/package/gnuradio/0001-suppress-boost_unitest-detection.patch
> new file mode 100644
> index 0000000..ab8411b
> --- /dev/null
> +++ b/package/gnuradio/0001-suppress-boost_unitest-detection.patch
> @@ -0,0 +1,32 @@
> +By default, the boost test option is mandatory for build environment
> +detection. 
> +This patch suppress this dependency and allows the test part only if
> +build_test is enabled at the Buildroot level.
> +
> +Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> +---
> +Index: gnuradio-3.7.5/volk/cmake/VolkBoost.cmake
> +===================================================================
> +--- gnuradio-3.7.5.orig/volk/cmake/VolkBoost.cmake
> ++++ gnuradio-3.7.5/volk/cmake/VolkBoost.cmake
> +@@ -29,7 +29,6 @@ set(__INCLUDED_VOLK_BOOST_CMAKE TRUE)
> + set(BOOST_REQUIRED_COMPONENTS
> +     filesystem
> +     system
> +-    unit_test_framework
> +     program_options
> + )
> + 
> +Index: gnuradio-3.7.5/volk/lib/CMakeLists.txt
> +===================================================================
> +--- gnuradio-3.7.5.orig/volk/lib/CMakeLists.txt
> ++++ gnuradio-3.7.5/volk/lib/CMakeLists.txt
> +@@ -541,7 +541,7 @@ endif(ENABLE_STATIC_LIBS)
> + ########################################################################
> + 
> + 
> +-if(Boost_FOUND)
> ++if(Boost_FOUND AND BUILD_TEST)

 My CMake knowledge is a bit limited, but if boost's unit test framework is not
enabled and BUILD_TEST is, will this not give an error? For buildroot that's not
so relevant because we never enable BUILD_TEST, but for upstreaming it is.

> + 
> +     set_source_files_properties(
> +         ${CMAKE_CURRENT_SOURCE_DIR}/testqa.cc PROPERTIES
> diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
> new file mode 100644
> index 0000000..a95c704
> --- /dev/null
> +++ b/package/gnuradio/Config.in
> @@ -0,0 +1,46 @@
> +comment "gnuradio needs a toolchain w/ C++, IPV6, threads, largefile, wchar"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
> +			!BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || \
> +			!BR2_INET_IPV6

 Two tabs is enough for the continued indentation.

> +
[snip]
> diff --git a/package/gnuradio/gnuradio.hash b/package/gnuradio/gnuradio.hash
> new file mode 100644
> index 0000000..a25b466
> --- /dev/null
> +++ b/package/gnuradio/gnuradio.hash
> @@ -0,0 +1,2 @@
> +# From http://gnuradio.org/redmine/projects/gnuradio/files
> +md5	b4a917a548f41ce25c6c88f9bc864bca	gnuradio-3.7.5.tar.gz

 If upstream only provides md5, we usually add a locally-calculated sha256.

> diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
> new file mode 100644
> index 0000000..e503911
> --- /dev/null
> +++ b/package/gnuradio/gnuradio.mk
> @@ -0,0 +1,59 @@
> +################################################################################
> +#
> +# gnuradio
> +#
> +################################################################################
> +
> +GNURADIO_VERSION = 3.7.5
> +GNURADIO_SITE = http://gnuradio.org/redmine/attachments/download/792
> +GNURADIO_LICENSE = GPLv3+
> +GNURADIO_LICENSE_FILES = COPYING
> +
> +# gnuradio prevents doing an in-source-tree build

 This comment is redundant, the variable explains it all.

> +GNURADIO_SUPPORTS_IN_SOURCE_BUILD = NO
> +
> +# host-python-cheetah is needed for volk to compile
> +GNURADIO_DEPENDENCIES = \
> +		host-python-cheetah \
> +		host-swig \

 Isn't host-swig only needed when python is enabled? Or does volk also require it?

> +		boost
> +
> +GNURADIO_CONF_OPTS = \
> +		-DENABLE_DEFAULT=OFF \
> +		-DENABLE_VOLK=ON \
> +		-DENABLE_GNURADIO_RUNTIME=ON
> +
> +#For third-party blocks,  the gnuradio libraries are mandatory at 
> +# compile time.
> +GNURADIO_INSTALL_STAGING = YES
> +
> +# Yes, this is silly, because -march is already known by the compiler
> +# with the internal toolchain, and passed by the external wrapper for
> +# external toolchains. Nonetheless, gnuradio does some matching on the
> +# CFLAGS to decide whether to build the NEON functions or not, and
> +# wants to see the string 'armv7' in the CFLAGS.
> +ifeq ($(BR2_ARM_CPU_ARMV7A),y)
> +GNURADIO_CONF_OPTS += -DCMAKE_C_FLAGS="-march=armv7-a"

 Not all armv7 actually support NEON, so this should also be in the HAS_NEON
condition. So something like:

# Yes, this is silly, because -march is already known by the compiler
# with the internal toolchain, and passed by the external wrapper for
# external toolchains. Nonetheless, gnuradio does some matching on the
# CFLAGS to decide whether to build the NEON functions or not, and
# wants to see the string 'armv7' in the CFLAGS.
ifeq ($(BR2_ARM_CPU_ARMV7A)$(BR2_ARM_CPU_HAS_NEON),yy)
GNURADIO_CONF_OPTS += -DCMAKE_C_FLAGS="-march=armv7-a"
endif

> +endif
> +
> +# As soon as -mfpu=neon is supported by the compiler, gnuradio will try
> +# to use it. But having NEON support in the compiler doesn't necessarily
> +# mean we have NEON support in our CPU.
> +ifeq ($(BR2_ARM_CPU_HAS_NEON),)
> +GNURADIO_CONF_OPTS += -Dhave_mfpu_neon=0

 I don't find anything that looks like this CMake variable in the source... Are
you sure it does anything?


 Regards,
 Arnout


> +endif
> +
> +ifeq ($(BR2_PACKAGE_GNURADIO_BLOCKS),y)
> +GNURADIO_CONF_OPTS += -DENABLE_GR_BLOCKS=ON
> +else
> +GNURADIO_CONF_OPTS += -DENABLE_GR_BLOCKS=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
> +GNURADIO_DEPENDENCIES += python
> +GNURADIO_CONF_OPTS += -DENABLE_PYTHON=ON
> +else
> +GNURADIO_CONF_OPTS += -DENABLE_PYTHON=OFF
> +endif
> +
> +$(eval $(cmake-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
