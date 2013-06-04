From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Jun 2013 08:38:47 +0200
Subject: [Buildroot] [PATCH 5/6] package/rpi-firmware: add options to
	select what firmware to install
In-Reply-To: <30f6d94a556efedb7d999a778bb6e32071efdda0.1370289131.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 3 Jun 2013 22:15:51 +0200")
References: <cover.1370289131.git.yann.morin.1998@free.fr>
 <cover.1370289131.git.yann.morin.1998@free.fr>
 <30f6d94a556efedb7d999a778bb6e32071efdda0.1370289131.git.yann.morin.1998@free.fr>
Message-ID: <8761xugz2g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> Add two options to rpi-firmware:
 Yann>   - the first option to select the firmware being booted, amongst:
 Yann>     - the default one
 Yann>     - the cut-down one, for emergency
 Yann>   - the second to also install all firmwares

 Yann> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> ---
 Yann>  board/raspberrypi/readme.txt         |  8 -------
 Yann>  package/rpi-firmware/Config.in       | 45 ++++++++++++++++++++++++++++++++++++
 Yann>  package/rpi-firmware/rpi-firmware.mk | 20 ++++++++++++----
 Yann>  3 files changed, 61 insertions(+), 12 deletions(-)

 Yann> diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
 Yann> index 3287795..720a0ac 100644
 Yann> --- a/board/raspberrypi/readme.txt
 Yann> +++ b/board/raspberrypi/readme.txt
 Yann> @@ -34,9 +34,7 @@ After building, you should obtain this tree:
 Yann>      +-- rpi-firmware
 Yann>      |?? +-- bootcode.bin
 Yann>      |?? +-- config.txt
 Yann> -    |?? +-- fixup_cd.dat
 Yann>      |?? +-- fixup.dat
 Yann> -    |?? +-- start_cd.elf
 Yann>      |?? `-- start.elf
 Yann>      `-- zImage
 
 Yann> @@ -52,9 +50,7 @@ At the root of the partition, the RaspberryPi must find the following files:
 
 Yann>   * bootcode.bin
 Yann>   * config.txt
 Yann> - * fixup_cd.dat
 Yann>   * fixup.dat
 Yann> - * start_cd.elf
 Yann>   * start.elf
 Yann>   * zImage
 
 Yann> @@ -83,9 +79,7 @@ After building, you should obtain this tree:
 Yann>      +-- rpi-firmware
 Yann>      |?? +-- bootcode.bin
 Yann>      |?? +-- config.txt
 Yann> -    |?? +-- fixup_cd.dat
 Yann>      |?? +-- fixup.dat
 Yann> -    |?? +-- start_cd.elf
 Yann>      |?? `-- start.elf
 Yann>      `-- zImage
 
 Yann> @@ -104,9 +98,7 @@ You must copy theses files at the root of partition:
 
 Yann>   * bootcode.bin
 Yann>   * config.txt
 Yann> - * fixup_cd.dat
 Yann>   * fixup.dat
 Yann> - * start_cd.elf
 Yann>   * start.elf
 Yann>   * zImage
 
 Yann> diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
 Yann> index eb10a8a..4573204 100644
 Yann> --- a/package/rpi-firmware/Config.in
 Yann> +++ b/package/rpi-firmware/Config.in
 Yann> @@ -7,3 +7,48 @@ config BR2_PACKAGE_RPI_FIRMWARE
 
 Yann>  	  https://github.com/raspberrypi/firmware
 
 Yann> +if BR2_PACKAGE_RPI_FIRMWARE
 Yann> +
 Yann> +choice
 Yann> +	bool "Firmware to boot"
 Yann> +	default BR2_PACKAGE_RPI_FIRMWARE_DEFAULT
 Yann> +	help
 Yann> +	  There are two different firmware files:
 Yann> +	    - the default firmware, that enables standard GPU features;
 Yann> +	    - the cut-down firmware, for emergency situations, with only
 Yann> +	      features required to boot a Linux kernel.
 Yann> +
 Yann> +config BR2_PACKAGE_RPI_FIRMWARE_DEFAULT
 Yann> +	bool "default"
 Yann> +	help
 Yann> +	  The default firmware, that enables standard GPU features.
 Yann> +
 Yann> +config BR2_PACKAGE_RPI_FIRMWARE_CD
 Yann> +	bool "cut-down ('cd', emergency)"
 Yann> +	help
 Yann> +	  The cut-down firmware, for emergency situations, with only
 Yann> +	  features required to boot a Linux kernel.
 Yann> +
 Yann> +endchoice
 Yann> +
 Yann> +config BR2_PACKAGE_RPI_FIRMWARE_BOOT
 Yann> +	string
 Yann> +	default ""      if BR2_PACKAGE_RPI_FIRMWARE_DEFAULT
 Yann> +	default "_cd"   if BR2_PACKAGE_RPI_FIRMWARE_CD
 Yann> +
 Yann> +config BR2_PACKAGE_RPI_FIRMWARE_ALL
 Yann> +	bool "Install all firmwares"
 Yann> +	default y
 Yann> +	help

So this option overrides whatever you have selected above?

 Yann> +	  If you say 'y' here (the default), then all firmware files will
 Yann> +	  be installed, so you can later switch to an alternate firmware.
 Yann> +	  The firmware files will be installed thusly:
 Yann> +	    - the 'default'  will be denoted with '_default' in filenames

That seems different from above where the default version doesn't have
any suffix?

Do we really need this? Can't people just delete the files they don't
want in a post build script like for everything else?

-- 
Bye, Peter Korsgaard
