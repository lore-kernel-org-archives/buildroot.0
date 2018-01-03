From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Jan 2018 21:37:47 +0100
Subject: [Buildroot] [PATCH v4 1/2] pkg-cmake: make BUILD_SHARED_LIBS
 part of generic cmake pkg logic
In-Reply-To: <1515010165-25315-2-git-send-email-heyleke@gmail.com>
References: <1515010165-25315-1-git-send-email-heyleke@gmail.com>
 <1515010165-25315-2-git-send-email-heyleke@gmail.com>
Message-ID: <20180103213747.0edd0567@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  3 Jan 2018 21:09:24 +0100, Jan Heylen wrote:
> From: Jan Heylen <jan.heylen@nokia.com>
> 
> Signed-off-by: Jan Heylen <jan.heylen@nokia.com>

This commit really needs a better description as to why we are doing
this.


> +ifeq ($(BR2_STATIC_LIBS),y)
> +CMAKE_BUILD_SHARED_LIBS = OFF
> +CMAKE_BUILD_STATIC_LIBS = ON
> +else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
> +CMAKE_BUILD_SHARED_LIBS = ON
> +CMAKE_BUILD_STATIC_LIBS = ON
> +else ifeq ($(BR2_SHARED_LIBS),y)
> +CMAKE_BUILD_SHARED_LIBS = ON
> +CMAKE_BUILD_STATIC_LIBS = OFF

I don't think those intermediate variables are really useful.

> +endif
> +
>  #
>  # Configure step. Only define it if not already defined by the package
>  # .mk file. And take care of the differences between host and target
> @@ -96,7 +107,8 @@ define $(2)_CONFIGURE_CMDS
>  		-DBUILD_TEST=OFF \
>  		-DBUILD_TESTS=OFF \
>  		-DBUILD_TESTING=OFF \
> -		-DBUILD_SHARED_LIBS=$$(if $$(BR2_STATIC_LIBS),OFF,ON) \
> +		-DBUILD_SHARED_LIBS=$$(CMAKE_BUILD_SHARED_LIBS) \
> +		-DBUILD_STATIC_LIBS=$$(CMAKE_BUILD_STATIC_LIBS) \

Indeed, you can just do:

		-DBUILD_SHARED_LIBS=$$(if $$(BR2_STATIC_LIBS),OFF,ON) \
		-DBUILD_STATIC_LIBS=$$(if $$(BR2_SHARED_LIBS),OFF,ON)

and that's it.

> diff --git a/package/rabbitmq-c/rabbitmq-c.mk b/package/rabbitmq-c/rabbitmq-c.mk
> index eef09ec..5a34e53 100644
> --- a/package/rabbitmq-c/rabbitmq-c.mk
> +++ b/package/rabbitmq-c/rabbitmq-c.mk
> @@ -13,14 +13,6 @@ RABBITMQ_C_CONF_OPTS = \
>  	-DBUILD_API_DOCS=OFF \
>  	-DBUILD_TOOLS_DOCS=OFF
>  
> -ifeq ($(BR2_STATIC_LIBS),y)
> -RABBITMQ_C_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF -DBUILD_STATIC_LIBS=ON
> -else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
> -RABBITMQ_C_CONF_OPTS += -DBUILD_SHARED_LIBS=ON -DBUILD_STATIC_LIBS=ON
> -else ifeq ($(BR2_SHARED_LIBS),y)
> -RABBITMQ_C_CONF_OPTS += -DBUILD_SHARED_LIBS=ON -DBUILD_STATIC_LIBS=OFF
> -endif

This should be part of a separate commit, since it's a simplification
that follows the previous change.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
