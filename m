From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 04 Mar 2014 18:19:23 +0100
Subject: [Buildroot] [PATCH v5 4/4] *.mk: remove all occurences of
 TARGET_PATH and HOST_PATH
In-Reply-To: <1393703951-7059-5-git-send-email-s.martin49@gmail.com>
References: <1393703951-7059-1-git-send-email-s.martin49@gmail.com>
 <1393703951-7059-5-git-send-email-s.martin49@gmail.com>
Message-ID: <53160B1B.20708@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/03/14 20:59, Samuel Martin wrote:
> Thanks to the 2 previous patches, the PATH now contains all locations
> in which host-packages may install programs.
> 
> This patch removes the occurrences TARGET_PATH and HOST_PATH from the
> *.mk files.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v4 -> v5:
> - rebase
> - remove all occurence of {TARGET,HOST}_PATH
> - fixup a couple of PATH definitions
> 
> changes v3 -> v4:
> - rebase
> - fix typo in commit log (ThomasP)
> - rename BR2_PATH -> BR_PATH
> - make substitution of new occurenrces (gpm.mk)
> 
> changes v2 -> v3:
> - rebase
> - no one-line commit log (ThomasP)
> 
> changes v1 -> v2:
> - make substitution of new occurenrces (pkg-python.mk and sdl.mk)
> ---
>  fs/ext2/ext2.mk          |  2 +-
>  package/Makefile.in      | 14 ++++----------
>  package/gpm/gpm.mk       |  2 +-
>  package/libhid/libhid.mk |  2 +-
>  package/pkg-python.mk    |  8 ++------
>  package/sdl/sdl.mk       |  2 +-

 Have you tested that ext2, gpm, libhid and sdl still work?

>  6 files changed, 10 insertions(+), 20 deletions(-)
> 

[snip]
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index 512ef66..7705a86 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -22,7 +22,6 @@
>  
>  # Target distutils-based packages
>  PKG_PYTHON_DISTUTILS_ENV = \
> -	PATH="$(TARGET_PATH)" \
>  	CC="$(TARGET_CC)" \
>  	CFLAGS="$(TARGET_CFLAGS)" \
>  	LDFLAGS="$(TARGET_LDFLAGS)" \
> @@ -39,15 +38,13 @@ PKG_PYTHON_DISTUTILS_INSTALL_OPT = \
>  	--prefix=$(TARGET_DIR)/usr
>  
>  # Host distutils-based packages
> -HOST_PKG_PYTHON_DISTUTILS_ENV = \
> -	PATH="$(HOST_PATH)"
> +HOST_PKG_PYTHON_DISTUTILS_ENV =

 Since this is now empty, the variable can be removed. Also its use in
python-m2crypto can be removed, and in $(2)_BASE_ENV. And since
$(2)_BASE_ENV becomes empty, it can be removed as well.

 But perhaps you better do that in a separate patch, since some people
may disagree.


 Regards,
 Arnout


>  
>  HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPT = \
>  	--prefix=$(HOST_DIR)/usr
>  
>  # Target setuptools-based packages
>  PKG_PYTHON_SETUPTOOLS_ENV = \
> -	PATH="$(TARGET_PATH)" \
>  	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
>  	_python_sysroot=$(STAGING_DIR) \
>  	_python_prefix=/usr \
> @@ -60,8 +57,7 @@ PKG_PYTHON_SETUPTOOLS_INSTALL_OPT = \
>  	--root=/
>  
>  # Host setuptools-based packages
> -HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
> -	PATH="$(HOST_PATH)"
> +HOST_PKG_PYTHON_SETUPTOOLS_ENV =
>  
>  HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPT = \
>  	--prefix=$(HOST_DIR)/usr
> diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
> index d5fb331..053a3c6 100644
> --- a/package/sdl/sdl.mk
> +++ b/package/sdl/sdl.mk
> @@ -14,7 +14,7 @@ SDL_INSTALL_STAGING = YES
>  # we're patching configure.in, but package cannot autoreconf with our version of
>  # autotools, so we have to do it manually instead of setting SDL_AUTORECONF = YES
>  define SDL_RUN_AUTOGEN
> -	cd $(@D) && PATH=$(HOST_PATH) ./autogen.sh
> +	cd $(@D) && ./autogen.sh
>  endef
>  
>  SDL_PRE_CONFIGURE_HOOKS += SDL_RUN_AUTOGEN
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
