From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2016 23:43:23 +0200
Subject: [Buildroot] [PATCHv2 1/2] package/efl: enable Eolian languages
 bindings
In-Reply-To: <1468875087-17192-1-git-send-email-romain.naour@gmail.com>
References: <1468875087-17192-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160720234323.621269e7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Jul 2016 22:51:26 +0200, Romain Naour wrote:

> +config BR2_PACKAGE_EFL_EOLIAN_CPP
> +	bool "Enable Eolian C++ bindings"
> +	depends on BR2_HOST_GCC_AT_LEAST_4_8 # Eolian (host) needs C++11
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # Eolian needs C++11
> +	help
> +	  Eolian is an EO object parser and code genrator.

generator

> +	  Whith this option enabled Eolian will handle automatic generation

With

> +ifeq ($(BR2_PACKAGE_EFL_EOLIAN_CPP),y)
> +EFL_CONF_OPTS += --enable-cxx-bindings \
> +	--with-eolian-cxx=$(HOST_DIR)/usr/bin/eolian_cxx
> +else
> +EFL_CONF_OPTS += --disable-cxx-bindings
> +endif
> +
>  ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),y)
>  EFL_DEPENDENCIES += util-linux
>  EFL_CONF_OPTS += --enable-libmount
> @@ -216,7 +221,8 @@ $(eval $(autotools-package))
>  ################################################################################
>  
>  # We want to build only some host tools used later in the build.
> -# Actually we want: edje_cc, embryo_cc and eet.
> +# Actually we want: edje_cc, eet and embryo_cc. eolian_cxx is build only

is built

> +# Enable Eolian language bindings to provide eolian_cxx tool for the host which
> +# is required to build Eolian language bindings for the target.
> +ifeq ($(BR2_PACKAGE_EFL_EOLIAN_CPP),y)
> +HOST_EFL_CONF_OPTS += --enable-cxx-bindings
> +else
> +HOST_EFL_CONF_OPTS += --disable-cxx-bindings
> +endif

I've moved this below...

> +
>  # Configure options:
>  # --disable-audio, --disable-multisense remove libsndfile dependency.
> -# --disable-cxx-bindings: disable C++11 bindings.
>  # --disable-fontconfig: remove dependency on fontconfig.
>  # --disable-fribidi: remove dependency on libfribidi.
>  # --disable-gstreamer1: remove dependency on gtreamer 1.0.
> @@ -251,7 +264,6 @@ HOST_EFL_DEPENDENCIES = \
>  #   Yes I really know what I am doing.
>  HOST_EFL_CONF_OPTS += \
>  	--disable-audio \
> -	--disable-cxx-bindings \
>  	--disable-fontconfig \
>  	--disable-fribidi \
>  	--disable-gstreamer1 \

... this, so that the unconditional options are listed before the
conditional ones.

Also, while doing a build test, I encountered a dependency check error:
efl has zlib in its DEPENDENCIES variable, but does not select it. So,
I've added a separate commit that fixes this.

Applied with the above typos fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
