From: Fromm Kay <Kay.Fromm@escad.de>
Date: Thu, 22 Jun 2017 09:31:06 +0000
Subject: [Buildroot] BBGW can0
Message-ID: <45405643a61e40fc93c4448dc043f9d1@SPF020.engineering.escad-group.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sirs,

I'm a software developer and I'm about to create an initramfs for the beaglebone green wireless.
I have got a custom am335x-bonegreen-wireless.dts for the wireless running by patching /board/ti/am335x/board.c and /include/configs/am335x_emv.h
Due to the lag of knowledge how to integrate the capemgr I added all needed additions oF BB-CAN1, BB-ADC, BB-PWM1 directly into the custom am335x-bonegreen-wireless.dts e.g. am33xx.dtsi.
I loaded the modules c_can_platform, can, can_dev, can_raw and put the can0 device up by adding ip link set can0 type can bitrate 250000 triple-sampling on

Ifconfig:
can0      Link encap:UNSPEC  HWaddr 00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00
          UP RUNNING NOARP  MTU:16  Metric:1
          RX packets:2 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:10
          RX bytes:16 (16.0 B)  TX bytes:0 (0.0 B)
          Interrupt:167

ip -d -s link show can0:
3: can0: <NOARP,UP,LOWER_UP,ECHO> mtu 16 qdisc pfifo_fast state UNKNOWN mode DEFAULT group default qlen 10
    link/can  promiscuity 0
    can <TRIPLE-SAMPLING> state ERROR-PASSIVE (berr-counter tx 0 rx 127) restart-ms 0
                 bitrate 250000 sample-point 0.875
                 tq 250 prop-seg 6 phase-seg1 7 phase-seg2 2 sjw 1
                 c_can: tseg1 2..16 tseg2 1..8 sjw 1..4 brp 1..1024 brp-inc 1
                 clock 24000000
                 re-started bus-errors arbit-lost error-warn error-pass bus-off
                 0          0          0          1          1          0         numtxqueues 1 numrxqueues 1
    RX: bytes  packets  errors  dropped overrun mcast
    16         2        0       0       0       0
    TX: bytes  packets  errors  dropped carrier collsns
    0          0        0       0       0       0

cat /sys/kernel/debug/pinctrl/44e10800.pinmux/pinmux-pins | grep can:
pin 96 (44e10980.0): 481d0000.can (GPIO UNCLAIMED) function pinmux_dcan1_pins group pinmux_dcan1_pins
pin 97 (44e10984.0): 481d0000.can (GPIO UNCLAIMED) function pinmux_dcan1_pins group pinmux_dcan1_pins

I have can-utils installed and when I fetch can-packets with the similar configured BBGW-blank-debian-8.5-seeed-iot-armhf-2016-06-19 OS I get my desired output via candump can0.

What I'm struggling with is the fact that with the same HW-setup (cape attached to a can-emitter) but running on my initramfs I don't get any messages via candump can0.

TLDR:
Buildroot-initramfs vs. BBGW-blank-debian-8.5-seeed-iot-armhf -> same can-kernel-config, same pinmux, same module, same tools, same hardware -> seeed-iot = candump can0 OK; initramfs = candump can0 NOTHING.

I would really appreciate some help from you.... plase
With best regards,

Kay Fromm
Teamleiter Softwareentwicklung
________________________________
ESCAD DESIGN GmbH
Edewechter Landstr.146
D-26131 Oldenburg
http://www.escad-group.com
Telefon:
Mobil:
E-Mail:

+49 441 960 1253 20
+49 172 7452 379
Kay.Fromm at escad.de

________________________________

Sitz der Gesellschaft:
Pfullendorf
Gerichtsstand:
Amtsgericht Ulm / HRB 723523
Bankverbindung:
Sparkasse Bodensee - IBAN: DE32690500010024378564 BIC: SOLADES1KNZ
Gesch?ftsf?hrer:
Reiner Hafen, Rudolf Rauch
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170622/cfca6949/attachment.html>
