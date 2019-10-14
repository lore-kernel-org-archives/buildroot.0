From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Oct 2019 23:07:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump version to 12.12.0
In-Reply-To: <20191014145358.62394-1-james.hilliard1@gmail.com>
References: <20191014145358.62394-1-james.hilliard1@gmail.com>
Message-ID: <20191014230700.0b4ca358@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Martin: since this is a fairly big bump, I'd really like to have your
Reviewed-by/Tested-by on this patch. Thanks!

See below some review comments.

On Mon, 14 Oct 2019 08:53:58 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Removed libhttpparser dependency as nodejs now uses built in llhttp.

Then you also need to remove the select BR2_PACKAGE_LIBHTTPPARSER from
the Config.in file.

> -sha256 7bf1123d7415964775b8f81fe6ec6dd5c3c08abb42bb71dfe4409dbeeba26bbd  node-v10.16.3.tar.xz
> +# From https://nodejs.org/dist/v12.12.0/SHASUMS256.txt
> +sha256 d9fa875aba9764f1b919115ce1d5e828b02c2a55a6e9e1b6fc771bb6b24a8cc1  node-v12.12.0.tar.xz
>  
>  # Hash for license file
> -sha256 2b0fe00a83916d0290c8531db25a827e18d01e7c4bf000e9a0f2e826604ba41e  LICENSE
> +sha256 950bbc741dc021489c47683e34e7637e9b96fb4a1f430b2f77a744130516e293  LICENSE

Changes in the LICENSE file need to be described/justified in the
commit log.

>  NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
> -	libhttpparser libuv zlib nghttp2 \
> +	libuv zlib nghttp2 \

As said above, this needs adjustment in the Config.in file.

> @@ -76,6 +77,9 @@ define HOST_NODEJS_BUILD_CMDS
>  		PATH=$(@D)/bin:$(BR_PATH)
>  
>  	$(HOST_DIR)/bin/patchelf --set-rpath $(HOST_DIR)/lib $(@D)/out/Release/torque
> +	$(HOST_DIR)/bin/patchelf --set-rpath $(HOST_DIR)/lib $(@D)/out/Release/mkcodecache
> +	$(HOST_DIR)/bin/patchelf --set-rpath $(HOST_DIR)/lib $(@D)/out/Release/gen-regexp-special-case
> +	$(HOST_DIR)/bin/patchelf --set-rpath $(HOST_DIR)/lib $(@D)/out/Release/bytecode_builtins_list_generator
>  endef
>  
>  define HOST_NODEJS_INSTALL_CMDS
> @@ -86,6 +90,9 @@ define HOST_NODEJS_INSTALL_CMDS
>  		PATH=$(@D)/bin:$(BR_PATH)
>  
>  	$(INSTALL) -m755 -D $(@D)/out/Release/torque $(HOST_DIR)/bin/torque
> +	$(INSTALL) -m755 -D $(@D)/out/Release/mkcodecache $(HOST_DIR)/bin/mkcodecache
> +	$(INSTALL) -m755 -D $(@D)/out/Release/gen-regexp-special-case $(HOST_DIR)/bin/gen-regexp-special-case
> +	$(INSTALL) -m755 -D $(@D)/out/Release/bytecode_builtins_list_generator $(HOST_DIR)/bin/bytecode_builtins_list_generator
>  endef
>  
>  ifeq ($(BR2_i386),y)
> @@ -143,7 +150,19 @@ define NODEJS_CONFIGURE_CMDS
>  
>  	# use host version of torque
>  	sed "s#<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)torque<(EXECUTABLE_SUFFIX)#$(HOST_DIR)/bin/torque#" \
> -		-i $(@D)/deps/v8/gypfiles/v8.gyp
> +		-i $(@D)/tools/v8_gypfiles/v8.gyp
> +
> +	# use host version of mkcodecache
> +	sed "s#<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)mkcodecache<(EXECUTABLE_SUFFIX)#$(HOST_DIR)/bin/mkcodecache#" \
> +		-i $(@D)/node.gyp
> +
> +	# use host version of gen-regexp-special-case
> +	sed "s#<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)gen-regexp-special-case<(EXECUTABLE_SUFFIX)#$(HOST_DIR)/bin/gen-regexp-special-case#" \
> +		-i $(@D)/tools/v8_gypfiles/v8.gyp
> +
> +	# use host version of bytecode_builtins_list_generator
> +	sed "s#<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)bytecode_builtins_list_generator<(EXECUTABLE_SUFFIX)#$(HOST_DIR)/bin/bytecode_builtins_list_generator#" \
> +		-i $(@D)/tools/v8_gypfiles/v8.gyp

All this stuff really calls for a bit of factorization:

NODEJS_HOST_TOOLS = \
	torque \
	mkcodecache \
	gen-regexp-special-case \
	bytecode_builtins_list_generator

then:

	$(foreach f,$(NODEJS_HOST_TOOLS), \
		$(HOST_DIR)/bin/patchelf --set-rpath $(HOST_DIR)/lib $(@D)/out/Release/$(f))
	)

and:

	$(foreach f,$(NODEJS_HOST_TOOLS), \
		$(INSTALL) -m755 -D $(@D)/out/Release/$(f) $(HOST_DIR)/bin/$(f)
	)

and finally:

	$(foreach f,$(NODEJS_HOST_TOOLS), \
		$(SED) "s#<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)$(f)<(EXECUTABLE_SUFFIX)#$(HOST_DIR)/bin/$(f)#" \
			$(@D)/tools/v8_gypfiles/v8.gyp
	)

Could you take into account those comments and resubmit ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
