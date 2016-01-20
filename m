From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jan 2016 10:41:56 +0100
Subject: [Buildroot] [PATCH] rabbitmq-c: link against zlib and libintl
In-Reply-To: <1453281896-24831-1-git-send-email-joris.lijssens@gmail.com>
References: <1453281896-24831-1-git-send-email-joris.lijssens@gmail.com>
Message-ID: <20160120104156.0a15467d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Joris Lijssens,

On Wed, 20 Jan 2016 10:24:56 +0100, Joris Lijssens wrote:

> diff --git a/package/rabbitmq-c/Config.in b/package/rabbitmq-c/Config.in
> index 0d08233..87bd3cb 100644
> --- a/package/rabbitmq-c/Config.in
> +++ b/package/rabbitmq-c/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_RABBITMQ_C
>  	# too old uClibc, not providing posix_spawn functions
>  	# http://autobuild.buildroot.net/results/a6c3e79c61c5a535970d03bf37b068349f766a7f/
>  	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
> +	select BR2_PACKAGE_ZLIB
>  	help
>  	  This is a C-language AMQP client library for use with v2.0+
>  	  of the RabbitMQ broker.
> diff --git a/package/rabbitmq-c/rabbitmq-c.mk b/package/rabbitmq-c/rabbitmq-c.mk
> index 42e2548..f2f3fb5 100644
> --- a/package/rabbitmq-c/rabbitmq-c.mk
> +++ b/package/rabbitmq-c/rabbitmq-c.mk
> @@ -9,6 +9,7 @@ RABBITMQ_C_SITE = https://github.com/alanxz/rabbitmq-c/releases/download/v$(RABB
>  RABBITMQ_C_LICENSE = MIT
>  RABBITMQ_C_LICENSE_FILES = LICENSE-MIT
>  RABBITMQ_C_INSTALL_STAGING = YES
> +RABBITMQ_C_DEPENDENCIES += zlib
>  RABBITMQ_C_CONF_OPTS = \
>  	-DBUILD_API_DOCS=OFF \
>  	-DBUILD_TOOLS_DOCS=OFF

This is not the proper fix. There is no reason for rabbitmq-c to select
zlib and have zlib in its <pkg>_DEPENDENCIES variable if it doesn't use
zlib directly. In the autobuilder failure, rabbitmq-c is:

 * Using popt, which in turn uses libintl

 * Using openssl, which in turn uses zlib

So, it is when rabbitmq-c queries popt for the linker flags that -lintl
should be added. And it is when rabbitmq-c queries openssl for the
linker flags that -lz should be added.

The easiest way to solve this is to make rabbitmq-c use pkg-config to
query the popt and openssl flags, because pkg-config has all the
infrastructure needed to handle dynamic/static linking properly.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
