From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Oct 2020 23:50:42 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/libmdbx: new package
 (library/database).
In-Reply-To: <20201006192709.8265-2-leo@yuriev.ru>
References: <CAO2+NUDJUL_FYfQ3E_cmmu20F3VOagxDpy_243a6mU3oAeASNA@mail.gmail.com>
 <20201006192709.8265-2-leo@yuriev.ru>
Message-ID: <20201014235042.1a27b09f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Leonid,

Thanks for this contribution and new iteration!

On Tue,  6 Oct 2020 22:27:09 +0300
Leonid Yuriev <leo@yuriev.ru> wrote:

> This patch adds libmdbx v0.9.1:
>  - libmdbx is one of the fastest compact embeddable key-value ACID database.
>  - libmdbx has a specific set of properties and capabilities,
>    focused on creating unique lightweight solutions.
>  - libmdbx surpasses the legendary LMDB (Lightning Memory-Mapped Database)
>    in terms of reliability, features and performance.
> 
> https://github.com/erthink/libmdbx
> 

Your Signed-off-by line should be here... and not after the changelog.

> ---
> Changes v1 -> v2:
>   - libmdbx version v0.8.2 -> v0.9.1 (released 2020-09-30)
> 
> Changes v2 -> v3:
>   - removed outcommented stuff (suggested by Heiko Thiery).
>   - cleaned up and simplified the makefile (suggested by Heiko Thiery).
>   - added patch for C++ header installation.
>   - added patch with fix minor copy&paste typo.
>   - added patch with pthread workaround for buggy toolchain/cmake/buildroot.
>   - added patch for `pthread_yield()`.
>   - passed `utils/check-package package/libmdbx/*` (suggested by Heiko Thiery)
>   - passed `utils/test-pkg -a -p libmdbx`,
>     except w/o threads & w/o MMU (suggested by Heiko Thiery).
> 
> Changes v3 -> v4:
>   - fix passing BR2_PACKAGE_LIBMDBX_TOOLS option to cmake.
>   - fix using `depend on` instead of `select`,
>     and add `comment` for C++ toolchain (suggested by Heiko Thiery).
>   - fix minor help typo.
> 
> Signed-off-by: Leonid Yuriev <leo@yuriev.ru>


> +N:	Leonid Yuriev <leo@yuriev.ru>
> +F:	package/libmdbx

Final / missing.


> diff --git a/package/libmdbx/Config.in b/package/libmdbx/Config.in
> new file mode 100644
> index 0000000000..dc36f12348
> --- /dev/null
> +++ b/package/libmdbx/Config.in
> @@ -0,0 +1,42 @@
> +config BR2_PACKAGE_LIBMDBX
> +	bool "libmdbx"
> +	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_4
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +	help
> +	  One of the fastest compact key-value ACID database
> +	  without WAL. libmdbx has a specific set of properties
> +	  and capabilities, focused on creating unique lightweight
> +	  solutions.
> +
> +	  libmdbx surpasses the legendary LMDB in terms of
> +	  reliability, features and performance.
> +
> +	  https://github.com/erthink/libmdbx
> +
> +if BR2_PACKAGE_LIBMDBX
> +
> +config BR2_PACKAGE_LIBMDBX_TOOLS
> +	bool "install tools"
> +	help
> +	  Install libmdbx tools for checking, dump, restore
> +	  and show statistics of databases.
> +
> +config BR2_PACKAGE_LIBMDBX_CXX

I don't think this option is needed, just enable C++ support in the .mk
file when the relevant conditions are met.

> +	bool "C++ API"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +	help
> +	  Enable modern C++11/14/17/20 API for libmdbx.
> +
> +comment "libmdbx C++ support needs a toolchain w/ C++11, gcc >= 4.8"
> +	depends on !BR2_INSTALL_LIBSTDCPP || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +
> +endif
> +
> +comment "libmdbx needs a toolchain w/ threads, gcc >= 4.4"
> +	depends on BR2_USE_MMU

depends on BR2_TOOLCHAIN_HAS_SYNC_4

should be added here as well.

> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_4
> diff --git a/package/libmdbx/libmdbx.hash b/package/libmdbx/libmdbx.hash
> new file mode 100644
> index 0000000000..f48cd81a7d
> --- /dev/null
> +++ b/package/libmdbx/libmdbx.hash
> @@ -0,0 +1,2 @@

# Locally calculated

> +sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
> +sha256  c7fb24381eb4d92f2e2edc17e577cb721269683c816c6cca307c58f6f346e786  libmdbx-amalgamated-0.9.1.tar.gz

Please put the tarball hash before the license hash.

