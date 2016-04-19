From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Tue, 19 Apr 2016 13:23:31 +0200
Subject: [Buildroot] [RPi 3B] ttyAMA0 serial port device doesn't exist on
	raspberry pi 3B
Message-ID: <CALtfCQatSKG7Afgd=Z5bbp69h3UfTDKd+3GX6_zcVfcYqFaEhA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

I'm using buildroot-2016.02 and I'm trying to make a rootfs for the
raspberry pi 3B. I've just used the raspberrypi2_defconfig. And everything
works fine except the serial port /dev/ttyAMA0.... I can see characters on
the serial port but they are garbage characters...

This is my config.txt, I'm using the bcm2710-rpi-3-b.dtb file:

-----
# Please note that this is only a sample, we recommend you to change it to
fit
# your needs.
# You should override this file using a post-build script.
# See http://buildroot.org/manual.html#rootfs-custom
# and http://elinux.org/RPiconfig for a description of config.txt syntax

kernel=zImage

# To use an external initramfs file
#initramfs rootfs.cpio.gz

# Disable overscan assuming the display supports displaying the full
resolution
# If the text shown on the screen disappears off the edge, comment this out
disable_overscan=1

# How much memory in MB to assign to the GPU on Pi models having
# 256, 512 or 1024 MB total memory
gpu_mem_256=100
gpu_mem_512=100
gpu_mem_1024=100

device_tree=bcm2710-rpi-3-b.dtb
dtparam=i2c_arm=on,i2c_arm_baudrate=200000
dtparam=spi=on
dtparam=watchdog=on
-----

And If I connect to my RPi3, I can see this with a dmesg:
...
[    0.000000] CPU: ARMv7 Processor [410fd034] revision 4 (ARMv7),
cr=10c5383d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing
instruction cache
[    0.000000] Machine model: Raspberry Pi 3 Model B Rev 1.2
[    0.000000] cma: Reserved 8 MiB at 0x38000000
...

So the .dtb file is loaded correctly.

And this is my cmdline.txt file:
------
console=ttyAMA0,115200 kgdboc=ttyAMA0,115200 root=/dev/mmcblk0p2 rw
rootfstype=ext4 elevator=deadline rootwait ip=dhcp
-----

But if I list the devices on /dev, I can see these devices:

/dev/ttyAMA1 and /dev/ttyS0

With the same rootfs compiled, but using bcm2709-rpi-2-b.dtb instead of
bcm2710-rpi-3-b.dtb it works fine on my RPi 2B, and I can see:

/dev/ttyAMA0


It seems to be there is some problem with the bcm2710-rpi-3-b.dtb file. Any
suggestions?


Best regards.

Oscar Gomez Fuente
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160419/55769873/attachment.html>
