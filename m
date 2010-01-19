From: Andrew Wiley <debio264@gmail.com>
Date: Tue, 19 Jan 2010 00:26:08 -0600
Subject: [Buildroot] EP9302 Sound and/or Module-Init-Tools: No such file or
	directory?
Message-ID: <ecbbfeda1001182226w3011d340t56a2e685738168b2@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to get sound working on my EP9302, and it *seems* like ALSA has a
driver for the the card (I think it's a CS4271?) somewhere, but I'm having
issues figuring out exactly how to set it up. My first reaction was to
enable everything ALSA-related that looked useful in the kernel config
(space isn't an issue for me) and try to run alsaconf on the board in hopes
that everything would Just Work.
As it turns out, alsaconf depends on module-init-tools (it crashed because
it couldn't find modinfo), so I added that to my packages, rebuild the
image, and tried again. Now my board is failing to load any kernel modules
because modprobe always returns "No such file or directory" even though I
can use insmod directly and load the modules correctly. The modules are in
the right place, but modprobe isn't finding them. Here's an example:
# lsmod
Module                  Size  Used by
# modprobe zd1211rw
WARNING: Could not open 'kernel/net/wireless/cfg80211.ko': No such file or
directory
WARNING: Could not open 'kernel/net/mac80211/mac80211.ko': No such file or
directory
WARNING: Could not open 'kernel/drivers/base/firmware_class.ko': No such
file or directory
FATAL: Could not open 'kernel/drivers/net/wireless/zd1211rw/zd1211rw.ko': No
such file or directory
# insmod /lib/modules/2.6.32.3/kernel/net/wireless/cfg80211.ko
cfg80211: Calling CRDA to update world regulatory domain
# insmod /lib/modules/2.6.32.3/kernel/net/mac80211/mac80211.ko
# insmod /lib/modules/2.6.32.3/kernel/drivers/base/firmware_class.ko
# insmod /lib/modules/
2.6.32.3/kernel/drivers/net/wireless/zd1211rw/zd1211rw.ko
usb 1-1: reset full speed USB device using ep93xx-ohci and address 2
usb 1-1: reset full speed USB device using ep93xx-ohci and address 2
zd1211rw: probe of 1-1:1.0 failed with error -2
usbcore: registered new interface driver zd1211rw
# uname -r
2.6.32.3
#

I'm guessing the first thing you'll ask for is an strace of a modprobe call,
so I'll get strace onto my root and get that up in a few minutes.

Thanks for any help you can provide,
Andrew Wiley
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100119/7ff12b3c/attachment.htm>
