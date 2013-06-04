From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Jun 2013 08:55:56 +0200
Subject: [Buildroot] [PATCH 5/6] package/rpi-firmware: add options to
	select what firmware to install
In-Reply-To: <8761xugz2g.fsf@dell.be.48ers.dk>
References: <cover.1370289131.git.yann.morin.1998@free.fr>
 <30f6d94a556efedb7d999a778bb6e32071efdda0.1370289131.git.yann.morin.1998@free.fr>
 <8761xugz2g.fsf@dell.be.48ers.dk>
Message-ID: <201306040855.56614.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On Tuesday 04 June 2013 08:38:47 Peter Korsgaard wrote:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  Yann> Add two options to rpi-firmware:
>  Yann>   - the first option to select the firmware being booted, amongst:
>  Yann>     - the default one
>  Yann>     - the cut-down one, for emergency
>  Yann>   - the second to also install all firmwares
> 
>  Yann> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  Yann> ---
>  Yann>  board/raspberrypi/readme.txt         |  8 -------
>  Yann>  package/rpi-firmware/Config.in       | 45 ++++++++++++++++++++++++++++++++++++
>  Yann>  package/rpi-firmware/rpi-firmware.mk | 20 ++++++++++++----
>  Yann>  3 files changed, 61 insertions(+), 12 deletions(-)
[--SNIP--]
>  Yann> +if BR2_PACKAGE_RPI_FIRMWARE
>  Yann> +
>  Yann> +choice
>  Yann> +	bool "Firmware to boot"
>  Yann> +	default BR2_PACKAGE_RPI_FIRMWARE_DEFAULT
>  Yann> +	help
>  Yann> +	  There are two different firmware files:
>  Yann> +	    - the default firmware, that enables standard GPU features;
>  Yann> +	    - the cut-down firmware, for emergency situations, with only
>  Yann> +	      features required to boot a Linux kernel.
>  Yann> +
>  Yann> +config BR2_PACKAGE_RPI_FIRMWARE_DEFAULT
>  Yann> +	bool "default"
>  Yann> +	help
>  Yann> +	  The default firmware, that enables standard GPU features.
>  Yann> +
>  Yann> +config BR2_PACKAGE_RPI_FIRMWARE_CD
>  Yann> +	bool "cut-down ('cd', emergency)"
>  Yann> +	help
>  Yann> +	  The cut-down firmware, for emergency situations, with only
>  Yann> +	  features required to boot a Linux kernel.
>  Yann> +
>  Yann> +endchoice
>  Yann> +
>  Yann> +config BR2_PACKAGE_RPI_FIRMWARE_BOOT
>  Yann> +	string
>  Yann> +	default ""      if BR2_PACKAGE_RPI_FIRMWARE_DEFAULT
>  Yann> +	default "_cd"   if BR2_PACKAGE_RPI_FIRMWARE_CD
>  Yann> +
>  Yann> +config BR2_PACKAGE_RPI_FIRMWARE_ALL
>  Yann> +	bool "Install all firmwares"
>  Yann> +	default y
>  Yann> +	help
> 
> So this option overrides whatever you have selected above?

No, the firmware files will be installed as:

    source file                                 | installed file
    ---- Installed by the choice: --------------+-------------------
    start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf   | start.elf
    fixup$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat   | fixup.dat
    ---- Installed with "Install all": ---------+-------------------
    start.elf                                   | start_default.elf
    fixup.elf                                   | fixup_default.elf
    start_cd.elf                                | start_cd.elf
    fixup_cd.elf                                | fixup_cd.elf
    start_x.elf                                 | start_x.elf    [*]
    fixup._xelf                                 | fixup_x.elf    [*]

[*] After the bump with the following patch

>  Yann> +	  If you say 'y' here (the default), then all firmware files will
>  Yann> +	  be installed, so you can later switch to an alternate firmware.
>  Yann> +	  The firmware files will be installed thusly:
>  Yann> +	    - the 'default'  will be denoted with '_default' in filenames
> 
> That seems different from above where the default version doesn't have
> any suffix?

I guess the table above answers that.

> Do we really need this? Can't people just delete the files they don't
> want in a post build script like for everything else?

Yes, it is possible. But since a single firmware will ever be booted,
there is no reason to install all of them in the first place.

This last option is here for people that want to switch firmware at
/runtime/ (ie. with just a mv from within the target).

Of course, I'm fine with this not going in (but I'd be sad, as I'd
have to tweak my post-image scripts. ;-) ).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
