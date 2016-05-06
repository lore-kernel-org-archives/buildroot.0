From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 6 May 2016 23:08:28 +0200
Subject: [Buildroot] [dtc] Compiling a .dts overlay
In-Reply-To: <CALtfCQZz2htRMAtsGTpehAwshDLeLFfQki1b1UJEW+pVVcR1Aw@mail.gmail.com>
References: <CALtfCQZz2htRMAtsGTpehAwshDLeLFfQki1b1UJEW+pVVcR1Aw@mail.gmail.com>
Message-ID: <20160506230828.71dddb88@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Oscar,

On Fri, 6 May 2016 14:17:32 +0200, Oscar Gomez Fuente <oscargomezf@gmail.com> wrote:

> Hi,
> 
> I'm working with the latest stable release: 2016.02 and with the raspberry
> pi 3B.
> 
> I'm trying to compile my own .dtb overlay, because I need to add the IO
> Expander i2c TCA6424A to my HW. And I would like to know how to do this
> using overlays and device tree.
> 
> But I've got this error when I tried to compile de .dts file:
> 
> # dtc -I dts -O dtb -o tca6424a-overlay.dtb tca6424a-overlay.dts
> Error: tca6424a-overlay.dts:3.2-8 syntax error
> FATAL ERROR: Unable to parse input tree
> # dtc -v
> Version: DTC 1.4.1-g8ead5b66
> #
> 

You need to use a overlay enhanced dtc e.g. the one provided with the
Raspberry Pi linux kernel:

./build/linux-9118192d7357b0942885c2c8baf65d5501c12913/scripts/dtc/dtc --version
Version: DTC 1.4.1-g25efc119

./build/linux-9118192d7357b0942885c2c8baf65d5501c12913/scripts/dtc/dtc -@ -I dts -O dtb -o -o tca6424a-overlay.dtb tca6424a-overlay.dts

Not sure if the '-@' is still needed. Only one change needed for your example, see below...

> This is the .dts file:
> ----------
> // Definitions for TCA6424A IO Extender from Texas Instruments
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
> interrupt-parent = <&gpio4>;
> interrupts = <23 IRQ_TYPE_LEVEL_LOW>;

Changed to:

interrupts = <23 2>;

Seems no constants supported (or missing include) and '2' was just some guess...

Regards,
Peter

> };
> 
> };
> };
> };
> -----------
> 
> Anyone could help me how to do this?
> 
> Best regards.
> 
> Oscar Gomez Fuente.
