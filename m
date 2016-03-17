From: David Picard <davepiq@yahoo.fr>
Date: Thu, 17 Mar 2016 16:57:59 +0100
Subject: [Buildroot] issue with I2C driver : ft6x06
Message-ID: <56EAD407.1010905@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I got the following configuration working :
- Raspberry Pi B+
- PiTFT 2.8" capacitive touchscreen (FT6x06 I2C chip for touchscreen)
- Kernel 4.1.5 + ft6x06 patch (ft6x06 introduced in v4.4)
- NFS rootfs

For some reason, I decided to switch to Raspberry Pi 2. Everything 
works, but the touchscreen : no entry is created in /dev/input and no 
output in dmesg. I tried to replace i2c_bcm2708 by i2c_bcm2835, but no luck.

I must be missing something...

David.


-------------
/etc/modules
-------------
# PiTFT display :
spi_bcm2835
fb_ili9341
fbtft_device name=adafruit28 rotate=90 gpios=dc:25
# PiTFT touch panel :
evdev
i2c_bcm2708
ft6x06_ts
# RTCC :
i2c-dev
rtc-ds1307

----------
config.txt
----------
kernel=zImage
disable_overscan=1
gpu_mem_256=100
gpu_mem_512=100
gpu_mem_1024=100
dtparam=spi=on
dtparam=i2c_arm=on

-----------
cmdline.txt
-----------
dwc_otg.lpm_enable=0 rootwait root=/dev/nfs rootfstype=nfs \
nfsroot=172.16.4.33:/var/local/rootfs_rpi_br console=ttyAMA0,115200 \
fbcon=map:10 fbcon=font:VGA8x8 ip=172.16.4.100
