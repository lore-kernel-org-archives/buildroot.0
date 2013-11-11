From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Nov 2013 23:30:58 +0100
Subject: [Buildroot] [PATCH 5/6] pkg-cmake.mk,
 pkg-autotools.mk: add PATH in the configure command environment
In-Reply-To: <1384203586-17790-6-git-send-email-s.martin49@gmail.com>
References: <1384203586-17790-1-git-send-email-s.martin49@gmail.com>
 <1384203586-17790-6-git-send-email-s.martin49@gmail.com>
Message-ID: <20131111233058.70fbc99f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Mon, 11 Nov 2013 21:59:45 +0100, Samuel Martin wrote:

> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> index 9523529..b405eb1 100644
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -102,6 +102,7 @@ ifeq ($(5),target)
>  # Configure package for target
>  define $(2)_CONFIGURE_CMDS
>  	(cd $$($$(PKG)_SRCDIR) && rm -rf config.cache && \
> +	PATH=$(BR2_PATH) \
>  	$$(TARGET_CONFIGURE_OPTS) \
>  	$$(TARGET_CONFIGURE_ARGS) \
>  	$$($$(PKG)_CONF_ENV) \
> @@ -129,6 +130,7 @@ else
>  # installed.
>  define $(2)_CONFIGURE_CMDS
>  	(cd $$($$(PKG)_SRCDIR) && rm -rf config.cache; \
> +		PATH=$(BR2_PATH) \
>  	        $$(HOST_CONFIGURE_OPTS) \
>  		CFLAGS="$$(HOST_CFLAGS)" \
>  		LDFLAGS="$$(HOST_LDFLAGS)" \

These two chunks are not needed, since HOST_CONFIGURE_OPTS and
TARGET_CONFIGURE_OPTS already contain PATH=$(BR2_PATH) (you changed
them in PATH 3/6).

> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index 0e08722..956fce8 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -62,6 +62,7 @@ ifeq ($(5),target)
>  define $(2)_CONFIGURE_CMDS
>  	(cd $$($$(PKG)_BUILDDIR) && \
>  	rm -f CMakeCache.txt && \
> +	PATH=$(BR2_PATH) \
>  	$$($$(PKG)_CONF_ENV) $(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
>  		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
>  		-DCMAKE_INSTALL_PREFIX="/usr" \
> @@ -74,6 +75,7 @@ else
>  define $(2)_CONFIGURE_CMDS
>  	(cd $$($$(PKG)_BUILDDIR) && \
>  	rm -f CMakeCache.txt && \
> +	PATH=$(BR2_PATH) \
>  	$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
>  		-DCMAKE_INSTALL_SO_NO_EXE=0 \
>  		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \

However, I agree with those ones. An user recently reported a problem
that was caused by cmake not having a proper PATH passed into its
environment, and therefore failing to find some Buildroot tools (I
think it was pkg-config).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
