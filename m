From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Feb 2020 15:42:26 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/erlang: bump to version 22.2
In-Reply-To: <20200204100733.22106-1-frank.vanbever@essensium.com>
References: <20200129172618.16966-1-frank.vanbever@essensium.com>
 <20200204100733.22106-1-frank.vanbever@essensium.com>
Message-ID: <20200205154226.0dca67b1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Frank,

I've applied your patch, but with some changes. See below.

On Tue,  4 Feb 2020 11:07:31 +0100
Frank Vanbever <frank.vanbever@essensium.com> wrote:

>  # See note below when updating Erlang
> -ERLANG_VERSION = 21.0
> +ERLANG_VERSION = 22.2
>  ERLANG_SITE = http://www.erlang.org/download
>  ERLANG_SOURCE = otp_src_$(ERLANG_VERSION).tar.gz
>  ERLANG_DEPENDENCIES = host-erlang
> @@ -15,11 +15,20 @@ ERLANG_LICENSE_FILES = LICENSE.txt
>  ERLANG_INSTALL_STAGING = YES
>  
>  # Patched erts/aclocal.m4
> -ERLANG_AUTORECONF = YES
> +define ERLANG_RUN_AUTOCONF
> +	cd $(@D) && PATH=$(BR_PATH) ./otp_build autoconf
> +endef
> +HOST_ERLANG_DEPENDENCIES = host-autoconf
> +ERLANG_PRE_CONFIGURE_HOOKS += ERLANG_RUN_AUTOCONF

ERLANG_AUTORECONF = YES does the thing for both the host and target
packages.

However here, you are adding host-autoconf as a dependency for
host-erlang, but you're doing the autoconf only on the target erlang.
So I fixed that to ensure we add host-autoconf to both target/host
variants of erlang (which is pedantic since anyway erlang depends on
host-erlang) and do the autoconf on both host and target.

> +define ERLANG_RUN_SAVE_BOOTSTRAP
> +	cd $(@D) && PATH=$(BR_PATH) ./otp_build save_bootstrap
> +endef
> +ERLANG_POST_CONFIGURE_HOOKS += ERLANG_RUN_SAVE_BOOTSTRAP

As we discussed, this does not seem to be needed, at least from my
testing, so I dropped this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
