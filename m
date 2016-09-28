From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Sep 2016 08:36:39 +0200
Subject: [Buildroot] [PATCH v2] Fix 'make toolchain-external-reinstall'
In-Reply-To: <1475010332-3674-1-git-send-email-jezz@sysmic.org>
References: <1475010332-3674-1-git-send-email-jezz@sysmic.org>
Message-ID: <20160928083639.30af0ad6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 27 Sep 2016 23:05:32 +0200, J?r?me Pouiller wrote:
> toolchain-wrapper was not reinstalled on 'make
> toolchain-external-reinstall'
> 
> In add, normalize variable name: s/TOOLCHAIN_BUILD_WRAPPER/TOOLCHAIN_WRAPPER_BUILD/

I'm wondering if the rename should be done in a separate patch.


> -# For simplicity, build directly into the install location
> -define TOOLCHAIN_BUILD_WRAPPER
> -	$(Q)mkdir -p $(HOST_DIR)/usr/bin
> +define TOOLCHAIN_WRAPPER_BUILD
>  	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_WRAPPER_ARGS) \
>  		-s -Wl,--hash-style=$(TOOLCHAIN_WRAPPER_HASH_STYLE) \
>  		toolchain/toolchain-wrapper.c \
> -		-o $(HOST_DIR)/usr/bin/toolchain-wrapper
> +		-o $(@D)/toolchain-wrapper

You're building the wrapper in $(@D)/toolchain-wrapper

> +endef
> +
> +define TOOLCHAIN_WRAPPER_INSTALL
> +	$(INSTALL) -D -m 0755 toolchain/toolchain-wrapper \

but installing it from toolchain/toolchain-wrapper

I'm not sure how this can work.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
