From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 May 2015 16:54:39 +0200
Subject: [Buildroot] [PATCH 1/2] package/x11r7/libepoxy: Fix OpenGL /
 EGL dependencies
In-Reply-To: <1430575630-11283-1-git-send-email-bernd.kuhls@t-online.de>
References: <1430575630-11283-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150502165439.149f55a2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat,  2 May 2015 16:07:09 +0200, Bernd Kuhls wrote:

> -	depends on BR2_PACKAGE_MESA3D
> +	depends on BR2_PACKAGE_HAS_LIBEGL

	|| HAS_LIBGL ?

>  	help
> -	  Epoxy is a library for handling OpenGL function pointer management for you.
> +	  Epoxy is a library for handling OpenGL function pointer
> +	  management for you.
>  
>  	  https://github.com/anholt/libepoxy
> +
> +comment "epoxy needs an OpenGL EGL backend"
> +	depends on !BR2_PACKAGE_HAS_LIBEGL
> diff --git a/package/x11r7/libepoxy/libepoxy.mk b/package/x11r7/libepoxy/libepoxy.mk
> index d908893..fc1ede4 100644
> --- a/package/x11r7/libepoxy/libepoxy.mk
> +++ b/package/x11r7/libepoxy/libepoxy.mk
> @@ -8,8 +8,18 @@ LIBEPOXY_VERSION = v1.2
>  LIBEPOXY_SITE = $(call github,anholt,libepoxy,$(LIBEPOXY_VERSION))
>  LIBEPOXY_INSTALL_STAGING = YES
>  LIBEPOXY_AUTORECONF = YES
> -LIBEPOXY_DEPENDENCIES = mesa3d
> +LIBEPOXY_DEPENDENCIES = \
> +	$(if $(BR2_PACKAGE_HAS_LIBEGL),libegl) \
> +	$(if $(BR2_PACKAGE_HAS_LIBGL),libgl)

Because of this?

>  LIBEPOXY_LICENSE = MIT
>  LIBEPOXY_LICENSE_FILES = COPYING
>  
> +ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
> +LIBEPOXY_CONF_ENV = \
> +	CFLAGS="$(TARGET_CFLAGS) \
> +		-I$(STAGING_DIR)/usr/include/IL \
> +		-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads \
> +		-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux"
> +endif

Shouldn't we instead be using pkg-config here?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