> diff --git a/package/libmdbx/libmdbx.mk b/package/libmdbx/libmdbx.mk
> new file mode 100644
> index 0000000000..be0c2d7b06
> --- /dev/null
> +++ b/package/libmdbx/libmdbx.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# libmdbx
> +#
> +################################################################################
> +
> +LIBMDBX_VERSION = 0.9.1
> +LIBMDBX_SOURCE = libmdbx-amalgamated-$(LIBMDBX_VERSION).tar.gz
> +LIBMDBX_SITE = https://github.com/erthink/libmdbx/releases/download/v$(LIBMDBX_VERSION)
> +LIBMDBX_SUPPORTS_IN_SOURCE_BUILD = NO
> +LIBMDBX_LICENSE = OLDAP-2.8
> +LIBMDBX_LICENSE_FILES = LICENSE
> +LIBMDBX_REDISTRIBUTE = YES

Not needed, this is the default.

> +LIBMDBX_STRIP_COMPONENTS = 0

Quite odd, why do you generate your tarballs like this ?

> +LIBMDBX_INSTALL_STAGING = YES
> +
> +LIBMDBX_CONF_OPTS = -DMDBX_INSTALL_MANPAGES=OFF -DBUILD_FOR_NATIVE_CPU=OFF \
> +	-DMDBX_INSTALL_STATIC=$(if $(BR2_STATIC_LIBS),ON,OFF) \
> +	-DMDBX_BUILD_SHARED_LIBRARY=$(if $(BR2_SHARED_LIBS),ON,OFF) \

This is not good as it doesn't account for the BR2_SHARED_STATIC_LIBS
situation. So it should be:

ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
LIBMDBX_CONF_OPTS += -DMDBX_INSTALL_STATIC=ON
else
LIBMDBX_CONF_OPTS += -DMDBX_INSTALL_STATIC=OFF
endif

ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
LIBMDBX_CONF_OPTS += -DMDBX_BUILD_SHARED_LIBRARY=ON
else
LIBMDBX_CONF_OPTS += -DMDBX_BUILD_SHARED_LIBRARY=OFF
endif


> +	-DMDBX_BUILD_CXX=$(if $(BR2_PACKAGE_LIBMDBX_CXX),ON,OFF) \
> +	-DMDBX_BUILD_TOOLS=$(if $(BR2_PACKAGE_LIBMDBX_TOOLS),ON,OFF) \
> +	-DMDBX_LINK_TOOLS_NONSTATIC=$(if $(BR2_SHARED_LIBS),ON,OFF)

Ditto here.


However, the bigger problem is that it doesn't build for me. I used the
following defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2020.02.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_LIBMDBX=y
BR2_PACKAGE_LIBMDBX_TOOLS=y
BR2_PACKAGE_LIBMDBX_CXX=y
# BR2_TARGET_ROOTFS_TAR is not set

And it fails like this:

In file included from /home/thomas/projets/buildroot/output/build/libmdbx-0.9.1/mdbx.c++:105:0:
/home/thomas/projets/buildroot/output/build/libmdbx-0.9.1/mdbx.h++:223:10: error: ?exception_ptr? in namespace ?std? does not name a type
   ::std::exception_ptr captured_;
          ^
/home/thomas/projets/buildroot/output/build/libmdbx-0.9.1/mdbx.h++: In member function ?bool mdbx::exception_thunk::is_clean() const?:
/home/thomas/projets/buildroot/output/build/libmdbx-0.9.1/mdbx.h++:2730:66: error: ?captured_? was not declared in this scope
 inline bool exception_thunk::is_clean() const noexcept { return !captured_; }
                                                                  ^
/home/thomas/projets/buildroot/output/build/libmdbx-0.9.1/mdbx.h++: In member function ?void mdbx::exception_thunk::capture()?:
/home/thomas/projets/buildroot/output/build/libmdbx-0.9.1/mdbx.h++:2734:3: error: ?captured_? was not declared in this scope
   captured_ = ::std::current_exception();
   ^
/home/thomas/projets/buildroot/output/build/libmdbx-0.9.1/mdbx.h++:2734:15: error: ?current_exception? is not a member of ?std?
   captured_ = ::std::current_exception();
               ^
/home/thomas/projets/buildroot/output/build/libmdbx-0.9.1/mdbx.h++: In member function ?void mdbx::exception_thunk::rethrow_captured() const?:
/home/thomas/projets/buildroot/output/build/libmdbx-0.9.1/mdbx.h++:2738:7: error: ?captured_? was not declared in this scope
   if (captured_)
       ^
/home/thomas/projets/buildroot/output/build/libmdbx-0.9.1/mdbx.h++:2739:25: error: ?rethrow_exception? is not a member of ?std?
     MDBX_CXX20_UNLIKELY ::std::rethrow_exception(captured_);
                         ^
make[3]: *** [CMakeFiles/mdbx.dir/build.make:96: CMakeFiles/mdbx.dir/mdbx.c++.o] Error 1

Some older versions of gcc had an issue with exception_ptr, see
BR2_TOOLCHAIN_HAS_GCC_BUG_64735. You might need to depend on
!BR2_TOOLCHAIN_HAS_GCC_BUG_64735. See other packages that have this
dependency in Buildroot.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
