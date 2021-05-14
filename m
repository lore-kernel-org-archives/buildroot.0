From: Andy Bergh <allmyaddmin@gmail.com>
Date: Fri, 14 May 2021 09:36:57 +0200
Subject: [Buildroot] Use the CAN0 device on beaglebone black
Message-ID: <CAAmck7WMah=unSWHSy0+gxv6VtcWETTnAJWRLR0ZwAOWQX4Miw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

How can I use the CAN0 device with a Buildroot image?

I have a Beaglebone black rev C and have built an image using Buildroot. I
used the standard beaglebone_defconfig and installed can-utils as well as
iproute2.

My understanding is that the i2c2 pins should be reconfigured to be able to
use the CAN0 device. In order to keep things simple (and avoid overlays) I
edit the "am335x-bone-common.dtsi" file in two ways.

1) Comment out the i2c2 and insert the CAN0 pin setup:

//    i2c2_pins: pinmux_i2c2_pins {
//        pinctrl-single,pins = <
//            0x178 (PIN_INPUT_PULLUP | MUX_MODE3)    /*
uart1_ctsn.i2c2_sda */
//            0x17c (PIN_INPUT_PULLUP | MUX_MODE3)    /*
uart1_rtsn.i2c2_scl */
//        >;
//    };

dcan0_pins: pinmux_dcan0_pins {
        pinctrl-single,pins = <
            0x178 (PIN_OUTPUT_PULLUP | MUX_MODE2)  /* P9.20 (0x178),
ddcan0_tx */
            0x17c (PIN_INPUT_PULLUP | MUX_MODE2)   /* P9.19 (0x17c),
ddcan0_rx */
        >;
    };

2) Replace i2c2 with
&dcan0 {
    #address-cells = <1>;
    #size-cells = <1>;
    status = "okay";
    pinctrl-names = "default";
    pinctrl-0 = <&dcan0_pins>;

};

Once I log in I can not get any CAN device going anywhere:
# ifup can0
Cannot find device "can0"
# ifconfig can0 up
ifconfig: SIOCGIFFLAGS: No such device

And looking at the available networks

# ls -al /sys/class/net/
total 0
drwxr-xr-x    2 root     root             0 Jan  1 00:00 .
drwxr-xr-x   43 root     root             0 Jan  1 00:00 ..
lrwxrwxrwx    1 root     root             0 Jan  1 00:00 eth0 ->
../../devices/platform/ocp/4a100000.ethernet/net/eth0
lrwxrwxrwx    1 root     root             0 Jan  1 00:00 lo ->
../../devices/virtual/net/lo
lrwxrwxrwx    1 root     root             0 Jan  1 00:02 sit0 ->
../../devices/virtual/net/sit0

I have exhausted all resources and am truly stuck. Any information which
may help will be greatly appreciated.

Thank you
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210514/8cc48f71/attachment-0001.html>
