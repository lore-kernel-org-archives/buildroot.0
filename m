From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 May 2017 11:10:10 +0200
Subject: [Buildroot] [PATCH] rpi-wifi-firmware: new package
In-Reply-To: <871ss2s717.fsf@dell.be.48ers.dk>
References: <20170505183741.30214-1-peter@korsgaard.com>
 <20170506082758.GD2934@scaer> <871ss2s717.fsf@dell.be.48ers.dk>
Message-ID: <20170506091010.GE2934@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2017-05-06 10:50 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > Peter, All,
>  > On 2017-05-05 20:37 +0200, Peter Korsgaard spake thusly:
>  >> Add firmware (NVRAM data) for the Raspberry Pi 3 and Zero W wifi module.
>  >> 
>  >> Notice that linux-firmware provides the main firmware
>  >> (brcmfmac43430-sdio.bin), but the module also needs board specific
>  >> configuration (NVRAM) data.
>  >> 
>  >> For the rpi, this data is available in the RPI firmware-nonfree git repo.
>  >> As this repo contains a lot of unrelated data (~70MB), simply download the
>  >> single NVRAM file instead of cloning the entire repo.
>  >> 
>  >> A similar approach is used by openwrt and opensuse:
>  >> 
>  >> https://dev.openwrt.org/browser/trunk/package/firmware/brcmfmac43430-firmware/Makefile?rev=49139
>  >> https://build.opensuse.org/package/view_file/hardware/bcm43xx-firmware/bcm43xx-firmware.spec?rev=b1628448b36c85abc9215eab4785ef29
>  >> 
>  >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>  > [--SNIP--]
>  >> diff --git a/package/rpi-wifi-firmware/Config.in b/package/rpi-wifi-firmware/Config.in
>  >> new file mode 100644
>  >> index 000000000..2c87c7584
>  >> --- /dev/null
>  >> +++ b/package/rpi-wifi-firmware/Config.in
>  >> @@ -0,0 +1,10 @@
>  >> +config BR2_PACKAGE_RPI_WIFI_FIRMWARE
>  >> +	bool "rpi-wifi-firmware"
>  >> +	depends on BR2_arm || BR2_aarch64
> 
>  > I know it read "rpi-wifi-firmware" and thus it is arm or aarch64. But
>  > can we expect the same chip to be used on a non-arm board?
> 
> Posssibly, yes - But then with different nvram settings. See the
> opensuse link above for how they handle rpi + a few sunxi boards.
> 
> 
>  > I would just drop the architecture dependency here, because there is
>  > nothing specific to the SoC here; the WiFi chip is a secondary chip, so
>  > could well be present on other boards that are non-arm.
> 
> I disagree. I haven't found any detailed documentation, but my
> understanding is that this nvram data is board(-family) specific,
> E.G. it differs between the sunxi boards. From what I could find, the
> rpi0-w uses the same nvram file as rpi3 though.

If it is (familly-of-)board-specific then keep the dependency, then.

>  >> +++ b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
>  >> @@ -0,0 +1,22 @@
>  >> +################################################################################
>  >> +#
>  >> +# rpi-wifi-firmware
>  >> +#
>  >> +################################################################################
>  >> +
>  >> +RPI_WIFI_FIRMWARE_VERSION = 54bab3d6a6d43239c71d26464e6e10e5067ffea7
>  >> +# brcmfmac43430-sdio.bin comes from linux-firmware
>  >> +RPI_WIFI_FIRMWARE_SOURCE = brcmfmac43430-sdio.txt
>  >> +# git repo contains a lot of unrelated files
>  >> +RPI_WIFI_FIRMWARE_SITE =
>  >> https://raw.githubusercontent.com/RPi-Distro/firmware-nonfree/$(RPI_WIFI_FIRMWARE_VERSION)/brcm80211/brcm
> 
>  > License?
> 
> Yeah, that's where things get complicated. There is no explicit license
> given. The other brcm*bin files in linux-firmware are covered by
> LICENCE.broadcom_bcm43xx, but the question is if this also applies to
> this nvram file.
> 
> Maybe we should just do:
> 
> RPI_WIFI_FIRMWARE_LICENSE = PROPRIETARY
> 
> Like we do for the bluetooth part.

The OpenSUSE link you pointed above states:

    # From
    # https://github.com/raspberrypi/linux/issues/1325#issuecomment-195560582
    # Phil Elwell (Raspberry Pi Foundation) wrote: "Broadcom have said that
    # the firmware files for the BCM43438 are covered under this licence:"
    Source0:
    https://git.kernel.org/cgit/linux/kernel/git/firmware/linux-firmware.git/plain/LICENCE.broadcom_bcm43xx

BTW, I love the way they force local names to be board-specific.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
