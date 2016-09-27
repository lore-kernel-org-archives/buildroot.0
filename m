From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Sep 2016 18:52:06 +0200
Subject: [Buildroot] [PATCH] Fix 'make toolchain-external-reinstall'
In-Reply-To: <1474993712-27904-1-git-send-email-jezz@sysmic.org>
References: <1474993712-27904-1-git-send-email-jezz@sysmic.org>
Message-ID: <20160927185206.5cce9234@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 27 Sep 2016 18:28:32 +0200, J?r?me Pouiller wrote:

> diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
> index af39071..21690fd 100644
> --- a/toolchain/toolchain-wrapper.mk
> +++ b/toolchain/toolchain-wrapper.mk
> @@ -30,11 +30,15 @@ ifeq ($(BR2_CCACHE_USE_BASEDIR),y)
>  TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE_BASEDIR='"$(BASE_DIR)"'
>  endif
>  
> -# For simplicity, build directly into the install location
> -define TOOLCHAIN_BUILD_WRAPPER
> -	$(Q)mkdir -p $(HOST_DIR)/usr/bin
> +define TOOLCHAIN_WRAPPER_BUILD

If you rename this, you should fix the gcc package, which also uses the
same variable. As it is, your patch breaks the internal toolchain
backend.

>  	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_WRAPPER_ARGS) \
>  		-s -Wl,--hash-style=$(TOOLCHAIN_WRAPPER_HASH_STYLE) \
>  		toolchain/toolchain-wrapper.c \
> -		-o $(HOST_DIR)/usr/bin/toolchain-wrapper
> +		-o toolchain/toolchain-wrapper

This is not good: it generates a file in the source tree. You should
consider the source tree as read-only. Anything built by Buildroot
should be generated in the output directory. So, I'd suggest to
generate it in $(@D)/toolchain-wrapper maybe?


> +define TOOLCHAIN_WRAPPER_INSTALL
> +	$(Q)mkdir -p $(HOST_DIR)/usr/bin

Not needed, just use $(INSTALL) with the -D option.

Other than those implementation issues, I agree with the general
principle: the installation to the host directory should only take
place at install time.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
