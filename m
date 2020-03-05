From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Mar 2020 21:05:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/wayland: bump to version 1.18.0
In-Reply-To: <20200303230943.24334-1-james.hilliard1@gmail.com>
References: <20200303230943.24334-1-james.hilliard1@gmail.com>
Message-ID: <20200305210537.42d4c081@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello James,

+Arnout, as there is a meson/pkg-config question.

Thanks for the patch. Two questions below.

On Tue,  3 Mar 2020 16:09:43 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
> index e325c6d752..6de92f63d9 100644
> --- a/package/wayland/wayland.mk
> +++ b/package/wayland/wayland.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WAYLAND_VERSION = 1.17.0
> +WAYLAND_VERSION = 1.18.0
>  WAYLAND_SITE = http://wayland.freedesktop.org/releases
>  WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
>  WAYLAND_LICENSE = MIT
> @@ -13,12 +13,12 @@ WAYLAND_INSTALL_STAGING = YES
>  WAYLAND_DEPENDENCIES = host-pkgconf host-wayland expat libffi libxml2
>  HOST_WAYLAND_DEPENDENCIES = host-pkgconf host-expat host-libffi host-libxml2
>  
> -# 0002-configure-add-option-to-disable-tests.patch
> -WAYLAND_AUTORECONF = YES
> +WAYLAND_CONF_OPTS = \
> +	-Dbuild.pkg_config_path=$(HOST_DIR)/lib/pkgconfig \

Are you sure this is needed since commit
4e0bc29993376613d200e892d491e31ea5a49622 ? Indeed, with this commit,
meson is properly able to use pkg-config either for native builds or
cross builds.

> +	-Dtests=false \
> +	-Ddocumentation=false
>  
> -# wayland-scanner is only needed for building, not on the target
> -WAYLAND_CONF_OPTS = --with-host-scanner --disable-tests

So how is the scanner thing working these days? With the meson build
logic, it doesn't build the scanner when cross-compiling, and knows
that it should use a pre-installed scanner ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
