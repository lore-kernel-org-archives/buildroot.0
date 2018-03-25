From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Mar 2018 12:40:24 +0200
Subject: [Buildroot] [PATCH v3 1/1] toolchain-external-custom: allow
 specifying relative path to binaries
In-Reply-To: <20180325101855.21851-1-ccrisan@gmail.com>
References: <20180325101855.21851-1-ccrisan@gmail.com>
Message-ID: <20180325104024.GK2620@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Calin, All,

On 2018-03-25 13:18 +0300, Calin Crisan spake thusly:
> There are cases where a downloaded toolchain doesn't have its binaries
> placed directly in a "bin" subfolder (where BuildRoot currently looks
> for them).
> 
> A common example is the official Raspberry Pi Toolchain
> (https://github.com/raspberrypi/tools), which has its binaries in
> "arm-bcm2708/arm-linux-gnueabihf/bin".
> 
> This commit introduces BR2_TOOLCHAIN_EXTERNAL_REL_BIN_PATH that defaults
> to "bin" and can be changed as needed.
> 
> Signed-off-by: Calin Crisan <ccrisan@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  toolchain/toolchain-external/pkg-toolchain-external.mk            | 7 ++++++-
>  .../toolchain-external-custom/Config.in.options                   | 8 ++++++++
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> index 3bf9fac412..405f2e1698 100644
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -71,13 +71,18 @@ else
>  TOOLCHAIN_EXTERNAL_INSTALL_DIR = $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
>  endif
>  
> +# If binary path unset (known, supported external toolchains), use "bin".
> +TOOLCHAIN_EXTERNAL_REL_BIN_PATH = $(or \
> +	$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_REL_BIN_PATH)), \
> +	bin)
> +
>  ifeq ($(TOOLCHAIN_EXTERNAL_INSTALL_DIR),)
>  ifneq ($(TOOLCHAIN_EXTERNAL_PREFIX),)
>  # if no path set, figure it out from path
>  TOOLCHAIN_EXTERNAL_BIN := $(dir $(shell which $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc))
>  endif
>  else
> -TOOLCHAIN_EXTERNAL_BIN = $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/bin
> +TOOLCHAIN_EXTERNAL_BIN = $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/$(TOOLCHAIN_EXTERNAL_REL_BIN_PATH)
>  endif
>  
>  # If this is a buildroot toolchain, it already has a wrapper which we want to
> diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> index 70c7d8e3c3..b711d9b81f 100644
> --- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> +++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> @@ -12,6 +12,14 @@ config BR2_TOOLCHAIN_EXTERNAL_URL
>  	help
>  	  URL of the custom toolchain tarball to download and install.
>  
> +config BR2_TOOLCHAIN_EXTERNAL_REL_BIN_PATH
> +	string "Toolchain relative bin path"
> +	default "bin"
> +	depends on BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD
> +	help
> +	  Path to where the binaries (e.g. the compiler) can be found,
> +	  relative to the downloaded toolchain root directory.
> +
>  config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
>  	string "Toolchain prefix"
>  	default "$(ARCH)-linux"
> -- 
> 2.16.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
