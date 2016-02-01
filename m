From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 14:15:54 +0100
Subject: [Buildroot] [PATCH] toolchain-external: add a check for broken
 toolchains
In-Reply-To: <1454326287-2123-1-git-send-email-romain.naour@gmail.com>
References: <1454326287-2123-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160201141554.618e93d4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

(I saw your e-mail saying that you are sending a new version, but
still.)

On Mon,  1 Feb 2016 12:31:27 +0100, Romain Naour wrote:

> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index 9ebf7bd..303a32a 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -478,6 +478,10 @@ define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
>  		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
>  		exit 1 ; \
>  	fi ; \
> +	if test "$${SYSROOT_DIR}" = "libc.a" ; then \
> +		@echo "External toolchain broken, unable to find the main sysroot. Cannot use." ; \
> +		exit 1 ; \
> +	fi ; \

I don't think "broken" is the appropriate word. The external toolchain
might be fine, maybe the Buildroot logic to use it is wrong. So maybe
the wording should be something like:

"Unable to detect the toolchain sysroot, Buildroot cannot handle this
toolchain".

>  	$(call check_kernel_headers_version,\
>  		$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC)),\
>  		$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))); \
> @@ -571,6 +575,10 @@ define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS
>  		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
>  		exit 1 ; \
>  	fi ; \
> +	if test "$${SYSROOT_DIR}" = "libc.a" ; then \
> +		@echo "External toolchain broken, unable to find the main sysroot. Cannot use." ; \
> +		exit 1 ; \
> +	fi ; \

Why do you need this check here as well? It has already been verified
in the CONFIGURE_CMDS, and it aborts if the test fails, so how could it
go up to the INSTALL_TARGET_CMDS step ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
