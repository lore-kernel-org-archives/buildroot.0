From: Fredrik Nyman <fredrik.nyman@gmail.com>
Date: Fri, 2 Jan 2015 21:02:38 -0500
Subject: [Buildroot] Raspberrypi question/suggestion
Message-ID: <CAAwtsPUfwvcSNvGTDee+XBgE9a_ePhw9QMURthNUDXqWFDTn+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Raspberry Pi is a somewhat odd creature in that the default console
(tty1) is graphical (HDMI output).

Most people using buildroot on the RPi probably want to use the GPIO serial
port (ttyAMA0).  Conveniently, the RPi allows you to do both; just modify
cmdline.txt to add

console=ttyAMA0,115200

so it reads something like
dwc_otg.lpm_enable=0 console=ttyAMA0,115200 console=tty1
root=/dev/mmcblk0p2 rootfstype=ext4 elevator=deadline rootwait

and also add a second getty to etc/inittab like so:

ttyAMA0::respawn:/sbin/getty -L  ttyAMA0 115200 vt100 # GENERIC_SERIAL

Question: what is the cleanest way to do this with buildroot?  As far as I
can tell, the best I can do is to create a new etc/inittab with two entries
(one for tty1, one for ttyAMA0) and use BR2_ROOTFS_OVERLAY to point to this
file so it will be included when I rebuild.
I don't see a clean way to modify cmdline.txt though.  Suggestions?  Should
I write a script and call it with BR2_ROOTFS_POST_BUILD_SCRIPT?

And finally for my suggestion: it would probably be a very good idea to add
a paragraph to board/raspberrypi/readme.txt to remind people that they will
want to make sure to remember to check their tty settings.

Thanks!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150102/e666f68f/attachment.html>
