From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jun 2020 22:39:13 +0200
Subject: [Buildroot] [PATCH v2 5/7] package/cups: Add udev rules to
 assign usb printers group to lp
In-Reply-To: <20200619145719.2352019-6-angelo@amarulasolutions.com>
References: <20200619145719.2352019-1-angelo@amarulasolutions.com>
 <20200619145719.2352019-6-angelo@amarulasolutions.com>
Message-ID: <20200620223913.38af0c62@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Angelo,

On Fri, 19 Jun 2020 16:57:17 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> commit c8a337593660f27379c30248a11bf08dc8712113
> Author: Jeffy Chen <jeffy.chen@rock-chips.com>
> Date:   Tue Nov 13 18:59:43 2018 +0800
> 
>     package: cups: Add udev rules to assign usb printers' group to lp
> 
>     Change-Id: Ieae17deaa7d3623e1f0e1cc826871f1719d98d88
>     Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
> 
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/cups/70-usb-printers.rules | 4 ++++
>  package/cups/cups.mk               | 9 +++++++++
>  2 files changed, 13 insertions(+)
>  create mode 100644 package/cups/70-usb-printers.rules
> 
> diff --git a/package/cups/70-usb-printers.rules b/package/cups/70-usb-printers.rules
> new file mode 100644
> index 0000000000..537645523d
> --- /dev/null
> +++ b/package/cups/70-usb-printers.rules
> @@ -0,0 +1,4 @@
> +# Allow USB printers in the lp group
> +# Match rules converted from usblp.c driver's usblp_ids
> +ACTION=="add", SUBSYSTEM=="usb", ATTR{bInterfaceClass}=="07", ATTR{bInterfaceSubClass}=="01", GROUP="lp"

This first rule makes sense, i.e it's based on the interface
class/subclass.

> +ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="04b8", ATTRS{idProduct}=="0202", GROUP="lp"

But this one looks weird. Why do we care specifically about the printer
of vendor id 04b8 and product id 0202, and not some random other
printer ?

I suppose if you're adding this udev rules file it's because cups
doesn't provide one that we could use as-is ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
