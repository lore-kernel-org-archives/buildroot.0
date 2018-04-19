From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Apr 2018 23:09:02 +0200
Subject: [Buildroot] [PATCH v3 1/1] toolchain-external-custom: allow
 specifying relative path to binaries
In-Reply-To: <20180325101855.21851-1-ccrisan@gmail.com>
References: <20180325101855.21851-1-ccrisan@gmail.com>
Message-ID: <20180419230902.4b6ea480@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 25 Mar 2018 13:18:55 +0300, Calin Crisan wrote:

> +# If binary path unset (known, supported external toolchains), use "bin".
> +TOOLCHAIN_EXTERNAL_REL_BIN_PATH = $(or \
> +	$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_REL_BIN_PATH)), \
> +	bin)

I found this syntax a bit ugly, so I changed this to:

+TOOLCHAIN_EXTERNAL_REL_BIN_PATH = $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_REL_BIN_PATH))
+ifeq ($(TOOLCHAIN_EXTERNAL_REL_BIN_PATH),)
+TOOLCHAIN_EXTERNAL_REL_BIN_PATH = bin
+endif

and also I moved this into...

> +
>  ifeq ($(TOOLCHAIN_EXTERNAL_INSTALL_DIR),)
>  ifneq ($(TOOLCHAIN_EXTERNAL_PREFIX),)
>  # if no path set, figure it out from path
>  TOOLCHAIN_EXTERNAL_BIN := $(dir $(shell which $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc))
>  endif
>  else

... this condition

> -TOOLCHAIN_EXTERNAL_BIN = $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/bin
> +TOOLCHAIN_EXTERNAL_BIN = $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/$(TOOLCHAIN_EXTERNAL_REL_BIN_PATH)
>  endif

Applied with this change.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
