From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 9 May 2016 22:36:20 +0200
Subject: [Buildroot] [dtc] Compiling a .dts overlay
In-Reply-To: <CALtfCQa3LcBpbWuYucEn3eafXnbvp_hwidC1XyrzmK2z6mkSSA@mail.gmail.com>
References: <CALtfCQZz2htRMAtsGTpehAwshDLeLFfQki1b1UJEW+pVVcR1Aw@mail.gmail.com>
 <CAKXOQBxS0OTJC4o_UKM2GS+DZmydXbk2-H3zhd9Gas7ivH2JEA@mail.gmail.com>
 <CALtfCQa3LcBpbWuYucEn3eafXnbvp_hwidC1XyrzmK2z6mkSSA@mail.gmail.com>
Message-ID: <20160509223620.14eefaa7@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Oscar,

On Mon, 9 May 2016 08:37:36 +0200, Oscar Gomez Fuente <oscargomezf@gmail.com> wrote:

> Hi,
> 
> 
> I've tried what told me Peter Seiderer, and it compiled fine: "using
> interrupts = <23 2>;". Now I'm going to check if the .dtb file works fine.
> 
	$ grep -R IRQ_TYPE_LEVEL_LOW linux-9118192d7357b0942885c2c8baf65d5501c12913/arch/arm/boot/dts/include/
	linux-9118192d7357b0942885c2c8baf65d5501c12913/arch/arm/boot/dts/include/dt-bindings/interrupt-controller/irq.h:#define IRQ_TYPE_LEVEL_LOW      8

So 'interrupts = <23 IRQ_TYPE_LEVEL_LOW>;' should translate to 'interrupts = <23 8>;'

> Thank you very much.

Thanks for feedback...

Regards,
Peter

> 
> Best regards.
> 
> Oscar Gomez Fuente
> 
> On 6 May 2016 at 23:20, Nicholas Walton <nicholas.walton@gmail.com> wrote:
> 
> > Plugin overlays are not part of mainline dtc. Try
> > https://git.kernel.org/cgit/utils/dtc/dtc.git and the instructions at
> > https://learn.adafruit.com/introduction-to-the-beaglebone-black-device-tree/compiling-an-overlay
> > .
> >
> > On Fri, May 6, 2016 at 5:17 AM, Oscar Gomez Fuente <oscargomezf@gmail.com>
> > wrote:
> >
> >> Hi,
> >>
> >> I'm working with the latest stable release: 2016.02 and with the
> >> raspberry pi 3B.
> >>
> >> I'm trying to compile my own .dtb overlay, because I need to add the IO
> >> Expander i2c TCA6424A to my HW. And I would like to know how to do this
> >> using overlays and device tree.
> >>
> >> But I've got this error when I tried to compile de .dts file:
> >>
> >> # dtc -I dts -O dtb -o tca6424a-overlay.dtb tca6424a-overlay.dts
> >> Error: tca6424a-overlay.dts:3.2-8 syntax error
> >> FATAL ERROR: Unable to parse input tree
> >> # dtc -v
> >> Version: DTC 1.4.1-g8ead5b66
> >> #
> >>
> >> This is the .dts file:
> >> ----------
> >> // Definitions for TCA6424A IO Extender from Texas Instruments
> >> /dts-v1/;
> >> /plugin/;
> >> / {
> >> compatible = "brcm,bcm2835", "brcm,bcm2708", "brcm,bcm2709";
> >>
> >> fragment at 0 {
> >> target = <&i2c1>;
> >> __overlay__ {
> >> status = "okay";
> >> };
> >> };
> >>
> >> fragment at 1 {
> >> target = <&gpio>;
> >> __overlay__ {
> >> tca6424_pins: tca6424_pins {
> >> brcm,pins = <4>;
> >> brcm,function = <0>;
> >> };
> >> };
> >> };
> >>
> >> fragment at 2 {
> >> target = <&i2c1>;
> >> __overlay__ {
> >> #address-cells = <1>;
> >> #size-cells = <0>;
> >> tca6424 at 22 {
> >> compatible = "ti,tca6424";
> >> reg = <0x22>;
> >> pinctrl-names = "default";
> >> pinctrl-0 = <&tca6424_pins>;
> >> interrupt-parent = <&gpio4>;
> >> interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
> >> };
> >>
> >> };
> >> };
> >> };
> >> -----------
> >>
> >> Anyone could help me how to do this?
> >>
> >> Best regards.
> >>
> >> Oscar Gomez Fuente.
> >>
> >> _______________________________________________
> >> buildroot mailing list
> >> buildroot at busybox.net
> >> http://lists.busybox.net/mailman/listinfo/buildroot
> >>
> >
> >
