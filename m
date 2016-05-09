From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 9 May 2016 22:46:32 +0200
Subject: [Buildroot] [dtc] Compiling a .dts overlay
In-Reply-To: <CALtfCQYgM9Lh9iu-iPFB5PUHJBL-vxno4s8ocOECjhrVJ6bT3Q@mail.gmail.com>
References: <CALtfCQZz2htRMAtsGTpehAwshDLeLFfQki1b1UJEW+pVVcR1Aw@mail.gmail.com>
 <CAKXOQBxS0OTJC4o_UKM2GS+DZmydXbk2-H3zhd9Gas7ivH2JEA@mail.gmail.com>
 <CALtfCQa3LcBpbWuYucEn3eafXnbvp_hwidC1XyrzmK2z6mkSSA@mail.gmail.com>
 <CALtfCQYgM9Lh9iu-iPFB5PUHJBL-vxno4s8ocOECjhrVJ6bT3Q@mail.gmail.com>
Message-ID: <20160509224632.20316e68@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Oscar,

On Mon, 9 May 2016 11:57:02 +0200, Oscar Gomez Fuente <oscargomezf@gmail.com> wrote:

> Hi everyone,
> 
> The dtb overlay loaded fine. I've checked this with the command: vcdbg log
> msg
> ...
> 001402.187: Loading 'bcm2710-rpi-3-b.dtb' from SD card
> 001468.661: dtparam: uart0_clkrate=48000000
> 001488.609: Loaded overlay 'pi3-disable-bt'
> 001523.385: Loaded overlay 'tca6424a'
> ...
> 
> Now I can see the device: /sys/call/gpiochip488
> 
> I can access to the 24 pins of my TCA6424A IC [488 to 511]
> 
> # echo 488 > /sys/class/gpio/export
> # echo "out" > /sys/class/gpio/gpio488/direction
> # echo 1 > /sys/class/gpio/gpio488/value
> 
> But I couldn't see the interrupt in /proc/interrupts:
> 
> # cat /proc/interrupts
>            CPU0       CPU1       CPU2       CPU3
>  16:          0          0          0          0   ARMCTRL  16 Edge
>  bcm2708_fb dma
>  20:          0          0          0          0   ARMCTRL  20 Edge
>  DMA IRQ
>  21:          0          0          0          0   ARMCTRL  21 Edge
>  DMA IRQ
>  24:          0          0          0          0   ARMCTRL  24 Edge
>  DMA IRQ
>  32:     424138          0          0          0   ARMCTRL  32 Edge
>  dwc_otg, dwc_otg_pcd, dwc_otg_hcd:usb1
>  49:          0          0          0          0   ARMCTRL  49 Edge
>  3f200000.gpio:bank0
>  50:          0          0          0          0   ARMCTRL  50 Edge
>  3f200000.gpio:bank1
>  65:         14          0          0          0   ARMCTRL  65 Edge
>  3f00b880.mailbox
>  66:          2          0          0          0   ARMCTRL  66 Edge
>  VCHIQ doorbell
>  75:          1          0          0          0   ARMCTRL  75 Edge
>  77:        554          0          0          0   ARMCTRL  77 Edge
>  DMA IRQ
>  79:       6148          0          0          0   ARMCTRL  79 Edge
>  3f804000.i2c
>  80:          0          0          0          0   ARMCTRL  80 Edge
>  3f204000.spi
>  82:        136          0          0          0   ARMCTRL  82 Edge
>  mmc0
>  83:      10895          0          0          0   ARMCTRL  83 Edge
>  uart-pl011
>  84:       9475          0          0          0   ARMCTRL  84 Edge
>  mmc1
>  96:          0          0          0          0   ARMCTRL  96 Edge
>  arch_timer
>  97:      10595       8874       3133        458   ARMCTRL  97 Edge
>  arch_timer
> ...
> 
> According to my .dts file, I've configured the pin GPIO04 as an input
> [interrupt]. I think I had to see an interrupt related to tca6424a, didn't
> I? but it didn't appear. I've read the kernel log and I've seen this
> suspicious message:
> 
> # dmesg
> ..
> [    3.633230] pca953x 1-0022: interrupt support not compiled in
> ..
> 
> So I was surfing on the internet and It seems to be you have to select in
> the kernel the option:
> 
> Device Drivers > GPIO Support > I2C GPIO expanders > [*] GPIO_PCA953X_IRQ
> 
> But If you want to select this option you can't select the driver:
> PCA95[357]x, PCA9698, TCA64xx, and MAX7310 I/O ports like a module. (I
> don't have any idea why?)
> 
> Eventually, everything works fine.
> 
> 
> So this is my final tca6424a-overlay.dts [i2c1 and INT pin connected to
> GPI04] working fine on my raspberry pi 3B.
> 
> ---
> // Definitions for TCA6424A IO Expander from Texas Instruments
> /dts-v1/;
> /plugin/;
> / {
> compatible = "brcm,bcm2835", "brcm,bcm2708", "brcm,bcm2709";
> 
> fragment at 0 {
> target = <&i2c1>;
> __overlay__ {
> status = "okay";
> };
> };
> 
> fragment at 1 {
> target = <&gpio>;
> __overlay__ {
> tca6424_pins: tca6424_pins {
> brcm,pins = <4>;
> brcm,function = <0>;
> };
> };
> };
> 
> fragment at 2 {
> target = <&i2c1>;
> __overlay__ {
> #address-cells = <1>;
> #size-cells = <0>;
> tca6424 at 22 {
> compatible = "ti,tca6424";
> reg = <0x22>;
> pinctrl-names = "default";
> pinctrl-0 = <&tca6424_pins>;
> interrupt-parent = <&gpio>;
> interrupts = <4 2>;
> };
> 
> };
> };
> };
> ---
> 
> I would like to place this overlay dts file in
> https://github.com/raspberrypi/linux.git/arch/arm/boot/dts/overlays
> 
> Does anyone know how to apply for uploading this overlay dts file, to the
> person in charge of https://github.com/raspberrypi/linux?
> 
> 

Try to announce it somewhere on RPi forum [1] or create a git(hub) pull
request against https://github.com/raspberrypi/linux?

But I think chances are higher for a widely available ready to use
devices/add-on-boards than for individual solutions... 

Regards,
Peter

[1] https://www.raspberrypi.org/forum

> Best regards.
> 
> On 9 May 2016 at 08:37, Oscar Gomez Fuente <oscargomezf@gmail.com> wrote:
> 
> > Hi,
> >
> >
> > I've tried what told me Peter Seiderer, and it compiled fine: "using
> > interrupts = <23 2>;". Now I'm going to check if the .dtb file works fine.
> >
> > Thank you very much.
> >
> > Best regards.
> >
> > Oscar Gomez Fuente
> >
> > On 6 May 2016 at 23:20, Nicholas Walton <nicholas.walton@gmail.com> wrote:
> >
> >> Plugin overlays are not part of mainline dtc. Try
> >> https://git.kernel.org/cgit/utils/dtc/dtc.git and the instructions at
> >> https://learn.adafruit.com/introduction-to-the-beaglebone-black-device-tree/compiling-an-overlay
> >> .
> >>
> >> On Fri, May 6, 2016 at 5:17 AM, Oscar Gomez Fuente <oscargomezf@gmail.com
> >> > wrote:
> >>
> >>> Hi,
> >>>
> >>> I'm working with the latest stable release: 2016.02 and with the
> >>> raspberry pi 3B.
> >>>
> >>> I'm trying to compile my own .dtb overlay, because I need to add the IO
> >>> Expander i2c TCA6424A to my HW. And I would like to know how to do this
> >>> using overlays and device tree.
> >>>
> >>> But I've got this error when I tried to compile de .dts file:
> >>>
> >>> # dtc -I dts -O dtb -o tca6424a-overlay.dtb tca6424a-overlay.dts
> >>> Error: tca6424a-overlay.dts:3.2-8 syntax error
> >>> FATAL ERROR: Unable to parse input tree
> >>> # dtc -v
> >>> Version: DTC 1.4.1-g8ead5b66
> >>> #
> >>>
> >>> This is the .dts file:
> >>> ----------
> >>> // Definitions for TCA6424A IO Extender from Texas Instruments
> >>> /dts-v1/;
> >>> /plugin/;
> >>> / {
> >>> compatible = "brcm,bcm2835", "brcm,bcm2708", "brcm,bcm2709";
> >>>
> >>> fragment at 0 {
> >>> target = <&i2c1>;
> >>> __overlay__ {
> >>> status = "okay";
> >>> };
> >>> };
> >>>
> >>> fragment at 1 {
> >>> target = <&gpio>;
> >>> __overlay__ {
> >>> tca6424_pins: tca6424_pins {
> >>> brcm,pins = <4>;
> >>> brcm,function = <0>;
> >>> };
> >>> };
> >>> };
> >>>
> >>> fragment at 2 {
> >>> target = <&i2c1>;
> >>> __overlay__ {
> >>> #address-cells = <1>;
> >>> #size-cells = <0>;
> >>> tca6424 at 22 {
> >>> compatible = "ti,tca6424";
> >>> reg = <0x22>;
> >>> pinctrl-names = "default";
> >>> pinctrl-0 = <&tca6424_pins>;
> >>> interrupt-parent = <&gpio4>;
> >>> interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
> >>> };
> >>>
> >>> };
> >>> };
> >>> };
> >>> -----------
> >>>
> >>> Anyone could help me how to do this?
> >>>
> >>> Best regards.
> >>>
> >>> Oscar Gomez Fuente.
> >>>
> >>> _______________________________________________
> >>> buildroot mailing list
> >>> buildroot at busybox.net
> >>> http://lists.busybox.net/mailman/listinfo/buildroot
> >>>
> >>
> >>
> >
