From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 13 Jan 2015 20:40:00 +0100
Subject: [Buildroot] [PATCH v3 0/7] dtc: update and add raspberry pi overlay
	support
Message-ID: <1421178007-11877-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There are two different dtb files used for raspberry pi booting:
- overwrite the firmware provided videocore dtb configuration ([1])
- linux kernel dtb configuration and dtb overlays ([2])

Example for Raspberry Pi B+ and Adafruit PiTFT 320x240 TFT module with
capcacitive touchscreen ([3]).

The PiTFT module has 4 buttons which can connect gpio 17, 22, 23 or 27 to GND,
this means this gpios have to be configured to input with pull up termination
(input is '1' with switch open, input is '0' with switch closed).

Setting the gpio parameters can be done by direct register setting (see [4] for
example, similare code can be put into arch/arm/mach-bcm2708/bcm2708.c) or
by the modern way, overwrite the videocore dtb boot configuration.

For the example with the 4 buttons do the following:

- get the original videocore dts file:

	$ wget http://www.raspberrypi.org/documentation/configuration/images/dt-blob.dts

- apply the following patch:

--- a/dt-blob.dts 2015-01-11 17:32:56.730450241 +0100
+++ b/dt-blob.dts 2015-01-11 18:01:15.715903945 +0100
@@ -186,6 +186,10 @@
                   }; // pin
                   pin at p14 { function = "uart0";  termination = "no_pulling"; drive_strength_mA = < 8 >; }; // TX uart0
                   pin at p15 { function = "uart0";  termination = "pull_up"; drive_strength_mA = < 8 >; }; // RX uart0
+                  pin at p17 { function = "input"; termination = "pull_up";}; // adafruit28 - button 4
+                  pin at p22 { function = "input"; termination = "pull_up";}; // adafruit28 - button 2
+                  pin at p23 { function = "input"; termination = "pull_up";}; // adafruit28 - button 1
+                  pin at p27 { function = "input"; termination = "pull_up";}; // adafruit28 - button 3
                   pin at p28 { function = "i2c0";   termination = "pull_up";    }; // I2C 0 SDA
                   pin at p29 { function = "i2c0";   termination = "pull_up";    }; // I2C 0 SCL
                   pin at p31 { function = "output"; termination = "pull_down"; }; // LAN NRESET

- compile to dtb file:

	$ host/usr/bin/dtc -I dts -O dtb -o dt-blob.bin dt-blob.dts

- copy the resulting dt-blob.bin to the Raspberry Pi boot partition, the videocore will use
  it automatically

After this steps you can use the 4 buttons, for example do the following on the target
(for the fist button):

	$ echo 23 > /sys/class/gpio/export
	$ while true; do echo -n "gpio-23: "; cat /sys/class/gpio/gpio23/value; sleep 2; done

The second use case is for the linux kernel dtb configuration using overlays, e.g.
enable spi when using a device tree enabled Raspberry Pi linux kernel ([5]):

- use the following adafruit28-spi0.dts file:
/dts-v1/;
/plugin/;

/ {
    compatible = "brcm,bcm2708";

   fragment at 0 {
      target = <&spi0>;
      __overlay__ {
         status = "okay";
         spidev at 0{
            spi-max-frequency = <32000000>;
         };
         spidev at 1{
            spi-max-frequency = <32000000>;
         };
      };
   };
};

- compile to dtb overlay file

	$ host/usr/bin/dtc -@ -I dts -O dtb -o adafruit28-spi0.dtb adafruit28-spi0.dts

- copy the resulting adafruit28-spi0.dtb to the Raspberry Pi boot partition overlay directory and
  add the following line to the file config.txt on the boot partition:

	device_tree_overlay=overlays/adafruit28-spi0.dtb

This will enable the spi bus used for the PiTFT 320x240 TFT module (which is otherwise
disabled by default).

The same dtb overlay method is used for BeagleBone (see [6]).

[1] http://www.raspberrypi.org/documentation/configuration/pin-configuration.md
[2] https://github.com/raspberrypi/documentation/blob/master/configuration/device-tree.md
[3] http://www.adafruit.com/products/1983
[4] https://github.com/adafruit/adafruit-rpi-fbtft/commit/b4a3d8e481eae0290d5f0d3327be5624b0077c54
[5] http://lists.busybox.net/pipermail/buildroot/2015-January/116919.html
[6] https://learn.adafruit.com/introduction-to-the-beaglebone-black-device-tree/device-tree-overlays

Peter Seiderer (7):
  dtc: fix project and download url
  dtc: rename patches to new convention
  dtc: bump version to 1.4.1
  dtc: add hash
  dtc: add host build
  dtc: add patches for raspberry pi overlay support
  linux: install dtc only in case package host dtc is not selected

 linux/linux.mk                                     |   3 +-
 package/Config.in.host                             |   1 +
 ...-extra_cflags.patch => 0002-extra-cflags.patch} |   2 +-
 .../0003-dtc-Dynamic-symbols-fixup-support.patch   | 581 +++++++++++++++++++++
 .../0004-dtc-v-takes-no-argument-drop-extra.patch  |  44 ++
 package/dtc/Config.in                              |   2 +-
 package/dtc/Config.in.host                         |   9 +
 package/dtc/dtc-separate-lib-install.patch         |  28 -
 package/dtc/dtc.hash                               |   2 +
 package/dtc/dtc.mk                                 |  27 +-
 10 files changed, 657 insertions(+), 42 deletions(-)
 rename package/dtc/{dtc-extra_cflags.patch => 0002-extra-cflags.patch} (92%)
 create mode 100644 package/dtc/0003-dtc-Dynamic-symbols-fixup-support.patch
 create mode 100644 package/dtc/0004-dtc-v-takes-no-argument-drop-extra.patch
 create mode 100644 package/dtc/Config.in.host
 delete mode 100644 package/dtc/dtc-separate-lib-install.patch
 create mode 100644 package/dtc/dtc.hash

-- 
2.1.2
