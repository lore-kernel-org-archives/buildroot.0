From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Mar 2014 00:05:02 +0100
Subject: [Buildroot] [PATCH v6 3/6] *.mk: replace (TARGET|HOST)_PATH by
 BR_PATH
In-Reply-To: <1394373623-10650-4-git-send-email-s.martin49@gmail.com>
References: <1394373623-10650-1-git-send-email-s.martin49@gmail.com>
 <1394373623-10650-4-git-send-email-s.martin49@gmail.com>
Message-ID: <20140309230502.GD3194@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-03-09 15:00 +0100, Samuel Martin spake thusly:
> Thanks to the 2 previous patches of the series, BR_PATH contains
> all locations in which host-packages may install programs.
> 
> This patch replaces the occurrences TARGET_PATH and HOST_PATH with
> BR_PATH, everywhere these variables are used in the *.mk files.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[--SNIP--]
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index 512ef66..b0e4bd3 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -22,7 +22,7 @@
>  
>  # Target distutils-based packages
>  PKG_PYTHON_DISTUTILS_ENV = \
> -	PATH="$(TARGET_PATH)" \
> +	PATH="$(BR_PATH)" \

Don't you lareday have quotes in the definitions of BR_PATH.
From patch 1/1:

    BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin:$(PATH)"

So they are not needed here.

That's even worse: the quotes above would nullify the ones in the
BR_PATH definition, and if a component in the PATH has a sapce,
you're toast. ;-)

>  	CC="$(TARGET_CC)" \
>  	CFLAGS="$(TARGET_CFLAGS)" \
>  	LDFLAGS="$(TARGET_LDFLAGS)" \
> @@ -40,14 +40,14 @@ PKG_PYTHON_DISTUTILS_INSTALL_OPT = \
>  
>  # Host distutils-based packages
>  HOST_PKG_PYTHON_DISTUTILS_ENV = \
> -	PATH="$(HOST_PATH)"
> +	PATH="$(BR_PATH)"

Ditto.

>  HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPT = \
>  	--prefix=$(HOST_DIR)/usr
>  
>  # Target setuptools-based packages
>  PKG_PYTHON_SETUPTOOLS_ENV = \
> -	PATH="$(TARGET_PATH)" \
> +	PATH="$(BR_PATH)" \

Ditto.

>  	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
>  	_python_sysroot=$(STAGING_DIR) \
>  	_python_prefix=/usr \
> @@ -61,7 +61,7 @@ PKG_PYTHON_SETUPTOOLS_INSTALL_OPT = \
>  
>  # Host setuptools-based packages
>  HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
> -	PATH="$(HOST_PATH)"
> +	PATH="$(BR_PATH)"

Ditto.

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

Also note how we do not quote BR_PATH here, although this is the exact
same conditions as the ones for python, above: passing the variable in
the shell environment.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
