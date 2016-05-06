From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Fri, 6 May 2016 14:17:32 +0200
Subject: [Buildroot] [dtc] Compiling a .dts overlay
Message-ID: <CALtfCQZz2htRMAtsGTpehAwshDLeLFfQki1b1UJEW+pVVcR1Aw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm working with the latest stable release: 2016.02 and with the raspberry
pi 3B.

I'm trying to compile my own .dtb overlay, because I need to add the IO
Expander i2c TCA6424A to my HW. And I would like to know how to do this
using overlays and device tree.

But I've got this error when I tried to compile de .dts file:

# dtc -I dts -O dtb -o tca6424a-overlay.dtb tca6424a-overlay.dts
Error: tca6424a-overlay.dts:3.2-8 syntax error
FATAL ERROR: Unable to parse input tree
# dtc -v
Version: DTC 1.4.1-g8ead5b66
#

This is the .dts file:
----------
// Definitions for TCA6424A IO Extender from Texas Instruments
/dts-v1/;
/plugin/;
/ {
compatible = "brcm,bcm2835", "brcm,bcm2708", "brcm,bcm2709";

fragment at 0 {
target = <&i2c1>;
__overlay__ {
status = "okay";
};
};

fragment at 1 {
target = <&gpio>;
__overlay__ {
tca6424_pins: tca6424_pins {
brcm,pins = <4>;
brcm,function = <0>;
};
};
};

fragment at 2 {
target = <&i2c1>;
__overlay__ {
#address-cells = <1>;
#size-cells = <0>;
tca6424 at 22 {
compatible = "ti,tca6424";
reg = <0x22>;
pinctrl-names = "default";
pinctrl-0 = <&tca6424_pins>;
interrupt-parent = <&gpio4>;
interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
};

};
};
};
-----------

Anyone could help me how to do this?

Best regards.

Oscar Gomez Fuente.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160506/c24b270d/attachment.html>
