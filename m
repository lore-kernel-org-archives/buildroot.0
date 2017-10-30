From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Mon, 30 Oct 2017 12:49:37 +0530
Subject: [Buildroot] [PATCH v4 11/11] board: Add Orangepi Zero Plus2
	support
In-Reply-To: <CAFGfvX59qSbGconUFVatoR-izmuATBm+_nWEEWuB5Qzs7gTcjg@mail.gmail.com>
References: <1509041511-30956-1-git-send-email-jagan@amarulasolutions.com>
 <1509041511-30956-12-git-send-email-jagan@amarulasolutions.com>
 <CAFGfvX7P2Y3u2SqBE4r3Jetc82PUuwDUZncrK=hqnoq=9FAwXA@mail.gmail.com>
 <CAFGfvX59qSbGconUFVatoR-izmuATBm+_nWEEWuB5Qzs7gTcjg@mail.gmail.com>
Message-ID: <CAD6G_RSaKJxjMjtPTVtsoRq2TyUd00HYEqtd-cNZcAmRVnp9Cg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 30, 2017 at 3:02 AM, Sergey Matyukevich <geomatsi@gmail.com> wrote:
>
>
>>>
>>> Add initial support for Orangepi Zero Plus2 board with below features:
>>> - U-Boot 2017.09
>>> - Linux 4.13.7
>>> - Default packages from buildroot
>>
>>
>> I applied the whole patch series on top of the current buildroot and tried
>> orange-pi-zero-plus2. Build is ok, booting u-boot and kernel from SD card is
>> ok as well.
>> However later on kernel is not able detect SD card, while eMMC is properly
>> detected. As a result, boot never completes.  I guess SD cards in use should
>> not be a problem since my other boards (orange-pi-[zero|one]) work fine
>> with the same cards. s there anything I could miss ? Any DTS fixup maybe ?
>
>
> I stopped being lazy and did a bit more hacking around... With mmc debug
> enabled the following message appears in dmesg when I try to _remove_ card
> from the slot:
> mmc0: mmc_rescan_try_freq: trying to init card at 400000 Hz
>
> Which brings us to the following dts fixup:
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> index b6b7a561df8c..a42fd79a62a3 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> @@ -71,7 +71,7 @@
>         pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin>;
>         vmmc-supply = <&reg_vcc3v3>;
>         bus-width = <4>;
> -       cd-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>;
> +       cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;
>         status = "okay";
>  };
>
> With this fix applied  orange-pi-zero-plus2 boots fine.

Thanks, will investigate on this further and send the change to Linux.

thanks!
-- 
Jagan Teki
Free Software Engineer | www.openedev.com
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
