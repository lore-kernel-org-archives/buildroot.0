From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Sep 2012 23:01:54 +0200
Subject: [Buildroot] [PATCH] Add package raspberrypi-firmware.
In-Reply-To: <1347914057-20287-1-git-send-email-marek.belisko@open-nandra.com>
References: <1347914057-20287-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <201209172301.54610.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marek, All,

On Monday 17 September 2012 22:34:17 Marek Belisko wrote:
> Add support for raspberrypi bootloader and VideoCore.

See my comments below.

> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
> 
> Added changes from Arnout comments:
> (http://lists.busybox.net/pipermail/buildroot/2012-September/058565.html)
> - add rasberrypi-firmware as separate package
> - change Config.in handling to have separate bootloader and
>   VideoCore packages (handled in same mk file)
> - various other fixes
> 
> New features:
> - add possibility to choose ARM - GPU memory split by user
> - download package in tar.gz instead git method
> 
> ---
>  package/Config.in                                  |    1 +
>  package/raspberrypi-firmware/Config.in             |   53 ++++++++++++++++++++
>  .../raspberrypi-firmware/raspberrypi-firmware.mk   |   48 ++++++++++++++++++
>  3 files changed, 102 insertions(+)
>  create mode 100644 package/raspberrypi-firmware/Config.in
>  create mode 100644 package/raspberrypi-firmware/raspberrypi-firmware.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 58dd5e8..36635cd 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -232,6 +232,7 @@ source "package/owl-linux/Config.in"
>  source "package/parted/Config.in"
>  source "package/pciutils/Config.in"
>  source "package/picocom/Config.in"
> +source "package/raspberrypi-firmware/Config.in"
>  source "package/read-edid/Config.in"
>  source "package/rng-tools/Config.in"
>  source "package/sane-backends/Config.in"
> diff --git a/package/raspberrypi-firmware/Config.in b/package/raspberrypi-firmware/Config.in
> new file mode 100644
> index 0000000..55abd68
> --- /dev/null
> +++ b/package/raspberrypi-firmware/Config.in
> @@ -0,0 +1,53 @@
> +config BR2_PACKAGE_RASPBERRYPI_FIRMWARE
> +	bool
> +
> +config BR2_PACKAGE_RASPBERRYPI_BOOTLOADER
> +        bool "Raspberry Pi bootloader files"

Space-damage: config option should be indented one tab, not 8 spaces,
and help entries are indented one tab plus two spaces, not 10 spaces.

> +	select BR2_PACKAGE_RASPBERRYPI_FIRMWARE

I am not too fond of this hack... :-(

The issue with this 'package' is that it's two things:
  - a package that installs the videocore library;
  - a package that installs the bootloader files.

So, I would really like to see the bootloader entries in the bootloader
sub-menu, and the library part in the "packages on target" sub-menu.

I'll look at this shortly (having recently received my rPi), and hope to
be able to come back later tonight with an alternate proposal.

The big issue is that there is no provision in BR to handle this situation,
as it is currently expected that an upstream package only provides a single
package in BR.

So, NACK from me in the state it is currently.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
