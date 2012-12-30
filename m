From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Dec 2012 23:14:43 +0100
Subject: [Buildroot] [PATCH 4/8] package/pkg-cmake.mk: make sure
 $(HOST_PATH) is in the PATH at configure time
In-Reply-To: <5e67b559958501e38ddd579c1fce3b18cd363ad2.1356903063.git.s.martin49@gmail.com>
References: <cover.1356903063.git.s.martin49@gmail.com>
 <5e67b559958501e38ddd579c1fce3b18cd363ad2.1356903063.git.s.martin49@gmail.com>
Message-ID: <20121230231443.3a5ffb1f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun, 30 Dec 2012 22:33:28 +0100, Samuel Martin wrote:
> ---
>  package/pkg-cmake.mk | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index 626a0b0..1e8302f 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -62,7 +62,8 @@ ifeq ($(5),target)
>  define $(2)_CONFIGURE_CMDS
>  	(cd $$($$(PKG)_BUILDDIR) && \
>  	rm -f CMakeCache.txt && \
> -	$$($$(PKG)_CONF_ENV) $(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
> +	PATH="$(TARGET_PATH)" $$($$(PKG)_CONF_ENV) \
> +		$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
>  		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
>  		-DCMAKE_INSTALL_PREFIX="/usr" \
>  		$$($$(PKG)_CONF_OPT) \
> @@ -74,7 +75,7 @@ else
>  define $(2)_CONFIGURE_CMDS
>  	(cd $$($$(PKG)_BUILDDIR) && \
>  	rm -f CMakeCache.txt && \
> -	$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
> +	PATH="$(HOST_PATH)" $(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
>  		-DCMAKE_INSTALL_SO_NO_EXE=0 \
>  		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
>  		-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \

In fact, with your previous patch TARGET_PATH becomes equal to
HOST_PATH. And I find the name TARGET_PATH to be misleading. Maybe we
should just refactor that in a single variable instead?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
