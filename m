From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 7 Jan 2021 22:43:07 +0100
Subject: [Buildroot] [PATCH 2/3] package/environment-setup: make script
 idempotent
In-Reply-To: <20201231212949.2415485-3-konrad.schwarz@siemens.com>
References: <20201231212949.2415485-1-konrad.schwarz@siemens.com>
 <20201231212949.2415485-3-konrad.schwarz@siemens.com>
Message-ID: <aacff91f-ea3c-ed65-3906-0cc8ac3bf30f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 31/12/2020 22:29, Konrad Schwarz wrote:
> One (slight) problem with this kind of environment setup files is when they
> are executed repeatedly (e.g., because something else is not quite right
> yet), they tend to extend the PATH variable with the same directory,
> creating a very unwieldy search path and potentially slowing down
> searches for executable files.
> 
> This fix adds a test such that PATH is extended only when necessary.
> 
> The code has also been simplified
> (using standard POSIX shell features) and make the generated
> script more readable, e.g., by splitting overly long lines.

 Maybe the generated script is more readable (and I'm not entirely convinced),
but the code in the .mk file is much *less* readable.

 If you want to make it more readable, I think it would be better to do change
the environment-setup script to environment-setup.in that contains @VAR@
references which are replaced with sed. In fact, since this kind of approach is
used in many places, it would be worth adding a make function that does exactly
that. But maybe that's going a bit too far :-)


 Also, this change of how the script is formatted should be split in a separate
patch from the PATH manipulation, they are pretty much unrelated.

 Regards,
 Arnout

> Signed-off-by: Konrad Schwarz <konrad.schwarz@siemens.com>
> ---
>  .../environment-setup/environment-setup.mk    | 60 +++++++++----------
>  1 file changed, 30 insertions(+), 30 deletions(-)
> 
> diff --git a/package/environment-setup/environment-setup.mk b/package/environment-setup/environment-setup.mk
> index fcad013f0d..5cb703e421 100644
> --- a/package/environment-setup/environment-setup.mk
> +++ b/package/environment-setup/environment-setup.mk
> @@ -4,38 +4,38 @@
>  #
>  ################################################################################
>  
> -ENVIRONMENT_SETUP_FILE = $(HOST_DIR)/environment-setup
> -
>  define HOST_ENVIRONMENT_SETUP_INSTALL_CMDS
> -	cp package/environment-setup/environment-setup $(ENVIRONMENT_SETUP_FILE)
> -	for var in $(TARGET_CONFIGURE_OPTS); do \
> -		printf "export \"$$var\"\n" >> $(ENVIRONMENT_SETUP_FILE); \
> -	done
> -	printf "export \"ARCH=$(KERNEL_ARCH)\"\n" >> $(ENVIRONMENT_SETUP_FILE)
> -	printf "export \"CROSS_COMPILE=$(TARGET_CROSS)\"\n" >> $(ENVIRONMENT_SETUP_FILE)
> -	printf "export \"CONFIGURE_FLAGS=--target=$(GNU_TARGET_NAME) \
> -		--host=$(GNU_TARGET_NAME) \
> -		--build=$(GNU_HOST_NAME) \
> -		--prefix=/usr \
> -		--exec-prefix=/usr \
> -		--sysconfdir=/etc \
> -		--localstatedir=/var \
> -		--program-prefix=\"\n" >> $(ENVIRONMENT_SETUP_FILE)
> -	printf "alias configure=\"./configure \$${CONFIGURE_FLAGS}\"\n" \
> -		>> $(ENVIRONMENT_SETUP_FILE)
> -	printf "alias cmake=\"cmake \
> -		-DCMAKE_TOOLCHAIN_FILE=$(HOST_DIR)/share/buildroot/toolchainfile.cmake \
> -		-DCMAKE_INSTALL_PREFIX=/usr\"\n" >> $(ENVIRONMENT_SETUP_FILE)
> -	$(SED) 's%$(HOST_DIR)%\$$SDK_PATH%g' \
> -		-e 's%$(HOST_DIR)/bin/%%g' \
> -		-e '/^export "PATH=/c\' \
> -		$(ENVIRONMENT_SETUP_FILE)
> -	printf "export \"PATH=\$$SDK_PATH/bin:\$$SDK_PATH/sbin:\$$PATH\"\n" \
> -		>> $(ENVIRONMENT_SETUP_FILE)
> -
> +	{ \
> +	cat package/environment-setup/environment-setup &&\
> +	printf 'export "%s"\n' $(TARGET_CONFIGURE_OPTS) &&\
> +	printf %b\
> +	'export "ARCH=$(KERNEL_ARCH)"\n'\
> +	'export "CROSS_COMPILE=$(TARGET_CROSS)"\n'\
> +	'export CONFIGURE_FLAGS=\\\n'\
> +		'"--target=$(GNU_TARGET_NAME) "\\\n'\
> +		'"--host=$(GNU_TARGET_NAME) "\\\n'\
> +		'"--build=$(GNU_HOST_NAME) "\\\n'\
> +		'"--prefix=/usr "\\\n'\
> +		'"--exec-prefix=/usr "\\\n'\
> +		'"--sysconfdir=/etc "\\\n'\
> +		'"--localstatedir=/var "\\\n'\
> +		'"--program-prefix= "\n'\
> +	'alias configure="./configure \$$CONFIGURE_FLAGS"\n'\
> +	'alias cmake="cmake"\\\n'\
> +		'" -DCMAKE_TOOLCHAIN_FILE'\
> +		'=$(HOST_DIR)/share/buildroot/toolchainfile.cmake"\\\n'\
> +		'" -DCMAKE_INSTALL_PREFIX=/usr"\n'\
> +	'if ! command -v $${CROSS_COMPILE}gcc > /dev/null\n'\
> +	'then	export PATH="$$SDK_PATH/bin:$$SDK_PATH/sbin:$$PATH"\n'\
> +	'fi\n'\
> +	\
>  	$(if $(BR2_LINUX_KERNEL),\
> -		printf "export \"KERNELDIR=$(LINUX_BUILDDIR)\"\n" \
> -			>> $(ENVIRONMENT_SETUP_FILE),)
> +		'export "KERNELDIR=$(LINUX_BUILDDIR)"\n')\
> +	; } |\
> +	sed -e 's%$(HOST_DIR)%\$$SDK_PATH%g'\
> +		-e 's%$(HOST_DIR)/bin/%%g'\
> +		-e '/^export "PATH=/c\'\
> +		>$(HOST_DIR)/environment-setup
>  endef
>  
>  $(eval $(host-generic-package))
> 
