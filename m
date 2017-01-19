From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Jan 2017 13:22:50 +1100
Subject: [Buildroot] [PATCH] libgpiod: new package
In-Reply-To: <1484747888-25092-1-git-send-email-bgolaszewski@baylibre.com>
References: <1484747888-25092-1-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <20170119132250.14f88713@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Jan 2017 14:58:08 +0100, Bartosz Golaszewski wrote:
> Add a package containing a C library and a set of command-line tools
> for controlling GPIOs from user space using the new character device
> interface on linux.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Thanks! This looks mostly good. A few comments below though.

> ---
>  DEVELOPERS                     |  1 +

Some people prefer to see the change to the DEVELOPERS file as a
separate patch. Indeed, when backporting patches to older Buildroot
versions, the changes in the DEVELOPERS file tend to cause conflicts.

> +################################################################################
> +#
> +# libgpiod
> +#
> +################################################################################
> +
> +LIBGPIOD_VERSION = 0.1
> +LIBGPIOD_SITE = https://github.com/brgl/libgpiod/archive/v$(LIBGPIOD_VERSION)

Any reason not to use the github helper here?

> +LIBGPIOD_LICENSE = GPLv3+
> +LIBGPIOD_LICENSE_FILES = COPYING
> +LIBGPIOD_AUTORECONF = YES
> +LIBGPIOD_AUTORECONF_OPTS = --install

This should not be needed, we already pass the "-i" option to
autoreconf by default. See the definition of the AUTORECONF variable in
package/autoconf/autoconf.mk.

> +LIBGPIOD_CONF_OPTS += --enable-tools=$(if $(BR2_PACKAGE_LIBGPIOD_TOOLS),yes,no)

We normally use --enable/--disable instead of --enable=yes/--enable=no,
so:

ifeq ($(BR2_PACKAGE_LIBGIOPD_TOOLS),y)
LIBGPIOD_CONF_OPTS += --enable-tools
else
LIBGPIOD_CONF_OPTS += --disable-tools
endif

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
