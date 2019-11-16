From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Nov 2019 10:24:57 +0100
Subject: [Buildroot] [PATCH/next] package/raspi-gpio: new package
In-Reply-To: <1573593749-31151-1-git-send-email-pjtexier@koncepto.io>
References: <1573593749-31151-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20191116092456.GB32494@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pierre-Jean, All,

On 2019-11-12 22:22 +0100, Pierre-Jean Texier spake thusly:
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
[--SNIP--]
> diff --git a/package/raspi-gpio/Config.in b/package/raspi-gpio/Config.in
> new file mode 100644
> index 0000000..25c1db0
> --- /dev/null
> +++ b/package/raspi-gpio/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_RASPI_GPIO
> +	bool "raspi-gpio"
> +	help
> +	  Tool to help debug / hack at the BCM283x GPIO.
> +	  You can dump the state of a GPIO or (all GPIOs).
> +	  You can change a GPIO mode and pulls (and level
> +	  if set as an output).

We already have package/pigpio/ and a bunch of other GPIO-related
packages.We even have two python modules dedicated to the GPIO on the
rpi: package/python-pigpio/ (a python binding to pigpio), and
package/python-rpi-gpio/.

Why can't the rpi folks just use the generic interfaces provided by the
kernel, of even by the generic libgpiod?

So, what does that package brings that the existing ones do not?

> +	  Beware this tool writes directly to the BCM283x GPIO reisters,

*registers

> +	  ignoring anything else that may be using them (like Linux drivers).
> +
> +	  https://github.com/RPi-Distro/raspi-gpio
> diff --git a/package/raspi-gpio/raspi-gpio.hash b/package/raspi-gpio/raspi-gpio.hash
> new file mode 100644
> index 0000000..8a808b6
> --- /dev/null
> +++ b/package/raspi-gpio/raspi-gpio.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256 8f3fb411746d339d69adc398497892883c11d2d715ccbe6d8b0b5a401da73bd5  raspi-gpio-2eaa8b8755a550e34d07c898b90b0d9b3d66fd81.tar.gz
> +sha256 6e02227e1fb942687163996678d94add7911890c50025912d0ae7ee66d256bb2  LICENSE
> diff --git a/package/raspi-gpio/raspi-gpio.mk b/package/raspi-gpio/raspi-gpio.mk
> new file mode 100644
> index 0000000..7381f75
> --- /dev/null
> +++ b/package/raspi-gpio/raspi-gpio.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# raspi-gpio
> +#
> +################################################################################
> +
> +RASPI_GPIO_VERSION = 2eaa8b8755a550e34d07c898b90b0d9b3d66fd81
> +RASPI_GPIO_SITE = $(call github,RPi-Distro,raspi-gpio,$(RASPI_GPIO_VERSION))
> +RASPI_GPIO_LICENSE = BSD-3-Clause
> +RASPI_GPIO_LICENSE_FILES = LICENSE
> +RASPI_GPIO_INSTALL_STAGING = YES

Why staging? As far as I can see, it just installs a single executable,
and no library.

Regards,
Yann E. MORIN.

> +$(eval $(autotools-package))
> -- 
> 2.7.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
