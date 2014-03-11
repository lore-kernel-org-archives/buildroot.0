From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Mar 2014 23:51:24 +0100
Subject: [Buildroot] [PATCH v7 3/6] *.mk: replace (TARGET|HOST)_PATH by
 BR_PATH
In-Reply-To: <1394577587-6426-4-git-send-email-s.martin49@gmail.com>
References: <1394577587-6426-1-git-send-email-s.martin49@gmail.com>
 <1394577587-6426-4-git-send-email-s.martin49@gmail.com>
Message-ID: <20140311225124.GC3330@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-03-11 23:39 +0100, Samuel Martin spake thusly:
> Thanks to the 2 previous patches of the series, BR_PATH contains
> all locations in which host-packages may install programs.
> 
> This patch replaces the occurrences TARGET_PATH and HOST_PATH with
> BR_PATH, everywhere these variables are used in the *.mk files.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> changes v6 -> v7:
> - rebase
> - remove double quotes around $(BR_PATH) (Yann)
> 
> changes v4 -> v6:
> - rebase
> 
> changes v3 -> v4:
> - rebase
> - fix typo in commit log (ThomasP)
> - rename BR2_PATH -> BR_PATH
> 
> changes v2 -> v3:
> - rebase
> 
> changes v1 -> v2:
> - rebase
> ---
>  fs/ext2/ext2.mk          | 2 +-
>  package/Makefile.in      | 8 ++++----
>  package/gpm/gpm.mk       | 2 +-
>  package/libhid/libhid.mk | 2 +-
>  package/pkg-python.mk    | 8 ++++----
>  package/sdl/sdl.mk       | 2 +-
>  6 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
> index 0af955f..1bc49da 100644
> --- a/fs/ext2/ext2.mk
> +++ b/fs/ext2/ext2.mk
> @@ -24,7 +24,7 @@ EXT2_ENV  = GEN=$(BR2_TARGET_ROOTFS_EXT2_GEN)
>  EXT2_ENV += REV=$(BR2_TARGET_ROOTFS_EXT2_REV)
>  
>  define ROOTFS_EXT2_CMD
> -	PATH=$(TARGET_PATH) $(EXT2_ENV) fs/ext2/genext2fs.sh -d $(TARGET_DIR) $(EXT2_OPTS) $@
> +	PATH=$(BR_PATH) $(EXT2_ENV) fs/ext2/genext2fs.sh -d $(TARGET_DIR) $(EXT2_OPTS) $@
>  endef
>  
>  rootfs-ext2-symlink:
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 99c1975..d92628c 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -208,7 +208,7 @@ HOSTCC_VERSION:=$(shell $(HOSTCC_NOCCACHE) --version | \
>  HOST_PERL_ARCHNAME := $(shell perl -MConfig -e "print Config->{archname}")
>  export PERL5LIB := $(HOST_DIR)/usr/lib/perl5/$(HOST_PERL_ARCHNAME):$(HOST_DIR)/usr/lib/perl5
>  
> -TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
> +TARGET_CONFIGURE_OPTS=PATH=$(BR_PATH) \
>  		AR="$(TARGET_AR)" \
>  		AS="$(TARGET_AS)" \
>  		LD="$(TARGET_LD)" \
> @@ -245,10 +245,10 @@ TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
>  		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
>  		STAGING_DIR="$(STAGING_DIR)"
>  
> -TARGET_MAKE_ENV=PATH=$(TARGET_PATH)
> +TARGET_MAKE_ENV=PATH=$(BR_PATH)
>  
>  
> -HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
> +HOST_CONFIGURE_OPTS=PATH=$(BR_PATH) \
>  		AR="$(HOSTAR)" \
>  		AS="$(HOSTAS)" \
>  		LD="$(HOSTLD)" \
> @@ -270,7 +270,7 @@ HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
>  		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig:$(HOST_DIR)/usr/share/pkgconfig" \
>  		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)"
>  
> -HOST_MAKE_ENV=PATH=$(HOST_PATH) \
> +HOST_MAKE_ENV=PATH=$(BR_PATH) \
>  		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)" \
>  		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
>  		PKG_CONFIG_SYSROOT_DIR="/" \
> diff --git a/package/gpm/gpm.mk b/package/gpm/gpm.mk
> index 85fdad6..d927bab 100644
> --- a/package/gpm/gpm.mk
> +++ b/package/gpm/gpm.mk
> @@ -27,7 +27,7 @@ GPM_CONF_OPT = --without-curses
>  # configure is missing but gpm seems not compatible with our autoreconf
>  # mechanism so we have to do it manually instead of using GPM_AUTORECONF = YES
>  define GPM_RUN_AUTOGEN
> -	cd $(@D) && PATH=$(HOST_PATH) ./autogen.sh
> +	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
>  endef
>  GPM_PRE_CONFIGURE_HOOKS += GPM_RUN_AUTOGEN
>  
> diff --git a/package/libhid/libhid.mk b/package/libhid/libhid.mk
> index 1b9b895..30501d5 100644
> --- a/package/libhid/libhid.mk
> +++ b/package/libhid/libhid.mk
> @@ -11,7 +11,7 @@ LIBHID_INSTALL_STAGING = YES
>  LIBHID_AUTORECONF = YES
>  # configure runs libusb-config for cflags/ldflags. Ensure it picks up
>  # the target version
> -LIBHID_CONF_ENV = PATH=$(STAGING_DIR)/usr/bin:$(TARGET_PATH)
> +LIBHID_CONF_ENV = PATH=$(STAGING_DIR)/usr/bin:$(BR_PATH)
>  LIBHID_CONF_OPT = \
>  	--disable-swig \
>  	--disable-werror \
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index 512ef66..ba59b70 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -22,7 +22,7 @@
>  
>  # Target distutils-based packages
>  PKG_PYTHON_DISTUTILS_ENV = \
> -	PATH="$(TARGET_PATH)" \
> +	PATH=$(BR_PATH) \
>  	CC="$(TARGET_CC)" \
>  	CFLAGS="$(TARGET_CFLAGS)" \
>  	LDFLAGS="$(TARGET_LDFLAGS)" \
> @@ -40,14 +40,14 @@ PKG_PYTHON_DISTUTILS_INSTALL_OPT = \
>  
>  # Host distutils-based packages
>  HOST_PKG_PYTHON_DISTUTILS_ENV = \
> -	PATH="$(HOST_PATH)"
> +	PATH=$(BR_PATH)
>  
>  HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPT = \
>  	--prefix=$(HOST_DIR)/usr
>  
>  # Target setuptools-based packages
>  PKG_PYTHON_SETUPTOOLS_ENV = \
> -	PATH="$(TARGET_PATH)" \
> +	PATH=$(BR_PATH) \
>  	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
>  	_python_sysroot=$(STAGING_DIR) \
>  	_python_prefix=/usr \
> @@ -61,7 +61,7 @@ PKG_PYTHON_SETUPTOOLS_INSTALL_OPT = \
>  
>  # Host setuptools-based packages
>  HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
> -	PATH="$(HOST_PATH)"
> +	PATH=$(BR_PATH)
>  
>  HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPT = \
>  	--prefix=$(HOST_DIR)/usr
> diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
> index d5fb331..0de3f19 100644
> --- a/package/sdl/sdl.mk
> +++ b/package/sdl/sdl.mk
> @@ -14,7 +14,7 @@ SDL_INSTALL_STAGING = YES
>  # we're patching configure.in, but package cannot autoreconf with our version of
>  # autotools, so we have to do it manually instead of setting SDL_AUTORECONF = YES
>  define SDL_RUN_AUTOGEN
> -	cd $(@D) && PATH=$(HOST_PATH) ./autogen.sh
> +	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
>  endef
>  
>  SDL_PRE_CONFIGURE_HOOKS += SDL_RUN_AUTOGEN
> -- 
> 1.9.0
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
