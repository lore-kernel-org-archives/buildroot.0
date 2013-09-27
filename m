From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 27 Sep 2013 16:24:33 +0200
Subject: [Buildroot] [RFCv1 10/11] toolchain-external: convert to the
 package infrastructure
In-Reply-To: <1378416469-17708-11-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378416469-17708-11-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <52459521.9080809@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> This commit converts the 'toolchain-external' logic to the package
> infrastructure.
>
> The TOOLCHAIN_EXTERNAL_DIR variable (which points to where the
> toolchain is located) is renamed to TOOLCHAIN_EXTERNAL_INSTALL_DIR,
> because the former conflicts with the package infrastructure (which
> defines the <pkg>_DIR variable for each package as pointing to its
> build directory).
>
> The new _SOURCE_ADDONS mechanism is used for Blackfin toolchains.
>
> The extract, configuration and installation steps are converted inside
> the <pkg>_EXTRACT_CMDS, <pkg>_CONFIGURE_CMDS and
> <pkg>_INSTALL_STAGING_CMDS.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---

...

>   # Checks for an already installed toolchain: check the toolchain
>   # location, check that it supports sysroot, and then verify that it
>   # matches the configuration provided in Buildroot: ABI, C++ support,
>   # type of C library and all C library features.
> -$(STAMP_DIR)/ext-toolchain-checked: $(TOOLCHAIN_EXTERNAL_DEPENDENCIES)
> -	@$(call MESSAGE,"Checking external toolchain settings")
> +define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
>   	$(Q)$(call check_cross_compiler_exists,$(TOOLCHAIN_EXTERNAL_CC))
>   	$(Q)LIBC_A_LOCATION=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) -print-file-name=libc.a)` ; \
>   	SYSROOT_DIR=`echo $${LIBC_A_LOCATION} | sed -r -e 's:usr/lib(32|64)?/(.*/)?libc\.a::'` ; \
> @@ -385,7 +368,7 @@ $(STAMP_DIR)/ext-toolchain-checked: $(TOOLCHAIN_EXTERNAL_DEPENDENCIES)
>   	else \
>   		$(call check_glibc,$${SYSROOT_DIR}) ; \
>   	fi
> -	$(Q)touch $@
> +endef

...

> -toolchain-external: dependencies $(HOST_DIR)/usr/bin/ext-toolchain-wrapper
> +# Even though we're installing things in both the staging, the host
> +# and the target directory, we do everything within the
> +# install-staging step, arbitrarily.
> +define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
> +	$(TOOLCHAIN_EXTERNAL_INSTALL_CORE)
> +	$(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FDPIC)
> +	$(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FLAT)
> +	$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
> +endef

At first sight, hijacking the configure step to check toolchain settings 
and the
install staging step to install into host and target does not look very 
clean.
I think here we are pushing the package infrastructure a bit beyond what 
it is
conceived for.

Nevertheless this it not a very dirty hack (just a bit) and makes the 
whole file
a little simpler. Not to mention this unlocks new features, which is the 
final
goalof the whole patchset, isn't it?

Overall I think the pros are stronger than the cons here. And extending the
package infra just to make this one file more polite wouldn't be worth 
the effort,
I suppose. So:

Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
