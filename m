From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Mar 2013 22:19:46 +0100
Subject: [Buildroot] [PATCH 2/2 V5] nodejs: new package
In-Reply-To: <1362102967-10236-1-git-send-email-daniel.price@gmail.com>
References: <1362102967-10236-1-git-send-email-daniel.price@gmail.com>
Message-ID: <20130304221946.6c6d62cd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Daniel Price,

On Thu, 28 Feb 2013 17:56:07 -0800, Daniel Price wrote:

> diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
> new file mode 100644
> index 0000000..22daade
> --- /dev/null
> +++ b/package/nodejs/Config.in
> @@ -0,0 +1,78 @@
> +config BR2_PACKAGE_NODEJS
> +	bool "nodejs"
> +	depends on BR2_INET_IPV6
> +	depends on BR2_LARGEFILE
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_arm || BR2_i386 || BR2_x86_64
> +	# uses fork()
> +	depends on BR2_USE_MMU
> +	help
> +	  Event-driven I/O server-side JavaScript environment based on V8.
> +
> +	  http://nodejs.org/
> +
> +comment "nodejs requires a toolchain with C++, IPv6, large files, and threading"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6

We generally want lines like this to be split on two lines:

comment "nodejs requires a toolchain with C++, IPv6, large files, and threading"
	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || \
		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6


> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> new file mode 100644
> index 0000000..b30fcd4
> --- /dev/null
> +++ b/package/nodejs/nodejs.mk
> @@ -0,0 +1,109 @@
> +#############################################################
> +#
> +# nodejs
> +#
> +#############################################################
> +
> +NODEJS_VERSION = 0.8.21
> +NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.gz
> +NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
> +NODEJS_DEPENDENCIES = host-python host-nodejs \
> +    $(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
> +HOST_NODEJS_DEPENDENCIES = host-python
> +NODEJS_LICENSE = MIT

Please add:

NODEJS_LICENSE_FILES = LICENSE

That said, as the LICENSE file explains, nodejs source code includes
some code from various other projects, under other licenses. Maybe the
licensing experts should tell us what value NODEJS_LICENSE should have
here. Yann? Luca? See
https://github.com/joyent/node/blob/master/LICENSE if you don't want to
download the whole nodejs source code.

> +define HOST_NODEJS_INSTALL_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
> +endef
> +
> +ifeq ($(BR2_i386),y)
> +NODEJS_CPU=ia32
> +else ifeq ($(BR2_x86_64),y)
> +NODEJS_CPU=x64
> +else ifeq ($(BR2_arm),y)
> +NODEJS_CPU=arm
> +# V8 needs to know what floating point ABI the target is using.  There's also
> +# a 'hard' option which we're not exposing here at the moment, because
> +# buildroot itself doesn't really support it at present.
> +ifeq ($(BR2_SOFT_FLOAT),y)
> +NODEJS_ARM_FP=soft
> +else
> +NODEJS_ARM_FP=softfp
> +endif
> +endif

In fact, using BR2_SOFT_FLOAT doesn't work very well: on ARM, with an
external toolchain, BR2_SOFT_FLOAT will always be 'y', and therefore,
when NodeJS is built with a hard-float toolchain like Linaro ARM
toolchains, it doesn't work at runtime.

But that's not your fault, it's the Buildroot infrastructure that
doesn't handle this very well. So keep this as it is for now.

> +#
> +# Build the list of modules to install based on the booleans for
> +# popular modules, as well as the "additional modules" list.
> +# qstrip the whole thing to remove whitespace.
> +#
> +NODEJS_MODULES_LIST= $(call qstrip, \
> +	$(if $(BR2_PACKAGE_NODEJS_MODULES_EXPRESS),express,) \
> +	$(if $(BR2_PACKAGE_NODEJS_MODULES_COFFEESCRIPT),coffee-script,) \
> +	$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL))

When reviewing the previous version, I did suggest to use qstrip only
where needed, and to remove useless commas:

NODEJS_MODULES_LIST = \
	$(if $(BR2_PACKAGE_NODEJS_MODULES_EXPRESS),express) \
	$(if $(BR2_PACKAGE_NODEJS_MODULES_COFFEESCRIPT),coffee-script) \
	$(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL))

> +define NODEJS_INSTALL_TARGET_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) DESTDIR=$(TARGET_DIR) install
> +
> +	# If you're having trouble with module installation, adding -d to the
> +	# npm install call below and setting npm_config_rollback=false can both
> +	# help in diagnosing the problem.
> +	if [[ -n "$(NODEJS_MODULES_LIST)" ]]; then \
> +		echo "Installing modules: $(NODEJS_MODULES_LIST)"; \
> +		(cd $(TARGET_DIR)/usr/lib; \
> +			$(TARGET_CONFIGURE_OPTS) \
> +			LD="$(TARGET_CXX)" \
> +			npm_config_arch=$(NODEJS_CPU) \
> +			npm_config_nodedir=$(BUILD_DIR)/nodejs-$(NODEJS_VERSION) \
> +			$(HOST_DIR)/usr/bin/npm install \
> +			$(NODEJS_MODULES_LIST) \
> +		) \
> +	fi
> +endef

Here as well, I already suggested doing this in a different way, when
reviewing the v4 of your patch. I don't like the shell based testing of
NODEJS_MODULES_LIST. It's much more common in Buildroot to do something
like:

ifneq ($(NODEJS_MODULES_LIST),)
define NODEJS_INSTALL_MODULES
	(cd $(TARGET_DIR)/usr/lib;
	   ...
endef
endif

define NODEJS_INSTALL_TARGET_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) DESTDIR=$(TARGET_DIR) install
	$(NODEJS_INSTALL_MODULES)
endef

Also, get rid of the 'echo' when installing modules.

Once those things are fixed, then I think the patch will be good to go!

Thanks a lot for your work!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
