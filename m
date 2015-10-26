From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 26 Oct 2015 20:46:49 +0100
Subject: [Buildroot] Integrating ft6x06 touchscreen driver
In-Reply-To: <1587830330.3506598.1445679247577.JavaMail.yahoo@mail.yahoo.com>
References: <1587830330.3506598.1445679247577.JavaMail.yahoo@mail.yahoo.com>
 <1587830330.3506598.1445679247577.JavaMail.yahoo@mail.yahoo.com>
Message-ID: <20151026204649.6e0c23a3@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello David,

On Sat, 24 Oct 2015 09:34:07 +0000 (UTC), David PICARD <davepiq@yahoo.fr> wrote:

> Hi,
> I could successfully build a system for the RPi B+ and Adafruit's PiTFT 2.8" capacitive touchscreen. The frame buffer works, and I can see my test Qt5 app on the TFT. Happy week for a noob !
> 
> So far, so good. But I'm stuck at the touchscreen part. I saw a driver (ft6x06) in Adafruit's git tree, but I don't really know how to use it. So, I'd be pleased if you could give me some guidelines.

See attached patch against buildroot which adds ft6x06 support for the rpi linux kernel (works for me), you
have to add:

	BR2_LINUX_KERNEL_PATCH="board/raspberrypi/linux-4.1.5-rpi

to your buildroot config (and rebuild the linux kernel) and add:

	CONFIG_TOUCHSCREEN_FT6X06=m

to your linux kernel config. The patches port the adafruit patches to the linux-4.1.5 kernel tree.

But a newer version (supporting device tree configuration) is coming soon, see [1].


> Alternatively, I could use a USB mouse. But I although I could see an entry in /dev/input, the pointer would not show up on the TFT device.
> Thanks,David.

No mouse cursor with a qt5 application, but I get the mouse/touch events....

Basic check with

	$ cat /dev/input/event0 | hexdump
or
	$ evtest
or
	$ /usr/lib/qt/examples/touch/fingerpaint/fingerpaint -platform linuxfb:fb=/dev/fb1

Regards,
Peter


[1] http://lkml.iu.edu/hypermail/linux/kernel/1510.0/00403.html
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-raspberrypi-add-ft6x06_ts-support.patch
Type: text/x-patch
Size: 39363 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151026/82c3dcc6/attachment.bin>
