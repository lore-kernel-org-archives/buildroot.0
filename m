From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 30 Dec 2014 20:58:13 +0100
Subject: [Buildroot] [RFC v2] linux: add fbtft kernel extension
Message-ID: <1419969494-9615-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... sorry for the resend, file linux/linux-ext-fbtft.mk was missing.

First draft of a patch adding fbtft framebuffer drivers to buildroot.

My first attempt was using the out of tree kernel modules compile
(as suggested by Yann E. MORIN [1]) which is already (partly)
supported by the fbtft source, but I failed to enable some
needed kernel configurations e.g FB_DEFERRED_IO (did not survive
the oldconfig/silentoldconfig step when not referenced in tree,
workaround is to enable a built in feature with the same
preferences [2]).

The second attempt is the linux-ext approach (as presented here).

I am unsure if the enabling of CONFIG_SPI_BCM2708 belongs into
linux.mk or should go into raspberrypi_defconfig or belongs into
the appropriate Readme?

The second question is about the 25 submodules of fbtft
(at the moment only FB_TFT_ILI9340 and FB_TFT_ILI9341 are
enabled). Should every submodule be configurable or should all
submodules be enabled by default?

There is an adafruit fork of the fbtft repository [4] with some
adfruit specific enhancements...

Regards,
Peter

Tested with RaspberryPi B+ and PiTFT Mini Kit - 320x240 2.8" TFT
(see [5] and [6]) and the following configuration changes:

- cmdline.txt: add 'fbcon=map:10 fbcon=font:VGA8x8'
- add /etc/modules-load.d/fbtft.conf with 'fbtft_device'
- add /etc/modprobe.d/00-fbtft.conf with 'options fbtft_device name=adafruit28 rotate=90 gpios=dc:25'

[1] http://lists.busybox.net/pipermail/buildroot/2014-December/115770.html
[2] https://github.com/notro/fbtft/issues/209#issuecomment-68191514
[3] http://www.adafruit.com/products/1983
[4] https://github.com/adafruit/adafruit-rpi-fbtft
[5] http://h65951.serverkompetenz.net/PeterSeiderer/upload/PiTFT_2_8_ct/Image9893.jpg
[6] http://h65951.serverkompetenz.net/PeterSeiderer/upload/PiTFT_2_8_ct/Image9897.jpg

Peter Seiderer (1):
  linux: add fbtft kernel extension

 linux/Config.ext.in      | 10 ++++++++++
 linux/linux-ext-fbtft.mk | 25 +++++++++++++++++++++++++
 linux/linux.mk           |  9 +++++++++
 package/Config.in        |  1 +
 package/fbtft/Config.in  | 13 +++++++++++++
 package/fbtft/fbtft.mk   | 11 +++++++++++
 6 files changed, 69 insertions(+)
 create mode 100644 linux/linux-ext-fbtft.mk
 create mode 100644 package/fbtft/Config.in
 create mode 100644 package/fbtft/fbtft.mk

-- 
2.1.2
