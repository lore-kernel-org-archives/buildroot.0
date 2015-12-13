From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Dec 2015 22:19:29 +0100
Subject: [Buildroot] [PATCH v1] bcm2835: new package
In-Reply-To: <1449609824-2649-1-git-send-email-ps.report@gmx.net>
References: <1449609824-2649-1-git-send-email-ps.report@gmx.net>
Message-ID: <20151213211929.GD18449@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2015-12-08 22:23 +0100, Peter Seiderer spake thusly:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/Config.in            |  1 +
>  package/bcm2835/Config.in    | 10 ++++++++++
>  package/bcm2835/bcm2835.hash |  2 ++
>  package/bcm2835/bcm2835.mk   | 13 +++++++++++++
>  4 files changed, 26 insertions(+)
>  create mode 100644 package/bcm2835/Config.in
>  create mode 100644 package/bcm2835/bcm2835.hash
>  create mode 100644 package/bcm2835/bcm2835.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index bdc3063..8bf4048 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -860,6 +860,7 @@ menu "Graphics"
>  endmenu
>  
>  menu "Hardware handling"
> +	source "package/bcm2835/Config.in"
>  	source "package/c-periphery/Config.in"
>  	source "package/ccid/Config.in"
>  	source "package/dtc/Config.in"
> diff --git a/package/bcm2835/Config.in b/package/bcm2835/Config.in
> new file mode 100644
> index 0000000..50ec3dd
> --- /dev/null
> +++ b/package/bcm2835/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_BCM2835
> +	bool "bcm2835"

Even though there is not much ARM specific in this package (I checked,
it builds fine on x86_64 at least), I still believe this package should
be available only for ARM, so maybe add;

    depends on BR2_arm

Otherwise, I still amazed at how much length RPi people ar eready to go
to make things totally different from what is traditionally done.

bcm2835 is directly poking in the memory/regiters to toggle/read GPIOs,
when there is a prefectly working kernel driver that abstracts all of
that...

Sigh...

Regards,
Yann E. MORIN.

> +	help
> +	  C library for Broadcom BCM 2835 as used in Raspberry Pi.
> +	  It provides access to GPIO and other IO functions on the
> +	  Broadcom BCM 2835 chip, allowing access to the GPIO pins
> +	  on the 26 pin IDE plug on the RPi board so you can control
> +	  and interface with various external devices.
> +
> +	  http://www.airspayce.com/mikem/bcm2835
> diff --git a/package/bcm2835/bcm2835.hash b/package/bcm2835/bcm2835.hash
> new file mode 100644
> index 0000000..8b725f5
> --- /dev/null
> +++ b/package/bcm2835/bcm2835.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256 0317e23a29b4a9923c57c1b0fb7403adce10aa05e263af0bc20ffe026f78767c bcm2835-1.48.tar.gz
> diff --git a/package/bcm2835/bcm2835.mk b/package/bcm2835/bcm2835.mk
> new file mode 100644
> index 0000000..28755c3
> --- /dev/null
> +++ b/package/bcm2835/bcm2835.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# bcm2835
> +#
> +################################################################################
> +
> +BCM2835_VERSION = 1.48
> +BCM2835_SITE = http://www.airspayce.com/mikem/bcm2835
> +BCM2835_LICENSE = GPLv2+
> +BCM2835_LICENSE_FILES = COPYING
> +BCM2835_INSTALL_STAGING = YES
> +
> +$(eval $(autotools-package))
> -- 
> 2.1.4
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
